package com.test.app;

import java.util.List;

public interface HomeMapper {

	List<MemberDTO> getAllMembers();

	MemberDTO getMember(String id);

	int insertMember(MemberDTO memberDTO);

	int updateMember(MemberDTO memberDTO);

	int deleteMember(String id);

}
