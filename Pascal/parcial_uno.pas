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
    procedure Imprimir(a:arbol);
    begin
        WriteLn('nodo imprimir');
        WriteLn(a^.dato.peso);
    end;

    //al momento de usar esto tenemos que ver si la consigna dice que x > y o
    //preguntarlo con condicionales antes de usarlo.
    procedure puntos(a:arbol;x:integer;y:integer);
    begin
        if(a <> nil) then begin

            if a^.peso > x then begin
                puntos(a^.hi,x,y);
            end;

            if (a^.peso > x) and (a^.peso < y) then begin
                Imprimir(a);
            end;


            if a^.peso < y then begin
                puntos(a^.hd,x,y);
            end;

        end
    end;





var
    a:arbol;
begin
    crearArbol(a);
END.