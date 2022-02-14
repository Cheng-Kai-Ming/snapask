// import httpClient from "/app/javascript/lib/http/client"
import { Controller } from "stimulus"


export default class extends Controller {
  courses(){

      fetch('/api/v0/courses',{
        headers:{
          "X-Api-Secret-Key":"secret"
        },
        params:{access_key: "Jazyx5znADzoubQ53zZIg0FxxvBmDcg3MVgP2dEY"}
      })
        .then(function(response) {return response.json()} )
        .then(function(json){console.log(json)}) 
    
  }

  orders(){

    fetch('/api/v0/orders?access_key=qBvsmmlntfHhbKre570h7es9BJjUM6qDT6gVzj0E',{
      headers:{
        "X-Api-Secret-Key":"secret",
      }
    })
      .then(function(response) {return response.json()} )
      .then(function(json){console.log(json)}) 
  
}
}
