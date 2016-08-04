#lang racket
(require "./seq_base.rkt")

(define (count-leaves t)
  (accumulate +
              0
              ;; use Mapping over trees..
              ;; Idea:  regard the tree as a sequence of sub-trees
              ;; Many tree operations can be implemented by similar combinations of sequence operations and recursion.

              (map
               (lambda (sub-tree)
                 (cond
                   ((null? sub-tree) 0)
                   ((not (pair? sub-tree)) 1)
                   (else (count-leaves sub-tree))))
               t)))

(define x (cons (list 1 2) (list 3 4)))

(count-leaves x)
(count-leaves (append x x))