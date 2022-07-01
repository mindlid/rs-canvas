%%raw("import './index.css'")
open Webapi.Dom

Js.log("hello world")

let container = document->Document.getElementById("root")

switch container {
| Some(c) => ReactDOM.render(<div> {React.string("hello world")} </div>, c)
| None => ()
}
