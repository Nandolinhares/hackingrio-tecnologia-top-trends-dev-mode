class Juridica < ApplicationRecord
    validates :cnpj, :razao, :fantasia, :endereco, presence: true
    validates_length_of :cnpj, :is => 14, :message => "CNPJ é composto por 13 dígitos. Informe apenas os Números"
    validates_uniqueness_of :cnpj
    has_many :socios, dependent: :destroy
    
    def self.tokenizer(juridica)
        payload = { pessoa_juridica: "#{juridica.razao}",
                  cnpj: "#{juridica.cnpj}" }
        payload["socios"] = Array.new
        juridica.socios.each do |socio|
            payload["socios"] << {nome: "#{socio.fisica.nome}", 
                                cpf: "#{socio.fisica.cpf}",
                                administrador: "#{socio.administrador}"}
        end
        juridica.token = JWT.encode payload, 'HS256'
        juridica
    end
end
