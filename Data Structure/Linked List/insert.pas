unit insert;

interface

var

p,q:Pointer;

implementation

procedure insert(L:linklist; I:integer; x:datatype);
begin
     p := loc(L,I); New(q); 
     q^.data = x;
     q^.next = p^.next;
     p^.next = q;
     Inc(L.len);
end;
end.