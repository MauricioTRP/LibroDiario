module AccountsHelper
  def account_type_select(form)
    form.select(:type_id, AccountType.all.collect{ |type| [type.name, type.id] }, { include_blank: true } )
  end
end
