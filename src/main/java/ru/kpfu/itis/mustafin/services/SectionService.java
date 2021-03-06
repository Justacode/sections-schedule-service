package ru.kpfu.itis.mustafin.services;

import ru.kpfu.itis.mustafin.models.Section;
import ru.kpfu.itis.mustafin.models.SportsClub;

import java.util.List;

public interface SectionService {

    Section addSection(Section section);

    List<Section> getAll();

    Section getById(long id);

    Section getByName(String name);

    List<Section> getIfTeachersExist(Long clubId);

    void delete(long id);
}
