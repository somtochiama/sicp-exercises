(load "chptr-1/section-1.2/1.21.scm")

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-prime start end)
  (cond ((>= start end) ((newline) (display "finished")))
        ((odd? start) 
         ((timed-prime-test start) (search-for-prime (+ start 2) end)))
        (else (search-for-prime (+ start 1) end))))

;; Time taken 
;;; 1009 -> 2, 1013 -> 2, 1019 -> 2 
;;; 10007 *** 7, 10007 *** 9, 10037 *** 6
;;; 100003 *** 13, 100019 *** 13, 100043 *** 13
;;; 1000003 *** 57, 1000033 *** 56, 1000037 *** 55

;;; For 1000 range; avg 2
;;; For 10000 range; avg 7.33
;;; For 100000 range; avg 13
;;; For 1000000 range; avg 56

;;; The sqrt(10) is approx. 3
;;; 13 * 3 = 39 (which is kind of far)
;;; There are other factors affecting the timing of the function other than
;;; The magnitude of the input so we see here that it doesn;t really support the O(sqrt(n))
;;; except on a very rough scale


(define (test-data n)
  (cond ((= n 1) 1009)
        ((= n 2) 1013)
        ((= n 3) 1019)
        ((= n 4) 10007)
        ((= n 5) 10007)
        ((= n 6) 10037)
        ((= n 7) 100003)
        ((= n 8) 100019)
        ((= n 9) 100043)
        ((= n 10) 1000003)
        ((= n 11) 1000033)
        ((= n 12) 1000037)))
    
(define (run-test-prime f)
  (define (iter n)
      (if (= n 13)
          (display " done ")
          ((f (test-data n)) (iter (+ n 1)))))
  (iter 1))