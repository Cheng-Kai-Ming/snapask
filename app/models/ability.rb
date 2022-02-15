# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    def initialize(user) #這個 user 其實就是 devise 提供的 current_user
      if user.blank? # not logged in
        # can [:new, :create], Forum #可以執行 Form Controller 裡的 new 和 create action
        # cannot [:new], Comment  #無法執行 Comment Controller 裡的 new action
        # basic_read_only #呼叫基本權限設定 Medthod
      elsif user.has_role?(:admin) #如果 role 為 admin
        can :manage, :all #可管理所有資源
      end
    end
  

  
    # def basic_read_only
    #   can :read, Forum
    # end

  end
end
