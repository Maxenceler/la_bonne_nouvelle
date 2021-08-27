
const displayNextQuestion = (currentQuestion) => {
  const selector = currentQuestion.dataset.nextQuestionName
  if (selector) {
    const futureQuestion = document.querySelector(`#${selector}`)
    console.log("selector", selector)
    futureQuestion.classList.remove("d-none");
    displayNextQuestion(futureQuestion)
  }
}



const handleNewAnswer = (event) => {
   const responseId = event.currentTarget.dataset.nextQuestionName
   console.log(responseId)
   const nextQuestion = document.querySelector(`#${responseId}`)
   console.log(nextQuestion)
  nextQuestion.classList.remove("d-none");
  displayNextQuestion(nextQuestion)

};


const handleNewQuestion = (event) => {
  const questionId = event.currentTarget.dataset.nextQuestionName
  const nextQuestion = document.querySelector(`#${questionId}`)
  nextQuestion.classList.remove("d-none");

};

const initChatbot = () => {
  const first_question = document.querySelector("#estimation-approximative");
  const questions = document.querySelectorAll(".question-group")
  const responses = document.querySelectorAll(".answer-group")
  responses.forEach((response)=> {
  response.addEventListener("click", handleNewAnswer);
  })
}


export { initChatbot }
