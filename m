Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FA606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ImC6e7l3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0jxRsf6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHpRGzmC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=; b=ImC6e7l32nUV8o
	+PWcaKW4OGf2jj+armd0e90AXnzcGL0Es+v6BRKXw9yRU8GNvuD2XQgAAJBbRu6SmviGRj9k56zeh
	2tIqqmV3aIwuhdy9DipYUqcipz/miQyhNLssHN9YzFjbi3gZZwcYFSm4ZTXm8+auv72RvK2J+9X8c
	pfma0nQhBNn2PYcmQa0bP+RPNqUMBJ7hifHuJ5XN5jdjijrt5NdykUE4r5q3Epw5dru9JK1l7cO18
	oJtS98asibb/XPiK1+5GTEQjzzWkwPYbO79f5dTwTXV3sxJpEJFlS3tHUeRiqc2ZQe6sz7BlirhWW
	Q4Zwowztn4u5Xvn2m86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNois-0000000G5pC-05vq;
	Mon, 02 Nov 2026 09:53:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoip-0000000G5o0-2JMW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:53:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A9Aa3403350
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=; b=A0jxRsf6GUjEBSyj
	NvAXNYXryBlm8tFkVuBHt0ZA/6r9VkWTV0G5oSYAf/GxFxVWMgZ9wkX2L4GU/09R
	FgcDx2rijX+Q1e4woKw/gN1AuBGu59l2RHrGzUdAmii27pmHlDg5yIImySEo1eKo
	yIeKqdwlbRKi/7JERV2o7QsJj2OAc58hR80VpuqV4kVxZDIZsqHLbpXxBLAP7E4u
	jAMWET0satj3a5D4U4+jaSGia/RtNpU/0QuTFYQEtxY8aHZN4XxUanzRL4rQPk8j
	K3/Oa2IpiYFHqfp/KZXf4nPXBK8nJQm5BmC0a5XJn/rk9IU67Jurew09TnPA8P2p
	fee9mg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8h85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:52:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7fe5576bso20010676d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613178; x=1794217978; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=;
        b=IHpRGzmCxOAgpIpvrtJ72XI1WY2UQ1HNfz0nThSWEDddGqKszo4rJRie/dBYnAR7Di
         Q382AqAYUpmhvI4wleH80FNBhktL+CSkiWWmImS0pDQwk036Tlb2/z7dlhuGJErsV0eU
         Qvp4OBMFmyU0hhg9q64etVZgJzaklZY4REHGhwAOYome17sZSo+97ikCYp0DACVVwf6P
         X+6RkLQbtpFumTN1pRy7a2wUs/OJfX+Nmu1WeACQa0sDg/1uFNbu3S1fD5Hjw4GrMhRc
         5DcC7S3h+E4Dj4ETqSK72NHtSpoUdhY/nItEiwOM0iEoxMP6iK5lsLMx7RS9GxQ4nj+A
         6JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613178; x=1794217978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=;
        b=SWgpgTVMlBNszCJmWGigY1dU/bwKFs4mfGoQFyysFWTW57FO4+7Qma2jvLV+dzDX8o
         r82A+8QPLFSRCUudQwDPTZP7uoPX5CbIz57fdKUsjdXo4yAr3+kfOzKs23g74JSRSYK1
         R1PzV2p22GmO6ZwinURNYgQigqn3AS6mEol5gK+pRS/9e/07yU0aAfuiia5OVl81VAk2
         1j3ibLqIFpny6a001LKDpaiIcEyYMtfFYLGRKmToGyckyDxJJVyhliJA+USLvq6iebbJ
         AbLc9NDhbhv2yKli4k/oSxWkHGiJ0z+2vVyYF7y9DR7/EEQ0ydHdIvLW3kKSW4ydyyGp
         j88w==
X-Forwarded-Encrypted: i=1; AKwUvBwIw5yrDS7gDCIl72/x9dSIVv3Y+u7YZN3/YloxZJfyoU04GdcKurjc9bg3bMArNvtqGrtItoTkgavLo+8hKT0Q@lists.infradead.org
X-Gm-Message-State: AFq9FYLZGSkP4Ze92FCdSZpEqp/9IGef4bTbTWdQBVyOHzHJtAmYVDAg
	KCuQ32h+zgJyjxKJAokCcdNGFezKgrXYFsmJNKV7XDdKpwsnifKfb3V0TCDZmdPMSoi/P4rztXs
	mEs2B9QH2cJxnvUiyrhDLkaVn9LrtNrz/yKYt2D30RCuUQnfVf7gzAUUQOK3iVH7thOzfrNylt0
	nKng==
X-Gm-Gg: AYBFou1NkPXae6bGxuVigSFvFGkBUrugPXGTLMAKKK94Lc5lkDn/ClzsL1Tqmlx7UXc
	gTDZGuK9JPswv8PRizsWOHq00n0xcOqQpJAuXaw+jeCBbA2l5foUBfGfELCOSfdhGHXX5mQJWVK
	X1aCPwQ+PAGa4BRQtBWhQKQCU76mXqta03HOId3Ko0vxJJ9WgM2z4JvNuPb2pEj+3e6Ospl+Wz0
	/IMg7+UxD8T/B//3caPknk44+fzEZdjhrJB1Og9mar3Ww/kpyoGiAtX8bboMMv7hZMSCWOWn9jl
	BG1CHLr47OqY04qBFPjiq7LJlm+EaEk6cJ0H/JGJI2bRoRUuwrBm6ZPXu4bttrz465j6FMoADuJ
	LFHiGgpc5WY/KqujuNlQZcIYmsfSVg2OfJvQq1ECLbL5BzQDC/jFsnW2uvvzf5AUlfIUkX/o=
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1483716285a.4.1793613178169;
        Mon, 02 Nov 2026 01:52:58 -0800 (PST)
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1483714285a.4.1793613177588;
        Mon, 02 Nov 2026 01:52:57 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ec5sm364558866b.12.2026.11.02.01.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:52:56 -0800 (PST)
Message-ID: <c8810f27-8a44-4ac0-9c93-274894eced61@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:52:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae85d7b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1ACtxsPTqu74CH8WC9UA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX5GpSQ3HC5owJ
 K+KCA1+AE3eUeapxIAisCXdTuwkTrdzqxxCJIXCd3Tt6IFgrECur+75TUAwJSLhC/FFNSAH+h2t
 f8v7i1U5FxxjAkqO3A5CdbHad+NvlDmcGIbF5uw29f1jDRNVmfH/ECWL4JTXjc+CSnodq+ghRcQ
 d5voWOk3ryLZrGpezCS9kpcFBLY2k0+A0SeazNIrxExahv2KADE89Yx+KZHf6g15rHPG3L4K/Qf
 f/VfGe307nBycAEBP7o+iu4ppreXlH0w4uznSqCnDITrC1qeoWm67EDN379XBnNSci/o7jm8Htr
 53fWSkdSg1v+3qyRG9Ef0jJDi8cAmBx9AxJ0SGs/IbW1TwG1ewN0138ffcnQNOQ+NZNM+7oMg+G
 Xhz8VPBN0Eol6DxZxEw3ryuQuThgFDEcn3/tL7L7Oy03DE90zGKYzZWcK+vLoQPhnXgSOVGUM5y
 ySeDLMLV51DEOoMbGyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX/UGxxpHmKT6f
 67UuYAV6uq+dRO1oUVU0LiJWqp4vcHoPtLrjZUHykUzX8DBZqxM7TvhHDK85vvNS7JHtEf1skkQ
 tUTCzVMRKOttuzHSiViwsfklWcYKxtA=
X-Proofpoint-ORIG-GUID: R462Iq8BoddJfJI5uSC14tpRlwCVN9ir
X-Proofpoint-GUID: R462Iq8BoddJfJI5uSC14tpRlwCVN9ir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_015259_607133_8B4CDFA0 
X-CRM114-Status: GOOD (  12.58  )
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
> qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
> invalidates anything. iommu_unmap() users do not notice, since
> io-pgtable invalidates each page through the gather, but drm/msm unmaps
> with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
> hangs on stale TLB entries as soon as another process reuses the IOVAs.
> 
> Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
> plain sync.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

