defmodule Bank.Core.Events.MoneyDeposited do
  use Domo

  @type t :: %__MODULE__{
          account_id: Bank.account_number(),
          amount: Bank.amount()
        }

  defstruct [:account_id, :amount]
end
