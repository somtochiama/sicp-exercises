(load "chptr-1/section-1.3/1.43.scm")
(load "chptr-1/section-1.3/1.35.scm")

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x)))) 

(define (repeated f x)
   (if (= x 1)
       f
       (compose f (repeated f (- x 1)))))

(define tolerance 0.00000001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
        tolerance))
  (define (try guess)
    (let ((next (f guess)))
         (if (close-enough? guess next)
             next
             (try next))))
  (trace try)
(try first-guess))

;; Using this function to test the number of damps
;;sqrt 2, 3 => 1, sqrt 4, 5, 6, 7 => 2, sqrt 8 => 3, sqrt 16 => 4
;; The number of damps increase by one with every power of 2
(define (nth-root-test x n k)
  (fixed-point ((repeated average-damp k) (lambda (y) (/ x (expt y (- n 1))))) 
               1.0))

(define (num-damp n) (floor (/ (log n) (log 2))))


(define (nth-root x n)
  (fixed-point ((repeated average-damp (num-damp n))
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))