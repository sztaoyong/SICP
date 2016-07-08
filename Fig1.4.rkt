#lang scheme

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter prod counter max-count)
  (if (> counter max-count)
      prod
      (fact-iter (* prod counter)
                 (+ 1 counter)
                 max-count)))

;; fibonaci
(define (fib_iter a b counter)
          (if (= counter 0) b
              (fib_iter (+ a b) a (- counter 1))))

(define (fib n) (fib_iter 1 0 n))

;; expand
;; (fib 6)
;; (fib_iter 1  0 6)
;; (fib_iter 1  1 5)
;; (fib_iter 2  1 5)
;; (fib_iter 3  2 4)
;; (fib_iter 5  3 3)
;; (fib_iter 8  5 2)
;; (fib_iter 13 8 1)
;; (fib_iter 21 13 0)
;; 13