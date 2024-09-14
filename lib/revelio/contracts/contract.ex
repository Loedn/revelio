defmodule Revelio.Contracts.Contract do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contracts" do
    field :name, :string
    field :version, :float
    field :app_id, :integer
    field :arc_32, :string
    field :arc56, :string
    field :valid_from, :integer
    belongs_to :project, Revelio.Projects.Project

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contract, attrs) do
    contract
    |> cast(attrs, [:name, :app_id, :arc_32, :arc56, :valid_from, :version, :project_id])
    |> validate_required([:name, :app_id, :arc_32, :arc56, :valid_from, :version, :project_id])
  end
end
