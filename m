Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7506606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aho2ptLL;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmlqFbrV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DTShVfET
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+xV1RGjg5KU41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=; b=aho2ptLLVBlq6E
	UrnD0gt8K5vQ/NHpZmmvapngs6W49ZhnUcEC9ePdGmEIsQV2TlMnjGf9Q89Hnd3HgYFMEQ5VXW1yq
	Wm76L6bgLpLgVXkSHXHynxodo471b6RgLFe+8YR7MdfgXT+Ersvrbncz+cNVBbppNIKHRYZdxKegs
	ei9c8Fah7Z7EXqfkoHfp/lXKwIfT3RTl0KrHNWh8LrokZhlVY4Lpkhbsye4m4u+RB3JASOtzYKc76
	UYR/wEGjTMMp9lkUoOFxarsXFNFmfn0NYiKVXX0qka8LSYLwz8mrgwDi7BrqpSlfempRbRbvWhrlF
	JR4rmJxkB/vrXJZbIPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRj-00000009tSh-19Q8;
	Thu, 29 Oct 2026 16:57:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRa-00000009tJI-3kY6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:57:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGF4mY053042
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+xV1RGjg5KU
	41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=; b=mmlqFbrVGnojNptRIp2Y0FfR73/
	wVV/o5gTl0sCSMYCHjuF3Dx6l0i5+dOf8jR6p65QP1QMFMPWqGx0EMXVgd6dbauH
	gdakoBqo/m9dYUGh5xACXlDUC4wCrqj39o2uJq7laJlMZUyh7kOcGa0InIpCK165
	6WlNbRcScA8H2Sjc/YpxU4HfKK8QEXNqvo77ljPo43uBpqhXz5cAhR9QkF4qQxMX
	5svf28nfmCH6fqPn7+p8M49RKPZmG7OQ7HilRO3lwccPNt/JQ28mwIbGboEUWZDF
	xEd7ajB1dSy8HHKOBP6FSUd4j8X9GrXE2IGybfIwRnCbmvDY8UBT9I6lL5g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nc62d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:57:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99063f4065eso564365241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293057; x=1793897857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xV1RGjg5KU41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=;
        b=DTShVfETqXyGoeqV9ZWZ7pqE0GUdmmAWSY6OxQUdYCoNJ3rsxHZcMer+42UdgPTuxQ
         kyT1ce88dPY0WPXYMgC0xdqdc8/G4lMWYATtlkOd0ydPTkSz3MpaPJhqleT39HobHl9l
         rm3Eo2DdTNgW+tafgzPIYI/V4q9aDAor6XC4yK4LjaixElh6CM99dDEkhg1Z51i5ecVE
         wQ3B+sgOQMfQ8Msh27OhLCkAEN3T+MS+zl3q9zB3gMNMSHnmqFZSzwx1MrMkrjo+EjcA
         /sVH8i1VgN/YiPBrTiW189XlqrJd70F7kYbJbGTk0GdiKCZm6TepRQcqGXOhLjfyj5NX
         csGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293057; x=1793897857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+xV1RGjg5KU41r+LCzwCOMC6Im+qEpwWkzwUNymeeJg=;
        b=rbpctD1C1YjVSNfBH/tIHM8lk2CnJ1ZMENH0ywAEe7OjU7qrjRDY1ZJx8rmFxRpPNJ
         sxGNt6QJ5QETWPuCFme12qiYd67CtGnhGI+T4IXbz0OsgXepiga59DnYMsTtpOiuQwlM
         7eDtq8e2iaHfxpVaNG64RWUdqqCb9A8vUub2xKJedYZOP54y9AKp1jYfPEEvNcV2h/Na
         FBA+d8zokoOC1Mruxj2GJ9vt5Q00i+nNfADeGYNPF4PGjoMoB+Q8haoCEJbStpzlkjz9
         LDihX2dd8kfPlgTRJdl/P+wGDod1pcwiaGDs+QyyhwYbasEMNvk99ntxRX+Y1+ghQE1W
         C9jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhK1i8enymMN0nLdpCHsZNqyVuQxq35PcPKDSWM3WX0d/RTPArwLnIarbj9V7GiFev4YTIeU+3og1edk4ENQv2@lists.infradead.org
X-Gm-Message-State: AFq9FYJKQZbsEN5sLVTq962UFIxhdDRX9nozX/JtEaDbhfFOYwAK1hQ8
	+J7j1Yu+GZHW1GX73xsr5ITafJid0w76VGyQkSj+uRbOLJIeSV1yqu+B1UfyVyJrPKIjCraiwt8
	tLVAlzevg+v/rmIh5zn+01zxEhKFxlXkCv6EqJ7UMzUGp9+ulKF5Vb/sfhFayeBRJapZn3H5ftm
	4R0A==
X-Gm-Gg: AYBFou3RqQ/R2iU83g7Ql+rVccRTGubmS1tW6L94WDCta463oSHe/HZnaSJDvr7MbGB
	ARsEfB5dI0e9eOvgKNG++1a5gw4Yi7lbpCPxkG1VmgSQ7VHoVbNz1J27z84+dCQODfVi9bGHkVz
	ddDJS7bJvKp3uyBlfXIltV1YQ0kat93vB1kwJUTAP6gWIL1RIkOVv87S1Xy3mrB5vKA/jA+ikXT
	tLWKOWrvTV7XygnhM7fAzz+bWoQeUR6Wf5jMW7vZvif6mUIPagkWxcqMReH6DUKzCcz4eOW8Fke
	5kNkIv041EIgj590T2MYSnJ0uy5cFZ6RTrFndwuhbBt9/K6j9b/gmrVS0HZB9fSi6EF6tgmILAs
	guRpwK0sqwqcbJ0IPmxU0FWHMWwX4wBqyhcPubHllR2+VmAba+3ZintQVaelLpF1fb17+/0xSV2
	Mt
X-Received: by 2002:a05:6102:1483:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d03a4bec64mr3117848137.13.1793293057012;
        Thu, 29 Oct 2026 09:57:37 -0700 (PDT)
X-Received: by 2002:a05:6102:1483:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d03a4bec64mr3117824137.13.1793293056511;
        Thu, 29 Oct 2026 09:57:36 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:35 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 3/6] powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
Date: Thu, 29 Oct 2026 17:56:47 +0100
Message-ID: <141ad25a137cb50516bd92f9a13dda7ec940f6da.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -7Mhyh6-mOHdFnE2g3P6JmFn-iLHnyuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfXwSK4+NpQ7QVh
 M5pSQSptW36pujQEHEYvwXgZjpGUIMffGas6q8cxaP2ldR+61hxfBSFbjaG1jKg/uPg4BeXCEOm
 9YvR3t9LG8Bq248XMib+lGdODsllQ3FwADiKqYR2Q5m7v50tZrRTzZ2Q11GkKFAGPMVXD7QJiup
 7c60HCH9VWiGgec5XmnqL6u/pEMFQt2elHf9PKGp0OM2PVYDE7c2vX3KbdhmhqOLMiEguibiLlv
 Blqen/OPJ8xsp14AOKaB/3F49QCrBnImscNEU3HAdJLTy6zpF0byMJBo6m9UlXTliJ1VDYCYXcN
 cRDLxpA5anCut/Jv25MR9sdipURzP21tQ/8zvYUaDR24cDd1ZNt/LALhW8GJUmQy7jF0ciVAlZA
 2RO0ff3OMMyHKbQg3X11Dg+ozDWxEK6qsf1AAwQWnjuS6ndHDi0xwQy3sdo7hhJPC+TzuaJIl9R
 DjImBPNdtr6hh8NucIg==
X-Proofpoint-GUID: -7Mhyh6-mOHdFnE2g3P6JmFn-iLHnyuK
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae37b02 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=EpzjDTW3ywHV2UopgxgA:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfXwqhTUFJjSwOU
 AeN03Hxxr8Nne45ntJImP1ecuVRs5Y3daUlAII4PiEh87t5ybvmvWYpymoSMDVyGhC95KGdvVgy
 M0BlmWsQMPphqoODO9jzuu1ZyFRubEI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095738_974688_5512CD4C 
X-CRM114-Status: GOOD (  17.13  )
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

The DTPM CPU backend registers one powercap zone per cpufreq policy,
not per CPU. On RK3399, CPUs sharing the same cpufreq policy therefore
map to the same DTPM zone.

Remove the redundant CPU nodes from the RK3399 hierarchy and keep only
one CPU node per cpufreq policy. The backend already suppresses duplicate
registration through its per-CPU state, so the removed entries are
redundant descriptions of the same zones. Keep both CPU policy domains
and the GPU in the hierarchy, preparing for one created zone per generic
hierarchy node.

Also fix indentation in the Rockchip device match table.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix Rockchip match-table indentation here rather than in patch 1.
- Clarify that the existing backend suppresses duplicate registration.

 drivers/soc/rockchip/dtpm.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index b36d4f752c30..e71f315fbb6b 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -20,30 +20,18 @@ static struct dtpm_node __initdata rk3399_hierarchy[] = {
 	[2] = { .name = "/cpus/cpu@0",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[3] = { .name = "/cpus/cpu@1",
+	[3] = { .name = "/cpus/cpu@100",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[4] = { .name = "/cpus/cpu@2",
+	[4] = { .name = "/gpu@ff9a0000",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[5] = { .name = "/cpus/cpu@3",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[6] = { .name = "/cpus/cpu@100",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[7] = { .name = "/cpus/cpu@101",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[8] = { .name = "/gpu@ff9a0000",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[9] = { /* sentinel */ }
+	[5] = { /* sentinel */ }
 };
 
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
-        { .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
-        {},
+	{ .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
+	{},
 };
 
 static int __init rockchip_dtpm_init(void)
-- 
2.43.0


