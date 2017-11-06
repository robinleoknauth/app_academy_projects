Array.prototype.bubbleSort = function () {
  for (let i = 0; i < this.length; i++) {
    if (this[i] > this[i + 1]) {
      // let a = this[i];
      // let b = this[i + 1];
      // this[i] = b;
      // this[i + 1] = a;
      [this[i], this[i+1]] = [this[i+1], this[i] ] ;

      console.log(this);
      i = -1;
    }
  }
  return this;
};

console.log([5,3,2,1,5].bubbleSort());


// Array.prototype.subtrings = function () {
//   const result = [];
//
//
// }
