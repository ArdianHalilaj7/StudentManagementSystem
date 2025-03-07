controladdin GoogleChart
{
    StartupScript = 'Charts/Startup.js';
    Scripts = 'Charts/Script.js', 'https://www.gstatic.com/charts/loader.js';
    HorizontalStretch = true;
    VerticalStretch = true;

    event ControlReady(); 
    procedure Run(Data: JsonArray);
}