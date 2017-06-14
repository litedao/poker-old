pragma solidity ^0.4.11;

import 'ds-test/test.sol';
import 'medianizer/medianizer.sol';
import 'ds-cache/cache.sol';

import "./poker.sol";

contract PokerTest is DSTest {
    Medianizer m;
    DSValue v;
    DSCache c;
    Poker p;

    function setUp() {
        p = new Poker();
        m = new Medianizer();
        v = new DSValue();
        c = new DSCache();
    }

    function test_basic_sanity() {
        m.set(v);
        v.poke(5 ether);
        m.set(c);
        c.prod(6 ether, uint128(now + 10));

        m.poke();

        assertEqDecimal(uint(m.read()), 5.5 ether, 18);
    }

    function testPoker() {
        m.set(v);
        p.poke(v,m,1 ether);
        bytes32 val = m.read();
        assertEqDecimal(uint(val), 1 ether, 18);
    }

    function testPokerWithCache() {
        m.set(v);
        m.set(c);
        p.prod(c, m, 1 ether, uint128(now + 10));
        p.poke(v, m, 2 ether);
        bytes32 val = m.read();
        assertEqDecimal(uint(val), 1.5 ether, 18);
    }
}
