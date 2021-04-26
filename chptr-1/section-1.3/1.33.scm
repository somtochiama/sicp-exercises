(define (square x) (* x x))

(define (filtered-accumulate combiner null-value term a next b predicate?)
  (cond ((> a b) null-value)
        ((predicate? a) 
         (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b predicate?)))
        (else (filtered-accumulate combiner null-value term (next a) next b predicate?))))

(define (sum-square-prime a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (product-positive-int n)
  (define (relative-prime? x)
    (= (gcd n x) 1))
  (filtered-accumulate * 1 id 1 inc n relative-prime?))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))