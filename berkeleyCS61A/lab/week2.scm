(define (substitute senc old-word new-word)
  (cond ((empty? senc) '())
        ((equal? (first senc) old-word) 
         (se new-word (substitute (bf senc) old-word new-word)))
        (else (se (first senc) (substitute (bf senc) old-word new-word)))))

;;; g takes no arguments
;;; Type returned by g is a procedure that takes one argument.
;;; f => (3)
;;; (f) => (lambda () 3) => 3
;;; (f 3) => (lambda (x) (+ x 3)) => 6
;;; ((f)) => (define (f) (lambda () 3)) =>
;;; (((f)) 3)

(define (make-tester w)
  (lambda (x) (equal? x w)))