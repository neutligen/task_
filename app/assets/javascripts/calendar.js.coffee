$(document).ready ->
  $('#calendar').fullCalendar
    editable: true,
    header:
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    defaultView: 'month',
    slotMinutes: 30,
    timeFormat: 'H:mm',
    
    events:[{title:"Event1", start:"2016-03-15"}]
    
    viewRender: (view, element) -> 
      $.ajax({
        url: "https://task-management-shionhonda1215.c9users.io/calendar/1",
        dataType: 'json',
        type:"get",
        
        success: (EventSource) ->
          $('#calendar').fullCalendar('removeEvents');
          $('#calendar').fullCalendar('addEventSource', EventSource);
      });