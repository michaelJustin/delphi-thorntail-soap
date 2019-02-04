// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.2.12.42:8080/helloService?WSDL
//  >Import : http://10.2.12.42:8080/helloService?WSDL>0
// Version  : 1.0
// (28.01.2019 09:01:09 - - $Rev: 19514 $)
// ************************************************************************ //

unit helloService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNQL = $0008;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://hello.example.com/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : helloServiceSoapBinding
  // service   : helloService
  // port      : helloPort
  // URL       : http://10.2.12.42:8080/helloService
  // ************************************************************************ //
  Hello = interface(IInvokable)
  ['{93DF7C67-F52E-C762-FCA3-9DBF34E25547}']
    function  sayHello(const arg0: string): string; stdcall;
  end;

function GetHello(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): Hello;


implementation
  uses SysUtils;

function GetHello(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): Hello;
const
  defWSDL = 'http://10.2.12.42:8080/helloService?WSDL';
  defURL  = 'http://10.2.12.42:8080/helloService';
  defSvc  = 'helloService';
  defPrt  = 'helloPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as Hello);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(Hello), 'http://hello.example.com/', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Hello), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(Hello), ioHasNamespace);

end.