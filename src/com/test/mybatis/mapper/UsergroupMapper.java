package com.test.mybatis.mapper;

import com.test.mybatis.po.Usergroup;
import com.test.mybatis.po.UsergroupExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsergroupMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    long countByExample(UsergroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    int deleteByExample(UsergroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    int deleteByPrimaryKey(Integer usergroupid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    int insert(Usergroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    int insertSelective(Usergroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    List<Usergroup> selectByExample(UsergroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    Usergroup selectByPrimaryKey(Integer usergroupid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    int updateByExampleSelective(@Param("record") Usergroup record, @Param("example") UsergroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    int updateByExample(@Param("record") Usergroup record, @Param("example") UsergroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    int updateByPrimaryKeySelective(Usergroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table usergroup
     *
     * @mbg.generated Fri Dec 22 14:28:06 CST 2017
     */
    int updateByPrimaryKey(Usergroup record);
}