defmodule Revelio.ContractsTest do
  use Revelio.DataCase

  alias Revelio.Contracts

  describe "contracts" do
    alias Revelio.Contracts.Contract

    import Revelio.ContractsFixtures

    @invalid_attrs %{name: nil, version: nil, app_id: nil, arc_32: nil, arc56: nil, valid_from: nil}

    test "list_contracts/0 returns all contracts" do
      contract = contract_fixture()
      assert Contracts.list_contracts() == [contract]
    end

    test "get_contract!/1 returns the contract with given id" do
      contract = contract_fixture()
      assert Contracts.get_contract!(contract.id) == contract
    end

    test "create_contract/1 with valid data creates a contract" do
      valid_attrs = %{name: "some name", version: 120.5, app_id: 42, arc_32: "some arc_32", arc56: "some arc56", valid_from: 42}

      assert {:ok, %Contract{} = contract} = Contracts.create_contract(valid_attrs)
      assert contract.name == "some name"
      assert contract.version == 120.5
      assert contract.app_id == 42
      assert contract.arc_32 == "some arc_32"
      assert contract.arc56 == "some arc56"
      assert contract.valid_from == 42
    end

    test "create_contract/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contracts.create_contract(@invalid_attrs)
    end

    test "update_contract/2 with valid data updates the contract" do
      contract = contract_fixture()
      update_attrs = %{name: "some updated name", version: 456.7, app_id: 43, arc_32: "some updated arc_32", arc56: "some updated arc56", valid_from: 43}

      assert {:ok, %Contract{} = contract} = Contracts.update_contract(contract, update_attrs)
      assert contract.name == "some updated name"
      assert contract.version == 456.7
      assert contract.app_id == 43
      assert contract.arc_32 == "some updated arc_32"
      assert contract.arc56 == "some updated arc56"
      assert contract.valid_from == 43
    end

    test "update_contract/2 with invalid data returns error changeset" do
      contract = contract_fixture()
      assert {:error, %Ecto.Changeset{}} = Contracts.update_contract(contract, @invalid_attrs)
      assert contract == Contracts.get_contract!(contract.id)
    end

    test "delete_contract/1 deletes the contract" do
      contract = contract_fixture()
      assert {:ok, %Contract{}} = Contracts.delete_contract(contract)
      assert_raise Ecto.NoResultsError, fn -> Contracts.get_contract!(contract.id) end
    end

    test "change_contract/1 returns a contract changeset" do
      contract = contract_fixture()
      assert %Ecto.Changeset{} = Contracts.change_contract(contract)
    end
  end
end
