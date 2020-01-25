package com.gul.test;

import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

public class JaxbExample {

	public static void main(String[] args) {

		Customer customer = new Customer();
		customer.setId(1);
		customer.setName("Gulrez");
		customer.setAge(28);

		try {
			File file = new File("D:/XML/customerXMl.xml");
			JAXBContext jaxbContext = JAXBContext.newInstance(Customer.class);
			Marshaller marshaller = jaxbContext.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			marshaller.marshal(customer, file);
			marshaller.marshal(customer, System.out);
		} catch (Exception e) {
		}
	}

}
