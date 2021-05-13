(define (contains? senc word)
  (cond ((empty? senc) #f)
        ((equal? (first senc) word) #t)
        (else (contains? (bf senc) word))))

(define (has-card? cards card)
  (cond ((empty? cards) #f)
        ((equal? (last (last cards)) card) #t)
        (else (has-card? (bl cards) card))))
