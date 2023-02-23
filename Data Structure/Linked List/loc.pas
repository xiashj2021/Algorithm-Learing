unit loc;

interface

var

p:Pointer;
j:Integer;

implementation

function loc(L:linklist; I:Integer):Pointer;
begin
     p := L.head; j := 0;
     if (I >= 1) and (I <= L.len) then 
     while j < I do begin p := p^.next; Inc(j); end;
     loc := p;
end;
end.