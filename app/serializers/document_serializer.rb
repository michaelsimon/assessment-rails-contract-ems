class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :contract_id, :name, :description, :location,  :rights

  def rights
    value =""
    if Pundit.policy(scope, Document.find(self.id)).show?
      value += "<a href=\"#{contract_document_path(self.contract_id, self.id)}\"><i class=\"fa fa-eye\"></i></a>&nbsp;&nbsp;"
    end

    if Pundit.policy(scope, Document.find(self.id)).edit?
      value += "<a href=\"#{edit_contract_document_path(self.contract_id, self.id)}\" id=\"edit-doc\"><i class=\"fa fa-pencil\"></i></a>&nbsp;&nbsp;"
    end

    if Pundit.policy(scope, Document.find(self.id)).destroy?
      value += "<a href=\"#{contract_document_path(self.contract_id, self.id)}\" id=\"del-doc\"><i class=\"fa fa-trash-o\"></i></a>&nbsp;&nbsp;"
    end
    return value
  end
end
