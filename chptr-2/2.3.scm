(load "2.2.scm")

(define (square x) (* x x))

(define (len-seg seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (sqrt (+ (square (- (x-point end)
                        (x-point start)))
              (square (- (y-point end)
                         (y-point start)))))))

;;; Implemented as a rectangle that takes 2 line segment(the width and length)
(define (make-rect l w)
  (cons l w))

(define (length rect)
  (len-seg (car rect)))

(define (width rect)
  (len-seg (cdr rect)))

(define (area rect)
  (* (length rect)
     (width rect)))

(define (perimeter rect)
  (+ (* 2 (length rect))
     (* 2 (width rect))))

;;; Different representation with 2 opposite points on a plane
(define (make-rect-2 x y)
  (cons x y))

(define (length rect)
  (abs (- (x-point (car rect))
          (x-point (cdr rect)))))

(define (width rect)
  (abs (- (y-point (car rect))
       (y-point (cdr rect)))))