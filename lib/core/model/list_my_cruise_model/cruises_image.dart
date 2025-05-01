class CruisesImage {
	int? id;
	int? cruiseId;
	String? cruiseImg;
	String? tag;
	dynamic alt;
	dynamic deletedAt;
	DateTime? createdAt;
	DateTime? updatedAt;

	CruisesImage({
		this.id, 
		this.cruiseId, 
		this.cruiseImg, 
		this.tag, 
		this.alt, 
		this.deletedAt, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory CruisesImage.fromJson(Map<String, dynamic> json) => CruisesImage(
				id: json['id'] as int?,
				cruiseId: json['cruise_id'] as int?,
				cruiseImg: json['cruise_img'] as String?,
				tag: json['tag'] as String?,
				alt: json['alt'] as dynamic,
				deletedAt: json['deleted_at'] as dynamic,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'cruise_id': cruiseId,
				'cruise_img': cruiseImg,
				'tag': tag,
				'alt': alt,
				'deleted_at': deletedAt,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};
}
