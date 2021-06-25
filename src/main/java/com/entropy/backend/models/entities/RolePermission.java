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
@Table(name = "ofRolePermission")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class RolePermission extends Base {
    @Id
    @Column(name = "id")
    private Byte id;

    @Column(name = "roleId")
    private Byte roleId;

    @Column(name = "permissionId")
    private Byte permissionId;
}