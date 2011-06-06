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

;;
;; iteration of a 2-dimensional space: driver function
;;
(define (f x y) (f-iter 0 x 0 y))

;; helper function to output point
(define (show i j) (write-line (string-append "(x:" (number->string i) ", y:" (number->string j) ")")))

;;
;; iteration of a 2-dimensional space: implementation
;;
(define (f-iter i x j y)
  ;; no 'let' bindings, 'let' is used just for sequence
  ;; of operations
  (let ()
    (if (and (< i x) (< j y)) (show i j))
    (if (< j y)
      (cond ((< i x) (f-iter (+ i 1) x j y))
            ((= i x) (f-iter 0 x (+ j 1) y))))))

;;
;; fibonacci sequence: tree recursive form
;;
(define (fib n)
  (cond ((= n 0) 0)) ((= n 1) 1))
        (else (+ (fib (- n 1)) (fib (- n 2))))))

;;
;; fibonacci sequence: tail-recursive form
;; (driver function)
;;
(define (fib n) (fib-iter 1 0 n))

;;
;; fibonacci sequence: tail-recursive form
;; (implementation)
;;
(define (fib-iter a b count)
  (if (= count 0) b
    (fib-iter (+ a b) a (- count 1))))


;;
;; SAMPLE CODE : Infinite Game
;;   play by invoking the function by typing '(game)'
;;   without single quotes
;;

;; the game starts in the center of the boat
(define (game) (center-boat))

;;
;; at the center of the boat, the user may move
;; left or right safely
;;
(define (center-boat)
  (let ()
    (write-line "You are in the center of the boat. Move left or right?")
    (let ((d (read-line)))
      (cond ((string=? d "left") (side-boat d))
            ((string=? d "right") (side-boat d))
            (else (center-boat))))))

;;
;; at the side of the boat, the user must choose
;; wisely
;;
(define (side-boat side)
  (let ((otherside (if (string=? side "left") "right" "left")))
    (write-line
      (string-append "You are at the " side " of the boat. Move left or right?"))
    (let ((d (read-line)))
      (cond ((string=? d side) (ocean))
            (else (side-boat otherside))))))

;;
;; 'sorry, you lose'
;;
(define (ocean)
  (write-line "you fell in the ocean! Game Over."))
