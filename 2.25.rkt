#lang racket

;; Note:
;; 1. cdr will return a list..
;; 2. it'd be easier if think in term of tree representation.

(car (cdaddr (list 1 3 (list 5 7) 9)))

(caar (list (list 7)))

(cadr (cadr (cadr (cadr (cadr (cadr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))))))