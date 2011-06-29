function make_listnode(value, next) {
    var node = new Object();
    node['value'] = value;
    node['next'] = next;
    return node;
}

function find(value, alist) {
    if (alist == null) {
        return null;
    }
    if (alist['value'] == value) {
        return alist;
    }
    return find(value, alist['next']);
}

function contains(value, alist) {
    return find(value, alist) != null;
}

function insert(value, alist) {
    return make_listnode(value, alist);
}

// note: originally in the slides it was 'delete'. delete is what's called a
//       "reserved word" in JavaScript. This means that it is already in use/has
//       special meaning, and shouldn't be redefined by you. gfmi (google for
//       more information :P )
function remove(value, alist) {
    var last = null;
    for (var cur = alist; cur != null; cur = cur['next']) {
        if (cur['value'] == value) {
            if (last == null) {
                alist = cur['next'];
            } else {
                last['next'] = cur['next'];
            }
            break;
        }
        last = cur;
    }
    return alist;
}

function length(alist) {
    var len = 0;
    for (var cur = alist; cur != null; cur = cur['next']) {
        len = len + 1;
    }
    return len;
}


//testing
var alist = make_listnode(12, null);
var blist = make_listnode(24, alist);
var clist = make_listnode(17, blist);

console.log(find(12, clist));
console.log(find(24, clist));
console.log(find(17, clist));

console.log(contains(12, clist));
console.log(contains(24, clist));
console.log(contains(17, clist));

console.log(length(clist));
console.log(length(blist));
console.log(length(alist));


console.log(remove(12, clist));
console.log(clist);
console.log(length(clist));
