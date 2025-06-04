/*
Write a code to solve the problem below with any programming language of your choice.
Create a reusable function to solve the issue. The function should return an array of
integers sorted in descending order, even numbers first then odd numbers from the input
array.
input : [3,2,5,1,8,9,6]
output : [8,6,2,9,5,3,1]
a. Attach your code in the document.
b. Attach the screenshot of your output.
*/

const sortArray = function (arr) {
  const reverseArray = arr.sort().reverse();
  const evenArray = []; 
  const oddArray = [];
  for (let i = 0; i < reverseArray.length; i++) {
    if (reverseArray[i] % 2 === 0) {
        evenArray.push(reverseArray[i]);
    } else {
        oddArray.push(reverseArray[i]);
    }
  }
  const joinArray = evenArray.concat(oddArray);

  return joinArray;
};

const arrayInput = [3, 2, 5, 1, 8, 9, 6];
console.log(sortArray(arrayInput));