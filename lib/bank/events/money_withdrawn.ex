defmodule Bank.Core.Events.MoneyWithdrawn do
  use Domo

  @type t :: %__MODULE__{
          account_id: Bank.account_number(),
          amount: Bank.amount()
        }

  defstruct [:account_id, :amount]
end
