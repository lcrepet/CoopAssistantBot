class SendHelp < Action
  def execute
    [text_message(text: "I'm not sure I understand. You can reach a humain being at: 06 00 00 00 00.")]
  end
end
