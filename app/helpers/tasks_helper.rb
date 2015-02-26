module TasksHelper
  def state_class_for(task)
    'round radius label ' << (task.state ? 'success' : 'alert')
  end

  def state_description_for(task)
    task.state ? 'Terminada' : 'No terminada'
  end
end
