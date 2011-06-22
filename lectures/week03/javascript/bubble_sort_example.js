// swap([3,2,1], 0 1)  => [2,3,1]

function swap(an_array, index_i, index_j) {
    console.log("before anything happens: " + an_array);
    var tmp = an_array[index_i];
    console.log("after setting tmp:" + an_array);
    an_array[index_i] = an_array[index_j];
    console.log("after swapping j to i: " + an_array);
    an_array[index_j] = tmp;
    return an_array

}


function bubble_sort(a_array) {
    var n = a_array.length;
    var found_inversion = true;
    while (found_inversion) {
        found_inversion = false;
        for (var i = 1; i < n; i++) {
            if (a_array[i - 1] > a_array[i]) {
                found_inversion = true;
                swap(a_array, i - 1, i);
            }
        }
    }
    return a_array;
}

function compare(a,i) {
    return (a[i - 1] > a[i]);
}

function bubbleSortNew(a_array, compareFunction) {
    var n = a_array.length;
    var found_inversion = true;
    while (found_inversion) {
        found_inversion = false;
        for (var i = 1; i < n; i++) {
            if (compareFunction(a_array, i)) {
                found_inversion = true;
                swap(a_array, i - 1, i);
            }
        }
    }
    return a_array;
}

function ascBubble(a_array) {
    return bubbleSortNew(a_array, function(a,i) { return (a[i - 1] > a[i]);});
}

function descBubble(a_array) {
    return bubbleSortNew(a_array, function(a,i) { return (a[i - 1] < a[i]);});
}

console.log(ascBubble([3,2,1]));
console.log(descBubble([1,2,3]));
