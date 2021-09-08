open Mongoose

let connectionOptions : connectionOptions = {
	useNewUrlParser: true,
	useUnifiedTopology: true,
	useCreateIndex: true,
	useFindAndModify: false,
};
let connectDb = () => {

    mongoose->connect("mongodb://localhost:27017/restapi",connectionOptions)
    let connection = mongoose->connection
    connection->on("connected",()=> {
        Js.log("Connected to Database")
    })
    connection->on("error",()=> {Js.log("Connection Failed")})
}