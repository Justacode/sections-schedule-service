package ru.kpfu.itis.mustafin.models;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "sections")
public class Section {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sections_id_sequence")
    @SequenceGenerator(name = "sections_id_sequence", sequenceName = "sections_id_seq", allocationSize = 1)
    private Long id;

    @Column(name = "name")
    private String name;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "section")
    @BatchSize(size = 25)
    private List<Teacher> teachers = new ArrayList<Teacher>();

    public Section() {

    }

    public Section(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
