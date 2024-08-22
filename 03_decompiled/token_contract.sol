// Decompiled by library.dedaub.com
// 2024.08.22 08:09 UTC
// Compiled using the solidity compiler version 0.8.20


// Data structures and variables inferred from the use of storage instructions
uint8 _version; // STORAGE[0x0] bytes 0 to 0
uint8 _initialize; // STORAGE[0x0] bytes 1 to 1
mapping (uint256 => uint256) _balanceOf; // STORAGE[0x33]
mapping (uint256 => mapping (uint256 => uint256)) _allowance; // STORAGE[0x34]
uint256 _totalSupply; // STORAGE[0x35]
uint256[] _name; // STORAGE[0x36]
uint256[] _symbol; // STORAGE[0x37]
uint256 _eip712Domain; // STORAGE[0x65]
uint256 stor_66; // STORAGE[0x66]
uint256[] array_67; // STORAGE[0x67]
uint256[] array_68; // STORAGE[0x68]
mapping (uint256 => uint256) _nonces; // STORAGE[0x99]
uint256[] _contractUri; // STORAGE[0x162]
mapping (uint256 => struct_1547) _getRoleAdmin; // STORAGE[0x22a]
uint8 _paused; // STORAGE[0x194] bytes 0 to 0
address _accessRegistry; // STORAGE[0xcc] bytes 0 to 19
uint8 stor_4910fdfa16fed3260ed0e7147f7cc6da11a60208b5b9406d12a635614ffd9143_0_0; // STORAGE[0x4910fdfa16fed3260ed0e7147f7cc6da11a60208b5b9406d12a635614ffd9143] bytes 0 to 0
uint160 _upgradeTo; // STORAGE[0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc] bytes 0 to 19

struct struct_1547 { mapping (uint256 => uint8) field0; uint256 field1; };

// Events
TokensRecovered(address, address, uint256);
Initialized(uint8);
Transfer(address, address, uint256);
Unpaused(address);
Paused(address);
RoleGranted(bytes32, address, address);
Approval(address, address, uint256);
RoleRevoked(bytes32, address, address);
Upgraded(address);

function 0x133b(uint256 varg0, address varg1) private { 
    require(0 - varg0, ZeroAmount());
    0x2071();
    emit 0xca9a684d22747bbed3bef704e16858bfa9ac8f5af2d80c70455b298bd7d8d239(msg.sender, varg1, varg0);
    0x21ff(varg0, msg.sender, varg1);
    return ;
}

function 0x172e(uint256 varg0) private { 
    if (_getRoleAdmin[varg0][msg.sender]) {
        return ;
    } else {
        v0 = 0x2c33(20, msg.sender);
        v1 = 0x2c33(32, varg0);
        MEM[32 + MEM[64]] = 'AccessControl: account ';
        v2 = v3 = 0;
        while (v2 < v0.length) {
            MEM[v2 + (32 + MEM[64] + 23)] = v0[v2];
            v2 += 32;
        }
        MEM[v0.length + (32 + MEM[64] + 23)] = 0;
        MEM[32 + MEM[64] + v0.length + 23] = ' is missing role ';
        v4 = v5 = 0;
        while (v4 < v1.length) {
            MEM[v4 + (32 + MEM[64] + v0.length + 40)] = v1[v4];
            v4 += 32;
        }
        MEM[v1.length + (32 + MEM[64] + v0.length + 40)] = 0;
        MEM[40 + (v1.length + (32 + MEM[64] + v0.length))] = 0x8c379a000000000000000000000000000000000000000000000000000000000;
        MEM[44 + (v1.length + (32 + MEM[64] + v0.length))] = 32;
        MEM[44 + (v1.length + (32 + MEM[64] + v0.length)) + 32] = 40 + (v1.length + (32 + MEM[64] + v0.length)) - MEM[64] - 32;
        v6 = v7 = 0;
        while (v6 < 40 + (v1.length + (32 + MEM[64] + v0.length)) - MEM[64] - 32) {
            MEM[v6 + (44 + (v1.length + (32 + MEM[64] + v0.length)) + 32 + 32)] = MEM[v6 + (MEM[64] + 32)];
            v6 += 32;
        }
        MEM[40 + (v1.length + (32 + MEM[64] + v0.length)) - MEM[64] - 32 + (44 + (v1.length + (32 + MEM[64] + v0.length)) + 32 + 32)] = 0;
        revert(MEM[64], 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + (40 + (v1.length + (32 + MEM[64] + v0.length)) - MEM[64] - 32)) + (44 + (v1.length + (32 + MEM[64] + v0.length)) + 32)) - MEM[64]);
    }
}

function 0x1738(uint256 varg0, address varg1, address varg2) private { 
    require(varg2, Error('ERC20: transfer from the zero address'));
    require(varg1, Error('ERC20: transfer to the zero address'));
    require(!_paused, Error('Pausable: paused'));
    require(_balanceOf[varg2] >= varg0, Error('ERC20: transfer amount exceeds balance'));
    _balanceOf[varg2] = _balanceOf[varg2] - varg0;
    _balanceOf[varg1] += varg0;
    emit Transfer(varg2, varg1, varg0);
    return ;
}

function 0x194f(uint256 varg0, address varg1) private { 
    if (!_accessRegistry) {
        return ;
    } else {
        v0 = new uint256[](msg.data.length);
        CALLDATACOPY(v0.data, 0, msg.data.length);
        MEM[4 + MEM[64] + msg.data.length + 128] = 0;
        v1, /* bool */ v2 = _accessRegistry.staticcall(uint32(0xeefb7e9a), varg1, msg.sender, v0).gas(msg.gas);
        require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v2 == bool(v2));
        if (v2) {
            return ;
        } else {
            require(!varg0, ERC20InvalidSender(varg1));
            revert(ERC20InvalidReceiver(varg1));
        }
    }
}

function 0x1a4c() private { 
    require(!_paused, Error('Pausable: paused'));
    0x172e(0x2ce8d04a9c35987429af538825cd2438cc5c5bb5dc427955f84daaa3ea105016);
    return ;
}

function 0x1bac() private { 
    v0 = 0x2dcf();
    v1 = 0x2e28();
    MEM[64] += 192;
    return keccak256(0x8b73c3c69bb8fe3d512ecc4cf759cc79239f7b179b0ffacaa9a75d522b39400f, v0, v1, CHAINID(), this);
}

function 0x1c5a(uint256 varg0, bytes varg1, uint256 varg2) private { 
    if (!stor_4910fdfa16fed3260ed0e7147f7cc6da11a60208b5b9406d12a635614ffd9143_0_0) {
        v0 = v1, /* uint256 */ v2 = address(varg2).proxiableUUID().gas(msg.gas);
        if (v1) {
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            v0 = v3 = 1;
        }
        require(v0, Error('ERC1967Upgrade: new implementation is not UUPS'));
        require(v2 == 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc, Error('ERC1967Upgrade: unsupported proxiableUUID'));
        0x292a(v2, v2, v2);
        return ;
    } else {
        0x288e(varg2);
        return ;
    }
}

function 0x1e11() private { 
    require(_paused, Error('Pausable: not paused'));
    _paused = 0;
    emit Unpaused(msg.sender);
    return ;
}

function 0x2071() private { 
    require(!_paused, Error('Pausable: paused'));
    0x172e(0x75afe8d9fedb4699bf07dc7bcb33fe609a84a99adfab7076931f0d93228085bb);
    return ;
}

function 0x20a3(bytes varg0) private { 
    v0 = 0x386b(_contractUri.length);
    v1 = new uint256[](v0);
    if (_contractUri.length & 0x1 == 0) {
        MEM[v1.data] = bytes31(_contractUri.length);
    } else if (_contractUri.length & 0x1 == 1) {
        v2 = v3 = _contractUri.data;
        v4 = v5 = 0;
        while (v4 < v0) {
            MEM[96 + (v4 + MEM[64])] = STORAGE[v2];
            v2 += 1;
            v4 += 32;
        }
    }
    v6 = new bytes[](varg0.length);
    v7 = v8 = 0;
    while (v7 < varg0.length) {
        v6[v7] = varg0[v7];
        v7 += 32;
    }
    v6[varg0.length] = 0;
    emit 0xe41f7f53dffb3e1410dab0f9f6a27c670b48ad40ccc47a64537100e1f3809e8a(msg.sender, v1, v6);
    require(varg0.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v9 = 0x386b(_contractUri.length);
    if (v9 > 31) {
        v10 = v11 = _contractUri.data;
        v10 = v12 = v11 + (varg0.length + 31 >> 5);
        while (v10 < v11 + (v9 + 31 >> 5)) {
            STORAGE[v10] = 0;
            v10 += 1;
        }
    }
    v13 = v14 = 32;
    if (varg0.length > 31 == 1) {
        v15 = v16 = 0;
        v17 = v18 = _contractUri.data;
        while (v15 < varg0.length & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) {
            STORAGE[v17] = MEM[v13 + varg0];
            v13 += v14;
            v17 = v17 + 1;
            v15 += v14;
        }
        if (varg0.length & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 < varg0.length) {
            STORAGE[v17] = ~(uint256.max >> (0xf8 & varg0.length << 3)) & MEM[v13 + varg0];
        }
        _contractUri.length = (varg0.length << 1) + 1;
    } else {
        v19 = v20 = 0;
        if (varg0.length) {
            v19 = MEM[varg0.data];
        }
        _contractUri.length = varg0.length << 1 | ~(uint256.max >> (varg0.length << 3)) & v19;
    }
    return ;
}

function 0x20f5() private { 
    require(!_paused, Error('Pausable: paused'));
    _paused = 1;
    emit Paused(msg.sender);
    return ;
}

function 0x2133() private { 
    v0 = 0x386b(array_67.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x386b(array_67.length);
    if (!v4) {
        return v1;
    } else if (31 < v4) {
        v5 = array_67.data;
        do {
            MEM[v2] = STORAGE[v5];
            v5 += 1;
            v2 += 32;
        } while (v3 + v4 <= v2);
        return v1;
    } else {
        MEM[v3] = array_67.length >> 8 << 8;
        return v1;
    }
}

function 0x2142() private { 
    v0 = 0x386b(array_68.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x386b(array_68.length);
    if (!v4) {
        return v1;
    } else if (31 < v4) {
        v5 = array_68.data;
        do {
            MEM[v2] = STORAGE[v5];
            v5 += 1;
            v2 += 32;
        } while (v3 + v4 <= v2);
        return v1;
    } else {
        MEM[v3] = array_68.length >> 8 << 8;
        return v1;
    }
}

function 0x21da(bytes varg0, address varg1) private { 
    v0 = v1 = 0;
    while (v0 < varg0.length) {
        MEM[v0 + v2.data] = varg0[v0];
        v0 += 32;
    }
    MEM[varg0.length + v2.data] = 0;
    v3, /* uint256 */ v4, /* uint256 */ v5 = varg1.delegatecall(v2.data).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v6 = v7 = 96;
    } else {
        v6 = v8 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v8.data, 0, RETURNDATASIZE());
    }
    if (!v3) {
        require(!MEM[v6], v5, MEM[v6]);
        v9 = new bytes[](v10.length);
        v11 = v12 = 0;
        while (v11 < v10.length) {
            v9[v11] = v10[v11];
            v11 += 32;
        }
        v9[v10.length] = 0;
        revert(Error(v9));
    } else {
        if (!(0 - MEM[v6])) {
            require(varg1.code.size, Error('Address: call to non-contract'));
        }
        return v6;
    }
}

function 0x21ff(uint256 varg0, address varg1, uint256 varg2) private { 
    MEM[MEM[64] + 68] = varg0;
    MEM[MEM[64]] = 68;
    MEM[64] = MEM[64] + 100;
    MEM[MEM[64] + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 | uint224(varg1);
    0x2a11(MEM[64], varg2);
    return ;
}

function 0x2402(bytes varg0, bytes varg1) private { 
    require(_initialize, Error('Initializable: contract is not initializing'));
    require(_initialize, Error('Initializable: contract is not initializing'));
    require(varg1.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = 0x386b(_name.length);
    if (v0 > 31) {
        v1 = v2 = _name.data;
        v1 = v3 = v2 + (varg1.length + 31 >> 5);
        while (v1 < v2 + (v0 + 31 >> 5)) {
            STORAGE[v1] = 0;
            v1 += 1;
        }
    }
    v4 = v5 = 32;
    if (varg1.length > 31 == 1) {
        v6 = v7 = 0;
        v8 = v9 = _name.data;
        while (v6 < varg1.length & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) {
            STORAGE[v8] = MEM[v4 + varg1];
            v4 += v5;
            v8 = v8 + 1;
            v6 += v5;
        }
        if (varg1.length & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 < varg1.length) {
            STORAGE[v8] = ~(uint256.max >> (0xf8 & varg1.length << 3)) & MEM[v4 + varg1];
        }
        _name.length = (varg1.length << 1) + 1;
    } else {
        v10 = v11 = 0;
        if (varg1.length) {
            v10 = MEM[varg1.data];
        }
        _name.length = varg1.length << 1 | ~(uint256.max >> (varg1.length << 3)) & v10;
    }
    require(varg0.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v12 = 0x386b(_symbol.length);
    if (v12 > 31) {
        v13 = v14 = _symbol.data;
        v13 = v15 = v14 + (varg0.length + 31 >> 5);
        while (v13 < v14 + (v12 + 31 >> 5)) {
            STORAGE[v13] = 0;
            v13 += 1;
        }
    }
    v16 = v17 = 32;
    if (varg0.length > 31 == 1) {
        v18 = v19 = 0;
        v20 = v21 = _symbol.data;
        while (v18 < varg0.length & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) {
            STORAGE[v20] = MEM[v16 + varg0];
            v16 += v17;
            v20 = v20 + 1;
            v18 += v17;
        }
        if (varg0.length & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 < varg0.length) {
            STORAGE[v20] = ~(uint256.max >> (0xf8 & varg0.length << 3)) & MEM[v16 + varg0];
        }
        _symbol.length = (varg0.length << 1) + 1;
    } else {
        v22 = v23 = 0;
        if (varg0.length) {
            v22 = MEM[varg0.data];
        }
        _symbol.length = varg0.length << 1 | ~(uint256.max >> (varg0.length << 3)) & v22;
    }
    return ;
}

function 0x2433(bytes varg0) private { 
    require(_initialize, Error('Initializable: contract is not initializing'));
    require(_initialize, Error('Initializable: contract is not initializing'));
    require(varg0.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = 0x386b(array_67.length);
    if (v0 > 31) {
        v1 = v2 = array_67.data;
        v1 = v3 = v2 + (varg0.length + 31 >> 5);
        while (v1 < v2 + (v0 + 31 >> 5)) {
            STORAGE[v1] = 0;
            v1 += 1;
        }
    }
    v4 = v5 = 32;
    if (varg0.length > 31 == 1) {
        v6 = v7 = 0;
        v8 = v9 = array_67.data;
        while (v6 < varg0.length & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) {
            STORAGE[v8] = MEM[v4 + varg0];
            v4 += v5;
            v8 = v8 + 1;
            v6 += v5;
        }
        if (varg0.length & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 < varg0.length) {
            STORAGE[v8] = ~(uint256.max >> (0xf8 & varg0.length << 3)) & MEM[v4 + varg0];
        }
        array_67.length = (varg0.length << 1) + 1;
    } else {
        v10 = v11 = 0;
        if (varg0.length) {
            v10 = MEM[varg0.data];
        }
        array_67.length = varg0.length << 1 | ~(uint256.max >> (varg0.length << 3)) & v10;
    }
    require(v12.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v13 = 0x386b(array_68.length);
    if (v13 > 31) {
        v14 = v15 = array_68.data;
        v14 = v16 = v15 + 1;
        while (v14 < v15 + (v13 + 31 >> 5)) {
            STORAGE[v14] = 0;
            v14 += 1;
        }
    }
    v17 = v18 = 32;
    if (v12.length > 31 == 1) {
        v19 = v20 = 0;
        v21 = v22 = array_68.data;
        while (v19 < 0) {
            STORAGE[v21] = MEM[v17 + 49];
            v17 += v18;
            v21 = v21 + 1;
            v19 += v18;
        }
        if (0 < v12.length) {
            STORAGE[v21] = bytes1(MEM[v17 + 49]);
        }
        array_68.length = 3;
    } else {
        v23 = v24 = 0;
        if (v12.length) {
            v25 = v12.data;
        }
        array_68.length = 0x2 | bytes1(v23);
    }
    _eip712Domain = 0;
    stor_66 = 0;
    return ;
}

function 0x247d(address varg0) private { 
    require(_initialize, Error('Initializable: contract is not initializing'));
    v0 = bool(varg0);
    if (varg0) {
        v1, /* bool */ v2 = varg0.supportsInterface(0xeefb7e9a00000000000000000000000000000000000000000000000000000000).gas(msg.gas);
        require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v2 == bool(v2));
        v0 = v3 = !v2;
    }
    require(!v0, InvalidImplementation());
    emit 0xf30d5b081b4a3016a4b34d3732b94b2b2ccc2d99f6774c8ac47c42d8764fd265(msg.sender, _accessRegistry, varg0);
    _accessRegistry = varg0;
    return ;
}

function 0x24d4() private { 
    require(_initialize, Error('Initializable: contract is not initializing'));
    require(_initialize, Error('Initializable: contract is not initializing'));
    require(_initialize, Error('Initializable: contract is not initializing'));
    _paused = 0;
    return ;
}

function 0x2503() private { 
    require(_initialize, Error('Initializable: contract is not initializing'));
    require(_initialize, Error('Initializable: contract is not initializing'));
    return ;
}

function 0x2532(address varg0, uint256 varg1) private { 
    if (_getRoleAdmin[varg1][varg0]) {
        return ;
    } else {
        _getRoleAdmin[varg1][varg0] = 1;
        emit RoleGranted(varg1, varg0, msg.sender);
        return ;
    }
}

function 0x261a(uint256 varg0, address varg1, address varg2) private { 
    require(varg2, Error('ERC20: approve from the zero address', 'ERC20: approve from the zero address'));
    require(varg1, Error('ERC20: approve to the zero address'));
    _allowance[varg2][varg1] = varg0;
    emit Approval(varg2, varg1, varg0);
    return ;
}

function 0x273e(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    v0 = _allowance[address(varg2)][address(varg1)];
    if (v0 == uint256.max) {
        return ;
    } else {
        require(v0 >= varg0, Error('ERC20: insufficient allowance'));
        0x261a(v0 - varg0, varg1, varg2);
        return ;
    }
}

function 0x2826(address varg0, uint256 varg1) private { 
    if (!_getRoleAdmin[varg1][varg0]) {
        return ;
    } else {
        _getRoleAdmin[varg1][varg0] = 0;
        emit RoleRevoked(varg1, varg0, msg.sender);
        return ;
    }
}

function function_selector() public payable { 
    revert();
}

function 0x288e(address varg0) private { 
    require(varg0.code.size, Error('ERC1967: new implementation is not a contract'));
    _upgradeTo = varg0;
    return ;
}

function supportsInterface(bytes4 interfaceId) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = v1 = 0x36372b0700000000000000000000000000000000000000000000000000000000 == interfaceId;
    if (0x36372b0700000000000000000000000000000000000000000000000000000000 != interfaceId) {
        v0 = v2 = 0xa219a02500000000000000000000000000000000000000000000000000000000 == interfaceId;
    }
    if (!v0) {
        v0 = v3 = !interfaceId;
    }
    if (!v0) {
        v0 = v4 = 0x52d1902d00000000000000000000000000000000000000000000000000000000 == interfaceId;
    }
    if (!v0) {
        v0 = v5 = 0x9d8ff7da00000000000000000000000000000000000000000000000000000000 == interfaceId;
    }
    if (!v0) {
        v0 = v6 = 0x84b0196e00000000000000000000000000000000000000000000000000000000 == interfaceId;
    }
    if (!v0) {
        v0 = v7 = 0x7965db0b00000000000000000000000000000000000000000000000000000000 == interfaceId;
        if (0x7965db0b00000000000000000000000000000000000000000000000000000000 != interfaceId) {
            v0 = v8 = interfaceId == 0x1ffc9a700000000000000000000000000000000000000000000000000000000;
        }
    }
    return bool(v0);
}

function 0x292a(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    0x288e(varg2);
    emit Upgraded(address(varg2));
    varg0 = v0 = MEM[varg1] > 0;
    if (!varg0) {
        return ;
    } else {
        v1 = 0x21da(varg1, varg2);
        return ;
    }
}

function 0x2a11(uint256 varg0, address varg1) private { 
    require(this.balance >= 0, Error('Address: insufficient balance for call'));
    v0 = v1 = 0;
    while (v0 < MEM[varg0]) {
        MEM[v0 + MEM[64]] = MEM[v0 + (varg0 + 32)];
        v0 += 32;
    }
    MEM[MEM[varg0] + MEM[64]] = 0;
    v2, /* uint256 */ v3, /* uint256 */ v4, /* uint256 */ v5 = varg1.call(MEM[MEM[64]:MEM[64] + MEM[v2a11arg0x0] + MEM[64] - MEM[64]], MEM[MEM[64]:MEM[64]]).gas(msg.gas);
    if (RETURNDATASIZE() == 0) {
        v6 = v7 = 96;
    } else {
        v6 = v8 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v8.data, 0, RETURNDATASIZE());
    }
    if (!v2) {
        require(!MEM[v6], v5, MEM[v6]);
        v9 = new bytes[](v10.length);
        v11 = v12 = 0;
        while (v11 < v10.length) {
            v9[v11] = v10[v11];
            v11 += 32;
        }
        v9[v10.length] = 0;
        revert(Error(v9, v13, 'SafeERC20: low-level call failed'));
    } else {
        if (!(0 - MEM[v6])) {
            require(varg1.code.size, Error('Address: call to non-contract'));
        }
        v14 = v15 = 0 == MEM[v6];
        if (0 != MEM[v6]) {
            require(32 + v6 + MEM[v6] - (32 + v6) >= 32);
            v14 = MEM[32 + v6];
            require(v14 == bool(v14));
        }
        require(v14, Error('SafeERC20: ERC20 operation did not succeed'));
        return ;
    }
}

function 0x2b0e(uint256 varg0) private { 
    v0 = 0x1bac();
    return keccak256(6401, v0, varg0);
}

function recoverTokens(address tokenAddress, uint256 tokenAmount) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    0x172e(0xacf805600123ef007091da3b3ffb39474074c656c127aa68cb0ffec232a8ff8);
    require(0 - tokenAmount, ZeroAmount());
    require(_accessRegistry);
    v0 = new uint256[](msg.data.length);
    CALLDATACOPY(v0.data, 0, msg.data.length);
    MEM[4 + MEM[64] + msg.data.length + 128] = 0;
    v1, /* bool */ v2 = _accessRegistry.staticcall(uint32(0xeefb7e9a), tokenAddress, msg.sender, v0).gas(msg.gas);
    require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
    require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
    require(v2 == bool(v2));
    require(!v2, tokenAddress);
    emit TokensRecovered(msg.sender, tokenAddress, tokenAmount);
    0x1738(tokenAmount, msg.sender, tokenAddress);
}

function 0x2c33(uint256 varg0, uint256 varg1) private { 
    require((varg0 == varg0 << 1 >> 1) | !0x2, Panic(17)); // arithmetic overflow or underflow
    v0 = (varg0 << 1) + 2;
    require(2 <= v0, Panic(17)); // arithmetic overflow or underflow
    require(v0 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v1 = new bytes[](v0);
    if (v0) {
        CALLDATACOPY(v1.data, msg.data.length, v0);
    }
    require(0 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    MEM8[v1.data] = (byte(bytes1(0x3000000000000000000000000000000000000000000000000000000000000000), 0x0)) & 0xFF;
    require(1 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
    MEM8[33 + v1] = (byte(bytes1(0x7800000000000000000000000000000000000000000000000000000000000000), 0x0)) & 0xFF;
    require((varg0 == varg0 << 1 >> 1) | !0x2, Panic(17)); // arithmetic overflow or underflow
    v2 = (varg0 << 1) + 1;
    require(1 <= v2, Panic(17)); // arithmetic overflow or underflow
    while (v2 > 1) {
        require(bool(varg1) < 16, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(v2 < v1.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        MEM8[32 + v2 + v1] = (byte(bytes1((byte('0123456789abcdef', bool(varg1))) << 248), 0x0)) & 0xFF;
        varg1 = varg1 >> 4;
        require(v2, Panic(17)); // arithmetic overflow or underflow
        v2 += uint256.max;
    }
    require(!varg1, Error('Strings: hex length insufficient'));
    return v1;
}

function 0x2dcf() private { 
    v0 = 0x2133();
    if (!v0.length) {
        if (!_eip712Domain) {
            return 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        } else {
            return _eip712Domain;
        }
    } else {
        v1 = v0.length;
        v2 = v0.data;
        return keccak256(v0);
    }
}

function 0x2e28() private { 
    v0 = 0x2142();
    if (!v0.length) {
        if (!stor_66) {
            return 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        } else {
            return stor_66;
        }
    } else {
        v1 = v0.length;
        v2 = v0.data;
        return keccak256(v0);
    }
}

function name() public nonPayable { 
    v0 = 0x386b(_name.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x386b(_name.length);
    if (v4) {
        if (31 < v4) {
            v5 = _name.data;
            do {
                MEM[v2] = STORAGE[v5];
                v5 += 1;
                v2 += 32;
            } while (v3 + v4 <= v2);
        } else {
            MEM[v3] = _name.length >> 8 << 8;
        }
    }
    v6 = new bytes[](v1.length);
    v7 = v8 = 0;
    while (v7 < v1.length) {
        v6[v7] = v1[v7];
        v7 += 32;
    }
    v6[v1.length] = 0;
    return v6;
}

function approve(address spender, uint256 amount) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(!_paused, Error('Pausable: paused'));
    0x261a(amount, spender, msg.sender);
    return True;
}

function totalSupply() public nonPayable { 
    return _totalSupply;
}

function CONTRACT_ADMIN_ROLE() public nonPayable { 
    return 0x2ce8d04a9c35987429af538825cd2438cc5c5bb5dc427955f84daaa3ea105016;
}

function transferFrom(address sender, address recipient, uint256 amount) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    0x194f(1, sender);
    0x194f(0, recipient);
    0x273e(amount, msg.sender, sender);
    0x1738(amount, recipient, sender);
    return True;
}

function 0x386b(uint256 varg0) private { 
    v0 = v1 = varg0 >> 1;
    if (!(varg0 & 0x1)) {
        v0 = v2 = v1 & 0x7f;
    }
    require((varg0 & 0x1) - (v0 < 32), Panic(34)); // access to incorrectly encoded storage byte array
    return v0;
}

function getRoleAdmin(bytes32 role) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    return _getRoleAdmin[role].field1;
}

function BURNER_ROLE() public nonPayable { 
    return 0x3c11d16cbaffd01df69ce1c404f6340ee057498f5f00246190ea54220576a848;
}

function 0x2e13ae6e(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    0x1a4c();
    v0 = v1 = bool(varg0);
    if (varg0) {
        v2, /* bool */ v3 = varg0.supportsInterface(0xeefb7e9a00000000000000000000000000000000000000000000000000000000).gas(msg.gas);
        require(bool(v2), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v3 == bool(v3));
        v0 = !v3;
    }
    require(!v0, InvalidImplementation());
    emit 0xf30d5b081b4a3016a4b34d3732b94b2b2ccc2d99f6774c8ac47c42d8764fd265(msg.sender, _accessRegistry, varg0);
    _accessRegistry = varg0;
}

function grantRole(bytes32 role, address account) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(!_paused, Error('Pausable: paused'));
    0x172e(_getRoleAdmin[role].field1);
    0x2532(account, role);
}

function decimals() public nonPayable { 
    return 18;
}

function RECOVERY_ROLE() public nonPayable { 
    return 0xacf805600123ef007091da3b3ffb39474074c656c127aa68cb0ffec232a8ff8;
}

function DOMAIN_SEPARATOR() public nonPayable { 
    v0 = 0x1bac();
    return v0;
}

function renounceRole(bytes32 role, address account) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(role);
    require(!_paused, Error('Pausable: paused'));
    require(msg.sender == account, Error('AccessControl: can only renounce roles for self'));
    0x2826(account, role);
}

function upgradeTo(address newImplementation) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(this - address(0x8a7ce7816b82e6675534693ef170bd60e9c70ebf), Error('Function must be called through delegatecall'));
    require(_upgradeTo == address(0x8a7ce7816b82e6675534693ef170bd60e9c70ebf), Error('Function must be called through active proxy'));
    0x172e(0x189ab7a9244df0848122154315af71fe140f3db0fe014031783b0946b8c9d2e3);
    MEM[MEM[64]] = 0;
    MEM[64] = MEM[64] + 32;
    0x1c5a(0, MEM[64], newImplementation);
}

function increaseAllowance(address spender, uint256 addedValue) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(!_paused, Error('Pausable: paused'));
    require(_allowance[msg.sender][spender] <= addedValue + _allowance[msg.sender][spender], Panic(17)); // arithmetic overflow or underflow
    0x261a(addedValue + _allowance[msg.sender][spender], spender, msg.sender);
    return True;
}

function unpause() public nonPayable { 
    0x172e(0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a);
    0x1e11();
}

function mint(address _to, uint256 _amount) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    0x172e(0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6);
    0x194f(0, _to);
    require(_to, Error('ERC20: mint to the zero address'));
    require(!_paused, Error('Pausable: paused'));
    require(_totalSupply <= _amount + _totalSupply, Panic(17)); // arithmetic overflow or underflow
    _totalSupply += _amount;
    _balanceOf[_to] += _amount;
    emit Transfer(0, _to, _amount);
}

function burn(uint256 amount) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    0x172e(0x3c11d16cbaffd01df69ce1c404f6340ee057498f5f00246190ea54220576a848);
    require(0 - amount, ZeroAmount());
    0xde6(msg.sender);
    require(msg.sender, Error('ERC20: burn from the zero address'));
    require(!_paused, Error('Pausable: paused'));
    require(_balanceOf[msg.sender] >= amount, Error('ERC20: burn amount exceeds balance'));
    _balanceOf[msg.sender] = _balanceOf[msg.sender] - amount;
    _totalSupply = _totalSupply - amount;
    emit Transfer(msg.sender, 0, amount);
}

function upgradeToAndCall(address newImplementation, bytes data) public payable { 
    require(msg.data.length - 4 >= 64);
    require(data <= uint64.max);
    require(4 + data + 31 < msg.data.length);
    require(data.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v0 = new bytes[](data.length);
    require(!((v0 + (63 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & data.length + 31) & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < v0) | (v0 + (63 + (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & data.length + 31) & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) > uint64.max)), Panic(65)); // failed memory allocation (too much memory)
    require(4 + data + data.length + 32 <= msg.data.length);
    CALLDATACOPY(v0.data, data.data, data.length);
    v0[data.length] = 0;
    require(this - address(0x8a7ce7816b82e6675534693ef170bd60e9c70ebf), Error('Function must be called through delegatecall'));
    require(_upgradeTo == address(0x8a7ce7816b82e6675534693ef170bd60e9c70ebf), Error('Function must be called through active proxy'));
    0x172e(0x189ab7a9244df0848122154315af71fe140f3db0fe014031783b0946b8c9d2e3);
    0x1c5a(1, v0, newImplementation);
}

function proxiableUUID() public nonPayable { 
    require(address(0x8a7ce7816b82e6675534693ef170bd60e9c70ebf) == this, Error('UUPSUpgradeable: must not be called through delegatecall'));
    return 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
}

function version() public nonPayable { 
    return _version;
}

function paused() public nonPayable { 
    return _paused;
}

function 0x6e1d21b0(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(0 - varg0, ZeroAmount());
    0x2071();
    emit 0x6fe86159012c6b167b88e7b30e7c8ebe172ed05c753231df050bf60e4faf724a(msg.sender, varg0);
    v0, /* uint256 */ v1 = msg.sender.call().value(varg0).gas(msg.gas);
    if (RETURNDATASIZE() != 0) {
        v2 = new bytes[](RETURNDATASIZE());
        RETURNDATACOPY(v2.data, 0, RETURNDATASIZE());
    }
    require(v0);
}

function balanceOf(address account) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    return _balanceOf[account];
}

function nonces(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    return _nonces[varg0];
}

function 0x7ffc5a5c(bytes varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= uint64.max);
    require(4 + varg0 + 31 < msg.data.length);
    require(varg0.length <= uint64.max);
    require(4 + varg0 + varg0.length + 32 <= msg.data.length);
    0x1a4c();
    v0 = new bytes[](varg0.length);
    CALLDATACOPY(v0.data, varg0.data, varg0.length);
    v0[varg0.length] = 0;
    0x20a3(v0);
}

function pause() public nonPayable { 
    0x172e(0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a);
    0x20f5();
}

function eip712Domain() public nonPayable { 
    v0 = v1 = 0 == _eip712Domain;
    if (v1) {
        v0 = v2 = !stor_66;
    }
    require(v0, Error('EIP712: Uninitialized'));
    v3 = 0x2133();
    v4 = 0x2142();
    v5 = new bytes[](v3.length);
    v6 = v7 = 0;
    while (v6 < v3.length) {
        v5[v6] = v3[v6];
        v6 += 32;
    }
    v5[v3.length] = 0;
    v8 = new bytes[](v4.length);
    v5[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + v3.length] = v4.length;
    v9 = v10 = 0;
    while (v9 < v4.length) {
        v8[v9] = v4[v9];
        v9 += 32;
    }
    v8[v4.length] = 0;
    v11 = new uint256[](0);
    v8[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + v4.length] = 0;
    v12 = v13 = MEM[64] + 32;
    v14 = v15 = v11.data;
    v16 = v17 = 0;
    while (v16 < 0) {
        MEM[v14] = MEM[v12];
        v12 += 32;
        v14 += 32;
        v16 += 1;
    }
    return bytes1(0xf00000000000000000000000000000000000000000000000000000000000000), v5, v8, CHAINID(), address(this), 0, v11;
}

function 0x88920d29() public nonPayable { 
    return 0x75afe8d9fedb4699bf07dc7bcb33fe609a84a99adfab7076931f0d93228085bb;
}

function hasRole(bytes32 role, address account) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    return _getRoleAdmin[role][account];
}

function symbol() public nonPayable { 
    v0 = 0x386b(_symbol.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x386b(_symbol.length);
    if (v4) {
        if (31 < v4) {
            v5 = _symbol.data;
            do {
                MEM[v2] = STORAGE[v5];
                v5 += 1;
                v2 += 32;
            } while (v3 + v4 <= v2);
        } else {
            MEM[v3] = _symbol.length >> 8 << 8;
        }
    }
    v6 = new bytes[](v1.length);
    v7 = v8 = 0;
    while (v7 < v1.length) {
        v6[v7] = v1[v7];
        v7 += 32;
    }
    v6[v1.length] = 0;
    return v6;
}

function DEFAULT_ADMIN_ROLE() public nonPayable { 
    return 0;
}

function decreaseAllowance(address spender, uint256 subtractedValue) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(!_paused, Error('Pausable: paused'));
    require(_allowance[msg.sender][spender] >= subtractedValue, Error('ERC20: decreased allowance below zero'));
    0x261a(_allowance[msg.sender][spender] - subtractedValue, spender, msg.sender);
    return True;
}

function transfer(address recipient, uint256 amount) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    0xde6(msg.sender);
    0x194f(0, recipient);
    0x1738(amount, recipient, msg.sender);
    return True;
}

function multicall(bytes[] data) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(data <= uint64.max);
    require(4 + data + 31 < msg.data.length);
    v0 = v1 = data.length;
    require(v1 <= uint64.max);
    require(4 + data + (v1 << 5) + 32 <= msg.data.length);
    require(v1 <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v2 = new uint256[](v1);
    if (v1) {
        v3 = v2.data;
        do {
            MEM[v3] = 96;
            v3 += 32;
            v0 = v0 - 1;
        } while (!v0);
    }
    v4 = v5 = 0;
    while (v4 < v1) {
        require(v4 < v1, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        require(data[v4] < msg.data.length - data.data - 31);
        require(msg.data[data.data + data[v4]] <= uint64.max);
        require(32 + (data.data + data[v4]) <= msg.data.length - msg.data[data.data + data[v4]]);
        v6 = new bytes[](msg.data[data.data + data[v4]]);
        CALLDATACOPY(v6.data, 32 + (data.data + data[v4]), msg.data[data.data + data[v4]]);
        v6[msg.data[data.data + data[v4]]] = 0;
        v7 = 0x21da(v6, this);
        require(v4 < v2.length, Panic(50)); // access an out-of-bounds or negative index of bytesN array or slice
        v2[v4] = v7;
        require(v4 + 1, Panic(17)); // arithmetic overflow or underflow
        v4 += 1;
    }
    v8 = new uint256[](v2.length);
    v9 = v10 = v8.data;
    v11 = v12 = MEM[64] + (v2.length << 5) + 64;
    v13 = v14 = v2.data;
    v15 = v16 = 0;
    while (v15 < v2.length) {
        MEM[v9] = v11 - MEM[64] - 64;
        MEM[v11] = MEM[MEM[v13]];
        v17 = v18 = 0;
        while (v17 < MEM[MEM[v13]]) {
            MEM[v17 + (v11 + 32)] = MEM[v17 + (MEM[v13] + 32)];
            v17 += 32;
        }
        MEM[MEM[MEM[v13]] + (v11 + 32)] = 0;
        v11 = 32 + ((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 & 31 + MEM[MEM[v13]]) + v11);
        v9 += 32;
        v13 += 32;
        v15 += 1;
    }
    return v8;
}

function contractUri() public nonPayable { 
    v0 = 0x386b(_contractUri.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x386b(_contractUri.length);
    if (v4) {
        if (31 < v4) {
            v5 = v6 = _contractUri.data;
            do {
                MEM[v2] = STORAGE[v5];
                v5 += 1;
                v2 += 32;
            } while (v3 + v4 <= v2);
        } else {
            MEM[v3] = _contractUri.length >> 8 << 8;
        }
    }
    v7 = new bytes[](v1.length);
    v8 = v9 = 0;
    while (v8 < v1.length) {
        v7[v8] = v1[v8];
        v8 += 32;
    }
    v7[v1.length] = 0;
    return v7;
}

function 0xc3d00d4e(address varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    0x133b(varg1, varg0);
}

function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) public nonPayable { 
    require(msg.data.length - 4 >= 224);
    require(!_paused, Error('Pausable: paused'));
    require(block.timestamp <= deadline, Error('ERC20Permit: expired deadline'));
    _nonces[owner] = _nonces[owner] + 1;
    v0 = 0x2b0e(keccak256(0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9, owner, spender, value, _nonces[owner], deadline));
    if (s <= 0x7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a0) {
        MEM[MEM[64]] = 0;
        MEM[MEM[64] + 32] = v0;
        MEM[MEM[64] + 64] = v;
        MEM[MEM[64] + 96] = r;
        MEM[MEM[64] + 128] = s;
        v1 = ecrecover(MEM[MEM[64]:MEM[64] + 160 + MEM[64] - MEM[64]], MEM[MEM[64] - 32:MEM[64] - 32 + 32]);
        require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        v2 = v3 = MEM[MEM[64] - 32];
        if (address(v3)) {
            v4 = v5 = 0;
        } else {
            v2 = v6 = 0;
            v4 = v7 = 1;
        }
    } else {
        v2 = 0;
        v4 = 3;
    }
    require(v4 <= 4, Panic(33)); // failed convertion to enum type
    if (v4 - 0) {
        require(v4 <= 4, Panic(33)); // failed convertion to enum type
        require(v4 - 1, Error('ECDSA: invalid signature'));
        require(v4 <= 4, Panic(33)); // failed convertion to enum type
        require(v4 - 2, Error('ECDSA: invalid signature length'));
        require(v4 <= 4, Panic(33)); // failed convertion to enum type
        require(v4 - 3, Error("ECDSA: invalid signature 's' value"));
    }
    require(address(v2) == owner, Error('ERC20Permit: invalid signature'));
    0x261a(value, spender, owner);
}

function MINTER_ROLE() public nonPayable { 
    return 0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6;
}

function revokeRole(bytes32 role, address account) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    v0 = v1 = !role;
    if (!bool(role)) {
        v0 = msg.sender == account;
    }
    require(!v0);
    require(!_paused, Error('Pausable: paused'));
    0x172e(_getRoleAdmin[role].field1);
    0x2826(account, role);
}

function initialize(string _name, string _symbol, address _admin, address _dev, address _owner) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    require(_name <= uint64.max);
    require(4 + _name + 31 < msg.data.length);
    require(_name.length <= uint64.max);
    require(4 + _name + _name.length + 32 <= msg.data.length);
    require(_symbol <= uint64.max);
    require(4 + _symbol + 31 < msg.data.length);
    require(_symbol.length <= uint64.max);
    require(4 + _symbol + _symbol.length + 32 <= msg.data.length);
    v0 = _initialize;
    v1 = v2 = !v0;
    if (!_initialize) {
        v1 = v3 = _version < 1;
    }
    if (!v1) {
        v1 = v4 = !this.code.size;
        if (!bool(this.code.size)) {
            v1 = 1 == _version;
        }
    }
    require(v1, Error('Initializable: contract is already initialized'));
    _version = 1;
    if (!_initialize) {
        _initialize = 1;
    }
    v5 = v6 = !_admin;
    if (_admin) {
        v5 = v7 = !_owner;
    }
    if (!v5) {
        v5 = !_dev;
    }
    require(!v5, InvalidAddress());
    require(_initialize, Error('Initializable: contract is not initializing'));
    v8 = new bytes[](_name.length);
    CALLDATACOPY(v8.data, _name.data, _name.length);
    v8[_name.length] = 0;
    v9 = new bytes[](_symbol.length);
    CALLDATACOPY(v9.data, _symbol.data, _symbol.length);
    v9[_symbol.length] = 0;
    0x2402(v9, v8);
    v10 = new bytes[](_name.length);
    CALLDATACOPY(v10.data, _name.data, _name.length);
    v10[_name.length] = 0;
    0x2433(v10);
    require(_initialize, Error('Initializable: contract is not initializing'));
    0x247d(0);
    require(_initialize, Error('Initializable: contract is not initializing'));
    MEM[MEM[64]] = 0;
    require(_initialize, Error('Initializable: contract is not initializing'));
    0x20a3(MEM[64]);
    0x24d4();
    0x2503();
    0x2532(_admin, 0);
    0x2532(_dev, 0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6);
    0x2532(_owner, 0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a);
    if (!_initialize) {
        _initialize = 0;
        emit Initialized(1);
    }
}

function allowance(address owner, address spender) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    return _allowance[owner][spender];
}

function PAUSER_ROLE() public nonPayable { 
    return 0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a;
}

function accessRegistry() public nonPayable { 
    return _accessRegistry;
}

function UPGRADER_ROLE() public nonPayable { 
    return 0x189ab7a9244df0848122154315af71fe140f3db0fe014031783b0946b8c9d2e3;
}

function 0xde6(address varg0) private { 
    if (!_accessRegistry) {
        return ;
    } else {
        v0 = new uint256[](msg.data.length);
        CALLDATACOPY(v0.data, 0, msg.data.length);
        MEM[4 + MEM[64] + msg.data.length + 128] = 0;
        v1, /* bool */ v2 = _accessRegistry.staticcall(uint32(0xeefb7e9a), varg0, msg.sender, v0).gas(msg.gas);
        require(bool(v1), 0, RETURNDATASIZE()); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v2 == bool(v2));
        if (v2) {
            return ;
        } else {
            require(!1, ERC20InvalidSender(varg0));
            revert(ERC20InvalidReceiver(varg0));
        }
    }
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function function_selector( function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        v0 = function_selector >> 224;
        if (0x5c975abb > v0) {
            if (0x313ce567 > v0) {
                if (0x1da03312 > v0) {
                    if (0x1ffc9a7 == v0) {
                        supportsInterface(bytes4);
                    } else if (0x69c9fae == v0) {
                        recoverTokens(address,uint256);
                    } else if (0x6fdde03 == v0) {
                        name();
                    } else if (0x95ea7b3 == v0) {
                        approve(address,uint256);
                    } else if (0x18160ddd == v0) {
                        totalSupply();
                    }
                } else if (0x1da03312 == v0) {
                    CONTRACT_ADMIN_ROLE();
                } else if (0x23b872dd == v0) {
                    transferFrom(address,address,uint256);
                } else if (0x248a9ca3 == v0) {
                    getRoleAdmin(bytes32);
                } else if (0x282c51f3 == v0) {
                    BURNER_ROLE();
                } else if (0x2e13ae6e == v0) {
                    0x2e13ae6e();
                } else {
                    require(0x2f2ff15d == v0);
                    grantRole(bytes32,address);
                }
            } else if (0x3f4ba83a > v0) {
                if (0x313ce567 == v0) {
                    decimals();
                } else if (0x31993a1c == v0) {
                    RECOVERY_ROLE();
                } else if (0x3644e515 == v0) {
                    DOMAIN_SEPARATOR();
                } else if (0x36568abe == v0) {
                    renounceRole(bytes32,address);
                } else if (0x3659cfe6 == v0) {
                    upgradeTo(address);
                } else {
                    require(0x39509351 == v0);
                    increaseAllowance(address,uint256);
                }
            } else if (0x3f4ba83a == v0) {
                unpause();
            } else if (0x40c10f19 == v0) {
                mint(address,uint256);
            } else if (0x42966c68 == v0) {
                burn(uint256);
            } else if (0x4f1ef286 == v0) {
                upgradeToAndCall(address,bytes);
            } else if (0x52d1902d == v0) {
                proxiableUUID();
            } else {
                require(0x54fd4d50 == v0);
                version();
            }
        } else if (0xa9059cbb > v0) {
            if (0x84b0196e > v0) {
                if (0x5c975abb == v0) {
                    paused();
                } else if (0x6e1d21b0 == v0) {
                    0x6e1d21b0();
                } else if (0x70a08231 == v0) {
                    balanceOf(address);
                } else if (0x7ecebe00 == v0) {
                    nonces(address);
                } else if (0x7ffc5a5c == v0) {
                    0x7ffc5a5c();
                } else {
                    require(0x8456cb59 == v0);
                    pause();
                }
            } else if (0x84b0196e == v0) {
                eip712Domain();
            } else if (0x88920d29 == v0) {
                0x88920d29();
            } else if (0x91d14854 == v0) {
                hasRole(bytes32,address);
            } else if (0x95d89b41 == v0) {
                symbol();
            } else if (0xa217fddf == v0) {
                DEFAULT_ADMIN_ROLE();
            } else {
                require(0xa457c2d7 == v0);
                decreaseAllowance(address,uint256);
            }
        } else if (0xd547741f > v0) {
            if (0xa9059cbb == v0) {
                transfer(address,uint256);
            } else if (0xac9650d8 == v0) {
                multicall(bytes[]);
            } else if (0xc0e24d5e == v0) {
                contractUri();
            } else if (0xc3d00d4e == v0) {
                0xc3d00d4e();
            } else if (0xd505accf == v0) {
                permit(address,address,uint256,uint256,uint8,bytes32,bytes32);
            } else {
                require(0xd5391393 == v0);
                MINTER_ROLE();
            }
        } else if (0xd547741f == v0) {
            revokeRole(bytes32,address);
        } else if (0xdb0ed6a0 == v0) {
            initialize(string,string,address,address,address);
        } else if (0xdd62ed3e == v0) {
            allowance(address,address);
        } else if (0xe63ab1e9 == v0) {
            PAUSER_ROLE();
        } else if (0xe6f29b05 == v0) {
            accessRegistry();
        } else {
            require(0xf72c0d8b == v0);
            UPGRADER_ROLE();
        }
    }
    fallback();
}
