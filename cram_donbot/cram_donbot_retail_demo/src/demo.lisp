;;;
;;; Copyright (c) 2018, Gayane Kazhoyan <kazhoyan@cs.uni-bremen.de>
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

(in-package :demo)

(defun spawn-objects-on-small-shelf ()
  (btr-utils:spawn-object :balea-bottle-1 :balea-bottle :pose
                          '((1.75 -1.42 1.05) (0 0 0.7 0.7)))
  (btr-utils:spawn-object :dish-washer-tabs-1 :dish-washer-tabs
                          :pose '((1.9 -1.45 1.05) (0 0 0.7 0.7)))
  (btr:simulate btr:*current-bullet-world* 50))

(defun pick-objects-from-small-shelf (&optional (list-of-objects
                                                 '(:balea-bottle :dish-washer-tabs)))
  (dolist (?item-type list-of-objects)

    (let ((?object
            (an object
                (type ?item-type)
                (location (a location
                             (on (an object
                                     (type shelf)
                                     (urdf-name shelf-2-level-3-link)
                                     (owl-name "shelf_system_verhuetung"))))))))

      ;; park arm
      (exe:perform
       (desig:an action
                 (type positioning-arm)
                 (left-configuration park)))

      ;; drive to pick up
      (let ((?pose (cl-transforms-stamped:make-pose-stamped
                    "map" 0.0
                    (cl-transforms-stamped:make-3d-vector
                     2.2660367329915365d0 -0.16621163686116536d0 0.0)
                    (cl-transforms:make-quaternion
                     0.0d0 0.0d0 -0.020739689469337463d0 0.9997849464416504d0))))
        (exe:perform
         (desig:an action
                   (type going)
                   (target (desig:a location (pose ?pose))))))

      ;; look at the shelf
      (exe:perform
       (desig:an action
                 (type looking)
                 (direction right)))

      ;; perceive
      (exe:perform
       (an action
           (type detecting)
           (object ?object)))

      ;; picking up
      (exe:perform
       (an action
           (type picking-up)
           (grasp front)
           (object ?object))))))

(defun stuff-that-works ()
  (cram-process-modules:with-process-modules-running
      (giskard:giskard-pm)
    (cpl-impl::named-top-level (:name :top-level)
      (exe:perform
       (let ((?pose (cl-tf:make-pose-stamped
                     "base_footprint" 0.0
                     (cl-transforms:make-3d-vector
                      -0.27012088894844055d0
                      0.5643729567527771d0
                      1.25943687558174133d0)
                     (cl-tf:make-quaternion
                      -0.4310053586959839d0
                      0.24723316729068756d0
                      0.752766489982605d0
                      0.4318017065525055d0 ))))
         (desig:a motion
                  (type moving-tcp)
                  (left-pose ?pose)
                  (collision-mode :allow-all))))))


   ;; drive to place
    (let ((?pose (cl-transforms-stamped:make-pose-stamped
                  "map" 0.0
                  (cl-transforms-stamped:make-3d-vector
                   2.6765769958496093d0
                   -0.13911641438802083d0
                   0.0)
                  (cl-transforms:make-quaternion
                   0.0d0
                   0.0d0
                   0.6886594891548157d0
                   0.7250849008560181d0))))
      (exe:perform
       (desig:an action
                 (type going)
                 (target (desig:a location (pose ?pose))))))

  (giskard::call-giskard-environment-service :remove-all)

  ;; pick up from tray
  (donbot-pm:with-real-robot
    (giskard::call-giskard-environment-service :remove-all)
    (exe:perform
     (desig:an action
               (type looking)
               (direction down)))
    (let* ((?robot-name (btr:get-robot-name))
           (?obj
             (perform
              (an action
                  (type detecting)
                  (object (an object
                              (type dish-washer-tabs)
                              (location (a location
                                           (on (an object
                                                   (type robot)
                                                   (name ?robot-name)
                                                   (urdf-name plate)
                                                   (owl-name "donbot_tray")))))))))))

      (exe:perform
       (an action
           (type picking-up)
           (grasp top)
           (object ?obj)))

      (let* ((?robot-link-name "plate")
             (?pose-in-map (cram-tf:frame-to-pose-in-fixed-frame ?robot-link-name))
             (?transform-in-map (cram-tf:pose-stamped->transform-stamped
                                 ?pose-in-map ?robot-link-name))
             (?pose-in-base (cram-tf:ensure-pose-in-frame
                             ?pose-in-map cram-tf:*robot-base-frame*
                             :use-zero-time t))
             (?transform-in-base (cram-tf:pose-stamped->transform-stamped
                                  ?pose-in-base ?robot-link-name)))
        (exe:perform
         (an action
             (type placing)
             (object ?obj)
             (target (a location
                        (on (an object
                                (type robot)
                                (name ?robot-name)
                                (urdf-name plate)
                                (owl-name "donbot_tray")
                                (pose ((pose ?pose-in-base)
                                       (transform ?transform-in-base)
                                       (pose-in-map ?pose-in-map)
                                       (transform-in-map ?transform-in-map)))))
                        (for ?obj)
                        (attachment donbot-tray-left))))))))

  

  ;; drive to place
  (donbot-pm:with-real-robot
    (let ((?pose (cl-transforms-stamped:make-pose-stamped
                  "map" 0.0
                  (cl-transforms-stamped:make-3d-vector
                   2.6765769958496093d0 -0.13911641438802083d0 3.814697266402156d-9)
                  (cl-transforms:make-quaternion
                   0.0d0 0.0d0 0.6886594891548157d0 0.7250849008560181d0))))
      (exe:perform
       (desig:an action
                 (type going)
                 (target (desig:a location (pose ?pose)))))))

  )





#+everything-below-is-pr2-s-stuff-so-need-new-things-for-donbot
(
(defparameter *object-cad-models*
  '(;; (:cup . "cup_eco_orange")
    ;; (:bowl . "edeka_red_bowl")
    ))

(cpl:def-cram-function initialize-or-finalize ()
  (cpl:with-failure-handling
      ((cpl:plan-failure (e)
         (declare (ignore e))
         (return)))
    (cpl:par
      (exe:perform
       (desig:an action
                 (type positioning-arm)
                 (left-configuration park)
                 (right-configuration park)))
      (let ((?pose (cl-transforms-stamped:make-pose-stamped
                    cram-tf:*fixed-frame*
                    0.0
                    (cl-transforms:make-identity-vector)
                    (cl-transforms:make-identity-rotation))))
        (exe:perform
         (desig:an action
                   (type going)
                   (target (desig:a location
                                    (pose ?pose))))))
      (exe:perform (desig:an action (type opening-gripper) (gripper (left right))))
      (exe:perform (desig:an action (type looking) (direction forward))))))


(cpl:def-cram-function demo-random (&optional
                                    (random t)
                                    (list-of-objects '(:milk :cup :breakfast-cereal :bowl :spoon)))
  (btr:detach-all-objects (btr:get-robot-object))
  (btr-utils:kill-all-objects)

  ;; (setf proj-reasoning::*projection-reasoning-enabled* nil)
  (when (eql cram-projection:*projection-environment*
             'urdf-proj:urdf-bullet-projection-environment)
    (spawn-objects-on-sink-counter :random random))

  (setf cram-robot-pose-guassian-costmap::*orientation-samples* 1)

  (initialize-or-finalize)

  (dolist (?object-type list-of-objects)
    (let* ((?cad-model
             (cdr (assoc ?object-type *object-cad-models*)))
           (?object-to-fetch
             (desig:an object
                       (type ?object-type)
                       (desig:when ?cad-model
                         (cad-model ?cad-model))))
           (?fetching-location
             (desig:a location
                      (on "CounterTop")
                      (name "iai_kitchen_sink_area_counter_top")
                      (side left)))
           (?placing-target-pose
             (cl-transforms-stamped:pose->pose-stamped
              "map" 0.0
              (cram-bullet-reasoning:ensure-pose
               (cdr (assoc ?object-type *object-placing-poses*)))))
           (?arm-to-use
             (cdr (assoc ?object-type *object-grasping-arms*)))
           (?delivering-location
             (desig:a location
                      (pose ?placing-target-pose))))

      (cpl:with-failure-handling
          ((common-fail:high-level-failure (e)
             (roslisp:ros-warn (pp-plans demo) "Failure happened: ~a~%Skipping..." e)
             (return)))
        (exe:perform
         (desig:an action
                   (type transporting)
                   (object ?object-to-fetch)
                   ;; (arm ?arm-to-use)
                   (location ?fetching-location)
                   (target ?delivering-location))))))

  (initialize-or-finalize)

  cpl:*current-path*)

)