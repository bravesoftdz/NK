�
 TFBAIXAPEDIDO2 0:  TPF0TfBaixaPedido2fBaixaPedido2LeftTopBorderIconsbiSystemMenu BorderStylebsSingleCaptionBaixa de PedidosClientHeight
ClientWidthColor�ʦ Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TPanelPanel1Left Top WidthHeight"AlignalTopTabOrder  TBitBtnBitBtn2Left�TopWidthYHeightHintFecha a janela atualCaption&FecharFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontParentShowHintShowHint	TabOrder OnClickBitBtn2Click
Glyph.Data
�   �   BM�       v   (               �   �  �               �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 88888������`8    8f 3330�f3330 f33 03f33 3f  �3���f  `3f33 3f33 03f333030�3330333330   33333333  TBitBtnBitBtn1Left�TopWidth� HeightCaptionAtualiza ConsultaFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrderOnClickBitBtn1Click
Glyph.Data
j  f  BMf      v   (               �                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwwwww  wwwwx���ww  wwwp  8�ww  www��0��w  www��0��w  wwp��3�w  wwp��3�w  wwp  3�w  wwww�33�w  wwwp 33�w  www�33�w  wwp��3�w  ww���3�w  wp�����w  wp �� �w  wwp��3ww  www��0�ww  www��0www  wwwp  7www  wwwwwwwwww     	TSMDBGrid	SMDBGrid1Left Top"WidthHeight�AlignalClient
DataSource	dsqPedidoOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit ReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickSMDBGrid1DblClickFlatBandsFont.CharsetDEFAULT_CHARSETBandsFont.ColorclWindowTextBandsFont.Height�BandsFont.NameMS Sans SerifBandsFont.Style 	Groupings GridStyle.StylegsCustomGridStyle.OddColorclWindowGridStyle.EvenColorclWindowTitleHeight.PixelCountFooterColor	clBtnFace	ExOptionseoENTERlikeTABeoKeepSelectioneoStandardPopupeoBLOBEditoreoTitleWordWrapeoShowFilterBar RegistryKeySoftware\ScalabiumRegistrySectionSMDBGridWidthOfIndicatorDefaultRowHeight
ScrollBarsssHorizontalColCountRowCountColumns	AlignmenttaCenterExpanded	FieldNamePedidoTitle.AlignmenttaCenterTitle.CaptionPedido InternoWidth-Visible	 	AlignmenttaCenterExpanded	FieldNamePedidoClienteTitle.AlignmenttaCenterTitle.CaptionPedido ClienteWidth<Visible	 	AlignmenttaCenterExpanded	FieldName	DtEmissaoTitle.AlignmenttaCenterTitle.Caption   Data EmissãoWidthBVisible	 Expanded	FieldNameNomeClienteTitle.AlignmenttaCenterTitle.CaptionNome ClienteWidth� Visible	 	AlignmenttaCenterExpanded	FieldName
CodProdutoTitle.AlignmenttaCenterTitle.Caption   Cód. ProdutoWidth*Visible	 	AlignmenttaCenterExpanded	FieldName
ReferenciaTitle.AlignmenttaCenterTitle.Caption   ReferênciaWidthPVisible	 	AlignmenttaCenterExpanded	FieldNameQtdParesTitle.AlignmenttaCenterTitle.CaptionQtde.Width,Visible	 	AlignmenttaCenterExpanded	FieldNameQtdParesFatTitle.AlignmenttaCenterTitle.Caption	Qtd. Fat.Width'Visible	 	AlignmenttaCenterExpanded	FieldNameQtdParesRestTitle.AlignmenttaCenterTitle.Caption
Qtd. Pend.Width*Visible	 Expanded	FieldNameNomeProdutoTitle.AlignmenttaCenterTitle.CaptionNome ProdutoVisible	 	AlignmenttaCenterExpanded	FieldNameItemTitle.AlignmenttaCenterWidth"Visible	 Expanded	FieldNamePrecoTitle.AlignmenttaCenterTitle.Caption   Vlr. UnitárioVisible	 Expanded	FieldNameVlrTotalTitle.AlignmenttaCenterTitle.Caption
Vlr. TotalVisible	 Expanded	FieldName
DtEmbarqueTitle.AlignmenttaCenterTitle.CaptionData EmbarqueVisible	 	AlignmenttaCenterExpanded	FieldNameNumOSTitle.AlignmenttaCenterTitle.Caption   Nº OSVisible	 	AlignmenttaCenterExpanded	FieldName
CodClienteTitle.AlignmenttaCenterTitle.Caption   Cód. ClienteVisible	    TStaticTextStaticText1Left Top�WidthHeightAlignalBottomBorderStyle	sbsSunkenCaption'Duplo clique para baixar item do pedidoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold ParentColor
ParentFontTabOrder  TQueryqPedidoActive	DatabaseNameTabelasSQL.Stringsu  SELECT Dbpedido.Pedido, Dbpedido.DtEmissao, Dbpedidoitem.Item, Dbpedido.CodCliente, Dbpedidoitem.CodProduto, Dbcliente.Nome NomeCliente, Dbproduto.Referencia, Dbpedidoitem.QtdPares, Dbproduto.Nome NomeProduto, Dbpedidoitem.QtdParesFat, Dbpedidoitem.QtdParesRest, Dbpedidoitem.Preco, Dbpedidoitem.VlrTotal, Dbpedidoitem.DtEmbarque, Dbpedidoitem.NumOS, Dbpedido.PedidoClienteFROM "dbPedido.DB" Dbpedido,   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem0   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)  &   INNER JOIN "dbCliente.DB" Dbcliente1   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)  &   INNER JOIN "dbProduto.DB" Dbproduto5   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)  HWHERE  (Dbpedidoitem.QtdParesRest > 0 ) and (dbPedido.Cancelado = False)+ORDER BY dbPedido.Pedido, dbPedidoItem.Item Left�Top  TIntegerFieldqPedidoPedido	FieldNamePedido  
TDateFieldqPedidoDtEmissao	FieldName	DtEmissao  TIntegerFieldqPedidoItem	FieldNameItem  TIntegerFieldqPedidoCodCliente	FieldName
CodCliente  TIntegerFieldqPedidoCodProduto	FieldName
CodProduto  TStringFieldqPedidoNomeCliente	FieldNameNomeClienteSize(  TStringFieldqPedidoReferencia	FieldName
Referencia  TFloatFieldqPedidoQtdPares	FieldNameQtdPares  TStringFieldqPedidoNomeProduto	FieldNameNomeProdutoSize(  TFloatFieldqPedidoQtdParesFat	FieldNameQtdParesFat  TFloatFieldqPedidoQtdParesRest	FieldNameQtdParesRest  TFloatFieldqPedidoPreco	FieldNamePreco  TFloatFieldqPedidoVlrTotal	FieldNameVlrTotal  
TDateFieldqPedidoDtEmbarque	FieldName
DtEmbarque  TStringFieldqPedidoNumOS	FieldNameNumOSSize  TStringFieldqPedidoPedidoCliente	FieldNamePedidoCliente   TDataSource	dsqPedidoDataSetqPedidoLeft�Top    