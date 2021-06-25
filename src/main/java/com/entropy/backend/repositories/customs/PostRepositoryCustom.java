package com.entropy.backend.repositories.customs;

import com.entropy.backend.models.dtos.PostDto;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface PostRepositoryCustom {
    Map<Integer, List<PostDto>> findPosts(int sort, int start, int limit, Integer statusType, Integer publishType, Integer categoryId, String searchText);
}