defmodule Bank.Core.Commands.DepositMoney do
  use Domo, skip_defaults: false

  @type t :: %__MODULE__{
          account_id: Bank.account_number(),
          amount: Bank.amount()
        }

  defstruct account_id: Bank.operator_account_id(), amount: 0
end
