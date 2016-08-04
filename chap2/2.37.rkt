#lang racket
(require "./seq_base.rkt")

(define (dot-product v w)
  ;; (map proc lst ...+)
  ;; Applies proc to the elements of the lsts from the first elements to the last.
  ;; The proc argument must accept *the same number* of arguments as the number of supplied lsts
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product w v)) m))

(define (transpose mat)
  (accumulate-n cons'() mat))

;; In new matrix; [M1; M2; M3] * N -> [M1N; M2N; M3N]
;; each row will be Mi*N where Mi is i-th row.
;; transpose(MiN) = (transpose N) transpose Mi
(define (matrix-*-matrix m n)
  (map (lambda (mi) (matrix-*-vector (transpose n) mi)) m))


;; test
;; m is a 3 * 4 matrix; n is a 4 * 2 matrix. m * n will be a 3 * 2 matrix..
;; v should be a 4-d vector
(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define n (list (list 1 2) (list 4 5) (list 1 2) (list 1 2)))
(define v (list 1 1 1 1))

(matrix-*-vector m v)
(transpose n)
(matrix-*-matrix m n)