#lang racket

(define (make-monitored f)
  (let ((count 0))
    (define (mf arg)
      (cond
        ((eq? arg 'how-many-calls?) count)
        ((eq? arg 'reset-count) (set! count 0))
        (else
         (begin
           (set! count (+ count 1))
           (f arg)))))
    mf))

(define s (make-monitored sqrt))
(s 'how-many-calls?)
(s 100)
(s 49)
(s 8)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)