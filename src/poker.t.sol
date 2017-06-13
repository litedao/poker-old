pragma solidity ^0.4.11;

import "ds-test/test.sol";

import "./poker.sol";

contract PokerTest is DSTest {
    function test_basic_sanity() {
        assert(true);
    }

    function testFail_basic_sanity() {
        assert(false);
    }
}
