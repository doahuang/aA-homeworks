function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
/*
in block
in block
*/

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}
/*
in block
out of block
*/

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
//error, x was declared as a constant

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}
/*
in block
out of block
*/

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}
//error, x was declared

function madLib(verb, adj, noun) {
  let VERB = verb.toUpperCase();
  let ADJ = adj.toUpperCase();
  let NOUN = noun.toUpperCase();
  return `We shall ${VERB} the ${ADJ} ${NOUN}.`;
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(array) {
  const arr = [];
  array.forEach(n => {
    if ((n % 3 === 0 || n % 5 === 0) && (n % 15 != 0)) {
      arr.push(n)
    }
  });
  return arr;
}

function isPrime(n) {
  if (n < 2) {
    return false;
  }
  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let counter = 0;
  let i = 2;
  while (counter < n) {
    if (isPrime(i)) {
      sum += i;
      counter += 1;
    }
    i += 1;
  }
  return sum;
}
