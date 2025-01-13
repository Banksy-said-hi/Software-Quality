// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaxCalculator {
    // Tax slabs and rates
    uint256 public constant TAX_RATE_1 = 10; // 10%
    uint256 public constant TAX_RATE_2 = 20; // 20%
    uint256 public constant TAX_RATE_3 = 30; // 30%

    uint256 public constant SLAB_1 = 50000; // Salary <= 50,000
    uint256 public constant SLAB_2 = 100000; // Salary <= 100,000
    uint256 public constant SLAB_3 = 150000; // Salary <= 150,000

    // Function to calculate tax based on salary
    function calculateTax(uint256 salary) public pure returns (uint256) {
        if (salary <= SLAB_1) {
            return (salary * TAX_RATE_1) / 100;
        } else if (salary <= SLAB_2) {
            return (SLAB_1 * TAX_RATE_1) / 100 + ((salary - SLAB_1) * TAX_RATE_2) / 100;
        } else {
            return
                (SLAB_1 * TAX_RATE_1) / 100 +
                ((SLAB_2 - SLAB_1) * TAX_RATE_2) / 100 +
                ((salary - SLAB_2) * TAX_RATE_3) / 100;
        }
    }
}