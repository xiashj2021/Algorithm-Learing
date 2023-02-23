unit Cyclic_Queue;

interface
const
    maxsize = n;
    m = maxsize - 1;
type
    cyclicquetp = record
        elem:array[0..m] of elemp;
        rear,front:0..m
end;

procedure addQ(cq:cyclicquetp; x:elemp);
procedure delQ(cq:cyclicquetp; x:elemp);

implementation

procedure addQ(cq:cyclicquetp; x:elemp);
begin
    cq.rear := cq.rear + 1;
    if cq.rear mod maxsize = cq.front then WriteLn('Queue full')
    else
        cq.rear := (cq.rear + 1) mod maxsize;
        cq.elem[cq.rear] := x;
end;

procedure delQ(cq:cyclicquetp; x:elemp);
begin
    if cq.rear = cq.front then WriteLn('Queue empty')
    else
        cq.front := (cq.front + 1) mod maxsize;
        x := cq.elem[cq.front];
end;
end.