/**
EXAMPLE: pragma
*/
pragma ton-solidity >=0.35.5; // Check compiler version is at least 0.35.5
pragma ton-solidity ^ 0.35.5; // Check compiler version is at least 0.35.5 and less 0.36.0
pragma ton-solidity < 0.35.5; // Check compiler version is less 0.35.5
pragma ton-solidity >= 0.35.5 < 0.35.7; // Check compiler version equal to 0.35.5 or 0.35.6
pragma ignoreIntOverflow;
pragma AbiHeader time;
pragma AbiHeader pubkey;
pragma AbiHeader expire;
pragma msgValue 123456789;
pragma msgValue 1e8;
pragma msgValue 10 ton;
pragma msgValue 10_000_000_123;


/**
EXAMPLE: TON units
*/
require(1 nano == 1);
require(1 nanoton == 1);
require(1 nTon == 1);
require(1 ton == 1e9 nanoton);
require(1 Ton == 1e9 nanoton);
require(1 micro == 1e-6 ton);
require(1 microton == 1e-6 ton);
require(1 milli == 1e-3 ton);
require(1 milliton == 1e-3 ton);
require(1 kiloton == 1e3 ton);
require(1 kTon == 1e3 ton);
require(1 megaton == 1e6 ton);
require(1 MTon == 1e6 ton);
require(1 gigaton == 1e9 ton);
require(1 GTon == 1e9 ton);


/**
EXAMPLE: int uint
*/
int i = 0;
uint u = 0;
int8 a = 1;
uint9 b = 123; //error type;
int255 c = 123; //error type;
uint256 d = 0xd;


/**
EXAMPLE: ExtraCurrencyCollection
*/
ExtraCurrencyCollection curCol;
uint32 key;
uint256 value;
optional(uint32, uint256) res = curCol.min();
optional(uint32, uint256) res = curCol.next(key);
optional(uint32, uint256) res = curCol.prev(key);
optional(uint32, uint256) res = curCol.nextOrEq(key);
optional(uint32, uint256) res = curCol.prevOrEq(key);
optional(uint32, uint256) res = curCol.delMin();
optional(uint32, uint256) res = curCol.delMax();
optional(uint256) optValue = curCol.fetch(key);
bool exists = curCol.exists(key);
bool isEmpty = curCol.empty();
bool success = curCol.replace(key, value);
bool success = curCol.add(key, value);
optional(uint256) res = curCol.getSet(key, value);
optional(uint256) res = curCol.getAdd(key, value);
optional(uint256) res = curCol.getReplace(key, value);
uint256 uintValue = curCol[index];


/**
EXAMPLE: vector
*/
vector(uint) vect;
uint a = 11;
vect.push(a);
vect.push(111);


/**
EXAMPLE: for iteration
*/
uint[] arr = ...;
uint sum = 0;
for (uint val : arr) { // iteration over array
    sum += val;
}

bytes byteArray = "Hello!";
for (byte b : byteArray) {
    // ...
}

mapping(uint32 => uint) map = ...;
uint keySum = 0;
uint valueSum = 0;
for ((uint32 key, uint value) : map) { // iteration over mapping 
    keySum += key;
    valueSum += value;
}

mapping(uint32 => uint) map = ...;
uint keySum = 0;
for ((uint32 key, ) : map) { // value is omitted
    keySum += key;
}

uint valueSum = 0;
for ((, uint value) : map) { // key is omitted  
    valueSum += value;
}


/**
EXAMPLE: repeat
*/
uint a = 0;
repeat(10) {
    a ++;
}
require(a == 10, 101);

// Despite a is changed in the cycle, code block will be repeated 10 times (10 is initial value of a)
repeat(a) {
    a += 2;
}
require(a == 30, 102);

a = 11;
repeat(a - 1) {
    a -= 1;
}
require(a == 1, 103);



/**
EXAMPLE: array
*/
struct MyStruct {
    uint a;
    int b;
    address c;
}

uint[] arr;
require(arr.empty());
arr.push();
require(!arr.empty());


/**
EXAMPLE: bytes and hex literal
*/
bytes a = "abzABZ0129"; // initialised with string
bytes b = hex"0DE_001a_239_abf"; // initialised with hex data
bytes bad_ = hex"_0DE_001a__239_abf_";
bytes bad = hex"ghjkl";
bytes bad1 = hex"123ghjkl";
bytes bad2 = hex"ghjkl123";
bytes bad3 = hex"BADgh01_23_46jkl123";


/**
EXAMPLE: bytes with length
*/
bytes0 b0;
bytes1 b1;
bytes2 b2;
bytes3 b3;
bytes4 b4;
bytes5 b5;
bytes6 b6;
bytes7 b7;
bytes8 b8;
bytes9 b9;
bytes10 b10;
bytes11 b11;
bytes12 b12;
bytes13 b13;
bytes14 b14;
bytes15 b15;
bytes16 b16;
bytes17 b17;
bytes18 b18;
bytes19 b19;
bytes20 b20;
bytes21 b21;
bytes22 b22;
bytes23 b23;
bytes24 b24;
bytes25 b25;
bytes26 b26;
bytes27 b27;
bytes28 b28;
bytes29 b29;
bytes30 b30;
bytes31 b31;
bytes32 b32;
bytes33 b33;
bytes34 b34;
bytes100 b100;


/**
EXAMPLE: bytes, byte
*/
bytes byteArray = "abba";
int index = 0;
byte a0 = byteArray[index];

bytes byteArray = "01234567890123456789";
bytes slice = byteArray[5:10];
bytes etalon = "56789";
require(slice == etalon);
slice = byteArray[10:];
etalon = "0123456789";
require(slice == etalon);
slice = byteArray[:10];
require(slice == etalon);
slice = byteArray[:];
require(slice == byteArray);
require(byteArray[:10] == etalon);
require(etalon == byteArray[:10]);

bytes byteArray = "1234";
bytes4 bb = byteArray;


/**
EXAMPLE: string
*/
string long = "0123456789";
string a = long.substr(1, 2); // a = "12"
string b = long.substr(6); // b = "6789"

string str = "01234567890";
optional(uint32) a = str.find(byte('0'));
require(a.hasValue());
require(a.get() == 0);

byte symbol = 'a';
optional(uint32) b = str.findLast(symbol);
require(!b.hasValue());

string sub = "111";
optional(uint32) c = str.find(symbol);
require(!c.hasValue());


/**
EXAMPLE: string escape
*/
string escaped = "escaped: \\ backslash, \' single quote, \" double quote";
string escape2 = "escaped: \n newline, \r carriage return, \t tab";
string escapeold = "not escaped, deprecated: \b \f \v";
string escapehex = "escaped: \x01 \xab \xCD \xaD, but: \x1 \xabc \x12345, \xg \x-12";
string escapeunicode = "escaped: \u1223 \uabCD, but: \u1 \u22 \u333 \u12345 \uABCDEF, \u123G \uAB-CD";


/**
EXAMPLE: string format
*/
string str = format("Hello {} 0x{:X} {}  {}.{} tons", 123, 255, address.makeAddrStd(-33,0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF123456789ABCDE), 100500, 32);
require(str == "Hello 123 0xFF -21:7fffffffffffffffffffffffffffffffffffffffffffffffff123456789abcde  100500.32 tons", 101);
require(format("Hello {}", 123) == "Hello 123", 102);
require(format("Hello 0x{:X}", 123) == "Hello 0x7B", 103);
require(format("{}", -123) == "-123", 103);
require(format("{}", address.makeAddrStd(127,0)) == "7f:0000000000000000000000000000000000000000000000000000000000000000", 104);
require(format("{}", address.makeAddrStd(-128,0)) == "-80:0000000000000000000000000000000000000000000000000000000000000000", 105);
require(format("{:6}", 123) == "   123", 106);
require(format("{:06}", 123) == "000123", 107);
require(format("{:06d}", 123) == "000123", 108);
require(format("{:06X}", 123) == "00007B", 109);
require(format("{:6x}", 123) == "    7b", 110);
uint128 a = 1 ton;
require(format("{:t}", a) == "1.000000000", 101);
a = 123;
require(format("{:t}", a) == "0.000000123", 103);
fixed32x3 v = 1.5;
require(format("{}", v) == "1.500", 106);
fixed256x10 vv = -987123.4567890321;
require(format("{}", vv) == "-987123.4567890321", 108);


/**
EXAMPLE: address
*/
address addrNone = address.makeAddrNone();
uint addrNumber;
uint bitCnt;
address addrExtern = address.makeAddrExtern(addrNumber, bitCnt);

(int8 wid, uint addr) = address(this).unpack();


/**
EXAMPLE: transfer
*/
address dest = ...;
uint128 value = ...;
bool bounce = ...;
uint16 flag = ...;
TvmCell body = ...;
ExtraCurrencyCollection c = ...;
// sequential order of parameters
addr.transfer(value);
addr.transfer(value, bounce);
addr.transfer(value, bounce, flag);
addr.transfer(value, bounce, flag, body);
addr.transfer(value, bounce, flag, body, c);
// using named parameters
destination.transfer({value: 1 ton, bounce: false, flag: 128, body: cell, currencies: c});
destination.transfer({bounce: false, value: 1 ton, flag: 128, body: cell});


/**
EXAMPLE: mapping
*/
struct Point {
    uint x;
    uint y;
    uint z;
}
mapping(Point => address) map;
function test(uint x, uint y, uint z, address addr) public {
    Point p = Point(x, y, z);
    map[p] = addr;
}

KeyType key; // init key
optional(KeyType, ValueType) nextPair = map.next(key);
optional(KeyType, ValueType) prevPair = map.prev(key);

if (nextPair.hasValue()) {
    (KeyType nextKey, ValueType nextValue) = nextPair.get(); // unpack optional value
    // using nextKey and nextValue
}

mapping(uint8 => uint) m;
optional(uint8, uint) = m.next(-1); // ok, param for next/prev can be negative 
optional(uint8, uint) = m.prev(65537); // ok, param for next/prev can not possibly fit to KeyType (uint8 in this case)


/**
EXAMPLE: function
*/
function getSum(int a, int b) internal pure returns (int) {
    return a + b;
}

function getSub(int a, int b) internal pure returns (int) {
    return a - b;
}

function process(int a, int b, uint8 mode) public returns (int) {
    function (int, int) returns (int) fun;
    if (mode == 0) {
        fun = getSum;
    } else if (mode == 1) {
        fun = getSub;
    }
    return fun(a, b); // if `fun` isn't initialized then exception is thrown 
}


/**
EXAMPLE: require, revert
*/
uint a = 5;
require(a == 5); // ok
require(a == 6); // throws an exception with code 100
require(a == 6, 101); // throws an exception with code 101
require(a == 6, 101, "a is not equal to six"); // throws an exception with code 101 and string
require(a == 6, 101, a); // throws an exception with code 101 and number a

revert(); // throw exception 100
revert(101); // throw exception 101
revert(102, "We have a some problem"); // throw exception 102 and string
revert(101, a); // throw exception 101 and number a


/**
EXAMPLE: constant, static
*/
uint128 constant public GRAMS_OVERHEAD = 0.2 nanoton;

contract MyContract {
	uint constant COST = 100;
	uint constant COST2 = COST + GRAMS_OVERHEAD;
	address constant dest = address.makeAddrStd(-1, 0x89abcde);
}

contract C {
    uint static a; // ok
    // uint static b = 123; // error
}


/**
EXAMPLE: contract functions
*/
contract Sink {
    uint public counter = 0;
    uint public msgWithPayload = 0;
    receive() external {
        ++counter;
        // if the inbound internal message has payload then we can get it using `msg.data`
        TvmSlice s = msg.data;
        if (!s.empty()) {
            ++msgWithPayload;
        }
    }
}

contract ContractA {
    uint public counter = 0;

    function f(uint a, uint b) public pure { /*...*/ }

    fallback() external {
        ++counter;
    }

    onBounce(TvmSlice body) external {
        /*...*/
    }
    onTickTock(bool isTock) external {
        /*...*/
    }
}


/**
EXAMPLE: pure view
*/
contract Test {
    uint a;
    event MyEvent(uint val);

    // pure mutability
    function f() public pure {
        emit MyEvent(123);
    }

    // view mutability
    function g() public view {
        emit MyEvent(a);
    }

    // default mutability (not set)
    function e(uint newA) public {
        a = newA;
    }
}


/**
EXAMPLE: inline, externalMsg and internalMsg
*/
// This function is called as usual function.
function getSum(uint a, uint b) public returns (uint) {
    return sum(a, b);
}

// Code of this function is inserted to the place of call.
function sum(uint a, uint b) private inline returns (uint) {
    return a + b;
}

function f() public externalMsg { // this function receives only external messages 
    /*...*/
}

// Note: keyword `external` specifies function visibility
function ff() external externalMsg { // this function receives only external messages also  
    /*...*/
}

function g() public internalMsg { // this function receives only internal messages
    /*...*/
}


/**
EXAMPLE: functionID
*/
// These function receives internal and external messages.
function fun() public { /*...*/ }


function f() public pure functionID(123) {
    /*...*/
}


/**
EXAMPLE: emit event
*/
event SomethingIsReceived(uint a, uint b, uint sum);
// ...
address addr = address.makeAddrExtern(...);
emit SomethingIsReceived{dest: addr}(2, 8, 10); // dest address is set
emit SomethingIsReceived(10, 15, 25); // dest address == addr_none


/**
EXAMPLE: return options
*/
function f(uint n) public pure {
    return n <= 1? 1 : n * f(n - 1);
}

function f(uint n) public responsible pure {
    return{value: 0, flag: 64} n <= 1? 1 : n * f(n - 1);
}



/**
EXAMPLE: external call
*/
interface IContract {
    function f(uint a) external;
}

contract Caller {
    function callExt(address addr) public {
        IContract(addr).f(123); // attached default value: 0.01 ton
        IContract(addr).f{value: 10 ton}(123);
        IContract(addr).f{value: 10 ton, flag: 3}(123);
        IContract(addr).f{value: 10 ton, bounce: true}(123);
        IContract(addr).f{value: 1 micro, bounce: false, flag: 128}(123);
        ExtraCurrencyCollection cc;
        cc[12] = 1000;
        IContract(addr).f{value: 10 ton, currencies:cc}(123);
    }
}


contract RemoteContract {
    // Note this function is marked as responsible to call callback function
    function getCost(uint x) public pure responsible returns (uint) {
        uint cost = x == 0 ? 111 : 222;
        // return `cost` and set option for outbound internal message.
        return{value: 0, bounce: false, flag: 64} cost;  
    }
}

contract Caller {
    function test(address addr, uint x) public pure {
        // `getCost` returns result to `onGetCost`
        RemoteContract(addr).getCost{value: 1 ton, callback: Caller.onGetCost}(x);
    }

    function onGetCost(uint cost) public {
        // check that msg.sender is expected address 
        // we get cost TODO value, we can handle this value
        /* `cost` is uint, `_item` is global, `0sdf` is incorrect */
    }
}


/**
EXAMPLE: highlight variables and names in comments
*/
contract Caller {
    function test(address addr, uint x) public pure {
        // `getCost` returns result to `onGetCost`
        RemoteContract(addr).getCost{value: 1 ton, callback: Caller.onGetCost}(x);
    }

    function onGetCost(uint cost) public {
        // TODO: check that `msg.sender` is expected address 
        // we get cost value, we can handle this value
        /* `cost` is uint, `_item` is global, `0sdf` is incorrect */
    }
}


/**
EXAMPLE: await
*/
interface IContract {
	function getNum(uint a) external responsible returns (uint) ;
}

contract Caller {
	function call(address addr) public pure {
		// ...
		uint res = IContract(addr).getNum(123).await;
		require(res == 124, 101);
		// ...
	}
}


/**
EXAMPLE: delete
*/
int a = 5;
delete a;
require(a == 0);

uint[] arr;
arr.push(11);
arr.push(22);
arr.push(33);

delete arr[1];
require(arr[0] == 11);
require(arr[1] == 0);
require(arr[2] == 33);
delete arr;
require(arr.length == 0);

mapping(uint => uint) l_map;
l_map[1] = 2;
delete l_map[1];
require(!l_map.exists(1));
l_map[1] = 2;
delete l_map;
require(!l_map.exists(1));

struct DataStruct {
    uint m_uint;
    bool m_bool;
}

DataStruct l_struct;
l_struct.m_uint = 1;
delete l_struct;
require(l_struct.m_uint == 0);

TvmBuilder b;
uint i = 0x54321;
b.store(i);
TvmCell c = b.toCell();
delete c;
TvmCell empty;
require(tvm.hash(empty) == tvm.hash(c));
b.store(c);

TvmSlice slice = b.toSlice();
require(slice.bits() == 256);
require(slice.refs() == 1);
delete slice;
require(slice.bits() == 0);
require(slice.refs() == 0);

require(b.bits() == 256);
require(b.refs() == 1);
delete b;
require(b.bits() == 0);
require(b.refs() == 0);


/**
EXAMPLE: tvm
*/
tvm.log("Hello,world!");
logtvm("99_Bottles");

string s = "Some_text";
tvm.log(s);

uint256 hash = tvm.hash(TvmCell cellTree);
uint256 hash = tvm.hash(string);
uint256 hash = tvm.hash(bytes);

// 1)
tvm.buildStateInit(TvmCell code, TvmCell data) returns (TvmCell stateInit);
// 2) 
tvm.buildStateInit(TvmCell code, TvmCell data, uint8 splitDepth) returns (TvmCell stateInit);
// 3)
tvm.buildStateInit({code: TvmCell code, data: TvmCell data, splitDepth: uint8 splitDepth,
    pubkey: uint256 pubkey, contr: contract Contract, varInit: {VarName0: varValue0, ...}});


TvmCell code = ...;
address newWallet = new SimpleWallet{value: 1 ton, code: code}(arg0, arg1, ...);



/**
EXAMPLE: extMsg
*/
interface Foo {
    function bar(uint a, uint b) external pure;
}

contract Test {
    function test7() public {
        address addr = address.makeAddrStd(0, 0x0123456789012345678901234567890123456789012345678901234567890123);
        Foo(addr).bar{expire: 0x12345, time: 0x123}(123, 45).extMsg;
        optional(uint) pubkey;
        optional(uint32) signBox;
        Foo(addr).bar{expire: 0x12345, time: 0x123, pubkey: pubkey}(123, 45).extMsg;
        Foo(addr).bar{expire: 0x12345, time: 0x123, pubkey: pubkey, sign: true}(123, 45).extMsg;
        pubkey.set(0x95c06aa743d1f9000dd64b75498f106af4b7e7444234d7de67ea26988f6181df);
        Foo(addr).bar{expire: 0x12345, time: 0x123, pubkey: pubkey, sign: true}(123, 45).extMsg;
        Foo(addr).bar{expire: 0x12345, time: 0x123, sign: true, signBoxHandle: signBox}(123, 45).extMsg;
    }
}


/**
EXAMPLE: tvm, math, rnd
*/
// The following functions are only colored differently from normal functions
// if theme supports "support.function". You can check with "Kimble Dark" theme
tvm.accept();
tvm.unknownFunction();

int a = math.abs(-4123); // 4123
int b = -333;
int c = math.abs(b); // 333
math.unknownFunction();

rnd.shuffle(/*uint someNumber*/ 123);
rnd.shuffle();
uint256 r0 = rnd.next(); // 0..2^256-1
uint8 r1 = rnd.next(100);  // 0..99
int8 r2 = rnd.next(int8(100));  // 0..99
int8 r3 = rnd.next(int8(-100)); // -100..-1
rnd.unknownFunction();

selfdestruct(/*address*/ dest_addr);
sha256(/*TvmSlice*/ slice);// returns (uint256)
sha256(/*bytes*/ b);// returns (uint256)
sha256(/*string*/ str);// returns (uint256)
gasToValue(/*uint128*/ gas, /*int8*/ wid);// returns (uint128 value)
valueToGas(/*uint128*/ value, /*int8*/ wid);// returns (uint128 gas)

sha257(someBytes);
sha256(someBytes);



/**
EXAMPLE: bitSize, uBitSize
*/
require(bitSize(12) == 5); // 12 == 1100(in bin sys)
require(bitSize(1) == 2);
require(bitSize(-1) == 1);
require(bitSize(0) == 0);

require(uBitSize(10) == 4);
require(uBitSize(1) == 1);
require(uBitSize(0) == 0);

require(ubitSize(0) == 0); // wrong

/**
EXAMPLE: TvmSlice, TvmBuilder, TvmCell
*/
TvmSlice slice = ...;
(uint8 a, uint16 b) = slice.decode(uint8, uint16);
(uint16 num0, uint32 num1, address addr) = slice.decode(uint16, uint32, address);

uint256 a = 11;
int16 b = 22;
TvmBuilder builder;
builder.store(a, b, uint(33));

function afterSignatureCheck(TvmSlice body, TvmCell message) private inline returns (TvmSlice) {
    /*...*/
}


/**
EXAMPLE: natspec
*/
/**
  @title A simulator for trees
  @author Larry A. Gardner
  @notice You can use this contract for only the most basic simulation
  @dev All function calls are currently implemented without side effects
*/
contract Tree {
    /// @author Mary A. Botanist
    /// @notice Calculate tree age in years, rounded up, for live trees
    /// @dev The Alexandr N. Tetearing algorithm could increase precision
    /// @param rings The number of rings from dendrochronological sample
    /// @return age in years, rounded up for partial years
    function age(uint256 rings) external pure returns (uint256) {
        return rings + 1;
    }
}


////
pragma ton-solidity >= 0.35.5 < 0.35.7; // Check compiler version equal to 0.35.5 or 0.35.6
pragma AbiHeader time;
pragma msgValue 10 ton;

int a = math.abs(-4123); // 4123
TvmBuilder b;
b.store(a);
TvmCell c = b.toCell();
int8 r = rnd.next(int8(-100));
uint9 b = 123; // error type;
rnd.unknownFunction();
selfdestruct(address(dest_addr));
gasToValue(gas, wid);// returns (uint128 `value`)
sha257("String with\nescapes: \x12 \u1234");
sha256("String with\rescapes:\t\x12 \u1234\"");
vector(uint) vect;
mapping(uint32 => uint) map = /*...*/;
for ((uint32 key, ) : map) { // value is omitted
    repeat(5) {keySum += key;}
}
bytes b = hex"0DE_001a_239_abf"; // initialised with hex data
bytes bad_ = hex"_0DE_001a__239_abf_";
bytes bad = hex"0123ghjklABCD";
require(format("Hello 0x{:X}", 123) == "Hello 0x7B", 103);
return{value: 0, flag: 64} n <= 1? 1 : n * f(n - 1);



