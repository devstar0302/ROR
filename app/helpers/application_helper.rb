module ApplicationHelper
  def opened_menu( request_path, current_path)
    # 1
    if request_path == '/religions'
      classes = (current_path.match(/\/religions\/\d+\/\w+$/)) ? ' opened-menu ' : ' close-menu '
    #2
    elsif request_path.match(/\/religions\/\d+\/\w+$/)
      unless current_path.match(/\/religions(\/\d+\/\w+)?$/)
        classes = (current_path.match(/#{request_path}\/\d+\/\w+$/)) ? ' opened-menu ' : ' close-menu '
      end
    #3
    elsif request_path.match(/\/religions\/\d+\/\w+\/\d+\/\w+$/)
      sub_path_array = request_path.split('/')
      sub_path_array.pop
      sub_path_array.pop
      sub_path = sub_path_array.join('/')
      if current_path.match(/\/religions(\/\d+\/\w+)?$/)
      elsif current_path.match(/#{sub_path}(\/\d+\/\w+)?$/)
      else
        classes = (current_path.match(/#{request_path}\/\d+\/\w+$/)) ? ' opened-menu ' : ' close-menu '
      end
    #4
    elsif request_path.match(/\/religions\/\d+\/\w+\/\d+\/\w+\/\d+\/\w+$/)
      sub_path_array = request_path.split('/')
      sub_path_array.pop
      sub_path_array.pop
      sub_path = sub_path_array.join('/')
      sub_path_array.pop
      sub_path_array.pop
      sub_path_ = sub_path_array.join('/')

      if current_path.match(/\/religions(\/\d+\/\w+)?$/)
      elsif current_path.match(/#{sub_path}(\/\d+\/\w+)?$/)
      elsif current_path.match(/#{sub_path_}(\/\d+\/\w+)?$/)
      else
        classes = (current_path.match(/#{request_path}\/\d+\/\w+$/)) ? ' opened-menu ' : ' close-menu '
      end
    #5
    else
      classes = ' close-menu '
    end

    classes
  end

  def active_menu(current)
    classes = current ? 'active-menu ' : ''
  end

  def count(path)
    path.split('/').length
  end

  def delete_icon
    content_tag :span, class: 'delete-icon' do
      tag :img, src: asset_path('error.png')
    end
  end

  def edit_icon
    content_tag :span, class: 'edit-icon' do
      tag :img, src: asset_path('pencil.png')
    end
  end
end
