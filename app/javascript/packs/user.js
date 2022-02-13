


  // $.ajax({
  //   url: "http://localhost:3000/api/v0/courses",
  //   dataType: "json",
  //   success: function (d){
  //     console.log(d)
  //   }
  // })

  getJSON("/api/v0/courses").then(jsonData=>{
    console.log(jsonData)
  })