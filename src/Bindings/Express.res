
// @Bindings for Express


// @types
type e
type unitFn = unit => unit
type request
type response
type router
type httpReqRes = (request, response) => unit
type middleWareFn = (request, response, unitFn) => unit

// @modules

@module external express: e = "express"
@module external expressFn: unit => e = "express"

// @function bindings
@send external listen: (e, int, unitFn) => unit = "listen"

@send external get: (e, string, httpReqRes) => unit = "get"
@send external post: (e, string, httpReqRes) => unit = "post"
@send external put: (e, string, httpReqRes) => unit = "put"
@send external delete: (e, string, httpReqRes) => unit = "delete"
@send external patch: (e, string, httpReqRes) => unit = "patch"

@send external use: (e, middleWareFn) => unit = "use"
@send external useWithRouter: (e, string, router) => unit = "use"
@send external json: e => middleWareFn = "json"

@send external send: (response, 'a) => unit = "send"
@send external status: (response, int) => unit = "status"

// @property bindings
@get external body: request => 'b = "body"
@get external params: request => 'p = "params"
