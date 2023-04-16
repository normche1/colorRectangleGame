
var counter = 0

function func() {

}

function clearCounter()
{
    counter = 0;
    colRect1.text = "0"
    colRect2.text = "0"
    colRect3.text = "0"
    colRect4.text = "0"
}

function setCounter()
{
    if(colRect.color === paintedRect.color)  counter++;
    else counter--;

//    return counter;
}

function getCounter()
{
    return counter;
}

function randRect(){
    var r = Math.floor(Math.random() * 4)
    if(r === 0) colRect1.color = paintedRect.color;
    if(r === 1) colRect2.color = paintedRect.color;
    if(r === 2) colRect3.color = paintedRect.color;
    if(r === 3) colRect4.color = paintedRect.color;
}

function summaryCounter()
  {
    if(colRect.color === paintedRect.color)  root.sumCounter++;
    else root.sumCounter--;

    return root.sumCounter;
  }

function secTimerStopped()
  {
    secTillEnd--;
    if(secTillEnd === 0){
    secTimer.stop();
     }
  }
