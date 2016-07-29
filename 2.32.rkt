#lang racket
;; use recursion to find all subsets.
(define (subsets s)
  (if (null? s)
      (list '());; this has be a list of nil; applying map on list of nil is very different from applying map on nil;
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (r) (cons (car s) r)) rest)))))

;; test
(subsets (list 1 2 3))