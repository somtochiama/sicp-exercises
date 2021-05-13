(define (sum-of-factors n)
  (define (iter result k)
     (cond ((= n k) result)
           ((= (remainder n k) 0)
            (iter (+ result k) (+ k 1)))
           (else (iter result (+ k 1))) ))
  (iter 0 1))

;;; Add the two factors at the same time reduces the time complexity
(define (fast-sum-of-factors n)
  (define (iter result k)
     (cond ((>= (square k) n) result)
           ((= (remainder n k) 0)
            (iter (+ result k (/ n k)) (+ k 1)))
           (else (iter result (+ k 1))) ))
  (iter 1 2))

(define (next-perf n)
   (if (= (sum-of-factors n) n)
       n
       (next-perf (+ n 1))))

;;; Number 2
;;; Interchanging the base case means that if the amount is equal to zero and kinds-of-coins 
;;; is equal to zero, it will return 0 in the new function instead of 1.
;;; So when the arguments are (0, 0), the function returns 0 instead of 1.

;;; Number 3
;;; Algebraic expression is equal to b^n = product * b^counter

(define (number-of-partitions n)
  (define (iter diff n)
     (cond ((= diff 0) 1)
           ((or (< diff 0) (= n 0)) 0)
           (else (+ (iter diff (- n 1))
                    (iter (- diff n) n)))))
  (trace iter)
  (iter n n))

;;; Counting partitions is like making change, where the coins are all the numbers
;;; less than or equal to the number itself