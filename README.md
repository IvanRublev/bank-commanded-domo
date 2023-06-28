# Bank

This repo is a fork of https://github.com/vasspilka/bank example seasoned with [Domo library](https://hex.pm/packages/domo)
in Command and Event modules.

That extended example is for "Eventsourcing and CQRS in Elixir" talk by Vasilis Spilka at ElixirConf EU 2021 https://youtu.be/GEFbhMZlxzE

Functions of `Account` context, process manager, and projector constructs 
commands and events with conformance to their types by calling to `new/1` or `new!`.

That includes the validation of the `account_number()` value format 
via precondition defined in `Bank` module.

That brings the following errors to the User Interface automatically:

```elixir
iex(1)> alias Bank.Core.Accounts
iex(1)> Accounts.deposit_money(nil, 10)        
{:error,
 [
   account_id: "Invalid value nil for field :account_id of %Bank.Core.Commands.DepositMoney{}. Expected the value matching the <<_::_*8>> type."
 ]}

iex(2)> Accounts.deposit_money("100102", 500)        
{:error, 
  [
    account_id: "Account number should be of xxx-xxx, x = 0..9 format."
  ]}

iex(3)> Accounts.deposit_money("100-102", -12)
{:error,
 [
   amount: "Invalid value -12 for field :amount of %Bank.Core.Commands.DepositMoney{}. Expected the value matching the non_neg_integer() type."
 ]}

iex(4)> Accounts.deposit_money("100-102", 120)
{:ok, %Commanded.Commands.ExecutionResult{}} 
```

The casting of Event from Command with type mismatch produces runtime error.

The `config :domo, :skip_defaults, true` in `config.exs` is to disable 
verification of Commands and Events default values during compile time 
because fields are overwritten in Accounts context, Manager, and Projector anyway.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and init event store database with `mix do event_store.create, event_store.init`
  * Create and migrate your database with `mix ecto.setup`
  * Start iex with `iex -S mix`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
