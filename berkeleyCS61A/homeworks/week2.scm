(define tolerance 0.000000000000000001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
    (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))


(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x)))) 

(define (every f senc)
  (if (empty? senc) '()
      (se (f (first senc)) (every f (bf senc)))))

(define (compose f g) 
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (equal? n 1) f
      (compose f (repeated f (- n 1)))))

(define (smoothed f) 
   (define (average x y z) (/ (+ x y z) 3))
   (let ((dx 0.0001)) 
        (lambda (x) 
                (average (f (- x dx))
                         (f x)
                         (f (+ x dx))))))

(define (n-fold-smoothed f n)
  (repeated (smoothed f) n))

(define (nth-root n x t) 
  (fixed-point 
    (repeated (average-damp 
                        (lambda (y) 
                          ( / x (expt y (- n 1))))) t) 
    1.0))

(define (iterative-improvement improve good-enough?) 
  (define (try guess)
    (if (good-enough? guess) guess
        (try (improve guess))))
  try)

(define (sqrt x)
  ((iterative-improvement (lambda (guess) (average guess (/ x guess))) 
                         (lambda (guess) (< (abs (- (square guess) x)) 0.001))) 1.0))