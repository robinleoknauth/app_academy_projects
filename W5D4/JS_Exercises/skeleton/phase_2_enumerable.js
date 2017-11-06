
Array.prototype.myEach = function (callb) {
  for (let i = 0; i < this.length; i++) {
    callb(this[i], i);
  }
  return this;
};

// console.log([1,2,43,45].myEach( function (el) ( el + 1 )));
// console.log([1,2,43,45].myEach( el => {
//   return el + 1; }
//  ));


 Array.prototype.map = function (callb) {
   return this.myEach(callb);
 };

 // console.log([1,2,43,45].myEach( function (el) ( el + 1 )));
 console.log([1,2,43,45].map( el => {
   return el + 1; }
  ));



Array.prototype.myReduce = function (callb, initial) {
  let accumulator = initial;
  if (accumulator === undefined) {
     accumulator = this[0];
  }

  this.myEach( function( el , i) {
    if (i !== 0) {
    accumulator =  callb(accumulator, el);}

  });

  return accumulator;
};

  let foo = function( arg1, arg2 ) {
    return arg1 + arg2;
  };

  //
  // console.log([1,2,3,4].myReduce( foo ));










// Array.prototype.bubbleSort
