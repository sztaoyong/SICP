#lang scheme
;;apply add-1 on zero using substitution method
;;(add-1 zero)
;;(lambda (f) (lambda (x) (f ((zero f) x))))
;;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;;(lambda (f) (lambda (x) (f x)))
(define one
  (lambda (f) (lambda (x) (f x))))

;;(add-1 one)
;;(lambda (f) (lambda (x) (f ((one f) x))))
;;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
;;(lambda (f) (lambda (x) (f (f x))))
(define two
  (lambda (f) (lambda (x) (f (f x)))))

;; pattern : apply f on x for n times.

;; 第二部分暂时不会
;; Give a direct definition of the addition procedure + (not in terms of repeated application of add-1).
;; observe some properties
;;(two f) -> (lambda (x) (f (f x)))
;;(one f) -> (lambda (x) (f x))
;;((two f) x) ->  (f (f x))
;;((one f) (two f x)) -> ((lambda (x) (f x)) ) -> (f (f (f x)))

(define (+ a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
