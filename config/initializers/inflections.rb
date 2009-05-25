# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
	inflect.irregular 'aluguel', 'alugueis'
	inflect.plural    'aluguel', 'alugueis'
	inflect.singular  'alugueis', 'aluguel'

	inflect.irregular 'Aluguel', 'Alugueis'
	inflect.plural    'Aluguel', 'Alugueis'
	inflect.singular  'Alugueis', 'Aluguel'

end
