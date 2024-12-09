let slider = document.querySelector('#slider-1'); //slider 가져오기

console.log(slider);
console.log(slider.value);

let aNewDiv = document.createElement('div'); // html 문서에 칸 만들기
let textContents = document.createTextNode(slider.value); // div에 넣을 텍스트 만들기
aNewDiv.appendChild(textContents); // 만든 텍스트를 div에 넣기
document.body.appendChild(aNewDiv); // div를 html 문서에 넣기
