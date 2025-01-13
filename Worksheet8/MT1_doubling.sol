pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract TaxCalculatorTest {
    TaxCalculator taxCalculator;

    function beforeEach() public {
        taxCalculator = new TaxCalculator();
    }

    function testTaxDoublingRelation() public {
        beforeEach();

        // Source test case: Calculate tax for salary = 30,000
        uint256 salary = 30000;
        uint256 tax1 = taxCalculator.calculateTax(salary);

        // Follow-up test case: Calculate tax for double the salary = 60,000
        uint256 doubledSalary = salary * 2;
        uint256 tax2 = taxCalculator.calculateTax(doubledSalary);

        // Verify: Tax for doubled salary ≈ 2 × tax for original salary
        require(
            tax2 >= tax1 * 2 - 100 && tax2 <= tax1 * 2 + 100,
            "Tax doubling relation failed"
        );
    }
}