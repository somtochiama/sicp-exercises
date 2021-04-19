;;;      1   
;;;     1 1
;;;    1 2 1
;;;   1 3 3 1
;;;  The edges of each row is equal to 1
;;; The rest are equal to the sum of the numbers above it
;;; My columns start to count from 0 and end at (row - 1)
(define (pascal-triangle row x)
  (if (or (<= x 0) (>= x (- row 1)))
      1
      (+ (pascal-triangle (- row 1) (- x 1))
         (pascal-triangle (- row 1) x))))