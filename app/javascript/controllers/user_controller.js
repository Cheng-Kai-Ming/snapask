// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { loadCSPNonce } from "@rails/ujs"
import { Controller } from "stimulus"
// import httpClient from "/app/javascript/lib/http/client"

export default class extends Controller {
  courses(){

      fetch('/api/v0/courses')
        .then(function(response) {return response.json()} )
        .then(function(json){console.log(json)}) 
    
  }
}
