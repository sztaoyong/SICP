#lang racket

(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

;; test
(last-pair (list 23 72 149 34))