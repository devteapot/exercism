defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(%{data: node_data, right: nil} = tree, data) when data > node_data,
    do: %{tree | right: %{data: data, left: nil, right: nil}}

  def insert(%{data: node_data, right: node_right} = tree, data) when data > node_data,
    do: %{tree | right: insert(node_right, data)}

  def insert(%{data: node_data, left: nil} = tree, data) when data <= node_data,
    do: %{tree | left: %{data: data, left: nil, right: nil}}

  def insert(%{data: node_data, left: node_left} = tree, data) when data <= node_data,
    do: %{tree | left: insert(node_left, data)}

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(%{data: nil}), do: []
  def in_order(%{data: data, left: nil, right: nil}),
    do: [data]
  def in_order(%{data: data, right: right_node}),
    do: [data | in_order(right_node)]
  def in_order(%{data: data, left: left_node}),
    do: [in_order(left_node) | data]
  def in_order(%{data: data, left: left_node, right: right_node}),
    do: in_order(left_node) ++ data ++ in_order(right_node)
end
