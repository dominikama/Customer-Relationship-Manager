package org.example.validation;


import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Constraint(validatedBy = PasswordValidator.class)
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.ANNOTATION_TYPE, ElementType.TYPE, ElementType.FIELD})
public @interface ValidPassword {

    String message() default "Invalid password. Your password should be at least 8 characters long and contain: " +
            "at least one capital letter, " +
            "at least one digit, " +
            "at least one special character, " +
            "at least one lowercase character.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
