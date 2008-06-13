
var tl;
function onLoad() {
  var eventSource = new Timeline.DefaultEventSource();
  var bandInfos = [

	Timeline.createBandInfo({
	        eventSource:    eventSource,
	        date:           "Jun 28 2008 00:00:00 GMT",
	        width:          "70%", 
	        intervalUnit:   Timeline.DateTime.MONTH, 
	        intervalPixels: 100
	}),
	Timeline.createBandInfo({
			eventSource:    eventSource,
			date:           "Jun 28 2008 00:00:00 GMT",
			width:          "30%", 
			intervalUnit:   Timeline.DateTime.YEAR, 
			intervalPixels: 200,
			showEventText:  false,
	     	trackHeight:    0.5,
	        trackGap:       0.2,
	}),
  ];
	bandInfos[1].syncWith = 0;
	bandInfos[1].highlight = true;
 	bandInfos[1].eventPainter.setLayout(bandInfos[0].eventPainter.getLayout());
  	tl = Timeline.create(document.getElementById("uca_timeline"), bandInfos);
    tl.loadXML("http://localhost:3000/study_cases/1/timeline.xml", function(xml, url) { eventSource.loadXML(xml, url); });
	//tl.loadJSON("/events/timeline.xml", function(json, url) { eventSource.loadJSON(json, url); });

}

var resizeTimerID = null;
function onResize() {
    if (resizeTimerID == null) {
        resizeTimerID = window.setTimeout(function() {
            resizeTimerID = null;
            tl.layout();
        }, 500);
    }
}