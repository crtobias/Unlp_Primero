Program ArbolesDeLibros;

type


libro = record 
    nombre:string;
    id:integer;
    precio:integer;
end;

arbol = ^nodo;

nodo = record
  ri:arbol;
  le:arbol;
  dato:libro;
end;


procedure insertarDato(var a:arbol ; l:libro);
var
  nue:arbol;
begin
  if(a = nil) then begin
    new(nue);
    nue^.dato:=l;
    nue^.ri:=nil;
    nue^.le:=nil;
    a:=nue;
  end else begin

    if (l.id > a^.dato.id) then begin
      insertarDato(a^.ri , l);
    end else
      if( l.id < a^.dato.id ) then begin
        insertarDato(a^.le , l); 
      end else
        WriteLn('es repetido');

  end;
end;


procedure leerLibro(var l:libro);
begin
  WriteLn('ingresar id');
  readLn(l.id);
  if (l.id <> -1) then begin
    WriteLn('ingresar precio');
    readLn(l.precio);
    WriteLn('ingresar nombre');
    readLn(l.nombre);
  end;
end;

// crear arbols mientras libro.id <> -1
procedure generarArbol(var a:arbol);
var
  l:libro;
begin
  leerLibro(l);
  if ( l.id <> -1) then begin
    insertarDato(a,l);
    generarArbol(a);
  end;
end;




begin
  
    WriteLn('holas');
  
END.