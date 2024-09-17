
// //q6
// function printPyramid() {
//     let row = "";
//   for (let i = 1; i <= 5; i++) {

//     for (let j = 1; j <= i; j++) {
//       row += i+ ``
//       break;

//     }
//     console.log(`this is row`, row);
// }
// }
// printPyramid();
// //q7
// function searchInArray(array_2D, target) {
//     let row ;
//     let col ;
  
//     for (let i = 0; i < array_2D.length; i++) {
//       let currentArray = array_2D[i];
//       console.log(`currentArray:`, currentArray);
  
//       for (let j = 0; j < currentArray.length; j++) {
//         let currentNumber = currentArray[j];
//         console.log(`currentNumber:`, currentNumber);
  
//         if (currentNumber === target) {
//           row = i;
//           col = j;
//           console.log(`Found ${target} at position (${row}, ${col})`);
//           return { row, col }; // Return immediately once found
//         }
//       }
//     }
  
//     console.log(`For target ${target}, output: Not found`);
//     return { row, col }; // Return (-1, -1) to indicate not found
//   }
  
//   // Example usage
//   let arr = [
//     [1, 2, 3],
//     [4, 5, 6],
//     [7, 8, 9],
//   ];
  
//   let result = searchInArray(arr, 4);
//   console.log(result); // Should log: { row: 1, col: 1 }
//   //q8
//   function findFrequency (str){
// let count=0;
// let freqObject = {
//    h:1
// }
// for (i=0; i <= str.length; i ++){
//     let chart = str[i]
//     console.log(chart);
//     for (j=0; j < str.length; j++){
//       console.log(`scanning letter ${str[i]} on ${str[j]}`);
//       if (str[i] === str[j]) {
//          if (!freqObject[str[i]])
//          }
//       }
// }
// console.log(`end of scanning`);
//   }
//   findFrequency(`hello`)
//   //q9
//   let array2d = [[1,2],[4,5],[7,8]];
// function arrid(nestedarray){
//     return console.log(nestedarray.flat());

// }
// arrid(array2d);
// //q11
// function isPalinrom (str) {
//     let length = str.length
// for (let i = 0; i < str.length; i++) {
//     //console.log(str[i]);
//     for (let j = 0; j < 1; j++){
//         if (str[i] !== str[length - 1 - i]) 
//             return false
//     }
// }
// return true
// }

// console.log (isPalinrom("natan"));



//objects
//let person = {
   // name: "daniel",
   // age: 20,
   // city: "kfar saba"
//};

//console.log(person);



