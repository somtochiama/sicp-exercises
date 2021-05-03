(define (smallest-divisor-fast n) (find-divisor-fast n 2))

(define (find-divisor-fast n test-divisor)
  (define (next n)
    (if (= n 2) 3 (+ n 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
  
(define (prime-fast? n)
  (= n (smallest-divisor-fast n)))

(define (timed-prime-test-fast n)
  (newline)
  (display n)
  (start-prime-test-fast n (runtime)))

(define (start-prime-test-fast n start-time)
  (if (prime-fast? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


;;; results
;;; 1009 *** 13
;;; 1013 *** 3
;;; 1019 *** 1
;;; 10007 *** 5
;;; 10007 *** 4
;;; 10037 *** 5
;;; 100003 *** 12
;;; 100019 *** 13
;;; 100043 *** 13
;;; 100003 *** 13
;;; 100019 *** 13
;;; 100043 *** 13
;;; 1000003 *** 39
;;; 1000033 *** 39
;;; 1000037 *** 40

;;; Change is almost the same