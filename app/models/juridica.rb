class Juridica < ApplicationRecord
    validates :cnpj, :razao, :fantasia, :endereco, presence: true
    validates_length_of :cnpj, :is => 11, :message => "CNPJ é composto por 14 dígitos. Informe apenas os Números"
    validates_uniqueness_of :cnpj
end
