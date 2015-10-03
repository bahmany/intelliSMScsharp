<%@ Control Language="C#" AutoEventWireup="true" CodeFile="frm_OpinionStatics.ascx.cs" Inherits="ascx_frm_OpinionStatics" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="Telerik.Charting" namespace="Telerik.Charting" tagprefix="telerik" %>
<div style="font-family: tahoma; font-size: 12px" dir="rtl">
    <table width="100%">
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            از تاریخ</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Width="58px"></asp:TextBox>
                        </td>
                        <td>
                            تا تاریخ</td>
                        <td style="margin-right: 40px">
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" Width="58px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">تائید</asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <br />
                آمار نظرات دریافتی :<br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataSourceID="ObjectDataSource1" Width="100%">
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <Columns>
                        <asp:BoundField DataField="0" HeaderText="0" SortExpression="0" />
                        <asp:BoundField DataField="1" HeaderText="1" SortExpression="1" />
                        <asp:BoundField DataField="2" HeaderText="2" SortExpression="2" />
                        <asp:BoundField DataField="3" HeaderText="3" SortExpression="3" />
                        <asp:BoundField DataField="4" HeaderText="4" SortExpression="4" />
                        <asp:BoundField DataField="5" HeaderText="5" SortExpression="5" />
                        <asp:BoundField DataField="6" HeaderText="6" SortExpression="6" />
                        <asp:BoundField DataField="7" HeaderText="7" SortExpression="7" />
                        <asp:BoundField DataField="8" HeaderText="8" SortExpression="8" />
                        <asp:BoundField DataField="9" HeaderText="9" SortExpression="9" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <br />
                <telerik:RadChart ID="RadChart1" runat="server" CssClass="RadChart" 
                    DataSourceID="ObjectDataSource1" Height="500px" Skin="Black" Width="700px">
                    <Series>
<telerik:ChartSeries Name="0" DataYColumn="0">
    <Appearance>
        <FillStyle FillType="ComplexGradient" MainColor="222, 202, 155">
            <FillSettings>
                <ComplexGradient>
                    <telerik:GradientElement Color="222, 202, 152" />
                    <telerik:GradientElement Color="211, 185, 123" Position="0.5" />
                    <telerik:GradientElement Color="183, 154, 84" Position="1" />
                </ComplexGradient>
            </FillSettings>
        </FillStyle>
        <TextAppearance TextProperties-Color="159, 159, 159">
        </TextAppearance>
        <Border Color="187, 149, 58" />
    </Appearance>
                        </telerik:ChartSeries>
<telerik:ChartSeries Name="1" DataYColumn="1">
    <Appearance>
        <FillStyle FillType="ComplexGradient" MainColor="172, 208, 217">
            <FillSettings>
                <ComplexGradient>
                    <telerik:GradientElement Color="172, 208, 217" />
                    <telerik:GradientElement Color="149, 193, 204" Position="0.5" />
                    <telerik:GradientElement Color="114, 162, 175" Position="1" />
                </ComplexGradient>
            </FillSettings>
        </FillStyle>
        <TextAppearance TextProperties-Color="159, 159, 159">
        </TextAppearance>
        <Border Color="129, 180, 193" />
    </Appearance>
                        </telerik:ChartSeries>
                        <telerik:ChartSeries DataYColumn="2" Name="2">
                            <Appearance>
                                <FillStyle FillType="ComplexGradient" MainColor="185, 208, 152">
                                    <FillSettings>
                                        <ComplexGradient>
                                            <telerik:GradientElement Color="185, 208, 152" />
                                            <telerik:GradientElement Color="164, 194, 122" Position="0.5" />
                                            <telerik:GradientElement Color="131, 166, 80" Position="1" />
                                        </ComplexGradient>
                                    </FillSettings>
                                </FillStyle>
                                <TextAppearance TextProperties-Color="159, 159, 159">
                                </TextAppearance>
                                <Border Color="123, 154, 69" />
                            </Appearance>
                        </telerik:ChartSeries>
                        <telerik:ChartSeries DataYColumn="3" Name="3">
                            <Appearance>
                                <FillStyle FillType="ComplexGradient" MainColor="187, 174, 165">
                                    <FillSettings>
                                        <ComplexGradient>
                                            <telerik:GradientElement Color="187, 174, 165" />
                                            <telerik:GradientElement Color="163, 146, 135" Position="0.5" />
                                            <telerik:GradientElement Color="134, 115, 103" Position="1" />
                                        </ComplexGradient>
                                    </FillSettings>
                                </FillStyle>
                                <TextAppearance TextProperties-Color="159, 159, 159">
                                </TextAppearance>
                                <Border Color="136, 119, 102" />
                            </Appearance>
                        </telerik:ChartSeries>
                        <telerik:ChartSeries DataYColumn="4" Name="4">
                            <Appearance>
                                <FillStyle FillType="ComplexGradient" MainColor="192, 161, 188">
                                    <FillSettings>
                                        <ComplexGradient>
                                            <telerik:GradientElement Color="192, 161, 188" />
                                            <telerik:GradientElement Color="174, 136, 169" Position="0.5" />
                                            <telerik:GradientElement Color="154, 108, 149" Position="1" />
                                        </ComplexGradient>
                                    </FillSettings>
                                </FillStyle>
                                <TextAppearance TextProperties-Color="159, 159, 159">
                                </TextAppearance>
                                <Border Color="123, 80, 125" />
                            </Appearance>
                        </telerik:ChartSeries>
                        <telerik:ChartSeries DataYColumn="5" Name="5">
                            <Appearance>
                                <FillStyle FillType="ComplexGradient" MainColor="149, 179, 179">
                                    <FillSettings>
                                        <ComplexGradient>
                                            <telerik:GradientElement Color="149, 179, 179" />
                                            <telerik:GradientElement Color="117, 155, 155" Position="0.5" />
                                            <telerik:GradientElement Color="96, 134, 134" Position="1" />
                                        </ComplexGradient>
                                    </FillSettings>
                                </FillStyle>
                                <TextAppearance TextProperties-Color="159, 159, 159">
                                </TextAppearance>
                                <Border Color="96, 134, 134" />
                            </Appearance>
                        </telerik:ChartSeries>
                        <telerik:ChartSeries DataYColumn="6" Name="6">
                        </telerik:ChartSeries>
                        <telerik:ChartSeries DataYColumn="7" Name="7">
                        </telerik:ChartSeries>
                        <telerik:ChartSeries DataYColumn="8" Name="8">
                        </telerik:ChartSeries>
                        <telerik:ChartSeries DataYColumn="9" Name="9">
                        </telerik:ChartSeries>
</Series>
                    <PlotArea>
                        <XAxis>
                            <Appearance Color="62, 62, 62" MajorTick-Color="48, 48, 48">
                                <MajorGridLines Color="77, 77, 77" />
                                <TextAppearance TextProperties-Color="159, 159, 159">
                                </TextAppearance>
                            </Appearance>
                            <AxisLabel>
                                <TextBlock>
                                    <Appearance TextProperties-Color="159, 159, 159">
                                    </Appearance>
                                </TextBlock>
                            </AxisLabel>
                        </XAxis>
                        <YAxis>
                            <Appearance Color="62, 62, 62" MajorTick-Color="48, 48, 48" 
                                MinorTick-Color="48, 48, 48">
                                <MajorGridLines Color="77, 77, 77" />
                                <MinorGridLines Color="77, 77, 77" />
                                <TextAppearance TextProperties-Color="159, 159, 159">
                                </TextAppearance>
                            </Appearance>
                            <AxisLabel>
                                <TextBlock>
                                    <Appearance TextProperties-Color="159, 159, 159">
                                    </Appearance>
                                </TextBlock>
                            </AxisLabel>
                        </YAxis>
                        <Appearance Dimensions-Margins="18%, 100px, 12%, 8%">
                            <FillStyle FillType="Solid" MainColor="51, 51, 51">
                            </FillStyle>
                            <Border Color="62, 62, 62" />
                        </Appearance>
                    </PlotArea>
                    <Appearance>
                        <FillStyle MainColor="25, 25, 25">
                        </FillStyle>
                        <Border Color="5, 5, 5" />
                    </Appearance>
                    <ChartTitle>
                        <Appearance Dimensions-Margins="3%, 10px, 14px, 6%">
                            <FillStyle MainColor="Transparent">
                            </FillStyle>
                            <Border Color="Transparent" />
                        </Appearance>
                        <TextBlock>
                            <Appearance TextProperties-Color="White" TextProperties-Font="Arial, 18pt">
                            </Appearance>
                        </TextBlock>
                    </ChartTitle>
                    <Legend>
                        <Appearance Dimensions-Margins="1px, 2%, 9%, 1px" 
                            Position-AlignedPosition="BottomRight">
                            <ItemTextAppearance TextProperties-Color="159, 159, 159" 
                                TextProperties-Font="Arial, 10pt">
                            </ItemTextAppearance>
                            <FillStyle MainColor="Transparent">
                            </FillStyle>
                            <Border Color="Transparent" />
                        </Appearance>
                    </Legend>
                </telerik:RadChart>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="MainDataModuleTableAdapters.func_GetOpenionStaticsTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="OwnerID" SessionField="owner" 
                            Type="Int32" />
                        <asp:Parameter DefaultValue="2001/01/01 12:22:22" Name="StartDate" 
                            Type="DateTime" />
                        <asp:Parameter DefaultValue="2012/01/01 12:22:22" Name="EndDate" 
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</div>