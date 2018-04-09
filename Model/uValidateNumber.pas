unit uValidateNumber;

interface

uses System.SysUtils;

function ValidateNumber(var AValue: String): Boolean;
function ValidateCurrency(AValue: String): Boolean;
function ReturnNumber(pValue: String): String;

implementation

function ValidateNumber(var AValue: String): Boolean;
var Count : Integer;
    Condition : Boolean;
begin
  Result := False;
  Condition := False;
  for Count := 1 to Length(AValue) do
    begin
      if AValue[Count] in ['0','1','2','3','4','5','6','7','8','9'] then
        Condition:= True
      else
        begin
          Condition:= False;
          Break;
        end;
    end;
  Result := Condition;
end;

function ValidateCurrency(AValue: String): Boolean;
var lvCount: Integer;
    lvCond: Boolean;
begin
  Result := False;
  lvCond := False;
  for lvCount := 1 to Length(AValue) do
    begin
      if AValue[lvCount] in ['0','1','2','3','4','5','6','7','8','9',','] then
        lvCond := True
      else
        begin
          lvCond := False;
          Break;
        end;
    end;
   Result := lvCond;
end;

function ReturnNumber(pValue: String): String;
var lvCount: Integer;
    lvReturn: String;
begin
  Result:= '';
  for lvCount := 1 to Length(pValue) do
    begin
      if pValue[lvCount] in ['0','1','2','3','4','5','6','7','8','9'] then
        lvReturn := lvReturn +  pValue[lvCount]
      else
        Break;
    end;
  Result:= lvReturn;
end;

end.
