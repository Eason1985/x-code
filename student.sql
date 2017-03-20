(
  student_id      VARCHAR2(30) not null,
  stname          VARCHAR2(50),
  stno            VARCHAR2(50),
  age             NUMBER,
  birthday        DATE,
  money           NUMBER(17,3),
  created_date    TIMESTAMP(6),
  updated_date    TIMESTAMP(6),
  created_user_cd VARCHAR2(50),
  updated_user_cd VARCHAR2(50),
  end_date        TIMESTAMP(6)
)
tablespace GATEWAY
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the columns 
comment on column STUDENT.student_id
  is '学生主键';
comment on column STUDENT.stname
  is '姓名';
comment on column STUDENT.stno
  is '学号';
comment on column STUDENT.age
  is '年龄';
comment on column STUDENT.birthday
  is '生日';
comment on column STUDENT.money
  is '学费';
comment on column STUDENT.created_date
  is '创建日期';
comment on column STUDENT.updated_date
  is '更新日期';
comment on column STUDENT.created_user_cd
  is '创建用户';
comment on column STUDENT.updated_user_cd
  is '更新用户';
comment on column STUDENT.end_date
  is '终止期间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table STUDENT
  add constraint PK_STUDENT primary key (STUDENT_ID)
  using index 
  tablespace GATEWAY
  pctfree 10
  initrans 2
  maxtrans 255;
