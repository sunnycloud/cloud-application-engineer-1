;;
;; Week 1, Lecture 1 : Scheme Fundamentals
;;

;;
;; SCHEME BASICS
;;

;; the integer 486
486

;; the string literal 'hi there'
"hi there"

;; an expression for adding 1 and 2
(+ 1 2)

;; (1+2)(4-2)
(* (+ 1 2) (- 4 2))

;; is 1 > 0?
(> 1 0)

;; is 2 >= 3?
(>= 2 3)

;; is 0 == 0?
(= 0 0)

;; based on the test 1 > 0?, return 3 or 4
(if (> 1 0) 3 4)

;; based on the test 1 == 0?, return 3 or 4
(if (= 1 0) 3 4)

;;
;; examine possibly multiple cases until the
;; right expression is found
;;
(cond ((= 4 4) 4) ;; return 4 if 4 == 4? holds
      ((> 3 4) 7) ;; else, return 7 if 3 > 4? holds
      (else 5))   ;; if all else fails, return 5

;; get the value of 'x'
;; (type 'x' without semicolons below, will cause
;; error because hasn't been defined yet, hit
;; ^C ^C to reset)
;; x

;; set the value of 'x' to 5
(define x 5)

;; get the value of 'x'
x

;; evaluate x + 1
(+ x 1)

;;
;; FUNCTIONS
;;

;; define a function called add5 which takes an
;; argument x (locally overriding global x)
(define (add5 x) (+ x 5))

;; evaluate add5(1)
(add5 1)

;; evaluate add5(5)
(add5 5)

;; define a function called 'square' which returns the
;; square of its argument x (locally overriding global x)
(define (square x) (* x x))

;; evaluate square(-1)
(square -1)

;; evaluate square(3)
(square 3)


;;
;; OUTPUT & INPUT
;;

;; write the string 'hello user' to output
(write-line "hello user")

;; putting 2 separate strings together
(write-line (string-append "hello " "world"))

;; converting a number to a string
(number->string 5)

;; vice versa
(string->number "7")

;; read a line from user input
(read-line)
;; ... user may now enter some text, followed by <ENTER>


;;
;; SAMPLE CODE!
;;

;;
;; a function that can evaluate user input
;;
;; NOTE: the line reading happens inside of the 'if' test
;; in the future, we'll see a better way to do that
;;
(define (try-unlock)
  (if (string=? (read-line) "opensesame")  ;; if the input string is 'opensesame'
    (write-line "unlocked!")               ;; print the 'unlocked' message
    (write-line "still locked.")))         ;; otherwise print 'locked'

;; execute the try-unlock function
(try-unlock)
opensesame

;;
;; another function that can evaluate user input
;;
;; NOTE: the line reading happens inside of the 'if' test
;; in the future, we'll see a better way to do that
;;
(define (is-old)
  (if (> (string->number (read-line)) 30)
    (write-line "You're old!")
    (write-line "Not old yet.")))

;; execute the is-old function
(is-old)
21

;; execute the is-old function
(is-old)
64

;; a function that converts degrees F to degrees C
(define (f-to-c x) (* (/ 5.0 9.0) (- x 32.0)))

;; evaluate f-to-c of 98.6
(f-to-c 98.6)

;; evaluate f-to-c of 32
(f-to-c 32)

;; evaluate f-to-c of 212
(f-to-c 212)

;; THE END (for now)
"fin."

