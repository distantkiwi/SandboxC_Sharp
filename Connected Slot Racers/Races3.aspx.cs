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

public partial class Races3 : Page
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
       // loadData.doIt(this.Request.PhysicalApplicationPath);
        Countdown();
    }
    
    protected void Countdown()
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {


    }

}

