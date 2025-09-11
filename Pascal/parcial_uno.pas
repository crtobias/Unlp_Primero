// Correo Argentino desea analizar la información de los paquetes enviados durante 2024. 
// De cada paquete enviado se conoce: código de envío, DNI del emisor, DNI del receptor,
//  cantidad de objetos en el paquete y peso del paquete en gramos.

// Realice un programa que contenga e invoque a:

// a. Un módulo que lea la información de paquetes enviados y retorne una 
// estructura con todos los paquetes leídos. La estructura debe ser eficiente 
// para buscar por peso del paquete en gramos. La lectura finaliza al leer un
//  paquete con código de envío 0.

// b. Un módulo que reciba la estructura generada en a) y dos valores, 
// y retorne una lista con todos los paquetes enviados cuyo peso está entre los dos valores recibidos.

// c. Un módulo que reciba la estructura generada en a) y retorne toda la
//  información del paquete enviado con mayor cantidad de objetos.

program CRtobias;
type



    arbol = ^nodo;

    lista = ^nodoLista;

    paquete = record
        codigo:integer;
        dniEmisor:integer;
        dniReceptor:integer;
        cantObjetos:integer;
        peso:real;
    end;

    nodoLista = record
        dato:paquete;
        sig:lista;
    end;

    nodo = record
        dato:paquete;
        hd:arbol;
        hi:arbol;
    end;

    // mientras codigo <> 0 agregar ordenado por peso
    procedure insertarDato(var a:arbol ; p:paquete);
    var
        nue:arbol;
    begin
        if(a=nil) then begin
            new(nue);
            nue^.dato:=p;
            nue^.hd:=nil;
            nue^.hi:=nil;
            a:=nue;
        end else begin 
            if (p.peso > a^.dato.peso) then begin
                insertarDato(a^.hd,p);
            end else begin
                if (p.peso < a^.dato.peso) then begin
                    insertarDato(a^.hi,p);
                end else
                    WriteLn('repetido');
            end
        end;
    end;

    procedure agregarAdelante(var l:lista;p:paquete);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:=p;
        nue^.sig:=nil;
        if(l = nil) then begin  
            l:=nue;
        end else begin
            nue^.sig:=l;
            l:=nue;
        end;
    end;

    procedure leerPaquete(var p:paquete);
    begin
        WriteLn('ingrese cdigo');
        readLn(p.codigo);
        if(p.codigo <> 0) then begin 
            WriteLn('ingrese dniEmisor');
            readLn(p.dniEmisor);
            WriteLn('ingrese dniReceptor');
            readLn(p.dniReceptor);
            WriteLn('ingrese peso');
            readLn(p.peso);
            WriteLn('ingrese cantObjetos');
            readLn(p.cantObjetos);
        end;
    end;

    procedure crearArbol(var a:arbol);
    var
        p:paquete;
    begin
        leerPaquete(p);
        if(p.codigo <> 0) then begin 
            insertarDato(a,p);
            crearArbol(a);
        end;
    end;

    //este solo imprime pero si queremos agregar en una lista o tratar
    //el nodo de alguna manera podriamos cambiar esta funcion y listo
    procedure Imprimir(a:arbol;var l:lista);
    var
        p:paquete;
    begin
        WriteLn('agregando a la lista');
        p:= a^.dato;
        agregarAdelante(l,p);
        WriteLn('nodo agregado a la lista');
    end;


    procedure puntos(a:arbol;min:real;max:real;var l:lista);
    begin

        if(a <> nil) then begin

            if a^.dato.peso > min then begin
                puntos(a^.hi,min,max,l);
            end;

            if (a^.dato.peso > min) and (a^.dato.peso < max) then begin
                Imprimir(a,l);
            end;


            if a^.dato.peso < max then begin
                puntos(a^.hd,min,max,l);
            end;

        end
    end;

    
procedure usarPuntos(a:arbol;var min:real;var max:real; var l:lista);
begin
    WriteLn('ingrese peso minimo');
    readLn(min);
    WriteLn('ingrese peso maximo');
    readLn(max);

    if( min < max) then begin 
        puntos(a,min,max,l);
    end else begin
        puntos(a,max,min,l);
    end;
end;

procedure writeLista(l:lista);
begin
    if( l <> nil) then begin
        write('nodo peso: ',l^.dato.peso);
        if (l^.sig <> nil) then begin
            writeLista(l^.sig);
        end;
    end;
end;


var
    a:arbol;
    min:real;
    max:real;
    l:lista;
begin
    l:=nil;
    crearArbol(a);
    usarPuntos(a,min,max,l);
    writeLista(l);

END.
//falta sacar el mayor en el arbol pero es recorrer
// y ir remplazando alta paja es facil