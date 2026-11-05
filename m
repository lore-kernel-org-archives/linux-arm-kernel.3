Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDE606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VdvjObvs;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1ILuSim;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ikeF37pR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=; b=VdvjObvsALebAG
	6EonORG/PyKSXCXc4v17hIAPsEs7wvidDORQqGsJwvnlIbvL7Hgs4RaNWsIBbQQTs4moTVLEEUa2s
	P8gwYMdQwhlDtcZ79D2pEY6TTQnqqNQLnRxjQoJ5kk34eWcw8r5kg98Q8bGbuzF7UwGx5LgiGbdao
	bnzZUa4p61/B+Luhr4Bx/Gm3cNm55B9VW1faaN1fKBfbwf449qwuNinSKBnq59M0UMUpnwkIivnwY
	cEzDEAx9DouxiG7NLZfexhVwmYhdcz7p6kmVJ//X80DcfnnL3Psr6pcqML+hhQ8ZYhTwJWPgQg+Ap
	bzQqua5jmvNwLdUQMIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzS4-00000009PiF-0ums;
	Thu, 05 Nov 2026 15:32:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzRy-00000009PgU-03Wh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:32:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ8QT094500
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 15:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=; b=p1ILuSim5deoO8ja
	3wphI/7Nsrgrqxx/+9uzSfHc6ihiO0isa17zG0dIcmjBGWCIGX3RU5A3vPW0Of+Z
	zSGCJNAB4ydNwylGt4IqRlyIdK772pN6VFyPJf+TIvRvvzawMEqD48Zufsy500lU
	VubhVlKSarv8F6EkCPH872vYZ3cSJoY89UoYVSApubdcnd6RDJO2UnKeGFvYYICp
	CuKFeG0Ccl/lQpZv6Fm8y6DNZpuRQfpmwRav889WXfIwZFdWPmmFg7moo53X1wDB
	OTdiorrPAVhsTwtpr+ft+Tf/Jg4bdcg9+1ooCmuyqK2aaebKn8G69z80h1MuY+9P
	Sgg0Gw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43jtuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 15:32:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c83124d530so1755693e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 07:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892744; x=1794497544; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=;
        b=ikeF37pRF3oaZXFPQKUtkQXr4Kkiu/bBGuCF42dabASUCO6nihff0BlBiUFyj7r8Mb
         m/4XOnXYffKBhrOrWcTgrmJ9mGvApaww1mThELOWDIFGGTFI3/Vo4bnEACkoKfkENjXO
         ywJ57Ad9G//ZyuQIDmb7Ah0wIRDivCWZp7lmf/OcOPw8XAxtu2y11cJpOhmO8PAw0XI5
         UfQmzEfVJDmO/eB3WlEMC/H6SBAAMDUdUyyGez80IwNbbaupm579xwGNbNzmjsdNWsPy
         0+Ra1xiNYkOjtEQOd+ypOwFYvFXGUYtj1kdYixvVm7OHFtAi6mkkAXFfFKHBN7yFCs9n
         8JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892744; x=1794497544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9aybnm6z6uCy7Z3S2M1SU/Xzgy17fe/G/KhASnMe+U=;
        b=G7ws2MXzSgISulAG4ULqNGMbR6+3u+kuWdEezCExACwfOuikh25EaYEh+5iwKl3309
         NEBsRsCcqekQ0Ojj/d3Zq+STNEsH39NHCrRNZ/HDvnIyy+U6Ih5dz4xGxI1RVbzE2RGq
         MsHpOzTgAja29mBjOjeA+0p+sJWAyZEKlZAlk5i0y2djD5oamPtQi79wWRJIw9RERAdo
         oYdNhwYJYD4DntMmQdZ7vgGbWZqPkXSJgacCmKvJjUFUEVW756H+osie+WsMMXRbxvV9
         MvT8w+3N8pNP5WoIEMHaAKsfbMoja0VNtbKMtyzR+FSNEoqSZzV8qoNAvsFyKcOBfhz3
         iUOg==
X-Forwarded-Encrypted: i=1; AKwUvBw9fULv95ENMemhxCzrBvsCko3lBJi5mFef6lQPbKKUaUnhO8R1TycYRmtUVsz28DgnNUl5BGHO/SmSyquoIfzZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/GOYkUK0sv7PMeFtlAAOGBkKZMcMOArp+8wabxf2SmBkA8J0uR
	hVlUStMppjC5TKa0f1W3omxb02nv6u3kW5qBVfFuRJu/wW4HxOYe323OqKJJZJWEWSLdCQFkysc
	oud7FJ4uE/IAFgbTR9+X5eW1Ty8kbjLQO2oLSU/t7mnL5dSM8jVLF6nQAFA9xVKdbbgQjBYAUiT
	QIwQ==
X-Gm-Gg: AYBFou2ytEiN3BKQ70oVBVjmH12BusVqkqC/KwayouLMCjc2CzxT9txOXG4837t40M9
	Ic+17gZMuP0By70zQAKFy0+z7KH5/IUdUI/Kdzp2/FTsQc3mHh4C8QNuCL6Y+/x0AtH8vLiUJW2
	LhomWQaJIcLYB9Nj/5p2DtPI77Iiam6PgYChiVgBnlDG3k9zrqSVFF8LxP2xgHVYx81bsvUfyhl
	aTw9gu/1MZpmXrKVMAYr+xphaoxgoOPFHXVWH0HIxCvjn1mVAmPXO9hXmDGVRZBHjDWGJJaGjNF
	u+mhjoBJUdCfwXdz146R63FhSXl5WnUpXWJ0l8CnGozdeIvN4e7OsE5xdBOj5yNm5Ike4sEO2fR
	gQkZsseqDfuMvI6cxrSr6ZvLeI/7mLez3vlTGtE2XTCzROqM0zDZcgbXjr4HUYW/KzbB+/5R/Ia
	ra0XYuAQZsThhg+e9G
X-Received: by 2002:a05:6122:469b:b0:5ea:b972:1403 with SMTP id 71dfb90a1353d-5ec68539420mr9780594e0c.3.1793892743638;
        Thu, 05 Nov 2026 07:32:23 -0800 (PST)
X-Received: by 2002:a05:6122:469b:b0:5ea:b972:1403 with SMTP id 71dfb90a1353d-5ec68539420mr9780528e0c.3.1793892743105;
        Thu, 05 Nov 2026 07:32:23 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm70424915e9.1.2026.11.05.07.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:32:22 -0800 (PST)
Message-ID: <6740e6e8-6b77-47dc-8b9a-b81efb557664@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:32:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] powercap: Add generic zone hierarchy creation
 helpers
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <d33ddfe789ee42a00d3ff3df55e0c4011e69debc.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <f018a2c1-2618-458d-a95f-a0cfdef9ac39@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <f018a2c1-2618-458d-a95f-a0cfdef9ac39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ldARP6vqvd9fQ_gjZsfU0nFCxXNClbmP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX1trUJm+422l4
 vGXrFzC8otTu+FE+HIgKXcBNU9cMavdc731ma19X9EoQJY1JZ/9c46x4QSI5Z0Q1erMAc8tvnMk
 9Zw/Hj0ffzYNbWV8p2esPAnzXaol5PAhun0zOIeV8n83/B2188NPuq/piPqm6tjUYRtN/YKdUk5
 UtE9tEjmgvt+UtExq/EsU7TYMs82BmbQzUDuK58OXASOL41sw2hVqtJPRZER5lzJP0ppyDEGeNG
 1l7ZHjC5bBWOfcFLrreeN5O5TizMPfJwB1b0C3nzsuP30EuebfNPHGWnFTwsoGJV6WLHAuQ+LLl
 jyrvWt7bKfyRyNCmT5QvaXoAsbX0CWDR1w3S0jzXq8OAv4iOsm/N38vl1E9AnBFzvCHBlpmDGTe
 AJkjdRUrYLEpfvpZ/7vjQ+tm+ZE/zunDL0wHbcLCmw7JaN3z9spHfkq/3uuuIRlg8Q0MWF4b4/m
 EhFSu7eSkHuugp7PHgQ==
X-Proofpoint-GUID: ldARP6vqvd9fQ_gjZsfU0nFCxXNClbmP
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aeca188 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=49fcMjTkyU320Q8Jtn8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX8OL+Lfr7pNvv
 xlP6yZ4Jhf7hqWjJd/92dzRrHFab9bJV3NseMsBmYCiAbI13C2FiqgtzX2pL52bPGe/TzjDWhyQ
 uWIIXKDkXsLJhxPBBq8SiREb05x/ISI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_073226_094293_A0B8F2B1 
X-CRM114-Status: GOOD (  13.22  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi Manaf,


On 11/5/26 10:35, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Daniel,
> 
> 
> On 11/3/2026 10:18 AM, Daniel Lezcano wrote:

[ ... ]

>>   drivers/powercap/powercap_sys.c | 204 +++++++++++++++++++++++++++++++
>>   include/linux/powercap.h        | 205 ++++++++++++++++++++++++++++++++
>>   2 files changed, 409 insertions(+)
> 
> I rebased my Qualcomm SPEL powercap driver series on top of this series 
> and migrated the series without any issues.
> 
> Tested-by: Manaf Meethalavalappu Pallikunhi 
> <manaf.pallikunhi@oss.qualcomm.com>

Thanks for testing !



