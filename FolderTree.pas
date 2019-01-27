unit FolderTree;

interface

uses
  FMX.TreeView,
  System.Contnrs;

type
  TFolderTree = class
  private
    fTreeView: TTreeView;
    fFolderView: TTreeViewItem;
    fViewItems: TObjectList;
    FTreeUpdating: Boolean;
    procedure UpdateTreeView;
  public
    Constructor Create(aTreeView: TTreeView);
    Destructor Destroy; override;
  end;

implementation

uses
  System.Classes,
  System.SysUtils,
  System.TypInfo,
  FMX.Grid;

constructor TFolderTree.Create(aTreeView: TTreeView);
var
  Item: TTreeViewItem;
  i: Integer;
begin
  fFolderView := TTreeViewItem.Create(nil);
  fViewItems := TObjectList.Create;
  fViewItems.OwnsObjects := True;
  fFolderView.Text := 'Test';
  aTreeView.AddObject(fFolderView);
  for I := Integer(Low(TGridOption)) to Integer(High(TGridOption)) do
  begin
    Item := TTreeViewItem.Create(nil);
    Item.Text := GetEnumName(TypeInfo(TGridOption), I);
    fFolderView.AddObject(Item);
    fViewItems.Add(Item);
  end;

  fFolderView.Expand;
  UpdateTreeView;
end;

destructor TFolderTree.Destroy;
begin
  FreeAndNil(fViewItems);
  FreeAndNil(fFolderView);
end;

procedure TFolderTree.UpdateTreeView;
var
  S: string;
  I: Integer;
begin
  if not FTreeUpdating then
  begin
    FTreeUpdating := True;
    try
      for I := 0 to fFolderView.Count - 1 do
      begin
        S := fFolderView.Items[I].Text;
        fFolderView.Items[I].Enabled := True;
        fFolderView.Items[I].IsChecked := True;
      end;
      fFolderView.IsChecked := False;
    finally
      FTreeUpdating := False;
    end;
  end;
end;

end.
