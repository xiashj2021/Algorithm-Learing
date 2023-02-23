unit delete;

interface

var

p,q:Pointer;

implementation
procedure delete(L:linklist; I:Integer);
begin
    p := loc(L,I-1);
    q := p^.next;
    q^.next = p^.next;
    Dispose(q);
    Dec(L.len);
end;
end.