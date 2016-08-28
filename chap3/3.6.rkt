#lang racket
(define (rand-update x)
  (+ x 1)) ;; for testing purpose


(define rand
  (let ((x 1))
    (lambda (op)
    (cond
      ((eq? op 'generate)
       (begin
         (set! x (rand-update x))
         x))
      ((eq? op 'reset)
       (lambda (x-new)
         (set! x x-new)))
      (else (error "Unknow operator"))))))

;; test
(rand 'generate)
(rand 'generate)
(rand 'generate)
((rand 'reset) 1)
(rand 'generate)
(rand 'generate)
(rand 'other)
