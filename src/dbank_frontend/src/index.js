import { dbank } from '../../declarations/dbank';

window.onload = async () => {
  update();
};

document.querySelector('form').onsubmit = async (e) => {
  e.preventDefault();
  //console.log('sumbmimted!');

  const button = e.target.querySelector('#submit-btn');

  const inputAmount = parseFloat(document.getElementById('input-amount').value);
  const outputAmount = parseFloat(document.getElementById('withdrawal-amount').value);

  button.setAttribute('disabled', true);

  if(!isNaN(inputAmount)) {
    //console.log(inputAmount);
    await dbank.topUp(inputAmount);
  }
  if(!isNaN(outputAmount)) {
    await dbank.withdraw(outputAmount);
  }

  await dbank.compound();

  update();
  
  document.getElementById('input-amount').value = '';
  document.getElementById('withdrawal-amount').value = '';
  button.removeAttribute('disabled');

}

async function update() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById('value').innerText = currentAmount.toFixed(2);
}