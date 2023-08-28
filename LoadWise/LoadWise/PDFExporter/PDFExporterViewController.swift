//
//  PDFExporterViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 27/08/23.
//

import UIKit

class PDFExporterViewController: UIViewController {
    
    private let parameters: PDFExporterEntity
    
    // MARK: Properties
    let contentView: PDFExporterViewProtocol = {
        let view = PDFExporterView()
        return view
    }()
    
    init(parameters: PDFExporterEntity) {
        self.parameters = parameters
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = contentView
        view.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        
        setupExportBarButton()
        updateContentView()
    }
    
    private func setupExportBarButton() {
        let exportBarButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(exportToPDFButtonTapped))
        navigationItem.rightBarButtonItem = exportBarButton
    }
    
    private func updateContentView() {        
        contentView.update(type: parameters.type,
                           regionality: parameters.regionality,
                           power: parameters.totalPower,
                           appliances: parameters.selectedItems)
    }
    
    @objc private func exportToPDFButtonTapped() {
        
        if let pdfData = contentView.exportToPDF() {
            let pdfURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("myPDF.pdf")
            
            do {
                try pdfData.write(to: pdfURL)
                print("PDF exportado com sucesso para \(pdfURL)")
                
                // Criar o UIActivityViewController
                let activityViewController = UIActivityViewController(activityItems: [pdfURL], applicationActivities: nil)
                activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
                present(activityViewController, animated: true, completion: nil)
                
            } catch {
                print("Erro ao exportar PDF: \(error.localizedDescription)")
            }
        }
        
        //            if let pdfData = contentView.exportToPDF() { // Certifique-se de que sua ContentView tenha o método exportToPDF implementado
        //                let pdfURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("myPDF.pdf")
        //                do {
        //                    try pdfData.write(to: pdfURL)
        //                    print("PDF exportado com sucesso para \(pdfURL)")
        //                } catch {
        //                    print("Erro ao exportar PDF: \(error.localizedDescription)")
        //                }
        //            }
    }
}
