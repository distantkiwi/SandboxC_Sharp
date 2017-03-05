<%@ Page Title="Connected Slot Racers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Connected Slot Racers</h1>
        <p class="lead">Connected Slot Racers is where you can race against others in seperated locations.&nbsp; With the aid of
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://rcs64.com/">RCS64</asp:HyperLink>, race information can be automatically uploaded here for all participants to see in real(ish) time.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Races</h2>
            <p>
                This is where you can watch the races unfolding, there are 3 types of races public, members and private.  Anyone can watch races that are public without registering on the site, members can watch public and member only races, and only members invited to a race can watch private races.  All races will be listed with an indication of the type.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/Races">Take me there &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Calendar</h2>
            <p>
                This is where you can see the calendar of races.  You can view the results of previous races or get information on upcoming races.  If you are a member this is the place to request to join a race.
            </p>
            <p>
                <a class="btn btn-default" visible="false" runat="server" href="~/Calendar">Take me there &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Create</h2>
            <p>
                If you are a member you can create a race for others to join.  This is where you set the event name, the start time, a picture of the track layout, a rules document and a place to invite participants.
            </p>
            <p>
                <a class="btn btn-default"  visible="false" runat="server" href="~/Create">Take me there &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
