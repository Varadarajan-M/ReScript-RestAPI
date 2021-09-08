let map = (a, fn) => Js.Promise.then_(v => v->fn-> Js.Promise.resolve, a)
let flatMap = (a, fn) => Js.Promise.then_(fn, a)
