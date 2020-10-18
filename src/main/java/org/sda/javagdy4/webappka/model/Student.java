package org.sda.javagdy4.webappka.model;

import lombok.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;
    private String lastName;

    private boolean graduated;

    private Double homeDistance;

    private LocalDate birthDate;

    // birthDate jest nazwą kolumny w bazie. Czasami baza nazywa kolumny z podkreślnikami i w tej sytuacji możemy napotkać problemy.
    @Formula("(year(now())-year(birthDate))")
    private Integer age;

    @Formula("(SELECT AVG(g.value) FROM Grade g where g.student_id = id)")
    private Double gradesAverage;

    @OneToMany(mappedBy = "student", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    @Cascade(org.hibernate.annotations.CascadeType.REMOVE)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Set<Grade> gradeSet;
}
