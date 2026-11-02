Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA66606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XgkCaF7h;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSnohwWi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gu31fK2C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=; b=XgkCaF7hvbmd2P
	OTkMdlXQpmdpBZRpkhYfqQhjL6ah8i4uzQe2XetixWw8zTS0LwR2I6/DVNP19JoL8FqifHZB7HbxB
	DDAcYCYnnVKQqYS00HFmlzkGgZlVs+paXlLReg8oFgyljzHm+wUaPIiQnUW8S+CR+mdad573Uxkmv
	ujwS+RktWeZP7Tp9T++J3afeRB1/Gl/AE9ygAEOI+LvKJMl99TZPVm1PIDwo6bjZ7h1039NB0jLCr
	+Nhgi8fSjI/TIgH6CRBszsOALdfqE9ULQFu+8zRUGyPGZm1LY0huCwcSFHGPYkYMOrFt/AoxeU4UW
	NTykWsW9Jxhb0haiv7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodS-0000000G3tl-2iIe;
	Mon, 02 Nov 2026 09:47:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodN-0000000G3pu-05Pf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:47:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ASGa3440486
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=; b=jSnohwWiUBZ9NtOR
	oHh5Cwu3ngWVSgEcNRLn2xJVxoWzJKvbteDYpb14R2Eg0tJZ5IWHEp5j3q2VOx5b
	kKWIN8wgEFGsoHxjzPvqxMGHmmWqSvP4o7CwVGi798X8CEf4jtxPLl9wC05/a0b3
	wLQacHVo5zMf/nvVzW2Ckp2jBa59W7Wv0dmCyDxDwMqN/jHefWCmZ1ySduX9qc80
	G7gPpSFsGI9iCNHPxGmiifj8qfz1tMFduKIQuuVEmUGRBmtWa8/prA7QWai0nR5A
	rvscJ6qnEwgmaV4uOfsRguvcy5eDdTQnuGWJXXmZZ2jPcfk522OyklBvMPZlyJtD
	ji8rTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201qv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:47:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350173dc7aso7576211cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612839; x=1794217639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=;
        b=gu31fK2C2F7IRD7N39KEG9DTZxPdXUoWm5veJRH5I2TJ/qiK776/p9uLUn1C/YIkaC
         ld8yfjz2Imh8KCYHtPG3KZwo4VdPZ2bVCJDFJMjHSbdj20r0u8CH91S/3pRpVulTpWqk
         f18JivShIxCw30ICyRMty8YF+g2qSdLaueW39qzEgb1LaM2+MWrOtXBALyalqeQxk4dM
         X/CcrPUsqqrBBNZsSc+gvC2RFqliylnDGe9pN9nvuPnYbZBSQXN9RPECk1/zY9UDefMY
         c6SZgwqBQS1U/aFXxNIot82usTFRF8jy6WQN5NkTwFIzZKgYpFGrsCw7Xoi77Yq8c5cE
         JeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612839; x=1794217639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=;
        b=p5KCwLsx6AJJ6aLk7T2sJEiqGNRioS3zwKGxOue8EsVQbOQosV+ooKmlhK8Xnz5Rfs
         saZHaGgmkk+6Hmo8kM3vWirv9toie49q+mwtHFSuSMf3w+SbZ3d8ytah1iijj69HxA9H
         DfMCXObciB97/To4mfoXU4WugCiUjBzk8NjfFdKMmY77Le4DgBqbHTwwRzAzdQTwcNZf
         8OL5vN3AnxCuXUhGBTMiG/yqBkfCMCWisM5bOoYgzUYtDy4U9BB4O6xJ6QZ5DjyVGULS
         X0y6PeNhXK/4p0ARQJAoE9cyoO+Fc399v8Md3pbTWi3pRUxeKVbf7/DscM95SuWScas6
         qg3g==
X-Forwarded-Encrypted: i=1; AKwUvBystNaIfvkTMCz/NbzkS7bZtm3N0VCCs0L1L2cwvDS1+LZF25WJiXfxhi3j6EzA4I/AuWe3nvNqYRxJ3yN/7//C@lists.infradead.org
X-Gm-Message-State: AFq9FYI6Rbh2aImebXvZ8hETF8AFdEu0/loAU0Dg4ei+8L1A5tscdyC2
	iNJRha07Nz8R5R3ARrANX4ze0dm9LPP9mu3kX89hLkZVGpbkyfMzR6S1m2i3Qxe7CdhoO9es57b
	WmBOMnoHTBAfPVx6kZIb4BGY/QZIPILSi1vtO7M6YPZcq2nDdti8ohXPYXfJc4OF4Ds2HlgWFFc
	UwDg==
X-Gm-Gg: AYBFou0ftxxHn+zC2/yOReDFuDwV4dMEKEEn1BgrpJ5Iwg3g1NmWDMPDAAPCuFLvMrm
	1NGrbCz3yoz5S6CkDs3tW9/NJp5d+dbqkD3SZlYXhlQSDvwnM0D1nEe+EzpPQ7zx3Fivbm4x7A+
	IhsKJ0vT1ZRFILPhqFxUchth3deAiTKU3UidXk1PGOo5qnyBmW+efOt+aAtiwdK1yAn/P5ptnhp
	DQ1Ig68bJKNna0u2Bm3kFMiEQt02d9UpYPHOgPMgsmXE2LXrwdaXppV21CF7+lRSFrsE2zPudrJ
	V7iXh1DWI26iKPHRmR5CjgpyQtbIkcsuKPL8TBLabljb0Z9thxcATCAR4mb3ITQfJ2hIfS3kEjZ
	xamCY/45QOd+seXDeuldUGE3teMDlA0GVXweEGakw7hGD95nFw/G/tmCk9C/x3x+utlE6R+k=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707760185a.0.1793612839325;
        Mon, 02 Nov 2026 01:47:19 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707757985a.0.1793612838806;
        Mon, 02 Nov 2026 01:47:18 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee537sm2987089a12.10.2026.11.02.01.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:47:17 -0800 (PST)
Message-ID: <d7a919b1-3a41-415c-9deb-9a0dca8bfa46@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:47:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] iommu/arm-smmu-qcom: Use identity default domains for
 MDP5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gtd2Agazf3_G7_9v9DgRGmFjw34OIqvJ
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae85c28 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UxUOhlBcqau6VQlabQkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Gtd2Agazf3_G7_9v9DgRGmFjw34OIqvJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXydgqpI0r+zZs
 cmb5UNiMsXwleWZduEVSVBBmU3EHh1MruW6xLfQtJ9w8lEfSV7EWL6LxPD0xHowZGNq4EDCaEsi
 5Wm0G4bokY47FYWrY5wFY2svrTzBuOy/ciGaNKeZcr6TsUKyC/OlzAP6eGJDR1Had8krDp7AaUV
 mvc8g/XVIVyMXHliwBIJ8EcmJaoucBLPl51IY16SxXJqd1jZ3NqI7gFrOXQc3+1R71ClcpvLR0S
 EisY1XipGEexB+IgvA73FIQtxa+24/qemc43ThFKSkWUCzsVAH0c/tYosb5cA6kF+si4T9bUgiG
 UC6oM1fo+vI+ADtmROatw3+FX4bRf8yjAbPXc5fG71YkUQWDBSGa2yvQCyp1kKm2dq3QD6BBbXB
 29eZ7QIPtSrp0sTkfZYP4zhJuCoul4y7XhYPNozoA59xWDE+iu2IKWOrC2GgJPNiRobJD+iG89/
 ChN4si2mpS2B6eZyqdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX442ShtXviVfw
 pSM9Jv5jTF7cRgJReg5SZmQwGH0/TElHoh3z8zi6+9RjkP66eD0wNZwJF45cLcmRH+xfDtTewzh
 6gIzmMIbXpWB+6nQzr0mJx4CssqpDgA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014721_190119_9B979E34 
X-CRM114-Status: GOOD (  15.92  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 11:04 PM, Dmitry Baryshkov wrote:
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. On MDP5 platforms the DRM
> device is the "qcom,mdp5" node, which is missing from the client list,
> and the msm8996 MMSS SMMUs have no qcom impl at all, so the device gets
> iommu-dma. On db820c the SoC then resets as soon as the GPU starts.
> 
> Add "qcom,mdp5" to the list, which also covers sdm630/660, and give
> msm8996 an impl with just def_domain_type, keeping the bypass emulation
> out of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

