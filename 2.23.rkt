#lang scheme
(define (for-each proc items)
  ;; i am try avoiding using 'begin'
  (proc (car items))
  (when (not (null? (cdr items)))
    (for-each proc (cdr items))))

;; test
(for-each (lambda (x) (newline) (display (+ x 1)))
          (list 57 321 88))