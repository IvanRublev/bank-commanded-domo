defmodule Bank.Core.Events.AccountOpened do
  use Domo

  @type t :: %__MODULE__{
          account_id: Bank.account_number()
        }

  defstruct [:account_id]
end
