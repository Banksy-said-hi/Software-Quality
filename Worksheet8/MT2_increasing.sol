pragma solidity ^0.8.0;

contract TaxCalculatorTest {
    TaxCalculator taxCalculator;

    function beforeEach() public {
        taxCalculator = new TaxCalculator();
    }

    function testProportionalTaxIncrement() public {
        beforeEach();

        // Source test case: Calculate tax for salary = 40,000
        uint256 baseSalary = 40000;
        uint256 baseTax = taxCalculator.calculateTax(baseSalary);

        // Follow-up test case: Increment salary by 100
        uint256 incrementedSalary = baseSalary + 100;
        uint256 incrementedTax = taxCalculator.calculateTax(incrementedSalary);

        // Verify: Tax increment ≈ salary increment × tax rate
        uint256 expectedTaxIncrement = (100 * taxCalculator.TAX_RATE_1()) / 100;
        require(
            incrementedTax - baseTax == expectedTaxIncrement,
            "Proportional tax increment failed"
        );
    }
}