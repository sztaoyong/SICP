#lang racket

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (set! balance (- balance amount))
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount)))
  (define (make-dispatch password)
    (lambda (p m)
      (if (eq? p password)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                ((eq? m 'show-balance) (begin (display "$ ") (display balance) (display "\n")))
                ;; when make-joint-request, we should not make a new account; we should just return a dispatch with different password.
                ;; this is to ensure the ''sameness'' requiremend
                ((eq? m 'make-joint) make-dispatch)
                (else (error "Unknown request -- MAKE-ACCOUNT" m)))
          (lambda (x) "Incorrect password!"))))
  (make-dispatch password))

(define (make-joint account password new-account-password)
  ((account password 'make-joint) new-account-password))

;; test
(define peter-acc (make-account 100 'open-sesame))
(display "Peter account - balance: ")
(peter-acc 'open-sesame 'show-balance)
(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))
(display "Paul made a joint account - balance: ")
(paul-acc 'rosebud 'show-balance)
((paul-acc 'rosebud 'withdraw) 100)
(display "Paul withdrew 100 - balance: ")
(paul-acc 'rosebud 'show-balance)

(display "Peter account - balance ")
(peter-acc 'open-sesame 'show-balance)
(display "Peter request to withdraw 100\n")
((peter-acc 'open-sesame 'withdraw) 100)