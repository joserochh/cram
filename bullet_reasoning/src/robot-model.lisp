;;;
;;; Copyright (c) 2010, Lorenz Moesenlechner <moesenle@in.tum.de>
;;; All rights reserved.
;;; 
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions are met:
;;; 
;;;     * Redistributions of source code must retain the above copyright
;;;       notice, this list of conditions and the following disclaimer.
;;;     * Redistributions in binary form must reproduce the above copyright
;;;       notice, this list of conditions and the following disclaimer in the
;;;       documentation and/or other materials provided with the distribution.
;;;     * Neither the name of the Intelligent Autonomous Systems Group/
;;;       Technische Universitaet Muenchen nor the names of its contributors 
;;;       may be used to endorse or promote products derived from this software 
;;;       without specific prior written permission.
;;; 
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
;;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;;; POSSIBILITY OF SUCH DAMAGE.
;;;

(in-package :btr)

(defgeneric urdf-make-collision-shape (geometry &optional color))

(defmethod urdf-make-collision-shape ((box cl-urdf:box) &optional (color '(0.8 0.8 0.8 1.0)))
  (make-instance 'colored-box-shape
                 :half-extents (cl-transforms:v*
                                (cl-urdf:size box) 0.5)
                 :color color))

(defmethod urdf-make-collision-shape ((cylinder cl-urdf:cylinder) &optional (color '(0.8 0.8 0.8 1.0)))
  (make-instance 'cylinder-shape
                 :half-extents (cl-transforms:make-3d-vector
                                (cl-urdf:radius cylinder)
                                (cl-urdf:radius cylinder)
                                (* 0.5 (cl-urdf:cylinder-length cylinder)))
                 :color color))

(defmethod urdf-make-collision-shape ((sphere cl-urdf:sphere) &optional (color '(0.8 0.8 0.8 1.0)))
  (make-instance 'sphere-shape :radius (cl-urdf:radius sphere)
                 :color color))

(defmethod urdf-make-collision-shape ((mesh cl-urdf:mesh) &optional (color '(0.8 0.8 0.8 1.0)))
  (make-instance 'mesh-shape
                 :color color
                 :faces (physics-utils:3d-model-faces (cl-urdf:3d-model mesh))
                 :points (physics-utils:3d-model-vertices (cl-urdf:3d-model mesh))))

(defclass robot-object (object)
  ((links :initform (make-hash-table :test 'equal))
   (joints :initform (make-hash-table :test 'equal))
   (urdf :initarg :urdf :reader urdf)))

(defgeneric joint-state (robot-object name)
  (:documentation "Returns the value of the joint named `name'"))

(defgeneric (setf joint-state) (new-value robot-object name)
  (:documentation "Sets the specific joint to a new value and updates
  all child-link positions"))

(defmethod add-object ((world bt-world) (type (eql 'urdf)) name pose &key
                       urdf)
  (labels ((make-link-bodies (pose link)
             "Returns the list of rigid bodies of `link' and all its sub-links"
             (let* ((pose-transform (cl-transforms:reference-transform pose))
                    (collision-elem (cl-urdf:collision link))
                    (bodies (mapcan (lambda (joint)
                                      (make-link-bodies (cl-transforms:transform-pose
                                                         pose-transform (cl-urdf:origin joint))
                                                        (cl-urdf:child joint)))
                                    (cl-urdf:to-joints link))))
               (if collision-elem
                   (cons (cons
                          (cl-urdf:name link)
                          (make-instance
                           'rigid-body
                           :name (make-rigid-body-name name (cl-urdf:name link))
                           :mass 0
                           ;; :mass (if (cl-urdf:inertial link)
                           ;;           (cl-urdf:mass (cl-urdf:inertial link))
                           ;;           0)
                           :pose (cl-transforms:transform-pose
                                  pose-transform (cl-urdf:origin collision-elem))
                           :collision-shape (urdf-make-collision-shape
                                             (cl-urdf:geometry collision-elem)
                                             (cl-urdf:color (cl-urdf:material (cl-urdf:visual link))))
                           :collision-flags '(:cf-default)))
                         bodies)
                   bodies)))
           ;; (get-joint-transform (joint)
           ;;   (cl-urdf:origin joint))
           ;; (make-joint (class frame body-1 body-2 &optional lower upper)
           ;;   (let ((joint (make-instance class
           ;;                               :frame-in-1 frame
           ;;                               :body-1 body-1
           ;;                               :body-2 body-2)))
           ;;     (when lower
           ;;       (setf (limit joint :lower) lower))
           ;;     (when upper
           ;;       (setf (limit joint :upper) upper))
           ;;     joint))
           ;; (add-joint (robot-object joint)
           ;;   (let ((parent (gethash (cl-urdf:name (cl-urdf:parent joint))
           ;;                           (slot-value robot-object 'links)))
           ;;          (child (gethash (cl-urdf:name (cl-urdf:child joint))
           ;;                          (slot-value robot-object 'links))))
           ;;     (when (and parent child)
           ;;       (let ((constraint (ecase (cl-urdf:joint-type joint)
           ;;                           (:revolute
           ;;                              (make-joint
           ;;                               'hinge-constraint
           ;;                               (get-joint-transform joint)
           ;;                               parent child
           ;;                               (cl-urdf:lower (cl-urdf:limits joint))
           ;;                               (cl-urdf:upper (cl-urdf:limits joint))))
           ;;                           (:continuous
           ;;                              (make-joint
           ;;                               'hinge-constraint
           ;;                               (get-joint-transform joint)
           ;;                               parent child))
           ;;                           (:prismatic
           ;;                              (make-joint
           ;;                               'slider-constraint
           ;;                               (get-joint-transform joint)
           ;;                               parent child
           ;;                               (cl-urdf:lower (cl-urdf:limits joint))
           ;;                               (cl-urdf:upper (cl-urdf:limits joint))))
           ;;                           (:fixed
           ;;                              (make-joint
           ;;                               'hinge-constraint
           ;;                               (get-joint-transform joint)
           ;;                               parent child 1 -1))
           ;;                           (:floating nil)
           ;;                           (:planaer nil))))
           ;;         (setf (gethash (cl-urdf:name joint) (slot-value robot-object 'joints))
           ;;               constraint)
           ;;         (add-constraint world constraint)
           ;;         (dolist (next-joint (cl-urdf:to-joints (cl-urdf:child joint)))
           ;;           (add-joint robot-object next-joint))))))
           )
    (let* ((urdf-model (etypecase urdf
                         (cl-urdf:robot urdf)
                         (string (handler-bind ((cl-urdf:urdf-type-not-supported #'muffle-warning))
                                   (cl-urdf:parse-urdf urdf)))))
           (pose (ensure-pose pose))
           (bodies (make-link-bodies pose (cl-urdf:root-link urdf-model)))
           (object
            (make-instance 'robot-object
                           :rigid-bodies (mapcar #'cdr bodies)
                           :world world
                           :pose-reference-body (cl-urdf:name (cl-urdf:root-link urdf-model))
                           :name name
                           :urdf urdf-model
                           :group :character-filter
                           :mask '(:default-filter :static-filter))))
      (loop for (name . body) in bodies do
            (setf (gethash name (slot-value object 'links))
                  body))
      ;; (dolist (next-joint (cl-urdf:to-joints (cl-urdf:root-link urdf-model)))
      ;;   (add-joint object next-joint))
      object)))

(defmethod joint-state ((obj robot-object) name)
  (with-slots (urdf links) obj
    (let ((joint (gethash name (cl-urdf:joints urdf))))
      (when joint
        (let* ((parent (cl-urdf:parent joint))
               (parent-body (gethash (cl-urdf:name parent) links))
               (child (cl-urdf:child joint))
               (child-body (gethash (cl-urdf:name child) links)))
          (when (and parent-body child-body)
            (let ((origin (cl-transforms:transform*
                           (cl-transforms:reference-transform
                            (pose parent-body))
                           (cl-transforms:transform-inv
                            (cl-transforms:reference-transform
                             (cl-urdf:origin (cl-urdf:collision parent))))
                           (cl-urdf:origin joint)))
                  (child-transform (cl-transforms:transform*
                                    (cl-transforms:reference-transform
                                     (pose child-body))
                                    (cl-transforms:transform-inv
                                     (cl-transforms:reference-transform
                                      (cl-urdf:origin (cl-urdf:collision child)))))))
              (ecase (cl-urdf:joint-type joint)
                ((:revolute :continuous)
                   (nth-value
                    0
                    (cl-transforms:angle-between-quaternions
                     (cl-transforms:rotation origin)
                     (cl-transforms:rotation child-transform))))
                (:prismatic
                   (cl-transforms:v-dist
                    (cl-transforms:translation origin)
                    (cl-transforms:translation child-transform)))))))))))

(defmethod (setf joint-state) (new-value (obj robot-object) name)
  (with-slots (urdf links) obj
    (labels ((update-link-position (link pose)
               (let ((body (gethash (cl-urdf:name link) links))
                     (pose-transform (cl-transforms:reference-transform pose)))
                 (when body
                   (setf (pose body) (cl-transforms:transform-pose
                                      pose-transform
                                      (cl-urdf:origin (cl-urdf:collision link)))))
                 (dolist (to-joint (cl-urdf:to-joints link))
                   (update-link-position (cl-urdf:child to-joint)
                                         (cl-transforms:transform-pose
                                          pose-transform
                                          (cl-urdf:origin to-joint)))))))
      (let* ((joint (gethash name (cl-urdf:joints urdf)))
             (parent (cl-urdf:parent joint))
             (parent-body (gethash (cl-urdf:name parent) links)))
        (when (and joint parent-body)
          (let ((joint-transform
                 (cl-transforms:transform*
                  (cl-transforms:reference-transform
                   (cl-urdf:origin joint))
                  (case (cl-urdf:joint-type joint)
                    ((:revolute :continuous)
                       (cl-transforms:make-transform
                        (cl-transforms:make-3d-vector 0 0 0)
                        (cl-transforms:axis-angle->quaternion
                         (cl-urdf:axis joint)
                         new-value)))
                    (:prismatic
                       (cl-transforms:make-transform
                        (cl-transforms:v* (cl-urdf:axis joint) new-value)
                        (cl-transforms:make-quaternion 0 0 0 1)))
                    (t (cl-transforms:make-transform
                        (cl-transforms:make-3d-vector 0 0 0)
                        (cl-transforms:make-quaternion 0 0 0 1)))))))
            (update-link-position (cl-urdf:child joint)
                                  (cl-transforms:transform*
                                   (cl-transforms:reference-transform
                                    (pose parent-body))
                                   (cl-transforms:transform-inv
                                    (cl-transforms:reference-transform
                                     (cl-urdf:origin (cl-urdf:collision parent))))
                                   joint-transform))))))))
