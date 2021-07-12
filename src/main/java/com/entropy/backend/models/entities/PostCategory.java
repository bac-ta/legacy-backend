package com.entropy.backend.models.entities;

import com.entropy.backend.models.entities.base.Base;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "ofPostCategory")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PostCategory extends Base {
    @Id
    @Column(name = "id")
    private Integer id;

    @Column(name = "postId")
    private Integer postId;

    @Column(name = "categoryId")
    private Integer categoryId;
}
