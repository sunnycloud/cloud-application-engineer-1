// Write a JS function that takes an integer argument N, and creates an array
// containing the integers from 1 to N


function enumerate_array(n) {
    var result = new Array();

    for(var i = 1; i <= n; i++) {
        result.push(i);
    }

    return result;
}

function recur_array(n) {
    var result = new Array();
    return recur_array_iter(result, 0, n)
}

function recur_array_iter(result, i, n) {
    console.log("we are at: " + i );
    if (i < n) {
        result.push(i + 1);
        return recur_array_iter(result, i + 1, n);
    } else {
        return result;
    }
}

recur_array(5);

var x = enumerate_array(4);  // x = [1,1,1,1]
var x = enumerate_array(5);  // x = [1,2,3,4,5]
                             // x = [1,.,.,.,N]
