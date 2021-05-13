(load "common.scm")

(define (hearts? cards)
  (or (has-card? cards 'H) (has-card? cards 'h)))
      
(define (valentine cards hand)
  (if (hearts? cards)
      ((stop-at 19) cards hand)
      ((stop-at 17) cards hand)))