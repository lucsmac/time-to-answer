require 'net/http'

class CEP
  attr_reader :logradouro, :bairro, :localidade, :uf

  END_POINT = 'https://viacep.com.br/ws/'
  FORMAT = "json"

  def initialize(cep) 
    found_cep = find(cep)
    fill_data(found_cep)
  end

  def endereco
    "#{@logradouro}/#{@bairro}/#{localidade}-#{uf}"
  end

  private

    def find(cep)
      ActiveSupport::JSON.decode(
        Net::HTTP.get(
          URI("#{END_POINT}/#{cep}/#{FORMAT}/")
        )
      )
    end

    def fill_data(cep)
      @logradouro = cep["logradouro"]
      @bairro     = cep["bairro"]
      @localidade = cep["localidade"]
      @uf         = cep["uf"]
    end 
end