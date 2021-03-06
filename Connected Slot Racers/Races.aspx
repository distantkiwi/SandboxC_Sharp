﻿<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Races.aspx.cs" Inherits="Races" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <table style="table-layout: fixed; vertical-align: middle">
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="http://route1racing.com/"><img style="width:200px; height:70px" src="images/route1racing_branding_v01.png"  /></asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="http://www.scorpiuswireless.com/"><img style="width:300px; height:70px" src="images/web%20banner_2606011.gif"  /></asp:HyperLink>
            </td>
            <td rowspan="3"><iframe width="640" height="240" src="http://widget.mibbit.com/?settings=486c1a654ca030288365249098e23847&server=Rizon.Mibbit.org&channel=%23slotheads"></iframe></td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="http://www.scalextric-shop.dk"><img style="width:300px; height:70px" src="images/Scalextric-shop%20medium.jpg" /></asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="http://www.slotcar.co.nz"><img style="width:300px; height:70px" src="images/Slotcar%20logo%20for%20Race.jpg" /></asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://rcs64.com/"><img src="images/rcs-logo-250-header.jpg" style="width:400px; height:100px" /></asp:HyperLink>
            </td>
            <td>
                <img src="images/rcs-logo-250-description.jpg" style="width: 200px; height: 100px" />

            </td>
        </tr>
    </table>
    <br />
    <asp:UpdatePanel ID="UpdatePanel5" runat="server" EnableViewState="False" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Timer ID="Timer2" runat="server" Interval="10000" ></asp:Timer>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsEvents" DataTextField="Name" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="False" UpdateMode="Conditional"><ContentTemplate><asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
            <table>
                <tr>
                    <td style="width: 350px">
                        <h2><a href="ISC64_rules 2015 rev 5.pdf">ISC64 rules 2015 rev 5</a></h2>
                    </td>
                    <td>
                        <h2></h2>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td>
                        <h3>Race</h3>
                        <asp:GridView ID="GridView3" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource4" AutoGenerateColumns="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                                <asp:BoundField DataField="Position" HeaderText="Position" ReadOnly="True" SortExpression="Position" />
                                <asp:BoundField DataField="Track Name" HeaderText="Location" SortExpression="Track Name" />
                                <asp:BoundField DataField="Driver Name" HeaderText="Team" SortExpression="Driver Name" />
                                <asp:BoundField DataField="Car Name" HeaderText="Car Name" SortExpression="Car Name" />
                                <asp:BoundField DataField="Lap Count" HeaderText="Lap Count" SortExpression="Lap Count" />
                                <asp:BoundField DataField="Fastest Lap" HeaderText="Fastest Lap" SortExpression="Fastest Lap" />
                                <asp:BoundField DataField="Average Lap" HeaderText="Average Lap" ReadOnly="True" SortExpression="Average Lap" DataFormatString="{0:0.000}"></asp:BoundField>
                                <asp:BoundField DataField="Pit Stops" HeaderText="Pit Stops" SortExpression="Pit Stops" />
                                <asp:BoundField DataField="RemainingLaps" HeaderText="Remaining Laps" SortExpression="RemainingLaps" ReadOnly="True" />

                                <asp:BoundField DataField="RemainingTime" HeaderText="Remaining Time" SortExpression="RemainingTime"></asp:BoundField>

                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        </asp:UpdatePanel>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSDISCConnectionString %>" SelectCommand="
                                            select 
		                                        case 
				                                        when remainingTime is null 
					                                        then RANK ( ) OVER ( partition by [Event Name] order by [Lap Count] desc, [Fastest Lap])
				                                        else
					                                        RANK ( ) OVER ( partition by [Event Name] order by [Average Lap], [Fastest Lap])
		                                        end
                                                as Position, 
                                                * 
                                            from  
                                                RaceResults( @eventName,'Race')
                                            order by 
                                                Position">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="eventName" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>Qualifying</h3>
                        <asp:GridView ID="GridView2" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource3" AutoGenerateColumns="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                                <asp:BoundField DataField="Position" HeaderText="Position" ReadOnly="True" SortExpression="Position" />
                                <asp:BoundField DataField="Track Name" HeaderText="Location" SortExpression="Track Name" />
                                <asp:BoundField DataField="Driver Name" HeaderText="Team" SortExpression="Driver Name" />
                                <asp:BoundField DataField="Car Name" HeaderText="Car Name" SortExpression="Car Name" />
                                <asp:BoundField DataField="Lap Count" HeaderText="Lap Count" SortExpression="Lap Count" />
                                <asp:BoundField DataField="Fastest Lap" HeaderText="Fastest Lap" SortExpression="Fastest Lap" />
                                <asp:BoundField DataField="Average Lap" HeaderText="Average Lap" ReadOnly="True" SortExpression="Average Lap" DataFormatString="{0:0.000}"></asp:BoundField>
                                <asp:BoundField DataField="Pit Stops" HeaderText="Pit Stops" SortExpression="Pit Stops" />
                                <asp:BoundField DataField="RemainingLaps" HeaderText="Remaining Laps" SortExpression="RemainingLaps" ReadOnly="True" />


                                <asp:BoundField DataField="RemainingTime" HeaderText="Remaining Time" SortExpression="RemainingTime"></asp:BoundField>


                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        </asp:UpdatePanel>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSDISCConnectionString %>" SelectCommand="
                                            select
					                                        RANK ( ) OVER ( partition by [Event Name] order by [Fastest Lap])
                                                as Position, 
                                                * 
                                            from  
                                                RaceResults( @eventName,'Qualify')
                                            order by 
                                                Position">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="eventName" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                                                <h3>Practice</h3>
                        <asp:GridView ID="GridView1" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="sdsRaceUploads" AutoGenerateColumns="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Position" HeaderText="Position" ReadOnly="True" SortExpression="Position" />
                                <asp:BoundField DataField="Track Name" HeaderText="Location" SortExpression="Track Name" />
                                <asp:BoundField DataField="Driver Name" HeaderText="Team" SortExpression="Driver Name" />
                                <asp:BoundField DataField="Car Name" HeaderText="Car Name" SortExpression="Car Name" />
                                <asp:BoundField DataField="Lap Count" HeaderText="Lap Count" SortExpression="Lap Count" />
                                <asp:BoundField DataField="Fastest Lap" HeaderText="Fastest Lap" SortExpression="Fastest Lap" />
                                <asp:BoundField DataField="Average Lap" HeaderText="Average Lap" SortExpression="Average Lap" ReadOnly="True" DataFormatString="{0:0.000}" />
                                <asp:BoundField DataField="Pit Stops" HeaderText="Pit Stops" SortExpression="Pit Stops" />
                                <asp:BoundField DataField="RemainingLaps" HeaderText="RemainingLaps" ReadOnly="True" SortExpression="RemainingLaps"></asp:BoundField>
                                <asp:BoundField DataField="RemainingTime" HeaderText="RemainingTime" SortExpression="RemainingTime"></asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        </asp:UpdatePanel>
                        <asp:SqlDataSource ID="sdsRaceUploads" runat="server" ConnectionString="<%$ ConnectionStrings:SSDISCConnectionString %>" SelectCommand="
                                            select
					                                        RANK ( ) OVER ( partition by [Event Name] order by  [Fastest Lap])
                                                as Position, 
                                                * 
                                            from  
                                                RaceResults( @eventName,'Practice')
                                            order by 
                                                Position" >
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="eventName" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="sdsEvents" runat="server" ConnectionString="<%$ ConnectionStrings:SSDISCConnectionString %>" SelectCommand="SELECT distinct [Event Name] as [Name] FROM [RaceUploads]"></asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />

</asp:Content>
