// @Bindings for Mongoose

// @types
type mongooseT
type connection
type schema
type model
type connectionOptions = {
  useNewUrlParser: bool,
  useUnifiedTopology: bool,
  useCreateIndex: bool,
  useFindAndModify: bool,
}
type unitFn = unit => unit
type error

// @modules
@module external mongoose: mongooseT = "mongoose"

// connection related functions

@send external connect: (mongooseT, string, connectionOptions) => unit = "connect"

@send external on: (connection, string, unitFn) => unit = "on"

@get external connection: mongooseT => connection = "connection"

// @Constructor functions
@module("mongoose") @new external schema: 't => schema = "Schema"

@send external model: (mongooseT, string, schema, string) => model = "model"

@val external stringT: string = "String"

@val external numT: int = "Number"

// @function bindings
@send external save: 'a => Js.Promise.t<'a> = "save"

@send external saveCB: ('a, (option<Js.Exn.t>, option<'b>) => unit) => unit = "save"

@send external find: model => Js.Promise.t<array<'a>> = "find"

@send external findCB: (model, (option<Js.Exn.t>, option<'b>) => unit) => unit = "find"

@send external deleteMany: (model, 'a) => Js.Promise.t<'b> = "deleteMany"

@send external findById: (model, 'a) => Js.Promise.t<'b> = "findById"

@send external findByIdCB: (model, (option<Js.Exn.t>, option<'b>) => unit) => unit = "findById"

@send external findByIdAndUpdate: (model, 'a, 'b) => Js.Promise.t<'c> = "findByIdAndUpdate"

@send external findByIdAndDelete: (model, 'a) => Js.Promise.t<'b> = "findByIdAndDelete"
