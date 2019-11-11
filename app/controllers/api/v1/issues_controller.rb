class Api::V1::IssuesController < Api::V1::BaseController
  def create
    issue = Issue.new(issue_params)
    if issue.save
      render json: { stasut: 'ok' }, status: 200
    else
      render json: { errors: issue.errors.full_messages }, status: 400
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:content)
  end
end
