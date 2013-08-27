module ProductsHelper
  def format_date(time)
    "#{time.year}年#{time.month}月#{time.day}日"
  end

  def more_than_one_picture?(pic)
    pic.length > 1 ? true : false
  end

  def how_many_pictures(pic)
    pic.length
  end
end
