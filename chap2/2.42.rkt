#lang racket
(require "./seq_base.rkt")

(define (enumerate-interval st en)
  (if (> st en)
      nil
      (cons st (enumerate-interval (+ st 1) en))))

;; Representing board position by a list of size k;
;; where each element is a pair (r c) representing the coordinate.
(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          ;; generate a list of arrangements.
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)

(define (adjoin-position new-row k rest-of-queens)
  (cons (cons k new-row) rest-of-queens))

(define (none predicate seq)
  (accumulate (lambda (e init) (and (not (predicate e)) init)) #t seq))
  
(define (safe? k positions)
  ;; check the first element of the sequence
  (let ((k-th-row (car positions)))
    (and
     (none (lambda (rest-row) (= (car k-th-row) (car rest-row))) (cdr positions))
     (none (lambda (rest-row) (= (cdr k-th-row) (cdr rest-row))) (cdr positions))
     (none (lambda (rest-row) (= (abs (- (car k-th-row) (car rest-row))) (abs (- (cdr k-th-row) (cdr rest-row))))) (cdr positions)))))


;; test
(define (queens-print seq)
  ;; can direct print its transpose
  (define (print-row n)
    (cond
      ((= n 1) (display "o . . . . . . . \n"))
      ((= n 2) (display ". o . . . . . . \n"))
      ((= n 3) (display ". . o . . . . . \n"))
      ((= n 4) (display ". . . o . . . . \n"))
      ((= n 5) (display ". . . . o . . . \n"))
      ((= n 6) (display ". . . . . o . . \n"))
      ((= n 7) (display ". . . . . . o . \n"))
      ((= n 8) (display ". . . . . . . o \n"))))
  (for-each (lambda (row) (print-row (cdr row))) seq))

(queens-print (car (queens 8)))