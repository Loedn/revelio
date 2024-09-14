defmodule Revelio.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :identifier, :string
    field :emergency_email, :string
    field :verified, :boolean, default: false
    belongs_to :user, Revelio.Accounts.User
    has_many :contracts, Revelio.Contracts.Contract
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :identifier, :emergency_email, :verified, :user_id])
    |> validate_required([:name, :identifier, :user_id])
  end
end
