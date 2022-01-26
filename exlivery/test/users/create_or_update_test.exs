defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent
  import Exlivery.Factory

  describe("call/1") do
    setup do
      UserAgent.start_link(%{})

      %{name: name, address: address, email: email, cpf: cpf, age: age} = build(:user)
      params = %{name: name, address: address, email: email, cpf: cpf, age: age}

      {:ok, params: params}
    end

    test "when all params are valid, saves the user", %{params: params} do
      response = CreateOrUpdate.call(params)
      expected_response = {:ok, "User created or updated successfully"}
      assert response == expected_response
    end

    test "when there are invalid params, returns an error", %{params: params} do
      updated_params = Map.put(params, :age, 13)
      response = CreateOrUpdate.call(updated_params)
      expected_response = {:error, "Invalid parameters"}
      assert response == expected_response
    end
  end
end
