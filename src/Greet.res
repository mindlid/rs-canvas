open Js.Global

module Greet = {
  // https://rescript-lang.org/docs/react/latest/components-and-props#children-props
  @react.component
  let make = (~name: option<string>=?) => {
    let (count, setCount) = React.useState(() => 0.0)

    // print hello world on mount
    React.useEffect0(() => {
      Js.log("Hello world!")
      Some(() => Js.log("Goodbye world!"))
    })

    // set a random number to count every second
    React.useEffect0(() => {
      let id = setInterval(() => setCount(_ => Js.Math.random()), 1000)
      Some(() => clearInterval(id))
    })

    <>
      <div style={ReactDOM.Style.make(~fontSize="24px", ())}>
        {React.string(
          switch name {
          | Some(name) => "Re: Hello " ++ name ++ "!"
          | None => "Hello stranger!"
          },
        )}
      </div>
      <br />
      <div> {React.string(Belt.Float.toString(count))} </div>
    </>
  }
}
