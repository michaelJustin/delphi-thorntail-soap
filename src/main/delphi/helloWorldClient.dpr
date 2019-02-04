program helloWorldClient;

{$APPTYPE CONSOLE}

uses
  helloService in 'helloService.pas',
  SysUtils, ActiveX;

var
  HelloServer: Hello;
  Response: string;

begin
  ActiveX.CoInitialize(nil);
  try
     HelloServer := GetHello;
     Response := HelloServer.sayHello('Delphi');
     WriteLn(Response);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;

  ReadLn;
  CoUninitialize;
end.
