package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TagEntity")
public class TagEntity extends BaseEntity<TagEntity> {
	@Column
	private String name;

	@OneToMany(mappedBy = "tagEntity")
	private List<TagProductEntity> tagProductEntities = new ArrayList<TagProductEntity>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<TagProductEntity> getTagProductEntities() {
		return tagProductEntities;
	}

	public void setTagProductEntities(List<TagProductEntity> tagProductEntities) {
		this.tagProductEntities = tagProductEntities;
	}

}
