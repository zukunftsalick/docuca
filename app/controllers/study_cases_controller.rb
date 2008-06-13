class StudyCasesController < ResourceController::Base
  before_filter :login_required
  layout 'default'
end
