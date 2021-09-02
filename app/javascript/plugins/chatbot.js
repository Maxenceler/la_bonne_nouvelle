import { fetchWithToken } from '../utils/fetch_with_token'

const fakeTyping = `<div class="col-1 fake-writing">
                      <div class="circle-writing"><i class="fas fa-circle circle-chatbot"></i></div>
                      <div class="circle-writing"><i class="fas fa-circle second-circle-chatbot"></i></div>
                      <div class="circle-writing"><i class="fas fa-circle third-circle-chatbot"></i></div>
                    </div>`

const displayNextQuestion = (currentQuestion) => {
  console.log(currentQuestion.children[1])
  const selector = currentQuestion.dataset.nextQuestionName
  if (selector) {
    const futureQuestion = document.querySelector(`#${selector}`)
    futureQuestion.classList.remove("d-none");
    opacityTransition(futureQuestion)
    futureQuestion.children[1].scrollIntoView({ behavior: "smooth" })
    displayNextQuestion(futureQuestion)
  } else {
    currentQuestion.children[1].scrollIntoView({ behavior: "smooth" })
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


const opacityTransition = (question) => {
  const arrayChildren = Array.from(question.children)
  setTimeout(() => {
    question.scrollIntoView({ behavior: "smooth" })
    question.insertAdjacentHTML("afterbegin", fakeTyping)
  }, 500);

  setTimeout(() => {
    question.children[0].remove()
  }, 2000);
  arrayChildren.forEach((child, index) => {
    setTimeout(() => {
      child.classList.add("going-visible")
    }, 2000 + index * 500);
  })
}

const handleNewAnswer = (event) => {
  const nextQuestionName = event.currentTarget.dataset.nextQuestionName
  const responseId = event.currentTarget.dataset.responseId
  const projectId = event.currentTarget.dataset.projectId
  saveAnswers(responseId, projectId)

  const nextQuestion = document.querySelector(`#${nextQuestionName}`)
  nextQuestion.classList.remove("d-none");
  opacityTransition(nextQuestion);

  const nextAnswer = event.currentTarget.nextElementSibling


  if (nextAnswer) {
    nextAnswer.classList.add("d-none")
  } else {
    const previousAnswer = event.currentTarget.previousElementSibling
    previousAnswer.classList.add("d-none")
  }


  setTimeout(() => {
    displayNextQuestion(nextQuestion)
  }, 2000)
};

const initChatbot = () => {
  const responses = document.querySelectorAll(".answer")
  responses.forEach((response)=> {
    response.addEventListener("click", handleNewAnswer);
  })
}


const editForm = () => {
  const answerAnnounce = document.querySelector("[data-next-question-name='annonce']")
  if (answerAnnounce) {
    answerAnnounce.addEventListener("click", () => {
      const url = `${window.location.protocol}//${window.location.host}/projects/${answerAnnounce.dataset.projectId}/edit`
      window.open(url, '_self')
    })
  }
}



export { initChatbot, editForm }
