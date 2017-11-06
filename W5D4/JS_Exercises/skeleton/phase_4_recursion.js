let range = function (start,end) {
  if (start === end) {
    return [end];
  }

  return [start].concat(range(start + 1, end));
};

// console.log(range(1, 8));

let sumRecc = function(arr) {
  if (arr.length === 0) {
    return 0;
  }
  let k = arr.length;
  return arr[0]+ sumRecc(arr.slice(1, k));
};


// console.log(sumRecc([1,2,3,4]));

// exponent recursively
let exponent = function (b, n) {
  if (n === 0 ) {
    return 1;
  }
  n--;
  return b * exponent(b, n);
};

// console.log(exponent(2, 3));



// fibonacci recursively

let fibsRec = function (n) {
  if (n < 3) {
    return [0,1].slice(0, n);
  }

  let fibs = fibsRec(n - 1);

  fibs.push((fibs[fibs.length - 2] + fibs[fibs.length - 1]));
  return fibs;

};

// console.log(fibsRec(10));

function bSearch(arr, target) {
  if (arr.length === 0) {
    return -1;
  }

  let mid = Math.floor(arr.length / 2)
  const pivot = arr[mid];

  if (pivot === target) {
    return mid;
  } else if (pivot > target) {
    let left = (arr.slice(0, mid));
    return bSearch(left, target);
  } else {
    let right = (arr.slice(mid + 1));
    let subs = bSearch(right, target);

    return subs === -1 ? -1 : subs + (mid + 1);
  }
};


// console.log(bSearch([1,2,3,4,5,6,7,8,9,11,12,13,14,15], 7));

function merge(left, right) {
  const res = []

  while (left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      res.push(right.shift())
    } else {
      res.push(left.shift())
    }
  }
  return res.concat(left).concat(right)
}

function mergeSort (arr) {
  if (arr.length <= 1) {
    return arr
  }
  const mid = Math.floor(arr.length / 2)

  let left = mergeSort(arr.slice(0, mid))
  let right = mergeSort(arr.slice(mid))

  return merge(left, right)
}


// console.log(mergeSort([1,5,3,4,2,3,4,6,7,8,9,7,5,6,3,4,6,5]));


function subsets (arr) {
  if (arr.length === 0) {
    return [[]]
  }
  const first = arr[0]
  const rest = subsets(arr.slice(1))
  const total = rest.map( sub => [first].concat(sub))
  return rest.concat(total)
}


console.log(subsets([0,1,2]));
