package com.journaldev.spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.journaldev.spring.model.Person;

public class PersonValidator implements Validator {

    @Override
    public boolean supports(Class<?> klass) {
        return Person.class.isAssignableFrom(klass);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Person person = (Person) target;
        ValidationUtils.rejectIfEmpty(errors, "name", "personname.required");
        ValidationUtils.rejectIfEmpty(errors, "country", "personcountry.required");
        String country = person.getCountry();
        if(country != null && country.length() > 0) {
          char car = country.toLowerCase().charAt(0);
          if (car == 'i' || car == 'y' || car == 'z') {
            errors.rejectValue("country", "pais.vetado");
          }
        }
    }
}

