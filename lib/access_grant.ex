defmodule CommonsPub.Access.AccessGrant do
  @moduledoc """
  """

  use Pointers.Pointable,
    otp_app: :cpub_access,
    table_id: "1NSERTSAP01NTER2NT0AC1RC1E",
    source: "cpub_access_access_grant"

  alias CommonsPub.Access.{Access, AccessGrant}
  alias Pointers.{Changesets, Pointer}

  pointable_schema do
    belongs_to :subject, Pointer
    belongs_to :access, Access
  end

  def changeset(access_grant \\ %AccessGrant{}, attrs, opts \\ []),
    do: Changesets.auto(access_grant, attrs, opts, [])

end

defmodule CommonsPub.Access.AccessGrant.Migration do
  use Ecto.Migration
  import Pointers.Migration
  alias CommonsPub.Access.{Access, AccessGrant}

  def migrate_access_grant(dir \\ direction())
  def migrate_access_grant(:up), do: create_access_grant_table()
  def migrate_access_grant(:down), do: drop_access_grant_table()

  def create_access_grant_table() do
    create_pointable_table(AccessGrant) do
      add :subject_id, strong_pointer()
      add :access_id, strong_pointer(Access)
    end
  end

  def drop_access_grant_table(), do: drop_pointable_table(AccessGrant)
end
