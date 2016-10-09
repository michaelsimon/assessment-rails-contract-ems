class PerformanceListSerializer < ActiveModel::Serializer
  attributes :id, :name, :perf_date, :perf_time, :act, :venue, :contract, :rights
  has_one :act, serializer: PerformanceActSerializer
  has_one :venue, serializer: PerformanceVenueSerializer
  has_one :contract, serializer: PerformanceContractSerializer

  def rights
    value =""
    if Pundit.policy(scope, Performance.find(self.id)).show?
      value += "<a href=\"#{performance_path(self.id)}\"><i class=\"fa fa-eye\"></i></a>&nbsp;&nbsp;"
    end

    if Pundit.policy(scope, Performance.find(self.id)).edit?
      value += "<a href=\"#{edit_performance_path(self.id)}\" id=\"edit-perf\"><i class=\"fa fa-pencil\"></i></a>&nbsp;&nbsp;"
    end

    if Pundit.policy(scope, Performance.find(self.id)).destroy?
      value += "<a href=\"#{performance_path(self.id)}\" id=\"del-perf\"><i class=\"fa fa-trash-o\"></i></a>&nbsp;&nbsp;"
    end
    return value
  end

end
