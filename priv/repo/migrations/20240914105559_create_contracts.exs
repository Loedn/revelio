defmodule Revelio.Repo.Migrations.CreateContracts do
  use Ecto.Migration

  def change do
    create table(:contracts) do
      add :name, :string
      add :app_id, :integer
      add :arc_32, :text
      add :arc56, :text
      add :valid_from, :integer
      add :version, :float
      add :project_id, references(:projects, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:contracts, [:project_id])
  end
end
