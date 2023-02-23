unit Linked_List;

interface

type
    pointer = ^nodetype;
    nodetype = record
        data:elemtp;
        next:pointer;
    linkisttp = pointer;
end;

function get_linklist(l:linkisttp; i:Integer):elemtp;
procedure ins_linklist(l:linkisttp; i:Integer; x:elemtp);
procedure del_linklist(l:linkisttp; i:Integer);

implementation

function get_linklist(l:linkisttp; i:Integer):elemtp;
var p:pointer; j:Integer;
begin
    p := l^.next; j := 1;
    while (p <> Nil) and (j < i) do
    begin
        p := p^.next; Inc(j);
    end;
    if (p <> Nil) and (j = i) then get_linklist := p^.data
    else get_linklist := null;
end;

procedure ins_linklist(l:linkisttp; i:Integer; x:elemtp);
var p,q,temp:pointer; j:Integer;
begin
    p := l; j := 0; New(q); q^.data := x;
    case (l^.next) of
    Nil : begin q^.next := Nil; l^.next = q; end;
    else 
    begin
        temp := l; p := l^.next;
        while (p <> Nil) and (j < i-1) do
        begin
            temp := p; p := p^.next; Inc(j);
        end;
        if (p = Nil) or (j > i-1) then begin p^.next := q; q^.next := Nil; end        
        else begin q^.next := p; temp^.next := q; end;
    end;
    end;
end;

procedure del_linklist(l:linkisttp; i:Integer);
var p,q,temp:pointer; j:Integer;
begin
    p := l; j := 0;
    case (l^.next) of
    Nil : WriteLn('Linked list empty');
    else
    begin
        temp := l; p := l^.next;
        while (p^.next <> Nil) and (j < i-1) do
        begin
            temp := p; p := p^.next; Inc(j);
        end;
        if (p^.next = Nil) or (j > i-1) then 
        begin q := p; temp^.next := Nil; Dispose(q); end        
        else begin q := temp^.next; temp^.next := temp^.next.next; Dispose(q); end;
    end;
    end;
end;
end.