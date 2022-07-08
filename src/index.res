%%raw("import './index.css'")
open Greet

let rootElement: option<Dom.element> = ReactDOM.querySelector("#root")

switch rootElement {
| Some(re) => {
    // https://rescript-lang.org/docs/react/latest/rendering-elements#rendering-elements-to-the-dom
    let root = ReactDOM.Client.createRoot(re)
    ReactDOM.Client.Root.render(root, <Greet name="World" />)
  }

| None => ()
}
