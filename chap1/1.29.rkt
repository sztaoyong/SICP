#lang scheme

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; Simpson's rule can be represented as 3 summuation of a series.
;; h/3[y0 + 4y1 + 2y2 + 4y3 + 2y4 + .. + 4yn-1 + yn]
;; = h/3 [y0 + ... + yn] + h/3[y1 + y2 + .. + yn-1] + h/3[2y1 + 2y3 + ... 2yn-1]
;; where h = (b-a)/3 and yk = f(a + kn)

(define (integral f a b n)
  (define h (/ (- b a) (* 1.0 n)))
  (define (delta-h x) (+ x h))
  (define (delta-2h x) (+ x (* 2 h)))
  (+
   (* (/ h 3.0) (sum f a delta-h b))
   (* (/ h 3.0) (sum f (+ a h) delta-h (- b h)))
   (* 2 (/ h 3.0) (sum f (+ a h) delta-2h (- b h)))))