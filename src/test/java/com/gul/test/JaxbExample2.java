package com.gul.test;

import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class JaxbExample2 {

	public static void main(String[] args) {

		try {
			File file = new File("D:/XML/customerXMl.xml");
			JAXBContext jaxbContext = JAXBContext.newInstance(Customer.class);
			Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
			Customer customer = (Customer) unmarshaller.unmarshal(file);
			System.out.println(customer);
		} catch (Exception e) {
		}
	}

}
