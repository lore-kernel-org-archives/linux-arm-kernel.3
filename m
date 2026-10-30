Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF7E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E5s8HoBY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCeeaCFI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxKvrjr0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=; b=E5s8HoBYJIeIyK
	Xk5Xe9hx2k4JRQZsbXxKnjx7w9uebm5veThlmHixQWMD3KU0U8E+uR+4Ok6yAaFErF1qKvRoYYrhx
	ZeztpoGEnvAnzVNgvlA7OAkkS9f/aKteD+INQmziyHrVYvKiIfHQ66PWCltk9GpKYsAu6aYov10kg
	tA1Z/Vb3tGyBEUJuV5VxAe8RoGKoM493nPrvcCdSkBCC0ub05OUcd9NXc6OLiuY6NnxCNr5u50yaq
	81Y/bym34HBDBdgibKJmNd+MPkWdeR2UKCJZWDmrjD1x9YPYegfh0lu/W1zMn5Z4jRam9BP1ZtMzz
	p695D7mrc/iEEXhZHruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnZK-0000000BrWk-40SJ;
	Fri, 30 Oct 2026 14:26:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnZH-0000000BrVA-3xPV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:26:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn73M2409226
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=; b=DCeeaCFIyfTgBGCE
	VrKDaL/o5zAiqilZKMzWNepzRLy0Ntx+36ld4Y6UcQxW30rZQ3tZqqTl3wIkRrzl
	bS7Mw2TT7cjBqqeswY7Tum/ERLdJ8i+J3ze2hwBqIi9f63hBbFe/yO5XdjupoLtR
	+YCNPoI+MspCwd4yDgkmfSGky9mkRlRdx43BRlGlM1Mobv5ueMVwp9l7iZbpwPCl
	6xyzA1vpY0BKLjMcZx7XKJ8HAOc0qHHUjhlr9jiAVK+v59LgRi3TX+ShE0zQWKHs
	x1kpLW9XddjkYRrzAK1bG/1cWi9Dt48JJek27KzKa5jE7S3cyqZZwVYACsjVRFTT
	lGBvGg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p3h7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:26:54 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6790b1d37e7so1196738d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793370413; x=1793975213; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=;
        b=LxKvrjr0+7g07dL81FLTDlB8p9X/NFtnD+VB8VdAVuquQ0lrzdAQUgSlTOhs21iYZY
         NuqYObeX42B7FspFmwRRAdlSxhH5DPaTjiGs09Pn0sR35R+3kYByAcwGpMoVzxmqsUsP
         oZb71trsrLVZv4heLoBncizlocjnJjotYUrxIXtejAJ1PuWBJy0K5l4L3DFWazmhJauh
         /wf3puhTEXYSUYuQc0Nwl0EkyZOqAAC6/4MxjTmAaWbp3/ZojtvmIkHlL4ZB8569PK/L
         01bl8e2iOIP4aA3lzsM5W3hsT9eXwm5EHEtTPj+blhP1dhWuix6kNYrlx6d3DY2zlyYw
         zqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370413; x=1793975213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=;
        b=ecCaIUTtPY1KG4VsMWAxLizNyzDhc0yqk/21Uf96fuGwe4j4PS0M77BpZo7cFhlQqG
         EqEYYpKP0jigRj4+b03a7O902SHqz/68fZRWK6bY4t9U0p1I9fhfK5Vyj/U7miR7NPx/
         dsM0fOGcVETBQmMspOit+1TQ9T0nCQcPB8dqAJWZHs0zxv4KTZrftsR4ZL7Xbf08VGYI
         WWZhVq5GL8IPVwWpIBnGPUAjH2WR7o9FbKVEWPdD5X4NkwOkIw5OG306JZfUNr3iDiyt
         httzfKuLxFgXc9RiRaCXYukvB0EKANpvP2tpFOjTWrW/FoMrPXgqmafsOtZwtpgUegA9
         IBkA==
X-Forwarded-Encrypted: i=1; AKwUvBxwgNzK5+LZlEaccQvL4ZGuV2EyAlulFfSqayw0FGurwSYC54qcjkB/AUWAOIi5d/BxRpJtTdSBhXdQvnNly4C7@lists.infradead.org
X-Gm-Message-State: AFq9FYLStZBX1NRxlwBWu1szKmnR6eEL99GyA6uFV9uq6/BgRX3RZl26
	64FeK7VDalk62KMsh3BVryzUCZUpJYBrAPm6Ro+u3uJvJ878AaCVl6RGLgjPO/Wn4iPjJn5X/SA
	DjIyUPGeuGiROJ3KnWtABY7fLAEAYYg+mtoQfHtoFp6/8knMkSaatiGiRTU8VRfvCQgP6FYrhXu
	8sOw==
X-Gm-Gg: AYBFou26+D+BHvHyVZvC3axcrfDLRXd143ur/FFlQ63sYUdetPbXVZJ+7lnL5WSu2Q9
	XAGcrFcPevdgAhzoxjfMWzghM5ddv0ZxJSAvHKZf/VpCDcNv2eq8XCK6yADFFjaQ2sVpwbz3jnx
	oWnUGEed3/rOeIU17BOl90zVHZb9qollEtVsKIQiCguqkcU9rob04KXRu1Ss05NzH1tA4H+EKF7
	+Q8gDN3Hm3nZpoSVkJhklPwrb/Y+YZY9KfjsaePdVRw/OLyy81QJYdUmxzqERv8voJLOnAQDfby
	Cnpc1v0T+QU/rFqDjANnmH/flCm5Bei0S9puobXA5JKp8rqejJscZtI+ZNxJvXPyli2MuWR3vdQ
	wE2RC+eiuC2oIri1IoSbPCugqf/cACN3LmluBy+Rjl/m3/JVWH44ydKf7xp4obUMzLIvNkkms/K
	tYm7hGUqIF05KIAA+4G+s16tAhDxSB31RZef0=
X-Received: by 2002:a53:b193:0:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67ba4c90dddmr1391840d50.4.1793370413203;
        Fri, 30 Oct 2026 07:26:53 -0700 (PDT)
X-Received: by 2002:a53:b193:0:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67ba4c90dddmr1391821d50.4.1793370412652;
        Fri, 30 Oct 2026 07:26:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7fbe:151a:486d:a2cc? ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm3456455f8f.43.2026.10.30.07.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:26:39 -0700 (PDT)
Message-ID: <6b1a831d-299e-43fd-83cb-74a64f844d03@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:26:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] powercap: Add generic zone hierarchy creation
 helpers
To: Lukasz Luba <lukasz.luba@arm.com>, rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <78abd10309b51ffdc3304997376d58e55b29487c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <dc1d68fc-e4fd-4cce-9444-acc8031d5ba0@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <dc1d68fc-e4fd-4cce-9444-acc8031d5ba0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX5/6YhLdhVIiG
 3RvWf8Ttw6Rro2v3Ee9ZpaywtSOEqAuFIPTd5GWyy8xr+z5eAQtQdAKnAZSWFI3dFzlZ9i//1J3
 p3GdEvPT79dw6x//oxrl7hwiw2LsKmtqO2edahTBXFx9Jq//qR92MZgTltgR2ruHZu1ypePxGhC
 OxABgdSfKwB5xL/TpYlFN7slNDBi2sSwjLDUFdnJ5/28Dcl/35dXvN2WIkNFGutzhj0KFHQXoww
 F0XpLwFoJ1SZx2Dpc+20H+E4fEuOtY7rr302whATM9uV/MTHdAcBalTcAH8rRD7btB4mbuD99KK
 OSr1WbU9Gy86tRsxjEH1YJghbABWe/UzZvlzFafuqhmddMm/3cuXgOO1p88zw3r/883n6ZtVCOK
 uxNBDRZqGCDkDEoRP1UMLKu+VXPPZNaNdL3yRTiLTCCPj08DwP7WnU+yNslNx8qiYfBKclmBB4p
 +K6sEW1bufPpDguIZfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX38VrqAW6ofXF
 v1T4jVQO3NRUOPUekK+IHPyRIwHUc07YJy10ghGaVY0zbCgOYkgzsyKdIUHIm1xxwxn4OQBo10u
 FqBI1sRyOMQsWw5dUFFtYeBL/vxEMk0=
X-Proofpoint-ORIG-GUID: XRuQN5Q0Eg3lq_eDXXqUV7uoWGm8UfHt
X-Proofpoint-GUID: XRuQN5Q0Eg3lq_eDXXqUV7uoWGm8UfHt
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4a92e cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=jVzW49EHFVz-FHsPnZwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_072656_093419_E50F4A29 
X-CRM114-Status: GOOD (  15.84  )
X-Spam-Score: -1.5 (-)
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


Hi Lukasz,

thanks for the review


On 10/30/26 15:02, Lukasz Luba wrote:
> 
> 
> On 10/29/26 16:56, Daniel Lezcano wrote:
>> Powercap controllers may need to create several powercap zones organized
>> as a hierarchy. At present, each controller has to open-code the
>> hierarchy traversal, parent lookup, error rollback and reverse-order
>> destruction.
>>
>> Introduce struct powercap_hierarchy to describe a powercap
>> hierarchy. Each node contains its name, parent, backend-specific data
>> and the powercap zone created for it.
> 
> [snip]
> 
>>
>> Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Link: https://patch.msgid.link/20260806110159.69690-2- 
>> daniel.lezcano@oss.qualcomm.com
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>> Changes in v4 (since v3):
>> - Rebase on v7.3; no code or commit-description changes.
>>
>> Changes in v3 (since v2):
>> - Rebase on v7.3-rc7.
>> - Add a static initializer and clarify hierarchy ownership and locking.
>> - Check for existing zones and validate names and parent ordering before
>>    creation; use zone for the runtime pointer member.
>> - Allow NULL callback results to skip branches; keep errors fatal.
>> - Use explicit locking and a signed reverse-loop index.
>> - Explain the controller callbacks, their arguments and their 
>> relationship
>>    to zone operations; update the description.
>>
>>   drivers/powercap/powercap_sys.c | 204 +++++++++++++++++++++++++++++++
>>   include/linux/powercap.h        | 205 ++++++++++++++++++++++++++++++++
>>   2 files changed, 409 insertions(+)
>>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>


