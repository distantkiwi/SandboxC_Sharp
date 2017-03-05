using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Xml.Linq;
using System.Xml;
using System.Xml.Xsl;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;

public partial class Races2 : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            UpdateFiles();
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        UpdateFiles();
    }

    private void UpdateFiles()
    {
        //loadData.doIt(this.Request.PhysicalApplicationPath);
        Countdown();
    }
    
    protected void Countdown()
    {
        DateTime Current = DateTime.UtcNow;
        DateTime Event = DateTime.Parse("14 March 2015 20:00:00");
        TimeSpan remaining = Event - Current;

        if(remaining.Days > 0)
            lblCountdown.Text = String.Format("{0} Days {1:00} Hours {2:00} Minutes {3:00} Seconds", remaining.Days, remaining.Hours, remaining.Minutes, remaining.Seconds);
        else if (remaining.Hours > 0)
            lblCountdown.Text = String.Format("{1:00} Hours {2:00} Minutes {3:00} Seconds", remaining.Days, remaining.Hours, remaining.Minutes, remaining.Seconds);
        else if (remaining.Minutes > 0)
            lblCountdown.Text = String.Format("{2:00} Minutes {3:00} Seconds", remaining.Days, remaining.Hours, remaining.Minutes, remaining.Seconds);
        else
            lblCountdown.Text = String.Format("{3:00} Seconds", remaining.Days, remaining.Hours, remaining.Minutes, remaining.Seconds);
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource3.DataBind();
        SqlDataSource4.DataBind();
        sdsRaceUploads.DataBind();

    }

}
