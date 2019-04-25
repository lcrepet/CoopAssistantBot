class Assistant
  def compute_response(recast_analyse)
    # TODO: compute real response
    if recast_analyse.intents.first.slug == "help"
      return help
    elsif recast_analyse.intents.first.slug == "greetings"
      return greetings
    end
    return recast_analyse.source
  end

  private

  def help
    #TODO
    return I18n.t(:help)
  end

  def incomprehension
    #TODO
  end

  def greetings
    #TODO
    return I18n.t(:hello)
  end
end
