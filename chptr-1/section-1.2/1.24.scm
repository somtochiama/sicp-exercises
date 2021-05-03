(load "chptr-1/section-1.2/fast-prime.scm")

(define (fast-start-prime-test n start-time)
  (if (fast-prime? n 12)
      (report-prime (- (runtime) start-time))))

(define (fast-timed-prime-test n)
  (newline)
  (display n)
  (fast-start-prime-test n (runtime)))

;;; 1009 *** 22
;;; 1013 *** 14
;;; 1019 *** 16
;;; 10007 *** 17
;;; 10007 *** 16
;;; 10037 *** 16
;;; 100003 *** 19
;;; 100019 *** 19
;;; 100043 *** 19
;;; 1000003 *** 22
;;; 1000033 *** 23
;;; 1000037 *** 22 

;;; The expectation is that the time between 1000 and 1,000,000 should double
;;; And that's approx what we see