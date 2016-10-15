//
//  CompaniesMapVC.swift
//  iNternships
//
//  Created by mohcine  on 10/9/16.
//  Copyright © 2016 belarremCorp. All rights reserved.
//

import UIKit
import MapKit

class CompaniesMapVC: UIViewController,MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    
    //Attributes
    let initialLocation = CLLocation(latitude: 50.6292, longitude: 3.0573)
    let regionRadius: CLLocationDistance = 1000
    var selectedAnnotation: MKPointAnnotation!
    
    
    var annotations : [MKPointAnnotation]!
    
    var companiesList : [Company]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        centerMapOnLocation(initialLocation)
        
        self.mapView.delegate = self
        
        self.annotations = [MKPointAnnotation]()
        
        
        self.navigationItem.title = CompaniesRetriever.sharedInstance.getCurrentUser().name
        
        
        let newCompanyButton = UIBarButtonItem(barButtonSystemItem: .add,
                                               target: self,
                                               action: #selector(addNewCompany))
        self.navigationItem.rightBarButtonItem  = newCompanyButton
        
        
        let disconnectButton = UIBarButtonItem(title: "Disconnect",
                                               style: UIBarButtonItemStyle.plain,
                                               target: self,
                                               action: #selector(disconnect))
        
        self.navigationItem.leftBarButtonItem  = disconnectButton
        
        
        self.loadDataAndDrawPins()
    }
    
    func disconnect() {
        
        self.dismiss(animated: true, completion: nil)
        //TODO: disconnect the cookie
    }
    
    func addNewCompany() {
        
        print("before \(companiesList.count)")
        self.performSegue(withIdentifier: "showNewCompanyScene", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showCompanyDetail" {
            
            let cdvc = segue.destination as! CompaniesDetailVC
            cdvc.companyToDetail = CompaniesRetriever.sharedInstance.getCompanyByName(selectedAnnotation.title!) as! Company
        }
    }
    
    @IBAction func unwindWithNewData(_ segue:UIStoryboardSegue) {
            print("returned \(companiesList.count)")
            sleep(5)
            self.loadDataAndDrawPins()
            print("returned after sleep \(companiesList.count)")
    }
    
    
    func loadDataAndDrawPins() {
        
        self.companiesList = CompaniesRetriever.sharedInstance.getCompaniesList()
        
        clearMap()
        makeAnnotations()
        drawAnnotations()
        
    }
    
    
    func makeAnnotations() {
        
        //NSLog("\(DummyDataBase.sharedInstance.getHelpers().count)")
        
        for company in self.companiesList {
            
            let point = MKPointAnnotation()
            let coordinates = company.coordinates.components(separatedBy: ",")
            point.coordinate = CLLocationCoordinate2D(latitude: Double(coordinates[0])!, longitude: Double(coordinates[1])! )
            point.title = company.name
            self.annotations.append(point)
            
        }
        
    }
    
    
    func clearMap() {
        
        for annotation in self.annotations {
            
            self.mapView.removeAnnotation(annotation)
        }
        self.annotations.removeAll(keepingCapacity: false)
    }
    
    func drawAnnotations() {
        
        for annotation in self.annotations {
            
            self.mapView.addAnnotation(annotation)
        }
    }
    
    //MapView Methods
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 10000.0, regionRadius * 10000.0)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "")
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "")
            annotationView!.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView!.rightCalloutAccessoryView = btn
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            selectedAnnotation = view.annotation as? MKPointAnnotation
            self.performSegue(withIdentifier: "showCompanyDetail", sender: self)
            // NSLog("Showing details....")
        }
    }
    

}
