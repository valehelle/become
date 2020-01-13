defmodule Become.Finances.File do
  use Ecto.Schema
  import Ecto.Changeset

  schema "files" do
    field :path, :string

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:path])
    |> validate_required([:path])
  end
end
