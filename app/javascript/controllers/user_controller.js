import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ["output", "courseInfo", "key"]

  courses(){
      let coursesHTML = ""
      this.outputTarget.innerHTML = ""
      fetch('/api/v0/courses',{
        headers:{
          "X-Api-Secret-Key":"secret"
        }
      })
        .then(function(response) {return response.json()} )
        .then((courses)=>{
          courses.forEach((element) =>{
            if (element.state == "unavailable"){
              coursesHTML += 
              `
              <div>
                <tr>
                  <td>${element.name}</td>
                  <td>${element.price}</td>
                  <td>${element.currency}</td>
                  <td>${element.category}</td>
                  <td>${element.intro}</td>
                  <td>${element.state}</td>
                </tr> 
              </div>
              `
              
            } else {
              coursesHTML += 
              `
              <div>
                <tr>
                  <td>${element.name}</td>
                  <td>${element.price}</td>
                  <td>${element.currency}</td>
                  <td>${element.category}</td>
                  <td>${element.intro}</td>
                  <td>${element.state}</td>
                  <button class="info" data-action="click->user#toggle" data-user-target = "courseInfo"  data-courseId=${element.id} data-coursePrice=${element.price}>購買</button>
                </tr> 
              </div>
              `
            
            }
        
        })
        this.outputTarget.innerHTML += coursesHTML
        }) 
  }

  orders(){
    const key = this.keyTarget.dataset.key
    this.outputTarget.innerHTML = ""
    let ordersHTML = ""
    fetch(`/api/v0/orders?access_key=${key}`,{
      headers:{
        "X-Api-Secret-Key":"secret",
      }
    })
      .then(function(response) {return response.json()} )
      .then((orders)=>{
        orders.forEach(function(element){
          ordersHTML +=
          `
          <div>
            <tr>
              <td>${element.amount}</td>
              <td>${element.paid_at}</td>
              <td>${element.serial}</td>
              <td>${element.state}</td>
            </tr> 
          </div>
        `
        })
        this.outputTarget.innerHTML += ordersHTML
      }) 
  
  }
  toggle(element){
    const key = this.keyTarget.dataset.key
    const courseId = element.target.dataset.courseid
    const coursePrice = element.target.dataset.courseprice
    fetch(`/api/v0/build/order?access_key=${key}&course_id=${Number(courseId)}&amount=${Number(coursePrice)}`,{
      headers:{
        "X-Api-Secret-Key":"secret",
      },
      method: 'POST'
    })
      .then(function(response) {return response.json()} )
      .then(function(json){console.log(json)}) 
  }
}
