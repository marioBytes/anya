# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Anya.Repo.insert!(%Anya.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Anya.Accounts
alias Anya.Invoices

password = "123456789012"

test_users = [
  %{email: "mario@anya.io", password: password},
  %{email: "testuser@anya.io", password: password},
  %{email: "admin@anya.io", password: password}
]

Enum.each(test_users, fn user -> Accounts.register_user(user) end)

Enum.each(1..5, fn i ->
  invoice = %{
    client_email: "test@email.com",
    client_name: Faker.Person.name(),
    description: Faker.Lorem.Shakespeare.En.hamlet(),
    payment_due: Faker.DateTime.forward(5) |> DateTime.to_unix(),
    payment_terms: "net 30",
    status: "pending",
    total: 1200.0,
    uuid: "AY8924",
    user_id: 1
  }

  client_address = %{
    city: Faker.Address.city(),
    country: Faker.Address.country(),
    post_code: "#{Faker.Address.zip_code()}",
    street: Faker.Address.street_address(),
    invoice_id: i
  }

  sender_address = %{
    city: Faker.Address.city(),
    country: Faker.Address.country(),
    post_code: "#{Faker.Address.zip_code()}",
    street: Faker.Address.street_address(),
    invoice_id: i
  }

  items =
    if rem(i, 2) != 0 do
      [
        %{
          name: Faker.Cannabis.strain(),
          price: 600.0,
          quantity: 2,
          total: 1200.0,
          invoice_id: i
        }
      ]
    else
      [
        %{
          name: Faker.Cannabis.strain(),
          price: 100.0,
          quantity: 1,
          total: 100.0,
          invoice_id: i
        },
        %{
          name: Faker.Cannabis.strain(),
          price: 50.0,
          quantity: 2,
          total: 100.0,
          invoice_id: i
        }
      ]
    end

  Invoices.create_invoice(invoice, client_address, sender_address, items)
end)
