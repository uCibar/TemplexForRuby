require "./templex"

view = Templex.new

view.window(width: 80, height:30, format:[1,100])
view.line(text:"#-#", margin:10, format:[31])
view.newLine
view.title(text:"My Awesome Terminal Application", center:true, format:[32])
view.newLine
view.line(text:"#-#", margin:10, format:[31])
