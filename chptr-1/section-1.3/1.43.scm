(load "chptr-1/section-1.3/1.42.scm")

(define (repeated f x)
   (if (= x 1)
       f
       (compose f (repeated f (- x 1)))))