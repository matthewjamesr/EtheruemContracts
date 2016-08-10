contract RentalAgreement
{	
	struct Landlord {
		bytes32 shortName;
		string fullName;
		string mailAddress;
		string signerFirstName;
		string signerSecondName;
		address landlordAddr;
	}
	
	struct Renter {
		string firstName;
		string secondName;
		address renterAddr;
		address landlordAddr;
	}
	struct FoundRenters {
		string secondName;
		address renterAddr;
	}
	
	struct Unit {
		uint unitNumber;
		uint unitBeds;
		uint unitBaths;
		uint unitSqFt;
		string unitDescription;
		string unitTerms;
		uint unitprice;
		bool rented;
	}
	
	Renter[] public renters;
	FoundRenters[] public foundRenters;
	Landlord[] public landlords;
	Unit[] public units;
	
	function newLandlord(bytes32 shortName, string fullName, string mailAddress, string firstName, string secondName) {		
		landlords.push(Landlord({
			shortName: shortName,
			fullName: fullName,
			mailAddress: mailAddress,
			signerFirstName: firstName,
			signerSecondName: secondName,
			landlordAddr: msg.sender
		}));
	}
	
	function newRenter(string firstName, string secondName, address renterAddr, address landlordAddr){
		renters.push(Renter({
			firstName: firstName,
			secondName: secondName,
			renterAddr: renterAddr,
			landlordAddr: landlordAddr
		}));
	}
	
	function getLandlords(address landlordAddr) constant returns (string, string, address) {
		var landlord = landlords[0];
		
		for (var i = 0; i <= landlords.length; i++) {
			if (landlords[i].landlordAddr == landlordAddr) {
				landlord = landlords[i];
				return (landlord.fullName, landlord.mailAddress, landlord.landlordAddr);
			}
		}

	}
	
	function getRenters(address renterAddr) constant returns (string) {
		for (var i = 0; i <= renters.length; i++) {
			if (renters[i].renterAddr == renterAddr) {
				return renters[i].secondName;
			}
		}
	}
}
