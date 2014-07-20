module
  CategoryRecordsHelper

  def colorize_categories(category_records)
    category_records.map { |cr| colorize_category(cr) }.join(' ').html_safe
    # colors.map { |cr| colorize_category(cr) }.join(' ').html_safe
  end

  def colorize_category(category_record)
    color = colors[string_to_int(category_record.category) % (colors.count - 1)]
    # color = category_record
    "<span style='background-color: #{color}; padding: 3px'>#{category_record}</span>".html_safe
  end

  def string_to_int(s)
    x = 0
    (0..(s.length - 1)).each do |i|
      x += s[i].ord
    end
    x
  end

  def colors
    %w(
      Aqua
      Aquamarine
      BlueViolet
      BurlyWood
      CadetBlue
      Chocolate
      Coral
      CornflowerBlue
      Crimson
      DarkCyan
      DarkGoldenRod
      DarkGray
      DarkKhaki
      DarkOrange
      DarkOrchid
      DarkSalmon
      DarkSeaGreen
      DarkTurquoise
      DarkViolet
      DeepPink
      DeepSkyBlue
      DodgerBlue
      FireBrick
      ForestGreen
      Fuchsia
      Gold
      GoldenRod
      GreenYellow
      HotPink
      IndianRed
      Khaki
      Lavender
      LawnGreen
      LemonChiffon
      LightBlue
      LightCoral
      LightCyan
      LightGoldenRodYellow
      LightGray
      LightGreen
      LightPink
      LightSalmon
      LightSeaGreen
      LightSkyBlue
      LightSlateGray
      LightSteelBlue
      Lime
      LimeGreen
      Magenta
      MediumAquaMarine
      MediumOrchid
      MediumPurple
      MediumSeaGreen
      MediumSlateBlue
      MediumSpringGreen
      MediumTurquoise
      MediumVioletRed
      Moccasin
      Olive
      Orange
      OrangeRed
      Orchid
      PaleGoldenRod
      PaleGreen
      PaleTurquoise
      PaleVioletRed
      PeachPuff
      Peru
      Pink
      Plum
      PowderBlue
      Red
      RosyBrown
      RoyalBlue
      SaddleBrown
      Salmon
      SandyBrown
      SeaGreen
      Sienna
      Silver
      SkyBlue
      SlateBlue
      SpringGreen
      SteelBlue
      Tan
      Thistle
      Tomato
      Turquoise
      Violet
      Wheat
      Yellow
      YellowGreen
    )
 end
end
