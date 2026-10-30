Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65016606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 22:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o4w3Nnmq;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URwG/Yit;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlFhesE2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z+fyA1uTF8l0hawKrmxS3cSFozenWUmVe0swEtjJgBo=; b=o4w3NnmqoHDM+yBv58aIUJDAa1
	TJjOpIS/T6dUDMPnBh87apSFFf+D+f6cSn0gLy7bTRVG3UMS5V+K6iK4hnjS0QvLuAM+KAaAU0LGY
	mdF1phlhXxZqypHrZXEZ49TgtAJ3yAdHjflOCC2SkNFKSILbDubcaJx1NZsExokrMImy6C7Jt1FlP
	Ltg0ApzZ7xcFtMqggBsHsddOCTyHWxa1xXJUfiZzT4Yh/+FqiIHnnvL6NOPNu8n++pjckQ15+/71l
	eyIe3jLtanv65coNcgFt19pvI7dlAG57r78yelc7vqx1c+ew3b/3ir59VAnd62T68+eQ1Cbvqo6yt
	KGffSUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuiy-0000000CeWY-1rqX;
	Fri, 30 Oct 2026 22:05:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuiv-0000000CeVs-3tJa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 22:05:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtYcH336744
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 22:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z+fyA1uTF8l0hawKrmxS3c
	SFozenWUmVe0swEtjJgBo=; b=URwG/YitOWgw2Cd6X9piaQbXrbCLMbwGRR0imJ
	OMUFop06EP8Tr1TFLK9Ow/SkKwFxSWAp6u2OvFYTkxN5b7LtBG6W4XS8gIEOnoe1
	VxR3uJOm4VTHaq5OwyqwyNs8hUZJRNcfNlo8n1s4u9PC5PmKWlwuykgKksDM0i2O
	C59D5vgj3j9dyXEEuhg6Lm+xPBy5djdkicnCelV34LifVJyN5Z/dxHgttePHzGp7
	/ejqtDku2znvofM/fDQvPS3HZ8OKG9E7k0DiBC9aa/vyPkBgA0qyQmrqcfWlS4FJ
	/9VWFOGVx0Li+482EvV4+BQJvxftsWrxwZd6BRO9xpgnllOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x007a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 22:05:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so301365085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 15:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397919; x=1794002719; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z+fyA1uTF8l0hawKrmxS3cSFozenWUmVe0swEtjJgBo=;
        b=FlFhesE2qIa+UM3HJEeP6sfMXLIZHizeB2B7aa/GTXHup56lc9ChyOLbWZEBRFCkDw
         MUQwY+4gq63mFAqnXdzPBAtnTxbqtqBDFpZaLIZXdryDFZPIi5IYTTCQ5+4+rCV7AB7N
         6pQTe4iggsxR9V/B/z+l802IG9dCi2mHrC5BuF3NXoel70X0FtBRV+bBrS7qCrhgqtrJ
         ozMp7zfLRFV/2eZx91dTsOuHz+tpYMpw3Wck3Jlc1ddFMJxUr9ozz1w88F+cu31xeAhf
         jE+DZVpfsHx2UQdR1Hbe4mjG3RKUtSST348mJM3svI87H0IVnOJtLxTcuLZwCUM5t2kj
         sQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397919; x=1794002719;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z+fyA1uTF8l0hawKrmxS3cSFozenWUmVe0swEtjJgBo=;
        b=H7cSJ93Qm0fYNw5bPGdd2lRWRHu4zWiurwzI8lusiA/B72NBQ50ldRzTvsjYOrgr8l
         U9AEBx6wdFVff9ilRps1CSoUFAC0k6UpRmUj2ke8GlwWVXKF9B1hbxIXMuEzZiJLkC4p
         Mj8fRL4Gq01wb9pSKY3YVOd8/clbk09lOBZWTc4ha5NP/l7oq6/b5kKMZfZQWsAtpG3h
         O0gETn9xDlXBd0+/BdDJgnjOTYgW/d23tuKFhzEMw9b+PBmfj7ZgCpvvfZoqJKrU9fX5
         LDKwqSPygQTMzmrLVC8Owj5UEk4BrD0d9Lz5zqcZbn4i0X7pLcfXBfvljHUo9fuhIH0j
         APHw==
X-Forwarded-Encrypted: i=1; AKwUvByQJi+AHAZkVqgPSsq56n3+wZ/RYZ50yDOIpSuKwvRUO91z4KJa4gKIpCWQN7qiHsVrZDtnEep7bez5z6dwxfN4@lists.infradead.org
X-Gm-Message-State: AFq9FYJOIUaM7ZfrunWOkJt8/3R5bQ8D6aDw2TjUQIci2BG8yTac7nkU
	Gzvqb9QHaFkCk0VvXn2yPFT6Whx5XvrXKdj2bskKydJE9wXnNV+6IEPNlxe6UYBkavEakXe78Wf
	fznuDZZ4z0LKgy0/2Azk5yek0WYpQqpt/l4tG3Q87z5/ZNzUqjFawkveagl+VldTw4HKQiCHrOc
	YwAQ==
X-Gm-Gg: AYBFou196KjllIslUo+m83QAJtgFZ/XGyLGAuEPGTHs5Ra6x3j19qh6USQSqfe0lrr9
	zGq9GWBFWNOD3k7QvvbJcKHLJKoZxBbmG7gEmTbzjH9BlLUgTauv8NlkekB0M62TQBBsoGA3J5y
	YxXcm9k/9exMjgo3iipAcTefU+7F4NbSCKbhV8o/m0LwiR/UB/kzt4HO9RvWR2+sYekRho9Hp0A
	h5b30LoCulxiShOhzt7vZzMxvKqmZn6TECUiXppbL6ONZVaGYS8PRH7bsP3+sp+f2XUlbTHPFLc
	dZNZ8P/+FZdZFg4W8PWkkXZJXJy51lWyKgG7MA67DzwE+s0lOYzfRSxmlo1CwkLxdxVB3CNVxje
	1C69NQthZnHsqFlIqA2ec1a6TdthvRlhLxnhw+DJ34ORNukWl0VJBy1+jqgTmFuiUHp/g7ic5wX
	RjaHIGUtE1DX55yt4aSyh2NaX8TvbS6c5yM3dMZa3JWMS/Z5qXJpYbdveWhuyqzA==
X-Received: by 2002:a05:620a:458b:b0:93f:22c4:e92f with SMTP id af79cd13be357-944216ecc93mr652556685a.54.1793397919363;
        Fri, 30 Oct 2026 15:05:19 -0700 (PDT)
X-Received: by 2002:a05:620a:458b:b0:93f:22c4:e92f with SMTP id af79cd13be357-944216ecc93mr652550985a.54.1793397918641;
        Fri, 30 Oct 2026 15:05:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
Date: Sat, 31 Oct 2026 00:04:56 +0200
Message-Id: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgU5WoC/yXMQQ5AMBCF4avIrDWpTmLhKmKBDkbSkk4JEXdXL
 L+XvP8CocAkUGUXBNpZePEJRZ5BP7V+JMU2GYw2ZaFRKydOiXNb2slHjqcqB9siGtQGO0i/NdD
 Ax9esm9+ydTP18Q3BfT9N7o4edQAAAA==
X-Change-ID: 20261030-msm-smmu-identity-6fda3323023b
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yRLg7HFVIyBpDR1OudfdDaicEhcnc5ii023H/+Rvg+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSLiBe70SPTpeJOfW582KU9YTC3tfcH16yAM
 9Ay3jDbaS6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUiwAKCRCLPIo+Aiko
 1XNmB/48FlBo5pNt8rsh2B3HNo35GC7dxYk/u+vNhivR7uRs0eE3PGoU8MvUBLnezpGw9Z6ygne
 8gQCqmsIfSQdJT8aYPoDBbYEvPTQXRlYfC3okuKkr8nrfLFiBrRg1ZvzzqQUdXZHpqfKysS3v28
 QYfEX8y72T16sW3zqsBkm7A9YUzGsdHuj8DKrilgsp3VKj8dS2ZpAt1KMbEomG+aewszvZTp1ig
 mtx6JrKjdo2Hy3DWCN+bAI0d08E2KISyzSM3dUrOG0VslIJVePvGyou7qbhflh6iSkQc0fdwVTn
 K7qHqaBr9vv+X3H4G2q5zC3gYc01ZT6XOSphcu6+nESFJZtj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX7qVgTRtLzxCU
 qBBj/V3wntVpmim3iEt8LJXrE9A0Q9Ui/BvXijDGGZIvaEtXVXZ19VgyNkQpr2X9+9PZmdUW9GN
 vmgpyQ60C8PmRphlhNMiYD7tT6p3vEnQ+UuZqiJR4x9aSpfde5CwrztAj1lsJw1BbjfB0hYV1pF
 mlKocbJXROBmS4an+LNYxLkc5yJiblsWFrBHl5lrLpJinUxqu1Evrwk/GnIKsn59dS1QSFQ8OpI
 J+n1obg3FnYx6CaT3mzmCQj7/NDja0BGT1Vm094TyIOPN/psAnAhTaWFSWYkAA7m2JzjGwR8al0
 X2p/VaAlHcs1pvNaCNPhvHW40ociuCMh8sZhCa2qigjOyYL6LroZIx5FwTlBlGE1IUOMrxopSQ5
 D+sZZL/LbRjXOqLo6hs6RI8jud6up2AnvzxO9kQfPBTxWt6IvIwPupk8ScYZDlyBDotCKKIrcNF
 dIz+UniDl7Igkvr5Wnw==
X-Proofpoint-GUID: W239j7G446G7zMRTPpa5Z9_VmG8ILo1B
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae514a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rHzMYdhUTImRmf5BPDcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: W239j7G446G7zMRTPpa5Z9_VmG8ILo1B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX5PmbP/I1XM4i
 YG3RQQpFrOXWlYx29tr0OFekbp6IDgT3qf9vTaEj9UXSJpa/oD12LG0AQ2fkEt30mpRuQhaBeh1
 0PURyA7FuMiMI2iJ8OB6Sga5KjNzj30=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_150522_089426_C5C1C717 
X-CRM114-Status: GOOD (  14.30  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rob's drm/msm series [1] writes the addresses dma_map_sgtable() returns
for the DRM device into the GPU and display page tables, so they have to
be physical addresses, i.e. the device must not use iommu-dma. On DPU
platforms that holds, the DRM device has no iommus of its own. On MDP5
platforms it is the MDP5 device, which ends up with iommu-dma: the GPU
then fails to start on db410c and sda660 and resets db820c. The last
two patches give it an identity default domain in qcom_iommu and
arm-smmu-qcom.

The first patch fixes qcom_iommu's flush_iotlb_all, which never
invalidated the TLB. Nothing relies on it today, but the series above
does, hence no Fixes tag.

The patches are independent of [1] and a no-op for the current drm/msm,
but have to land before it. Tested on top of [1] on db410c, db820c and
IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
control.

[1] https://lore.kernel.org/r/20261027230452.130031-1-robin.clark@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      iommu/qcom: Invalidate the TLB in flush_iotlb_all
      iommu/qcom: Use identity default domains for the MSM GPU and display
      iommu/arm-smmu-qcom: Use identity default domains for MDP5

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  7 ++++++-
 drivers/iommu/arm/arm-smmu/qcom_iommu.c    | 26 ++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 3 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261030-msm-smmu-identity-6fda3323023b

Best regards,
--  
With best wishes
Dmitry


