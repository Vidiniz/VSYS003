unit uModelProvider;

interface

type
  TProvider = class
    private
      FNumber: Integer;
      FName: String;
    protected
      procedure SetName(const Value: String);
      procedure SetNumber(const Value: String);
      function GetName: String;
      function GetNumber: String;
    public
      property Number: String read GetNumber write SetNumber;
      property Name: String read GetName write SetName;
  end;

implementation

uses
  System.SysUtils;

{ TProvider }

function TProvider.GetName: String;
begin
  Result:= FName;
end;

function TProvider.GetNumber: String;
begin
  Result:= IntToStr(FNumber);
end;

procedure TProvider.SetName(const Value: String);
begin
  FName:= Value;
end;

procedure TProvider.SetNumber(const Value: String);
begin
  FNumber:= StrToInt(Value);
end;

end.
