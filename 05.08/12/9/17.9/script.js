
document.getElementById('content').style.backgroundColor = 'lightblue';


const textElements = document.querySelectorAll('.text');
textElements.forEach(element => {
    element.style.color = 'red';
});


const listItems = document.querySelectorAll('#list li');
for (let i = 0; i < listItems.length; i++) {
    console.log(listItems[i].textContent);
}


document.getElementById('highlight-button').addEventListener('click', () => {
    listItems.forEach(item => {
        item.style.backgroundColor = 'yellow';
    });
});
