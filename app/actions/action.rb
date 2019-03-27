class Action
  attr_accessor :scenario

  def initialize(scenario = nil)
    @scenario = scenario
  end

  def execute
    raise StandardError.new('Override me.')
  end

  def text_message(text:)
    {
      type: 'text',
      content: text,
    }
  end

  def generic_buttons(message:, button_hash_array:)
    {
      type: 'buttons',
      content: {
        title: message,
        buttons: button_hash_array
      }
    }
  end

  def button_hash(title:, type:, value:)
    {
      title: title,
      type: type,
      value: value
    }
  end

  def link_button(message:, link_name:, link_href:)
    button_hash_array = [button_hash(link_name, 'web_url', link_href)]
    generic_buttons(message, button_hash_array)
  end

  def yes_or_no_buttons(message:)
    button_hash_array = [button_hash(I18n.t('affirmative'), 'postback', I18n.t('affirmative')),
                         button_hash(I18n.t('negative'), 'postback', I18n.t('negative'))]
    generic_buttons(message, button_hash_array)
  end

  def list_element_hash(title:, image_url:, subtitle:, button_hash:)
    {
      title: title,
      imageUrl: image_url,
      subtitle: subtitle,
      buttons: [button_hash]
    }
  end

  def generic_list(list_element_array:, button_hash:)
    {
      type: 'list',
      content: {
        elements: list_element_array,
        buttons: [button_hash]
      }
    }
  end
end
