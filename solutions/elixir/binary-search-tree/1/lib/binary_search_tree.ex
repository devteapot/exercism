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
  def insert(tree, data) do
    case tree do
      %{data: node_data, right: nil} when data > node_data        ->
        %{tree | right: %{data: data, left: nil, right: nil}}

      %{data: node_data, right: node_right} when data > node_data ->
        %{tree | right: insert(node_right, data)}

      %{data: node_data, left: nil} when data < node_data         ->
        %{tree | left: %{data: data, left: nil, right: nil}}

      %{data: node_data, left: node_left} when data < node_data   ->
        %{tree | left: insert(node_left, data)}
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    case tree do
      %{left: nil, right: nil}        -> [tree.data]
      %{left: nil, right: right_node} -> [tree.data | in_order(right_node)]
      %{left: left_node, right: nil}  -> [in_order(left_node) | tree.data]
      _ -> in_order(tree.left) ++ tree.data ++ in_order(tree.right)
    end
  end
end
