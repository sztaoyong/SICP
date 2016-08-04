#lang racket

(define (fringe x)
  (cond
   ((null? x) '())
   ((not (pair? x)) (list x))
   (else (append (fringe (car x)) (fringe (cdr x))))))

;; (append (fringe (1 2)) (fringe ((3 4))))
;; (append (append (fringe 1) (fringe (2))) (append (fringe (3 4)) '()))
;; (append (append (1) (append (fringe 2) '())) (append (fringe 3) (fringe (4))))
;; (append (append (1) (append (2) '())) (append (3) (append (fringe 4) '())))
;; (append (append (1) (2)) (append (3) (4)))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
(fringe (list x x))
