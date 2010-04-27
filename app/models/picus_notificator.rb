class PicusNotificator < ActionMailer::Base
  
#send to all admins
  def project_created(project)
    subject    'PicusNotificator >> New Project Was Created'
    recipients 'mateva.maria@gmail.com'
    from       'bugracker.picus@gmail.com'
    sent_on    Time.now
    
    body       :greeting => 'Hi,'
  end

#send to the project creator
  def version_created(sent_at = Time.now)
    subject    'PicusNotificator#version_created'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

#send to the project owner
  def bug_created(sent_at = Time.now)
    subject    'PicusNotificator#bug_created'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

#send to all subscribed
  def bug_change(sent_at = Time.now)
    subject    'PicusNotificator#bug_change'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

end
