import { post } from "jquery";
import { fetchWithToken } from "../utils/fetch_with_token"

const displayNextQuestion = (currentQuestion) => {
  const selector = currentQuestion.dataset.nextQuestionName
  if (selector) {
    const futureQuestion = document.querySelector(`#${selector}`)
    futureQuestion.classList.remove("d-none");
    displayNextQuestion(futureQuestion)
  }
}

const saveAnswers = (responseId, projectId) => {

  const url = "/response_projects"
  const body = { responseId: responseId,
                projectId: projectId }


  fetchWithToken(url, {
    method: "POST",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
    body: JSON.stringify(body)
  })

}


const handleNewAnswer = (event) => {
   const nextQuestionName = event.currentTarget.dataset.nextQuestionName
   console.log(nextQuestionName)
   const responseId = event.currentTarget.dataset.responseId
   const projectId = event.currentTarget.dataset.projectId
   saveAnswers(responseId, projectId)
   const nextQuestion = document.querySelector(`#${nextQuestionName}`)
   console.log(nextQuestion)
  nextQuestion.classList.remove("d-none");
  nextQuestion.scrollIntoView()
  displayNextQuestion(nextQuestion)

};

const initChatbot = () => {
  const responses = document.querySelectorAll(".answer")
  responses.forEach((response)=> {
  response.addEventListener("click", handleNewAnswer);
  })
}


export { initChatbot }
