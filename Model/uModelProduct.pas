unit uModelProduct;

interface

uses uModelProvider, uModelDepartment;

type
  TProduct = class
    private
      FNumber: Integer;
      FDescription: String;
      FFactoryCode: String;
      FBarcode: String;
      FPrice: Double;
      FStock: Double;
      FProvider: TProvider;
      FDepartment: TDepartment;
    protected
      function GetDepartment: TDepartment;
      function GetProvider: TProvider;
      function GetBacode: String;
      function GetDescription: String;
      function GetFactoryCode: String;
      function GetNumber: String;
      function GetPrice: String;
      function GetStock: String;
      procedure SetDepartment(const Value: TDepartment);
      procedure SetProvider(const Value: TProvider);
      procedure SetBarcode(const Value: String);
      procedure SetDescription(const Value: String);
      procedure SetFactoryCode(const Value: String);
      procedure SetNumber(const Value: String);
      procedure SetPrice(const Value: String);
      procedure SetStock(const Value: String);
    public
      property Number: String read GetNumber write SetNumber;
      property Description: String read GetDescription write SetDescription;
      property FactoryCode: String read GetFactoryCode write SetFactoryCode;
      property Barcode: String read GetBacode write SetBarcode;
      property Price: String read GetPrice write SetPrice;
      property Stock: String read GetStock write SetStock;
      property Provider: TProvider read GetProvider write SetProvider;
      property Department: TDepartment read GetDepartment write SetDepartment;
      constructor Create;
      Destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TProduct }

constructor TProduct.Create;
begin
  inherited Create;
  FProvider := TProvider.Create;
  FDepartment := TDepartment.Create;
end;

destructor TProduct.Destroy;
begin
  FreeAndNil(FProvider);
  FreeAndNil(FDepartment);
  inherited;
end;

function TProduct.GetBacode: String;
begin
  Result := FBarcode;
end;

function TProduct.GetDepartment: TDepartment;
begin
  Result := FDepartment;
end;

function TProduct.GetDescription: String;
begin
  Result := FDescription;
end;

function TProduct.GetFactoryCode: String;
begin
  Result := FFactoryCode
end;

function TProduct.GetNumber: String;
begin
  Result := IntToStr(FNumber);
end;

function TProduct.GetPrice: String;
begin
  Result := FloatToStr(FPrice);
end;

function TProduct.GetProvider: TProvider;
begin
  Result := FProvider;
end;

function TProduct.GetStock: String;
begin
  Result := FloatToStr(FStock);
end;

procedure TProduct.SetBarcode(const Value: String);
begin
  FBarcode := Value;
end;

procedure TProduct.SetDepartment(const Value: TDepartment);
begin
  FDepartment := Value;
end;

procedure TProduct.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TProduct.SetFactoryCode(const Value: String);
begin
  FFactoryCode := Value;
end;

procedure TProduct.SetNumber(const Value: String);
begin
  FNumber := StrToInt(Value);
end;

procedure TProduct.SetPrice(const Value: String);
begin
  FPrice := StrToFloat(Value);
end;

procedure TProduct.SetProvider(const Value: TProvider);
begin
  FProvider := Value;
end;

procedure TProduct.SetStock(const Value: String);
begin
  FStock := StrToFloat(Value);
end;

end.
