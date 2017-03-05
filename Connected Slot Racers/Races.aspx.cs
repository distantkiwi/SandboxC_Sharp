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

public partial class Races : Page
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
        loadData.doIt(this.Request.PhysicalApplicationPath);
        Countdown();
    }
    
    protected void Countdown()
    {
        //DateTime Current = DateTime.UtcNow;
        //DateTime Event = DateTime.Parse("14 March 2015 20:00:00");
        //TimeSpan remaining = Event - Current;

        //if(remaining.Days > 0)
        //    lblCountdown.Text = String.Format("{0} Days {1:00} Hours {2:00} Minutes {3:00} Seconds", remaining.Days, remaining.Hours, remaining.Minutes, remaining.Seconds);
        //else if (remaining.Hours > 0)
        //    lblCountdown.Text = String.Format("{1:00} Hours {2:00} Minutes {3:00} Seconds", remaining.Days, remaining.Hours, remaining.Minutes, remaining.Seconds);
        //else if (remaining.Minutes > 0)
        //    lblCountdown.Text = String.Format("{2:00} Minutes {3:00} Seconds", remaining.Days, remaining.Hours, remaining.Minutes, remaining.Seconds);
        //else
        //    lblCountdown.Text = String.Format("{3:00} Seconds", remaining.Days, remaining.Hours, remaining.Minutes, remaining.Seconds);
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource3.DataBind();
        SqlDataSource4.DataBind();
        sdsRaceUploads.DataBind();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}

public static class loadData
{
    static DateTime lastrun = DateTime.Now;
    internal static void doIt(string sFrom)
    {
        if(lastrun.AddSeconds(5) < DateTime.Now  )
        {
            lastrun = DateTime.Now;
            new Thread(() =>
            {
                Thread.CurrentThread.IsBackground = true;
                /* run your code here */
                ProcessFiles( sFrom);
            }).Start();
        }
        
    }

    static private void ProcessFiles(string sFrom)
    {
        string sql = "";
        
        try
        {

            XslCompiledTransform myXslFirstTrans = new XslCompiledTransform();
            myXslFirstTrans.Load(sFrom + "First.xsl");
            XslCompiledTransform myXslSecondTrans = new XslCompiledTransform();
            myXslSecondTrans.Load(sFrom + "Second.xsl");

            foreach (String sFile in Directory.GetFiles(sFrom + "RaceUploads", "*.xml"))
            {
                string myFile = File.ReadAllText(sFile).Replace(" xmlns=\"http://www.ni.com/LVData\"", "");
                File.Move(sFile, sFile.Replace("RaceUploads\\", "RaceUploads\\Backup\\"));
                XDocument myDoc = XDocument.Parse(myFile, LoadOptions.None);

                XDocument newTree = new XDocument();
                using (XmlWriter writer = newTree.CreateWriter())
                {

                    // Execute the transform and output the results to a writer.
                    myXslFirstTrans.Transform(myDoc.CreateReader(), writer);
                }

                myDoc = new XDocument();
                using (XmlWriter writer = myDoc.CreateWriter())
                {

                    // Execute the transform and output the results to a writer.
                    myXslSecondTrans.Transform(newTree.CreateReader(), writer);
                }

                StringReader theReader = new StringReader(myDoc.ToString());
                DataSet theDataSet = new DataSet();
                theDataSet.ReadXml(theReader);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSDISCConnectionString"].ConnectionString);


                sql = "insert into RaceUploads values ";
                DataRow myRow = theDataSet.Tables[0].Rows[0];

                sql += "(";
                sql += "'" + myRow["Event_name"].ToString() + "',"; //[Event Name]
                sql += "'" + myRow["Track_name"].ToString() + "',"; //[Track Name]
                sql += "'" + myRow["Driver"].ToString() + "',";//[Driver Name]
                sql += "'" + myRow["Car"].ToString() + "',";//[Car Name]
                sql += myRow["Laps"].ToString() + ",";//[Lap Count]
                sql += (int.Parse(myRow["Best_lap"].ToString()) / 1000.0).ToString("0.000", CultureInfo.InvariantCulture) + ",";//[Fastest Lap]
                
                sql += "'";//[Race Type]
                if (myRow["Race_type"].ToString().ToUpper() == "GP" || myRow["Race_type"].ToString().ToUpper() == "ENDURANCE")
                    sql += "Race";
                else
                    sql += myRow["Race_type"].ToString();
                sql += "',";

                sql += "'" + myRow["Race_status"].ToString() + "',";//[Race Status]
                sql += "'" + myRow["Race_Time"].ToString() + "',";//[Elapsed]
                sql += "'" + DateTime.Now.ToString("dd MMM yyyy hh:mm:ss") + "',";//[DateAdded]
                sql += myRow["Pit_stops"].ToString() + ",";//[Pit Stops]
                sql += (int.Parse(myRow["Last_laptime"].ToString()) / 1000.0).ToString("0.000", CultureInfo.InvariantCulture);//[Last_laptime]
                sql += ")";

                con.Open();
                SqlCommand com = new SqlCommand(sql, con);



                SqlCommand cmd=new SqlCommand("INSERT INTO insert into RaceUploads values (@EventName, @TrackName, @DriverName, @CarName, @LapCount, @FastestLap, @RaceType, @RaceStatus, @Elapsed, @DateAdded, @PitStops, @LastLapTime)",con);
cmd.Parameters.Add("@first",SqlDbType.NVarChar).Value = txtfirst.Text;
cmd.Parameters.Add("@last",SqlDbType.NVarChar).Value = txtlast.Text;
cmd.Parameters.Add("@email",SqlDbType.NVarChar).Value = txtemail.Text;
cmd.Parameters.Add("@pass",SqlDbType.NVarChar).Value = txtpass.Text;
cmd.Parameters.Add("@type",SqlDbType.NVarChar).Value = "customer";
cmd.ExecuteNonQuery();

                com.ExecuteNonQuery();
                con.Close();
            }
        }
        catch (Exception ex)
        {
            ex = ex;
        }

    }



}