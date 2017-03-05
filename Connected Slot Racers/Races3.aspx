<%@ Page Title="Races" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Races3.aspx.cs" Inherits="Races3" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <table style="table-layout: fixed; vertical-align: middle">
        <tr>
            <td valign="top">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="http://route1racing.com/"><img style="width:200px; height:70px" src="images/route1racing_branding_v01.png"  /></asp:HyperLink>
		<br>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="http://www.scorpiuswireless.com/"><img style="width:200px; height:70px" src="images/web%20banner_2606011.gif"  /></asp:HyperLink>
		<br>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="http://www.scalextric-shop.dk"><img style="width:200px; height:70px" src="images/Scalextric-shop%20medium.jpg" /></asp:HyperLink>
		<br>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="http://www.slotcar.co.nz"><img style="width:200px; height:70px" src="images/Slotcar%20logo%20for%20Race.jpg" /></asp:HyperLink>
		<br>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://rcs64.com/"><img src="images/rcs-logo-250-header.jpg" style="width:200px; height:100px" /></asp:HyperLink>
		<br>
                <img src="images/rcs-logo-250-description.jpg" style="width: 200px; height: 100px" />
            </td>

	    <td valign="top">
		<iframe width="800" height="2000" src="results.aspx"></iframe>
	    </td>

            <td valign="top">
		<iframe width="640" height="480" src="http://widget.mibbit.com/?settings=486c1a654ca030288365249098e23847&server=Rizon.Mibbit.org&channel=%23slotheads"></iframe>
	    </td>
        </tr>
    </table>
    <br />


</asp:Content>
