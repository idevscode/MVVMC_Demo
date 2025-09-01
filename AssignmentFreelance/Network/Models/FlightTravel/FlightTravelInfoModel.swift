//
//  FlightTravelInfoModel.swift
//  FlightTravel
//
//  Created by dilshad haidari on 06/06/25.
//

import Foundation


// MARK: - FlightTravelInfo
struct FlightTravelInfo: Codable {
    let data: [String: FlightModel]
    let currency: String
    let success: Bool
}

// MARK: - Datum
struct FlightModel: Codable {
    let origin: Origin
    let destination: Destination
    let airline: Airline
    let departureAt, returnAt, expiresAt: Date
    let price, flightNumber, transfers: Int

    enum CodingKeys: String, CodingKey {
        case origin, destination, airline
        case departureAt = "departure_at"
        case returnAt = "return_at"
        case expiresAt = "expires_at"
        case price
        case flightNumber = "flight_number"
        case transfers
    }
}

enum Airline: String, Codable {
    case a4 = "A4"
    case at = "AT"
    case dp = "DP"
    case ey = "EY"
    case j2 = "J2"
    case ms = "MS"
    case pc = "PC"
    case s7 = "S7"
    case su = "SU"
    case the2S = "2S"
    case the3F = "3F"
    case the5G = "5G"
    case tk = "TK"
    case u6 = "U6"
    case ut = "UT"
    case vf = "VF"
    case wz = "WZ"
}

enum Destination: String, Codable {
    case bcn = "BCN"
}

enum Origin: String, Codable {
    case mow = "MOW"
}



//--------MOCKAROO---------

import Foundation

// MARK: - FlightJourneyInfoElement
struct FlightJourneyInfoElement: Codable {
    let flightNumber: String
    let airlineName: AirlineName
    let departureAirport: DepartureAirport
    let departureCity: DepartureCity
    let departureCountry: DepartureCountry
    let departureTime, arrivalAirport, arrivalCity, arrivalCountry: String
    let durationHours: Double

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case airlineName = "airline_name"
        case departureAirport = "departure_airport"
        case departureCity = "departure_city"
        case departureCountry = "departure_country"
        case departureTime = "departure_time"
        case arrivalAirport = "arrival_airport"
        case arrivalCity = "arrival_city"
        case arrivalCountry = "arrival_country"
        case durationHours = "duration_hours"
    }
}

enum AirlineName: String, Codable {
    case aeroméxico = "Aeroméxico"
    case airCanada = "Air Canada"
    case airFrance = "Air France"
    case airIndia = "Air India"
    case airNewZealand = "Air New Zealand"
    case alitalia = "Alitalia"
    case allNipponAirways = "All Nippon Airways"
    case americanAirlines = "American Airlines"
    case avianca = "Avianca"
    case britishAirways = "British Airways"
    case cathayPacific = "Cathay Pacific"
    case deltaAirLines = "Delta Air Lines"
    case emirates = "Emirates"
    case ethiopianAirlines = "Ethiopian Airlines"
    case iberia = "Iberia"
    case klmRoyalDutchAirlines = "KLM Royal Dutch Airlines"
    case koreanAir = "Korean Air"
    case latamAirlines = "LATAM Airlines"
    case lufthansa = "Lufthansa"
    case qantas = "Qantas"
    case qatarAirways = "Qatar Airways"
    case sasScandinavian = "SAS Scandinavian"
    case singaporeAirlines = "Singapore Airlines"
    case southAfricanAirways = "South African Airways"
    case southwestAirlines = "Southwest Airlines"
    case thaiAirways = "Thai Airways"
    case unitedAirlines = "United Airlines"
}

enum DepartureAirport: String, Codable {
    case adolfoSuárezMadridBarajas = "Adolfo Suárez Madrid–Barajas"
    case amsterdamAirportSchiphol = "Amsterdam Airport Schiphol"
    case aucklandAirport = "Auckland Airport"
    case benitoJuárezInternational = "Benito Juárez International"
    case boleInternational = "Bole International"
    case changi = "Changi"
    case charlesDeGaulle = "Charles de Gaulle"
    case copenhagenAirport = "Copenhagen Airport"
    case dubaiInternational = "Dubai International"
    case elDoradoInternational = "El Dorado International"
    case frankfurtAirport = "Frankfurt Airport"
    case hamadInternational = "Hamad International"
    case haneda = "Haneda"
    case heathrow = "Heathrow"
    case hongKongInternational = "Hong Kong International"
    case incheonInternational = "Incheon International"
    case indiraGandhiInternational = "Indira Gandhi International"
    case johnFKennedyInternational = "John F. Kennedy International"
    case leonardoDaVinciInternational = "Leonardo da Vinci International"
    case losAngelesInternational = "Los Angeles International"
    case oRTamboInternational = "O.R. Tambo International"
    case suvarnabhumi = "Suvarnabhumi"
    case sydneyAirport = "Sydney Airport"
    case sãoPauloGuarulhosInternational = "São Paulo/Guarulhos International"
    case torontoPearson = "Toronto Pearson"
}

enum DepartureCity: String, Codable {
    case addisAbaba = "Addis Ababa"
    case amsterdam = "Amsterdam"
    case auckland = "Auckland"
    case bangkok = "Bangkok"
    case bogotá = "Bogotá"
    case copenhagen = "Copenhagen"
    case delhi = "Delhi"
    case doha = "Doha"
    case dubai = "Dubai"
    case frankfurt = "Frankfurt"
    case hongKong = "Hong Kong"
    case johannesburg = "Johannesburg"
    case london = "London"
    case losAngeles = "Los Angeles"
    case madrid = "Madrid"
    case mexicoCity = "Mexico City"
    case newYork = "New York"
    case paris = "Paris"
    case rome = "Rome"
    case seoul = "Seoul"
    case singapore = "Singapore"
    case sydney = "Sydney"
    case sãoPaulo = "São Paulo"
    case tokyo = "Tokyo"
    case toronto = "Toronto"
}

enum DepartureCountry: String, Codable {
    case australia = "Australia"
    case brazil = "Brazil"
    case canada = "Canada"
    case china = "China"
    case colombia = "Colombia"
    case denmark = "Denmark"
    case ethiopia = "Ethiopia"
    case france = "France"
    case germany = "Germany"
    case india = "India"
    case italy = "Italy"
    case japan = "Japan"
    case mexico = "Mexico"
    case netherlands = "Netherlands"
    case newZealand = "New Zealand"
    case qatar = "Qatar"
    case singapore = "Singapore"
    case southAfrica = "South Africa"
    case southKorea = "South Korea"
    case spain = "Spain"
    case thailand = "Thailand"
    case uae = "UAE"
    case uk = "UK"
    case usa = "USA"
}

typealias FlightJourneyInfo = [FlightJourneyInfoElement]

