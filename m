Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9D2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w97N7909;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juhMW/ei;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RR/1+IXm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxkoluFqXzQ=; b=w97N7909oIY+qSd+GumZBLs62H
	yEnHg2gjFjGcxx/4WbsSq65V7JXXgDsTkHM1f+p0FxSTb+OBKeDVyGtFymm4P0Nz1hQ/1dxE0ICTP
	9lUl8yf3vWcf7EjZpNxIYcCoXIZ8duEnFisHy0sry5JiULSXc5F3J0BTC9agikcCThoHo1569ea7m
	K7fA6Axep4dMBnrmtxUAVsxP+WxzpE8kziP0fhLoMyFJO3sw9rWNo6BA6emSyvEez0l8vwa4J8ag7
	XaGRWs73FcOABZbPaytUnl/YBbJa34/aEnAY8U8rwjkkx1bKvniei1U/LN/VKvN5ln2D+MqYA9V1b
	WMARhSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXbG-0000000APGH-1DFI;
	Thu, 29 Oct 2026 21:23:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXbD-0000000APFA-3NT5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:23:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjx6x1708213
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 21:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxk
	oluFqXzQ=; b=juhMW/ei599lYu0rJJYdPUNl7t3bA3+SKsV6j+954pbIu9Kj8eo
	Ciq6ohXOGQyAPNBqf8lCxt/sacTHwRTKTNXkZNYYxoLNqGU2wXydcw5IfxE5okHQ
	i0TPywtx/1Xb68BcgkEK5yA2AI8qMzmx3aumAVh3Z4wkXXMP+rGEg/KRsidyTFft
	Fcf6UooKpooD7wFPR0cEkiJSd6y+Tpgk+1c4eIaCGIjQvtiHKrBTDCo90B6F+YqG
	UoolplzT5fO0tfB6L7v4GIwI+yMuu6X54xZvT22B6coCxhlq7x0INmtrxg9y9NB/
	gIQ54PYY1jalU8w/LKiZtcQlO0pu+2snuTA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76ckd5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 21:23:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso26148a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309029; x=1793913829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxkoluFqXzQ=;
        b=RR/1+IXmcVYLIMYWrKXUe2CWHXHprISgKxwGpreX61ffudBN2R8RNzEEpp8V5Wenx7
         xYQl/7fcJgSuG4SSuKUulLQdMsTJcOcQd5snmvaAkhXPZ/um6LFAJAUSsmbvecJ7gtav
         T3G+fmbpj+qWkcXqJwW7zUM3ZtJxtJ2g4PDND/nVJp2UBI9vfWtguas+bgR2dqnV8SAw
         yEs20xvH3vap5IRDguU3yWi23fsMlOiGpiS1oUIDViJ8BrsrI2Ptkzl+ZUMhixLQCCkc
         FFbf/TgwTCArm1dNsSBmBUppU7Tsym3FBczv6NEIc7uR0yXDYFrpp0Kj9bMzMX8RIcpf
         TTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309029; x=1793913829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxkoluFqXzQ=;
        b=UVN4CGNDXfzL0+3IupO0+Il3LcsrzGER9cuW6cIhTpZko5kl7mkJVSen/pK8FEIcj1
         bsBvKRhp4Jhk2TZFR2LpfWJ/y9Rey0IYAuUGDflLSiVi5HTIPkA6H9oTvcnugTqpdXi/
         Cz7bSmar0Xgijc82x2TmaOslcUuhke8fZ2RkDV62S4xXRWdfaig184SefhXRTGENFqa2
         mvsFWx0emuU3Zd6EePMmTClLnzQqBeIPsFsa6IVFqSFovOe2J8AhWjOZsqykkvf1L84h
         p6e2uHMMErCp2ouOMwlGDNQOKZzZ6oQAIIOA2NC9Q5fV83wy0tc09h2tOJafxjEL1aJG
         0YRw==
X-Forwarded-Encrypted: i=1; AKwUvBwpr3zgo0vImOs7Z1RKFtUOAeh4Ml6Duxz3NtJLeekzPhYW30Lf8sqYNKkj3dkkhR3zQN2bgBRsp+HcPp5Y6RD8@lists.infradead.org
X-Gm-Message-State: AFq9FYLdMEGEWHLlGVx04VBhhUiWM+1EyikGou7t3X4xLUHQCAxsy7YX
	s2PNNZtQUskNLUE5GQ3zH0HITpwVoMi3Kf/ypOYd9WrWAeXJRUx34QDcWXrRlU4tQCpwrq6hOhD
	7Hm3KFRy/jSWu7oz4yrpXMp+p5nzFcmriyKB7uhBMLvyG6eSptSUX/FNgOr6DfjxG9vl5wTd9ny
	jLVw==
X-Gm-Gg: AYBFou2WS5cjjHnN1mSbD5bjfS2Dlfz0LDmVZPog8Lw0xCSEzOXa819ryvw6Xo//ALj
	IY3npBtTBDWLEOQsQNeR8HB0GJ7nEwcU7mAWw8vYK5kq7hRJZ2ej8WBtsvFOWmvsncix8f0Qo1b
	0N8TRZohKF+0PwuE0rhtAA68npnR0vgCJSLigijWhuLMJFnF3H5L7iPBSs1UE6U+fclifbcNTxC
	Xe5p04cq1Nfl/dRO+GZbxHyLBEnBScgN6xfF00yY6hT6wF44li9g+ELk3789KL8iM75F4SK3oYD
	cp3n7C0wDbqPEWT9G9x+nDcWUdNw/06QdkoSodzIwUr0nFyJ2PIJBkbkxH5y/jIFXhVBSMmXB8U
	C+MyodbAOOFqL9Vr6Q4W3GEa+/N05CMKneKFnGl74GHSGLYYI2K0z2j56LJPul6Ex/eR554E+OX
	7xJ2Vwrya68GEwEZqcQAszHQ==
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr175456a91.37.1793309028748;
        Thu, 29 Oct 2026 14:23:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr175434a91.37.1793309028255;
        Thu, 29 Oct 2026 14:23:48 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm5559785a91.14.2026.10.29.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:23:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH 0/2] iommu/qcom+msm: Use identity domain for display/GPU
Date: Thu, 29 Oct 2026 14:23:41 -0700
Message-ID: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3uAwUPVAH-Imvuxe9xf_67bFkc3NaqeX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfXyf/A2F9nE9uQ
 +KJB8bSbW4AwAVmRZt3r43YFOI1TsWbI5nWHwPyNJGttG83ohQN23U2opVskKdf47z86AkdIgLO
 Wh2rpxVRj7QLNXVdAm77tZlnRca5aVDc37eka1mkjpuEtXpeCSH16SFtuFsop9UjrtfHoRdaeSi
 GWgQHbMaqYEoxIsSBnJdRja9ojHhfOaSdMId0MEfBGd8UXWROSb2qyRwaldW0387gsByhmVSW8a
 TDQZRtX4Y5Z6s/xnhetYB+8R8JSKOJinwIJdB43f1Af+TTucyLmHBKoWykR6Lg7yJ2+4lce9zK+
 ncCOFsBNJc8ka/Xe5u/C6dnDm5AdPBgVc2eEmdNipzR3BmegxF/9Z5t/PU8pRGCprkRugZ5oshj
 Pk9hqtpYoow5oWHfYXCARxDKUCRv6z68TF/68fpPKbhvrPsRCxc3tt+BhB+l9OhaTQIwjnMxpnJ
 cNb/w1rqXCUBdKIKqPA==
X-Proofpoint-GUID: 3uAwUPVAH-Imvuxe9xf_67bFkc3NaqeX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX0Y9WV4RUgEVM
 A+MZuuGZzWg2hn1pSoPDLf8IBKxzDn3gDJ5b4Ig9Wx9XkOFwJFqdB3ySrU4ubXbK4g/UVhXTTmY
 7Th1//f7Axnrcy8lRBxLugfwmFJBWoY=
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae3b965 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=wtkIETcKxqgH55doulAA:9 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142351_990479_E92FC08C 
X-CRM114-Status: GOOD (  12.74  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Similar to what is already done in arm-smmu-qcom, match display and GPU
compatible strings to pick identity domain type for them.

So far, we have an "evil twin" domain kicking around after drm/msm
attaches it's own domain.  Until now, that has been relatively harmless.
But it becomes a problem with [1] when we start using sg_dma_len()/
sg_dma_address() for setting up mappings.  Which is required to avoid
problems with CONFIG_DMABUF_DEBUG (dma_buf_wrap_sg_table()).

The first patch is at least compile tested.. msm_iommu seems to be
armv7-only.

If there are devices with bootloader splash, we may also need some
work on qcom_iommu_identity_attach() and/or msm_iommu_identity_attach()
to put the context bank into bypass instead of disabling it?  Not sure,
but that is probably going to require someone with such hardware at
hand.

[1] https://patchwork.freedesktop.org/series/175619/

Rob Clark (2):
  iommu/qcom: Use identity domain for GPU and display
  iommu/msm: Use identity domain for GPU and display

 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 18 ++++++++++++++++++
 drivers/iommu/msm_iommu.c               | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.56.0


