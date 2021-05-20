(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
   (div-interval
    one (add-interval (div-interval one r1)
                      (div-interval one r2)))))

; (par1 r1 r2) => (49.75 50.25)
; multiply => 2475.0625 2525.0625 [doubled the percent]
; add => 99.5 100.5 [same] 
; div-interval = mul x * 1/y
              multiply [2475.0625 2525.0625] [0.010050251256281407 0.009950248756218905]

