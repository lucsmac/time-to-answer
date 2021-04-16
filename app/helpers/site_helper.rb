module SiteHelper
  def msg_jumbotron
    case params[:action]
    when 'index'
      'Exibindo todas as perguntas.'
    when 'questions'
      "Exibindo resultados para \"#{params[:term]}\""
    when 'subject'
      "Mostrando questões para o assunto \"#{params[:subject]}\"..."
    end
  end
end
