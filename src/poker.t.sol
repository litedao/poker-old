pragma solidity ^0.4.11;

import 'ds-test/test.sol';
import 'medianizer/medianizer.sol';
import 'ds-cache/cache.sol';

import "./poker.sol";

contract PokerTest is DSTest {
    Medianizer m;
    Poker p1;
    Poker p2;
    Poker p3;

    function setUp() {
        m = new Medianizer();
        p1 = new Poker();
        p2 = new Poker();
        p3 = new Poker();
    }

    function testPoker() {
        m.set(p1);
        
        p1.prod(m, 1 ether, uint128(now + 10));
        
        bytes32 mv = m.read();
        assertEqDecimal(uint(mv), 1 ether, 18);
    }

    function testPokerWithCache() {
        m.set(p1);
        m.set(p2);
        m.set(p3);

        p1.prod(m, 1 ether, uint128(now + 10));
        p2.prod(m, 2 ether, uint128(now + 10));
        p3.prod(m, 3 ether, uint128(now + 10));

        bytes32 val = m.read();
        assertEqDecimal(uint(val), 2 ether, 18);
    }
}
