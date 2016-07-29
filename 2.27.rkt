#lang racket

(define (reverse items)
  (if (null? items)
      '()
      (append (reverse (cdr items)) (list (car items)))))

;; need to think
(define (deep-reverse items)
   (if
    (not (pair? items))
         items ;; base cond for leaves
         (reverse (map deep-reverse items))))


;; test
(define x (list (list 1 2) (list 3 4 (list 5 6))))
(reverse x)
(deep-reverse x)