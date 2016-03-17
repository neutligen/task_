$ ->
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today myCustomButton',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      # カレンダーのどこかをクリックしたらイベントを作る
      # dayClick: -> (date, allDay, jsEvent, view) {
        # $('#calendar').fullCalendar('addEventSource', [{title: '無題', start: date, allDay: true }])
      # }
    })