;;
;; Week 1, Lecture 2 : Recursion & Iteration
;;

;;
;; RECURSIVE FUNCTIONS
;;

;;
;; infinite recursion
;; "to evaluate the function f, evaluate the function f"
;;
(define (f) (f))

;; evaluate f() (NOTE: will hang infinitely!)
;; (f)

;;
;; bounded recursion
;; 
(define (f x)  ;; recurses x times
  (if (> x 0)
    (f (- x 1))))

;; evaluate f(10) (should be fast)
(f 10)

;; evaluate f(10000000) (should be slower)
(f 10000000)


;;
;; factorial function: n!
;; "if n = 1, return 1, otherwise multiply n by factorial(n - 1)"
;;
;; NOTE: what if n is zero or negative?
;;
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))


;; 
;; ITERATIVE FUNCTIONS
;;

;; the outer driver for an iterative factorial function
(define (factorial n) (fact-iter 1 1 n))

;;
;; iterative function: calls itself with
;; changing value, terminates at base case
;;
(define (fact-iter prod count max-count)
  (if (> count max-count)
    prod
    (fact-iter         ;; call self recursively
      (* count prod)   ;;   new product
      (+ count 1)      ;;   new count
      max-count)))     ;;   max count is constant


;;
;; Fun with 'let'
;;

;;
;; by itself, let allows you to create bindings
;; for new variables inside a function
;; f(x) = (x*(x+1)) + (y*(y+1))
;;
(define (f x y)
  (let ((x1 (+ x 1))  ;; define x1
        (y1 (+ y 1))) ;; define y1
    (+ (* x x1) (* y y1))))

;;
;; without bindings, let evaluates multiple
;; expressions and returns the result of the
;; last one
;; 
(define (awesome person num-times)
  (if (> num-times 0)
    (let () ;; no bindings
      (write-line  (string-append person " is awesome!")) ;; write the output, then...
      (awesome person (- num-times 1)))))                 ;; recurse n - 1 times

;; print awesome message 10 times for 'joe user'
(awesome "joe user" 10)

