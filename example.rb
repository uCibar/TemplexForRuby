require "./templex"

view = Templex.new

view.window(width: 80, height:30, format:[1,100])
view.line(text:"#-#", margin:10, format:[31])
