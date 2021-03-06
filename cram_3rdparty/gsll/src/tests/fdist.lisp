;; Regression test FDIST for GSLL, automatically generated
;;
;; Copyright 2009 Liam M. Healy
;; Distributed under the terms of the GNU General Public License
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(in-package :gsl)

(LISP-UNIT:DEFINE-TEST FDIST
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST
    (LIST 18.411308904958695d0 5.120881381831058d0
	  18.104535265974707d0 0.15934280606960227d0
	  0.06272171507636773d0 2.2809441726456456d0
	  0.5259458753395939d0 1.8256109001076744d0
	  0.845346894458977d0 2.5212086970057763d0
	  0.5212415547032052d0))
   (MULTIPLE-VALUE-LIST
    (LET ((RNG (MAKE-RANDOM-NUMBER-GENERATOR +MT19937+ 0)))
      (LOOP FOR I FROM 0 TO 10 COLLECT
	   (sample rng :fdist :nu1 1.0d0 :nu2 2.0d0)))))
  (LISP-UNIT::ASSERT-NUMERICAL-EQUAL
   (LIST 0.1594719884624466d0)
   (MULTIPLE-VALUE-LIST (FDIST-PDF 1.2d0 1.0d0 2.0d0)))
  ;; Automatically converted from cdf/test.c
  (ASSERT-TO-TOLERANCE (FDIST-P 0.0d0 1.2d0 1.3d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-100 1.2d0 1.3d0) 6.98194275525039d-61 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.001d0 1.2d0 1.3d0) 0.011060848586023856d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.01d0 1.2d0 1.3d0) 0.04386367570683138d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.1d0 1.2d0 1.3d0) 0.16824239271284072d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.325d0 1.2d0 1.3d0) 0.3141300452461954d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.0d0 1.2d0 1.3d0) 0.5096307790747553d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.5d0 1.2d0 1.3d0) 0.5839986406415538d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 2.0d0 1.2d0 1.3d0) 0.6347335813519388d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10.0d0 1.2d0 1.3d0) 0.8484462378792009d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 20.0d0 1.2d0 1.3d0) 0.9009877263368751d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 100.0d0 1.2d0 1.3d0) 0.9644891270476884d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1000.0d0 1.2d0 1.3d0) 0.9920120516941164d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10000.0d0 1.2d0 1.3d0) 0.9982108628088426d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.0d0 1.2d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-100 1.2d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.001d0 1.2d0 1.3d0) 0.9889391514139761d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.01d0 1.2d0 1.3d0) 0.9561363242931686d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.1d0 1.2d0 1.3d0) 0.8317576072871593d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.325d0 1.2d0 1.3d0) 0.6858699547538045d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.0d0 1.2d0 1.3d0) 0.49036922092524476d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.5d0 1.2d0 1.3d0) 0.4160013593584461d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 2.0d0 1.2d0 1.3d0) 0.3652664186480612d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10.0d0 1.2d0 1.3d0) 0.15155376212079902d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 20.0d0 1.2d0 1.3d0) 0.09901227366312496d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 100.0d0 1.2d0 1.3d0) 0.03551087295231156d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1000.0d0 1.2d0 1.3d0) 0.007987948305883612d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10000.0d0 1.2d0 1.3d0) 0.0017891371911574144d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 3.4790822134658326d0 1.0d0 4040712.0d0) 0.9378507276372341d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 3.002774644786533d0 1.0d0 4040712.0d0) 0.9168778737947606d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 3.000854441173131d0 1.0d0 4040712.0d0) 0.9167793071981358d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 3.000064021622133d0 1.0d0 4040712.0d0) 0.9167386972447996d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.0d0 500.0d0 1.3d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-100 500.0d0 1.3d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.001d0 500.0d0 1.3d0) 9.834344603933047d-141 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.01d0 500.0d0 1.3d0) 1.4591562488855d-26 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.1d0 500.0d0 1.3d0) 5.899765096196881d-4 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.325d0 500.0d0 1.3d0) 0.06861104860515425d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.0d0 500.0d0 1.3d0) 0.33847505380640464d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.5d0 500.0d0 1.3d0) 0.4520162452474574d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 2.0d0 500.0d0 1.3d0) 0.5273390689373888d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10.0d0 500.0d0 1.3d0) 0.8168396285784139d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 20.0d0 500.0d0 1.3d0) 0.8817846230569114d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 100.0d0 500.0d0 1.3d0) 0.9580450572042213d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1000.0d0 500.0d0 1.3d0) 0.9905857493806552d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10000.0d0 500.0d0 1.3d0) 0.9978919248314614d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.0d0 500.0d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-100 500.0d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.001d0 500.0d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.01d0 500.0d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.1d0 500.0d0 1.3d0) 0.9994100234903803d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.325d0 500.0d0 1.3d0) 0.9313889513948458d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.0d0 500.0d0 1.3d0) 0.6615249461935954d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.5d0 500.0d0 1.3d0) 0.5479837547525426d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 2.0d0 500.0d0 1.3d0) 0.4726609310626112d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10.0d0 500.0d0 1.3d0) 0.1831603714215861d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 20.0d0 500.0d0 1.3d0) 0.11821537694308859d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 100.0d0 500.0d0 1.3d0) 0.0419549427957787d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1000.0d0 500.0d0 1.3d0) 0.009414250619344734d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10000.0d0 500.0d0 1.3d0) 0.002108075168538626d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.0d0 1.2d0 500.0d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-100 1.2d0 500.0d0) 8.23342055585483d-61 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.001d0 1.2d0 500.0d0) 0.013046149644128953d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.01d0 1.2d0 500.0d0) 0.05183242246080333d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.1d0 1.2d0 500.0d0) 0.20223510171607628d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.325d0 1.2d0 500.0d0) 0.39050298321939375d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.0d0 1.2d0 500.0d0) 0.6676561915746536d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.5d0 1.2d0 500.0d0) 0.7755392302714671d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 2.0d0 1.2d0 500.0d0) 0.8452091149046137d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10.0d0 1.2d0 500.0d0) 0.999168017659121d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 20.0d0 1.2d0 500.0d0) 0.9999980057383717d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 100.0d0 1.2d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1000.0d0 1.2d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10000.0d0 1.2d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.0d0 1.2d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-100 1.2d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.001d0 1.2d0 500.0d0) 0.986953850355871d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.01d0 1.2d0 500.0d0) 0.9481675775391967d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.1d0 1.2d0 500.0d0) 0.7977648982839237d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.325d0 1.2d0 500.0d0) 0.6094970167806063d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.0d0 1.2d0 500.0d0) 0.3323438084253464d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.5d0 1.2d0 500.0d0) 0.22446076972853293d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 2.0d0 1.2d0 500.0d0) 0.1547908850953863d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10.0d0 1.2d0 500.0d0) 8.319823408790116d-4 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 20.0d0 1.2d0 500.0d0) 1.99426162833131d-6 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 100.0d0 1.2d0 500.0d0) 6.233026622882171d-25 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1000.0d0 1.2d0 500.0d0) 1.1432857725966693d-134 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10000.0d0 1.2d0 500.0d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.0d0 200.0d0 500.0d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-100 200.0d0 500.0d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.001d0 200.0d0 500.0d0) 4.093250804036699d-251 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.01d0 200.0d0 500.0d0) 1.178943254196287d-151 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.1d0 200.0d0 500.0d0) 5.924309407968612d-57 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.325d0 200.0d0 500.0d0) 3.1822045235726357d-18 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.0d0 200.0d0 500.0d0) 0.5067463261211682d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.5d0 200.0d0 500.0d0) 0.9997941757187124d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 2.0d0 200.0d0 500.0d0) 0.9999999995282361d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10.0d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 20.0d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 100.0d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1000.0d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10000.0d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.0d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-100 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.001d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.01d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.1d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.325d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.0d0 200.0d0 500.0d0) 0.49325367387883173d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.5d0 200.0d0 500.0d0) 2.058242812875618d-4 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 2.0d0 200.0d0 500.0d0) 4.717638483714107d-10 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10.0d0 200.0d0 500.0d0) 5.980483371819484d-96 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 20.0d0 200.0d0 500.0d0) 2.920992658799795d-155 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1000.0d0 200.0d0 500.0d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10000.0d0 200.0d0 500.0d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.0d0 1.2d0 1.3d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 6.98194275525039d-61 1.2d0 1.3d0) 1.d-100 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.011060848586023856d0 1.2d0 1.3d0) 0.001d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.04386367570683138d0 1.2d0 1.3d0) 0.01d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.16824239271284072d0 1.2d0 1.3d0) 0.1d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.3141300452461954d0 1.2d0 1.3d0) 0.325d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.5096307790747553d0 1.2d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.5839986406415538d0 1.2d0 1.3d0) 1.5d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.6347335813519388d0 1.2d0 1.3d0) 2.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.8484462378792009d0 1.2d0 1.3d0) 10.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.9009877263368751d0 1.2d0 1.3d0) 20.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.9644891270476884d0 1.2d0 1.3d0) 100.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.9920120516941164d0 1.2d0 1.3d0) 1000.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.9982108628088426d0 1.2d0 1.3d0) 10000.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 1.0d0 1.2d0 1.3d0) 0.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.9889391514139761d0 1.2d0 1.3d0) 0.001d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.9561363242931686d0 1.2d0 1.3d0) 0.01d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.8317576072871593d0 1.2d0 1.3d0) 0.1d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.6858699547538045d0 1.2d0 1.3d0) 0.325d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.49036922092524476d0 1.2d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.4160013593584461d0 1.2d0 1.3d0) 1.5d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.3652664186480612d0 1.2d0 1.3d0) 2.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.15155376212079902d0 1.2d0 1.3d0) 10.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.09901227366312496d0 1.2d0 1.3d0) 20.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.03551087295231156d0 1.2d0 1.3d0) 100.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.007987948305883612d0 1.2d0 1.3d0) 1000.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.0017891371911574144d0 1.2d0 1.3d0) 10000.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.0d0 500.0d0 1.3d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 9.834344603933047d-141 500.0d0 1.3d0) 0.001d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 1.4591562488855d-26 500.0d0 1.3d0) 0.01d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 5.899765096196881d-4 500.0d0 1.3d0) 0.1d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.06861104860515425d0 500.0d0 1.3d0) 0.325d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.33847505380640464d0 500.0d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.4520162452474574d0 500.0d0 1.3d0) 1.5d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.5273390689373888d0 500.0d0 1.3d0) 2.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.8168396285784139d0 500.0d0 1.3d0) 10.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.8817846230569114d0 500.0d0 1.3d0) 20.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.9580450572042213d0 500.0d0 1.3d0) 100.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.9905857493806552d0 500.0d0 1.3d0) 1000.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.9978919248314614d0 500.0d0 1.3d0) 10000.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 1.0d0 500.0d0 1.3d0) 0.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.9994100234903803d0 500.0d0 1.3d0) 0.1d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.9313889513948458d0 500.0d0 1.3d0) 0.325d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.6615249461935954d0 500.0d0 1.3d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.5479837547525426d0 500.0d0 1.3d0) 1.5d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.4726609310626112d0 500.0d0 1.3d0) 2.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.1831603714215861d0 500.0d0 1.3d0) 10.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.11821537694308859d0 500.0d0 1.3d0) 20.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.0419549427957787d0 500.0d0 1.3d0) 100.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.009414250619344734d0 500.0d0 1.3d0) 1000.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.002108075168538626d0 500.0d0 1.3d0) 10000.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.0d0 1.2d0 500.0d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 8.23342055585483d-61 1.2d0 500.0d0) 1.d-100 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.013046149644128953d0 1.2d0 500.0d0) 0.001d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.05183242246080333d0 1.2d0 500.0d0) 0.01d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.20223510171607628d0 1.2d0 500.0d0) 0.1d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.39050298321939375d0 1.2d0 500.0d0) 0.325d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.6676561915746536d0 1.2d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.7755392302714671d0 1.2d0 500.0d0) 1.5d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.8452091149046137d0 1.2d0 500.0d0) 2.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.999168017659121d0 1.2d0 500.0d0) 10.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.9999980057383717d0 1.2d0 500.0d0) 20.0d0 +TEST-TOL6+)
  (ASSERT-posinf (FDIST-PINV 1.0d0 1.2d0 500.0d0))
  (ASSERT-posinf (FDIST-PINV 1.0d0 1.2d0 500.0d0))
  (ASSERT-posinf (FDIST-PINV 1.0d0 1.2d0 500.0d0))
  (ASSERT-TO-TOLERANCE (FDIST-QINV 1.0d0 1.2d0 500.0d0) 0.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.986953850355871d0 1.2d0 500.0d0) 0.001d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.9481675775391967d0 1.2d0 500.0d0) 0.01d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.7977648982839237d0 1.2d0 500.0d0) 0.1d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.6094970167806063d0 1.2d0 500.0d0) 0.325d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.3323438084253464d0 1.2d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.22446076972853293d0 1.2d0 500.0d0) 1.5d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.1547908850953863d0 1.2d0 500.0d0) 2.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 8.319823408790116d-4 1.2d0 500.0d0) 10.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 1.99426162833131d-6 1.2d0 500.0d0) 20.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 6.233026622882171d-25 1.2d0 500.0d0) 100.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 1.1432857725966693d-134 1.2d0 500.0d0) 1000.0d0 +TEST-TOL6+)
  (ASSERT-posinf (FDIST-QINV 0.0d0 1.2d0 500.0d0))
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.0d0 200.0d0 500.0d0) 0.0d0 +DBL-EPSILON+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 4.093250804036699d-251 200.0d0 500.0d0) 0.001d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 1.178943254196287d-151 200.0d0 500.0d0) 0.01d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 5.924309407968612d-57 200.0d0 500.0d0) 0.1d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 3.1822045235726357d-18 200.0d0 500.0d0) 0.325d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.5067463261211682d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.9997941757187124d0 200.0d0 500.0d0) 1.5d0 +TEST-TOL6+)
  (ASSERT-posinf (FDIST-PINV 1.0d0 200.0d0 500.0d0))
  (ASSERT-TO-TOLERANCE (FDIST-QINV 1.0d0 200.0d0 500.0d0) 0.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 0.49325367387883173d0 200.0d0 500.0d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 2.058242812875618d-4 200.0d0 500.0d0) 1.5d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 4.717638483714107d-10 200.0d0 500.0d0) 2.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 5.980483371819484d-96 200.0d0 500.0d0) 10.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-QINV 2.920992658799795d-155 200.0d0 500.0d0) 20.0d0 +TEST-TOL6+)
  (ASSERT-posinf (FDIST-QINV 0.0d0 200.0d0 500.0d0))
  (ASSERT-TO-TOLERANCE (FDIST-PINV 0.95d0 1.0d0 261.0d0) 3.877334032250872d0 +TEST-TOL3+)
  ;; Automatically converted from cdf/test_auto.c
  (ASSERT-TO-TOLERANCE (FDIST-P 0.0d0 5.3d0 2.7d0) 0.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-10 5.3d0 2.7d0) 3.23138066309d-26 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-9 5.3d0 2.7d0) 1.443404714791d-23 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-8 5.3d0 2.7d0) 6.447451698511d-21 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-7 5.3d0 2.7d0) 2.879969407315d-18 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-6 5.3d0 2.7d0) 1.286428479993d-15 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-5 5.3d0 2.7d0) 5.745970138195d-13 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d-4 5.3d0 2.7d0) 2.565314230632d-10 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.001d0 5.3d0 2.7d0) 1.14002620376d-7 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.01d0 5.3d0 2.7d0) 4.840333162527d-5 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 0.1d0 5.3d0 2.7d0) 0.01360698992545d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.0d0 5.3d0 2.7d0) 0.4532720490874d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10.0d0 5.3d0 2.7d0) 0.9461328174717d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 100.0d0 5.3d0 2.7d0) 0.9973356976994d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1000.0d0 5.3d0 2.7d0) 0.999879733805d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 10000.0d0 5.3d0 2.7d0) 0.9999946222456d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 100000.0d0 5.3d0 2.7d0) 0.9999997597592d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1000000.0d0 5.3d0 2.7d0) 0.9999999892687d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d7 5.3d0 2.7d0) 0.9999999995207d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d8 5.3d0 2.7d0) 0.9999999999786d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d9 5.3d0 2.7d0) 0.999999999999d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-P 1.d10 5.3d0 2.7d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d10 5.3d0 2.7d0) 4.272202262298d-14 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d9 5.3d0 2.7d0) 9.56426950277d-13 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d8 5.3d0 2.7d0) 2.141173208523d-11 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d7 5.3d0 2.7d0) 4.793489218238d-10 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1000000.0d0 5.3d0 2.7d0) 1.07312743344d-8 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 100000.0d0 5.3d0 2.7d0) 2.402407758939d-7 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10000.0d0 5.3d0 2.7d0) 5.377754447932d-6 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1000.0d0 5.3d0 2.7d0) 1.202661950234d-4 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 100.0d0 5.3d0 2.7d0) 0.002664302300604d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 10.0d0 5.3d0 2.7d0) 0.05386718252832d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.0d0 5.3d0 2.7d0) 0.5467279509126d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.1d0 5.3d0 2.7d0) 0.9863930100746d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.01d0 5.3d0 2.7d0) 0.9999515966684d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.001d0 5.3d0 2.7d0) 0.9999998859974d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-4 5.3d0 2.7d0) 0.9999999997435d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-5 5.3d0 2.7d0) 0.9999999999994d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-6 5.3d0 2.7d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-7 5.3d0 2.7d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-8 5.3d0 2.7d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-9 5.3d0 2.7d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 1.d-10 5.3d0 2.7d0) 1.0d0 +TEST-TOL6+)
  (ASSERT-TO-TOLERANCE (FDIST-Q 0.0d0 5.3d0 2.7d0) 1.0d0 +TEST-TOL6+))

