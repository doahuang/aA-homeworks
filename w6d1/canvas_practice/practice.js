document.addEventListener("DOMContentLoaded", function(){
  //set up canvas
  const mycanvas = document.getElementById('mycanvas');
  mycanvas.height = 500;
  mycanvas.width = 500;
  //draw rectangle
  const ctx = mycanvas.getContext('2d');
  ctx.fillStyle = 'blue';
  ctx.fillRect(0, 0, 100, 100);
  //draw circle
  ctx.beginPath();
  ctx.arc(200, 150, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'green';
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = 'yellow';
  ctx.fill();
  //draw love shape
  ctx.beginPath();
  ctx.strokeStyle ='red';
  ctx.moveTo(300, 300);
  ctx.bezierCurveTo(250, 275, 220, 200, 275, 200);
  ctx.arc(275, 225, 25, 1.5 * Math.PI, 0);
  ctx.arc(325, 225, 25, Math.PI, 1.5 * Math.PI);
  ctx.moveTo(325, 200);
  ctx.bezierCurveTo(375, 200, 350, 275, 300, 300);
  ctx.stroke();
});
