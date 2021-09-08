open Express
open Connection
open BookModel
open Mongoose
open ResponseHandlers

let app = expressFn()

app->use(express->json)

connectDb()

app->get("/books", (_, res) => {

  bookModel
  ->find
  ->Promise.map(d => {
    res->status(200)
    Js.Array.length(d) > 0 
    ? res->send(successHandler(d)) 
    : res->send(errorHandler("Nothing found"))
  })
  ->Js.Promise.catch(_ => {
    res->status(400)
    Js.Promise.resolve()
  }, _)
  ->ignore

})

app->post("/books", (req, res) => {  
  
  bookModelC(req->body)
  ->save
  ->Promise.map(d => {
    res->status(200)
    res->send(successHandler(d))
  })
  ->Js.Promise.catch(_ => {
    res->status(400)
    res->send(errorHandler("Cannot Save"))
    Js.Promise.resolve()
  }, _)
  ->ignore

})

app->delete("/books", (_, res) => {

  bookModel
  ->deleteMany(Js.null)
  ->Promise.map(d => {
    d["deletedCount"] > 0
      ? res->send(successHandler(d))
      : res->send(errorHandler("Nothing to delete"))
  })
  ->Js.Promise.catch(e => {
    res->send(e)
    Js.Promise.resolve()
  }, _)
  ->ignore

})

app->get("/books/:id", (req, res) => {

  let params = req->params
  bookModel
  ->findById(params["id"])
  ->Promise.map(d =>
    Js.null === d
      ? {
          res->status(400)
          res->send(errorHandler("Nothing found"))
        }
      : res->send(successHandler(d))
  )
  ->Js.Promise.catch(e => {
    res->send(e)
    Js.Promise.resolve()
  }, _)
  ->ignore

})

app->patch("/books/:id", (req, res) => {

  let params = req->params
  bookModel
  ->findByIdAndUpdate(params["id"], req->body)
  ->Promise.map(d =>
    d !== Js.null
      ? {
          res->status(200)
          res->send(successHandler(d))
        }
      : {
          res->status(400)
          res->send(errorHandler("cannot Update"))
        }
  )
  ->Js.Promise.catch(e => {
    res->send(e)
    Js.Promise.resolve()
  }, _)
  ->ignore

})

app->delete("/books/:id", (req, res) => {

  let params = req->params
  bookModel
  ->findByIdAndDelete(params["id"])
  ->Promise.map(d => {
    d !== Js.null
      ? {
          res->status(204)
          res->send(successHandler(d))
        }
      : {
          res->status(400)
          res->send(errorHandler("Cannot Delete"))
        }
  })
  ->Js.Promise.catch(e => {
    res->send(e)
    Js.Promise.resolve()
  }, _)
  ->ignore

})

app->listen(3000, () => {
  Js.log("Server started at port 3000")
})
