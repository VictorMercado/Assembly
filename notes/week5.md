# GDB Continuation
## Where data is stored

Largest signed number in a 64 bit register = 0x7FFF FFFF FFFF FFFF   =    2^63-1
adding 1 gets 0x8000 0000 0000 0000 which equals 2^63
where
    lonog *p = long(17)
    p -> [3670]
    
    [17] -> 3670

    double a[3] = {3.1, 4.7, 6.2};
    where is a?
    where are the 3 numbers?

    high address
    7FFFFFFF8760

    low address
    4048DO              heap