defmodule Bank.Core.Accounting.AccountEntry do
  @moduledoc """
  This module defines the AccountEntry schema.
  Used to model single account entries.
  """

  use Domo
  use Ecto.Schema

  @type t() :: %__MODULE__{
          journal_entry_uuid: binary(),
          account: binary(),
          credit: integer(),
          debit: integer()
        }

  schema "accounting_account_entries_v1" do
    field :journal_entry_uuid, :binary_id
    field :account, :string

    field :credit, :integer, default: 0
    field :debit, :integer, default: 0
  end
end
