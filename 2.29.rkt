#lang racket
(define (make-mobile left right)
  (list left right))

;; A branch is constructed from a length (which must be a number) together with a structure,
;; which may be either a number (representing a simple weight) or another mobile:
(define (make-branch length structure)
  (list length structure))

;; a. write the corresponding selectors left-branch and right-branch, which return the branches of a mobile
;;    and branch-length and branch-structure, which return the components of a branch.
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; b. Using your selectors, define a procedure total-weight that returns the total weight of a mobile.
(define (branch-hangs-mobile? branch)
  (pair? (branch-structure branch)))
(define (total-weight-branch branch)
  (if (branch-hangs-mobile? branch)
    (total-weight-mobile (branch-structure branch))
    (branch-structure branch)))

(define (total-weight-mobile mobile)
  (+ (total-weight-branch (left-branch mobile))
     (total-weight-branch (right-branch mobile))))

;; test
(total-weight-mobile
 (make-mobile
  (make-branch 5 10)
  (make-branch 5
               (make-mobile
                (make-branch 2
                             (make-mobile
                              (make-branch 1 11)
                              (make-branch 2 7)))
                (make-branch 6 11)))))

;; c. A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied by its top-right branch (that is, if the 
;;   length of the left rod multiplied by the weight hanging from that rod is equal to the corresponding product for the right side) and if each of 
;;   the submobiles hanging off its branches is balanced. Design a predicate that tests whether a binary mobile is balanced.

;; returns false if not balance. othewise return torque,
(define (branch-torque branch)
  (* (branch-length branch) (total-weight-branch branch)))

(define (mobile-balanced? mobile)
  (and
     ;; if a branch hangs mobile, check if the submobile is balanced.
     (if (branch-hangs-mobile? (left-branch  mobile)) (mobile-balanced? (branch-structure (left-branch  mobile))) true)
     (if (branch-hangs-mobile? (right-branch mobile)) (mobile-balanced? (branch-structure (right-branch mobile))) true)
     ;; if both branch are balanced; compare torque
     (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile)))))

;; test
(mobile-balanced?
 (make-mobile
  (make-branch 5 10)
  (make-branch 5
               (make-mobile
                (make-branch 20 5)
                (make-branch 20 5)))))