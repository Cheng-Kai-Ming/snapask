// import httpClient from "/app/javascript/lib/http/client"
import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ["output"]

  courses(){
      let coursesHTLM = ""
      fetch('/api/v0/courses',{
        headers:{
          "X-Api-Secret-Key":"secret"
        },
        params:{access_key: "Jazyx5znADzoubQ53zZIg0FxxvBmDcg3MVgP2dEY"}
      })
        .then(function(response) {return response.json()} )
        .then((courses)=>{
          courses.forEach(function(element){
            coursesHTLM += 
          `
          <div>
            <tr>
              <td>${element.name}</td>
              <td>${element.price}</td>
              <td>${element.currency}</td>
              <td>${element.category}</td>
              <td>${element.intro}</td>
            </tr> 
          </div>
          `
        })
        this.outputTarget.innerHTML += coursesHTLM
        }) 
  }

  orders(){
    let ordersHTLM = ""
    fetch('/api/v0/orders?access_key=qBvsmmlntfHhbKre570h7es9BJjUM6qDT6gVzj0E',{
      headers:{
        "X-Api-Secret-Key":"secret",
      }
    })
      .then(function(response) {return response.json()} )
      .then((orders)=>{
        orders.forEach(function(element){
          ordersHTLM +=
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
        this.outputTarget.innerHTML += ordersHTLM
      }) 
  
  }

  buildOrder(){
    fetch('/api/v0/build/order?access_key=qBvsmmlntfHhbKre570h7es9BJjUM6qDT6gVzj0E&course_id=12&amount=300',{
      headers:{
        "X-Api-Secret-Key":"secret",
      },
      method: 'POST'
    })
      .then(function(response) {return response.json()} )
      .then(function(json){console.log(json)}) 

  }
}
