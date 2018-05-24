document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const addPlace = (e) => {
    e.preventDefault();
    let input = document.querySelector('input.favorite-input');
    let li = document.createElement('li');
    li.innerText = input.value;
    document.getElementById('sf-places').append(li);
    input.value = '';
  };
  // --- your code here!
  document.querySelector('input.favorite-submit')
    .addEventListener('click', addPlace);


  // adding new photos
  const toggleForm = (e) => {
    e.preventDefault();
    let form = document.querySelector('div.photo-form-container');
    if (form.className === 'photo-form-container') {
      form.className = 'photo-form-container hidden';
    } else {
      form.className = 'photo-form-container';
    }
  };

  const addPhoto = (e) => {
    e.preventDefault();
    let input = document.querySelector('input.photo-url-input');
    let dogImg = document.createElement('img');
    dogImg.src = input.value;
    let dogLi = document.createElement('li');
    dogLi.append(dogImg);
    document.querySelector('ul.dog-photos').append(dogLi);
    input.value = '';
  };
  // --- your code here!
  document.querySelector('button.photo-show-button')
    .addEventListener('click', toggleForm);

  document.querySelector('input.photo-url-submit')
    .addEventListener('click', addPhoto);

});
