//
//    Copyright (c) 2015 Max Sokolov https://twitter.com/max_sokolov
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

public protocol RowConfigurable {
    
    func configure(_ cell: UITableViewCell)
}

public protocol RowActionable {
    
    var editingActions: [UITableViewRowAction]? { get }
    func isEditingAllowed(forIndexPath indexPath: IndexPath) -> Bool
    
    func invoke(_ action: TableRowActionType, cell: UITableViewCell?, path: IndexPath) -> [Any?]
    func hasAction(_ action: TableRowActionType) -> Bool
}

public protocol RowHashable {
    
    var hashValue: Int { get }
}

public protocol Row: RowConfigurable, RowActionable, RowHashable {
    
    var reuseIdentifier: String { get }
    var cellType: AnyClass { get }
    
    var estimatedHeight: CGFloat? { get }
    var defaultHeight: CGFloat? { get }
}

open class TableRow<CellType: ConfigurableCell>: Row where CellType: UITableViewCell {
    
    open let item: CellType.T
    private lazy var actions = [String: [TableRowAction<CellType>]]()
    private(set) open var editingActions: [UITableViewRowAction]?
    
    open var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
    
    open var reuseIdentifier: String {
        return CellType.reuseIdentifier
    }
    
    open var estimatedHeight: CGFloat? {
        return CellType.estimatedHeight
    }
    
    open var defaultHeight: CGFloat? {
        return CellType.defaultHeight
    }
    
    open var cellType: AnyClass {
        return CellType.self
    }
    
    public init(item: CellType.T, actions: [TableRowAction<CellType>]? = nil, editingActions: [UITableViewRowAction]? = nil) {
        
        self.item = item
        self.editingActions = editingActions
        actions?.forEach { self.action($0) }
    }
    
    // MARK: - RowConfigurable -
    
    open func configure(_ cell: UITableViewCell) {
        (cell as? CellType)?.configure(with: item)
    }
    
    // MARK: - RowActionable -
    
    open func invoke(_ action: TableRowActionType, cell: UITableViewCell?, path: IndexPath) -> [Any?] {
        var result = [Any?]()
        if let actions = actions[action.key] {
            for currentAction in actions {
                result.append(currentAction.invoke(item: item, cell: cell, path: path))
            }
        }
        return result
    }
    
    open func hasAction(_ action: TableRowActionType) -> Bool {
        return actions[action.key] != nil
    }
    
    open func isEditingAllowed(forIndexPath indexPath: IndexPath) -> Bool {
        if actions[TableRowActionType.canEdit.key] != nil {
            return invoke(.canEdit, cell: nil, path: indexPath).reduce(false, { $0 || (($1 as? Bool) ?? false) })
        }
        return editingActions?.isEmpty == false || actions[TableRowActionType.clickDelete.key] != nil
    }
    
    // MARK: - actions -
    
    @discardableResult
    open func action(_ action: TableRowAction<CellType>) -> Self {
        if actions[action.type.key] == nil {
            actions[action.type.key] = [TableRowAction<CellType>]()
        }
        actions[action.type.key]?.append(action)
        
        return self
    }
    
    @discardableResult
    open func action<T>(_ type: TableRowActionType, handler: @escaping (_ data: TableRowActionData<CellType>) -> T) -> Self {
        action(TableRowAction<CellType>(type, handler: handler))
        return self
    }
    
}
