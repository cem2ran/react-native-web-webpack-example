open ReactNative
open Stacks

type state = {count: int}

type action =
  | Increment
  | Decrement

let initialState = {count: 0}

let reducer = (state, action) =>
  switch action {
  | Increment => {count: state.count + 1}
  | Decrement => {count: state.count - 1}
  }

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(reducer, initialState)

  <StacksProvider spacing=4. debug=true>
    <Stack padding=[2.] space=[2.]>
      {React.string("Simple counter with reducer")}
      <Columns space=[5.]>
        <Column width=[#content]>
          <button onClick={_ => dispatch(Decrement)}> {React.string("Decrement")} </button>
        </Column>
        <Column width=[#content]>
          <Text> {state.count |> string_of_int |> React.string} </Text>
        </Column>
        <Column width=[#content]>
          <button onClick={_ => dispatch(Increment)}> {React.string("Increment")} </button>
        </Column>
      </Columns>
    </Stack>
  </StacksProvider>
}
