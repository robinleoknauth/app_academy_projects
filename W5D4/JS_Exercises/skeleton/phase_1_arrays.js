// Array.prototype.uniq = function () {
//   const result = [];
//   this.forEach(el => {
//   if (!result.includes(el)) {
//     result.push(el);
//   }
//   });
//   return result;
// };

Array.prototype.uniq = function () {
  const result = {};
  this.forEach (el => {
    result[el] = true;
    console.log(el);
    console.log(result[el]);
  });
// .keys returns keys as STRINGS, why is that?
  return Object.keys(result);
};


// this is quadreatic time, can we do better?
Array.prototype.twoSum = function () {
  const result = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }
  return result;
};

Array.prototype.transpose = function () {
  const a = this.length;
  let result_length = this[0].length;
  const result = [];

  if (a > result_length) {
    result_length = a;
  }

  for (let i = 0; i < result_length; i++) {
    result.push([]);
  }

  for (let i = 0; i < result_length; i++) {
    for (let j = 0; j < result_length; j++) {
        result[j][i] = this[i][j];
    }
  }
  return result;
};

// console.log([[1,2,3],[4,5,6],[7,8,9]].transpose());
