//
// Week 1 Lecture 2 : JavaScript Basics
//


// the expression 1
1

// the expression for 2 + 2
2 + 2

// display an alert saying 'hello world'
alert("hello world")

// a function f that displays an alert
function f(x) {
  alert(x);
}

f("hello world!")

// conditional expression 1 > 0
(1 > 0)

// conditional expression 3 >= 2
(3 <= 2)

// conditional expression 4 == 4
(4 == 4)

// conditional expression "hello" == "hello"
("hello" == "hello")

// conditional expression "hello" == "world"
("hello" == "world")


//
// CONDITIONAL EXPRESSIONS
//

if (1 > 0) {
  alert("got it!");
} else {
  alert("strange...");
}

//
// DEFINING & USING FUNCTIONS
//

function f(x) { alert(x);  }
function addXY(x, y) { return x + y;  }
function mulXY(x, y) { return x * y;  }
addXY(1, 2)
addXY(-7, 21)
mulXY(2,3)

//
// RECURSIVE FUNCTIONS
//

function countdown(x) {
  if (x == 0) {
    alert("BOOM!");
  } else {
    alert("tick");
    countdown(x - 1);
  }
}

//
// ITERATIVE FUNCTIONS
//

function countdown_iter(x) {
  for (var i = x; i > 0; i--) {
    alert("tick");
  }
  alert("BOOM!");
}


//
// using tail recursion
// NOTE: for informational purposes only;
// tail recursion is not optimized in JavaScript
//
function factorial(n) {  // driver function
  return fact_tail(n, 1);
}

function fact_tail(n, prod) {
  if (n == 1) {
    return prod;
  }
  return fact_tail(n - 1, n * prod);
}
