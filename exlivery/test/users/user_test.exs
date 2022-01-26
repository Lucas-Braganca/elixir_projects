defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe("build/5") do
    test "when all params are valid, returns the user" do
      response = User.build("Lucas", "lucas@email.com", "12345678900", 29, "Rua Teste")

      expected_response = {:ok, build(:user)}

      assert expected_response == response
    end

    test "when there are invalid params, returns an error" do
      response = User.build("Lucas", "lucas@email.com", "12345678900", 11, "Rua Teste")

      expected_response = {:error, "Invalid parameters"}

      assert expected_response == response
    end
  end
end
