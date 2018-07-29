class Fisica < ApplicationRecord
    validates :nome, :cpf, :telefone, :endereco, presence: true
    validates_length_of :cpf, :is => 11, :message => "CPF é composto por 11 dígitos. Informe apenas os Números"
    validates_uniqueness_of :cpf
    has_many :socios, dependent: :destroy

    def self.tokenizer(fisica)
        payload = { pessoa_fisica: "#{fisica.nome}",
                              cpf: "#{fisica.cpf}",
                         telefone: "#{fisica.telefone}"}
        fisica.token = JWT.encode payload, 'HS256'
        fisica
    end
end
