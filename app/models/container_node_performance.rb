class ContainerNodePerformance < MetricRollup
  default_scope { where("resource_type = 'ContainerNode' and resource_id IS NOT NULL") }

  belongs_to :container_node, :foreign_key => :resource_id, :class_name => ContainerNode.name

  def self.display_name(number = 1)
    n_('Container Node Performance', 'Container Nodes Performances', number)
  end
end
