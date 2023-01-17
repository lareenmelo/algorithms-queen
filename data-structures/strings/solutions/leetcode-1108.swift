// 1108 - Defanging an IP Address

func defangIPaddr(_ address: String) -> String {
	var defangedIP = ""

	for char in address {
		switch(char) {
			case ".":
			defangedIP += "[.]"
			default:
			defangedIP += "\(char)"
		}
	}

	return defangedIP
}
