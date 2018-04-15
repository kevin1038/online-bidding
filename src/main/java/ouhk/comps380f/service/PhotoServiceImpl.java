package ouhk.comps380f.service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import ouhk.comps380f.dao.PhotoRepository;
import ouhk.comps380f.model.Photo;

@Service
public class PhotoServiceImpl implements PhotoService {

    @Resource
    private PhotoRepository photoRepo;

    @Override
    @Transactional
    public Photo getPhoto(long itemId, String name) {
        return photoRepo.findByItemIdAndName(itemId, name);
    }

}
