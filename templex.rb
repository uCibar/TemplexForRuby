class Templex

  def window(**values)

    @window_width  = (values.include? :width) ? values[:width].to_i : 80
    @window_height = (values.include? :height) ? values[:height].to_i : 30

    if( values[:format].is_a? Array )

      @window_format = ""

      values[:format].each do |value|
        @window_format +="\e[#{value}m"
      end

    end

    print "\e[8;#{@window_height};#{@window_width}t"
    print @window_format
    clear

  end

  def line(**values)

    margin = (values.include? :margin) ? values[:margin].to_i : 0
    center = getCenter(margin:margin, size:values[:text].size)

    draw(text:values[:text], width:center, margin:margin, format:values[:format])
    newLine
  end

  def title(**values)

    center = (values[:center] == true) ? true : false

    if(center)
      margin = getCenter(size:values[:text].size)
      new_line = true
    else
      margin = (values.include? :margin) ? values[:margin].to_i : 0
    end

    draw(text:values[:text], width:1, margin:margin, format:values[:format])
    newLine if new_line == true
  end

  def draw(**values)

    margin = (values.include? :margin) ? values[:margin].to_i : 0

    setMargin(margin)
    setFormat(values[:format])
    values[:width].times {print values[:text]}

    reset
  end

  def newLine
    print "\n"
  end

  def clear
    print `clear`
  end

  private

  def getCenter(**values)
    if(values.include? :margin)
      centered = (@window_width -2*values[:margin])/values[:size]
    else
      centered = (@window_width-values[:size])/2
    end
  end

  def setMargin(value)
    value.times{print " "}
  end

  def setFormat(value)
    value.each{ |value| print "\e[#{value}m" } if value.is_a? Array
  end

  def reset
    print "\e[0m"
    print @window_format
  end

end
