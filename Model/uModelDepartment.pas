unit uModelDepartment;

interface

type
  TDepartment = class
    private
      FNumber: Integer;
      FName: String;
    protected
      function GetName: String;
      function GetNumber: String;
      procedure SetName(const Value: String);
      procedure SetNumber(const Value: String);
    public
      property Number: String read GetNumber write SetNumber;
      property Name: String read GetName write SetName;
  end;

implementation

uses
  System.SysUtils;

{ TDepartment }

function TDepartment.GetName: String;
begin
  Result:= FName;
end;

function TDepartment.GetNumber: String;
begin
  Result:= IntToStr(FNumber);
end;

procedure TDepartment.SetName(const Value: String);
begin
  FName:= Value;
end;

procedure TDepartment.SetNumber(const Value: String);
begin
  FNumber:= StrToInt(Value);
end;

end.
