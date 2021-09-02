const initSpinner = () => {
  const submitButton = document.querySelector('.btn-lbn-pl');
  const spinnerButton = document.querySelector('#spinner');
  if (spinnerButton) {
    submitButton.addEventListener('click', (event) => {
      event.currentTarget.classList.add('d-none')

      spinnerButton.classList.remove('d-none')
      spinnerButton.classList.add('d-flex')
    })
  }

}

export { initSpinner }