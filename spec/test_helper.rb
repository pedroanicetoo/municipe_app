# frozen_string_literal: true

class FormFail

    def register; end
  
    def valid?
      false
    end
  
    def errors
      ActiveModel::Errors.new(
        [ActiveModel::Error.new("doesn't matter", "doesn't matter")]
      )
    end
  
  end
  
  def valid_cpf
    Faker::CPF.numeric
  end
  
  def valid_cnpj
    Faker::CNPJ.numeric
  end

  def rand_cns
    rand.to_s[2..16]
  end
  
  def random_number(var = 100_000)
    if var != 100_000
      1 + SecureRandom.random_number(var)
    else
      1 + SecureRandom.random_number(var) + Time.now.to_i
    end
  end
  
  def random_string(size = 10)
    SecureRandom.alphanumeric[0...size]
  end
  
  def valid_email
    "#{random_string}@#{random_string}.com"
  end

  def valid_uf
    %w[RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF]
  end
