pragma solidity ^0.4.11;

import 'medianizer/medianizer.sol';
import 'ds-cache/cache.sol';

contract Poker is DSAuth {

    function poke(address val, address med, bytes32 wut) auth {
        DSValue(val).poke(wut);
        Medianizer(med).poke();
    }

    function prod(address val, address med, bytes32 wut, uint128 zzz) auth {
        DSCache(val).prod(wut, zzz);
        Medianizer(med).poke();
    }
}
