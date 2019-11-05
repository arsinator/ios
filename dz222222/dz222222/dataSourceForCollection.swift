//
//  dataSourceForCollection.swift
//  swift_lesson1_2
//
//  Created by Арсений Ермилов   on 03/11/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class dataSourceForCollection:NSObject, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDragDelegate,UICollectionViewDropDelegate {
    var o = 1
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        //        print(collectionView)
        let destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        }
        else {
            let row = collectionView.numberOfItems(inSection: 0)
//            destinationIndexPath = IndexPath(item: row - 1 , section: 0)
            destinationIndexPath = IndexPath(item: 0 , section: 2)
            print("adasdasdsad \(row)")
            
        }
        
        
        if coordinator.proposal.operation == .move{
            
            reorderItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
            
            collectionView.reloadData()
        }
    }
    
    
    var items: [[String]] = [["aaaa","bbbb","cccc","emptyCell"], ["yellow","black","emptyCell"],["pppp","emptyCell"]]
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        let item = self.items[indexPath.section][indexPath.row]
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        //        items.remove(at: indexPath.row)
        //        collectionView.deleteItems(at: [indexPath])
        return [dragItem]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! collectionCell
        if items[indexPath.section].count - 1 == indexPath.row {
            cell.backgroundColor = .white
            cell.contentView.layer.borderWidth = 0
            
            return cell
        }
        let a = UILabel(frame: CGRect(x: 10, y: 0, width: cell.bounds.size.width, height: cell.bounds.size.height))
        a.textAlignment = .center
        a.text=items[indexPath.section][indexPath.row]
        a.textColor = .white
        if cell.contentView.subviews.count == 0 {
            cell.contentView.addSubview(a)
        }
        else {
            let a = cell.contentView.subviews[0] as! UILabel
            a.text = items[indexPath.section][indexPath.row]
        }
        cell.backgroundColor = .red
        cell.contentView.layer.borderWidth = 10
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move,intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .move,intent: .insertAtDestinationIndexPath)
        //        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func reorderItems(coordinator: UICollectionViewDropCoordinator , destinationIndexPath: IndexPath, collectionView: UICollectionView){
        
        if let item = coordinator.items.first , let sourceIndexPath = item.sourceIndexPath {
            collectionView.performBatchUpdates({
            self.items[sourceIndexPath.section].remove(at: sourceIndexPath.item)
    self.items[destinationIndexPath.section].insert(item.dragItem.localObject as! String, at: destinationIndexPath.item)
                
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [destinationIndexPath])
                
                //                collectionView.reloadData()
            })
//            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }
}

