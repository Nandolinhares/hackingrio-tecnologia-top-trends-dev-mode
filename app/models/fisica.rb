class Fisica < ApplicationRecord
    validates :nome, :cpf, :telefone, :endereco, presence: true
    validates_length_of :cpf, :is => 11, :message => "CPF é composto por 11 dígitos. Informe apenas os Números"
    validates_uniqueness_of :cpf
    has_many :socios, dependent: :destroy
end
