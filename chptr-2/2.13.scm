; Assuming small percentages [> 0.01??]
; There exists a formular f for approximate % tolerance
; of the product of two interval
; i.e mul-interval(x, y) in terms of tolerance of factor

; let a = (ca - ta, ca + ta)
; let b = (cb - tb, cb + tb)
; (a * b) = ([ca - ta][cb - tb], [ca + ta][cb + tb])
; = (ca*cb - cb*ta -ca*tb + ta*tb, ca*cb + cb*ta + ca*tb + ta*tb)
; Since we are assumming small percentages, ta*tb will be really small hence insignificant
; (ca*cb - cb*ta -ca*tb, ca*cb + cb*ta + ca*tb)
; (ca*cb[1 - ta/ca - tb/cb], ca*cb[1 + ta/tb + tb/cb])
; (ca*cb[1 - (ta/ca + tb/cb)], ca*cb[1 + (ta/tb + tb/cb)])
; tolerance = (percent * center)
; (ca*cb[1 - (pa + pb)], ca*cb[1 + (pa + pb)])
; percent = [1 + (sum) - 1 + (sum)]/2
; percentages = 2sum/2 = sum!
; the resultant tolerance is equal to the sum of the individual tolerance