defmodule Bank do
  @moduledoc "Banking application"

  import Domo

  @type account_number() :: binary()
  precond account_number: &validate_account_number/1

  def validate_account_number(string) do
    if string =~ ~r/^[[:digit:]]{3}-[[:digit:]]{3}$/ do
      :ok
    else
      {:error, "Account number should be of xxx-xxx, x = 0..9 format."}
    end
  end

  @type amount() :: non_neg_integer()
  @type account_entries() :: %{account_number() => amount()}

  def operator_account_id, do: "000-000"
end
