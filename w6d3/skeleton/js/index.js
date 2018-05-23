console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',

  success: function(data) {
    console.log(data);
    $('body').append(JSON.stringify(data));
  },
  error: function(err) {
    console.log(err);
  }
});
// Add another console log here, outside your AJAX request
console.log("AJAX not bad");
