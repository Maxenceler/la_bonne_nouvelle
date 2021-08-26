
const handleNewAnswer = (event) => {
   const responseId = event.currentTarget.dataset.nextQuestionName
   console.log(responseId)
   const nextQuestion = document.querySelector(`#${responseId}`)
   console.log(nextQuestion)

};

const initChatbot = () => {
  const question = document.querySelector("#estimation-approximative");
  const responses = document.querySelectorAll(".answer-group")
  responses.forEach((response)=> {
  response.addEventListener("click", handleNewAnswer);
  })
}


export { initChatbot }
