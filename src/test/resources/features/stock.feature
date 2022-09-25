Feature: stock products
  As a customer
  I want to buy products

  Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Butter" with price 15.00 and stock of 12 exists

  Scenario: stock products
    When I buy "Jam" with quantity 2
    Then total should be 160.00
    Then "Jam" should have 8 in stock

  Scenario Outline: Buy one product in table
    When I buy <product> with quantity <quantity>
    Then <product> should have <in_stock> in stock
    Examples:
      | product  | quantity | in_stock |
      | "Bread"  |     1    |     4    |
      | "Jam"    |     2    |     8    |
      | "Butter" |     2    |    10    |