function Run(json)
{
  console.log(json);
    google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable(json);

        var options = {
          title: 'Number of Students per Department'
        };
        
        var chart = new google.visualization.PieChart(document.getElementById('controlAddIn'));
        chart.draw(data, options);
      }
}
