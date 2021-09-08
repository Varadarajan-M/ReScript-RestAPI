open Mongoose

type bookT = {"author": string, "name": string}

let bookSchemaOptions = {
  "author": {
    "required": true,
    "type": stringT,
  },
  "name": {
    "required": true,
    "type": stringT,
  },
}

let bookSchema = schema(bookSchemaOptions)

let _BookModel = mongoose->model("Book", bookSchema, "Books")

@new external book: bookT => model = "_BookModel"

/* 
used when calling as a constructor function  
eg Js code:
 const someBook = {...}
 await new bookModelC(someBook).save() 
*/
let bookModelC = book

/* 
used for data crud functions  
eg JS code:
 const books = await bookModel.find() 
*/
let bookModel = _BookModel