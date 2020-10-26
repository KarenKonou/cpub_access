defmodule CommonsPub.Access.Access do
  @moduledoc """
  """

  use Pointers.Pointable,
    otp_app: :cpub_accesss,
    table_id: "ABVNCH0FPERM1SS10NS1NA11ST",
    source: "cpub_access_access"

  alias CommonsPub.Access.Access
  alias Pointers.{Changesets}

  pointable_schema do
    field :name, :string
    field :can_see, :boolean
    field :can_read, :boolean
  end

  def changeset(access \\ %Access{}, attrs, opts \\ []),
    do: Changesets.auto(access, attrs, opts, [])

end

defmodule CommonsPub.Access.Access.Migration do
  use Ecto.Migration
  import Pointers.Migration
  alias CommonsPub.Access.Access

  def create_access_table() do
    create_pointable_table(Access) do
      add :name, :string
      add :can_see, :boolean
      add :can_read, :boolean
    end
  end

  def drop_access_table(), do: drop_pointable_table(Access)

  def migrate_access(dir \\ direction())
  def migrate_access(:up), do: create_access_table()
  def migrate_access(:down), do: drop_access_table()
end
