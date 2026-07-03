Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED9EC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKmEECCpKZlenl1lu2ey6k/TGjzaNnTRnCbdnwr1j/Y=; b=pdBBUXOAkpWlepHjBIoGf66vfB
	lTN4vP2pooIIoUcTTshHdtTFQpCwxDO43cMi+HW3xBbVlVjKd0+WutIZ/kGZq4yYGD3B88lB3AHjO
	IuDuTkE/gsuBWzxfwfK1H+xcpDOS8QQD1oEaVLkdyWGdeJx05SENVOCMHUlLR8/4S81Ka37tUYAr4
	Tg+O8SlpR0b4O/u7BfvTDSpB3UuaYC1CgJnoNOltdgs7Po3PxnLA+XTxNoGz+ZpHoKMsd3vgxrFDk
	77JMyWTr+24sX63BhAMtPUp+ZK/Q4MLoj79v7Py20Y71EKo2l5tqyMFaLrMzNO/Na9WWa9Dz8bR3v
	tVCyzusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfalE-00000006XwC-3TcR;
	Fri, 03 Jul 2026 10:04:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfalA-00000006Xrp-2fq4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:04:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rnUC3123794
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 10:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aKmEECCpKZlenl1lu2ey6k/TGjzaNnTRnCbdnwr1j/Y=; b=eiEVnCLkA1P+QFNX
	Ln1aDmBvU5CJuwjpqdYhsR0WFwSEWssif3H13kkNYnzatV9tl4n32oSdNVBa14B4
	VzraOXpEt2N/2wk6h8pcebSaO3LRy0NDfNj68yuPS9bdgz70/JKnKQMkMamDpbt0
	Uy23maeMmUsDn8n1LGpFbBBhgAHPJvpQzz3PvbHP+FbPE6jMfFzEECPF2FeHHmSi
	RhdzoU94DpGJyO1Fgw+/hPeELbq4DlF/aWBMv2wB7RjQMaxF0uxIVelKHgnZJ+8Z
	m9gB7vdKgWL2P+k7ZJgPoJqR4Zd9g3t5ExoGYhLxLc7hyPPA1qeZQ65qqI2oPf/6
	ffwl0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcsfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:04:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92aea0d801dso37185685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073075; x=1783677875; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKmEECCpKZlenl1lu2ey6k/TGjzaNnTRnCbdnwr1j/Y=;
        b=hrTSJQtcRQr7qnbnItGH/cERh55zLxN4qzMMsyvogVpK8k9ASii1L6YV0D0ewgUFFX
         8gbWHw5pYthqVlXf1s9qY4sIRraHG23574W0wjSrQktB4tnHHmas7cVlnecKGgjW3iLe
         SAJ/c7DvaOUq5eL1YJ2ESFhIqyFbNJNjuywc8AFAZmzAtoMr1Kc0TaSU6b9RN0O/d9ED
         XombKr/0oyNfT8ONaCERdziQnBUMltkTP58kHjN9iz96+y0pvWwOe2/bnhEKcOjEa7Qp
         DkS4xSE9zV3R3yHjFF3zVkz0Mzq3PoFmW4tACpWv7Dubo7DUQ8pZPaak0StkDn9nbGkw
         txTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073075; x=1783677875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKmEECCpKZlenl1lu2ey6k/TGjzaNnTRnCbdnwr1j/Y=;
        b=asgHUym8e0H6NlsAWO60RjFxEmK3oAz5N3jguAyGDMW+q2X/7q97zdkPVdDhPaCMG8
         1JBo8psygKzqQWFk2jIq+N5iVvITepZpbvvn2B/kvy0c2MD++Uu5MI8L3uy7d0newxv+
         l3vIsyJvVAHqaXvwqwQLotlEv1lnlkZUCABsgXISwvJVyTw1LDYm/I75IXLGAfCidvgE
         IGXc9dewK3d1pHCPJW8TFeuD/SDT4ulZfJUVSGpg4cGiFj/2Vs1lNR8aPIleiRC9c1R+
         21TgoyShQoPja1UZMJ+Q30r0V7qAUzp3WVAgihQn09OFB33xJJiGO6xuzHg3CIagZd2G
         sfCw==
X-Forwarded-Encrypted: i=1; AFNElJ+/yFDcT0W06T7YS2JBjNS2jpGDdvuajBaChcysFZrr60dO6r+kCyO4OLB6AJqcL2/Y7yqmz1PuOZbtaR5f8wMP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwj21JhwoOFd0yPQIQyGbkYjTaKFJIkZEpMd4rjUH+sjp3nDHd
	gUpdn6thvGE9s71qLGdZYka2CS5wZH1hxHp+VMwg/Qy57nrcog8kQ5SxRGAwJSCOVRfs927CeqE
	Xa9l/lRYhPQcv+czfdizJfWP2ZotN5SRFa8B6gSs2/6UO66KoN6FK4Z8RurZ2GNeQNoVl7nrVA6
	pYQ3U4onUW3w==
X-Gm-Gg: AfdE7cnoatcOyq0hah4IsZiPzCaxfnx/ZI+Tqe++lkpM8bJRR2wLXPFfZpgsTPgwVzt
	tBb4UrMk4qhzcxJvdZvQoQzIXoKYhZIi4Fd7ryjyv5eCEy9yKJkCBt8AjEjeHuO3G+VC9aLJxjQ
	wGZp4emEsb0wwhXuwMc9wrnuL1LJI744nECIhQnC98UXlLD1H5kGM03jBuY2ltTPEqDGerZcWjT
	HOs8N9TmC6E02OfvmAvxvPW0CJSCARkalVv8U2MygDDwO6hUYWwgmJg2G1rqFX/TtgkI6m4mFkm
	UohsjGhClMm8eLlnb3lL3wBaKKIe57E4yXxoiQmI2KBmbCITuNWvsy45U2LSMJZRPXDzQ1pxxmQ
	IPPtGVw3FI3IQ4C4e3fZr0U4kfKFnNCT3uxM=
X-Received: by 2002:a05:620a:2852:b0:916:10f6:77c3 with SMTP id af79cd13be357-92e7b05ed64mr1172407185a.28.1783073074951;
        Fri, 03 Jul 2026 03:04:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2852:b0:916:10f6:77c3 with SMTP id af79cd13be357-92e7b05ed64mr1172402085a.28.1783073074377;
        Fri, 03 Jul 2026 03:04:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:04 +0200
Subject: [PATCH v3 6/7] ARM/arm64: defconfig: Drop redundant Qualcomm clock
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-6-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5559;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+1hIpBeCmAYc20Bi2bLoql3Fiufm1gG3G2QDanx3Jug=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kY2vHjRMaOlA2RMcKNnXSECrog7hJNIsm47
 p1o86V2fC6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJGAAKCRDBN2bmhouD
 1zzUEACHLbF2efUMPSHn2ugFPrbd8tvAsCJADCPOZxHl+cVnlNNTz9QXdZyb/dyAG461hAh+l0O
 nxGPlFLOTrvZtSQLtPlG5kj3QiA5mtvAj5/i+4kxOt+naLN907MvLvk9bfdBfupU3IqUBB6oGyP
 pQ/OfGO7UNXLuKRhMEyRiBD5bKrpNfQfld0Q4nrksW1V75jE5DuqJA8CsoCu7/PYzvwipH6Had5
 3FBMB2XHb2trssl06ihdIqgBqu4I6NxdKLRuEm+cQS8LIwK4/vulQAJPHcWCIO3LbAPK61lWrYe
 R4T4XjNlP2rihZ6N7bOsWZzxFB/7e3aaFOgMxKkdrAd3F6P+kg84WemfLSuwDAwxVbOhEQHhHcp
 Luxu0wbyARNsxfsBmj+0CtVBUnXGSFzX9nnpONOv06bM0F2kWXtNRfQTlm6CXmYSj669ZFgsv+6
 NKSjQ+WfrS7gOzk71EMpFJlfUBiakS3y5mIQ3KrUIX+P7BiOdSzfOxMnbtv9i/wAS3q94R3KnEv
 nSarDsvo5piVTfe6FTfaA4u8zQVaheIbldRRY1eKUWFRGrMQf1B1Eaes2asONO38pIhFkaHBNNM
 Yny6fNfzU++yDiZSyp9cX62tmu80Saqe1dy13QWuE9FYouM0IJGOspnbqQn4rHmWtJ36p88whdN
 j1a0bzNug+fejrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX+sVzHcbUHWMf
 aOtDFyRJdeixDw7rUknfw2ymZZUi2tnAvLExl0Ua+DcL7y2qFQ6tEu6vfuQF0255wg+7kVWaFAO
 FrTLQMbH3mIYMC4+UAg6xHcgq1HnI58=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a478933 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yyKv-1BC-DQKXCkl3jQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX7bPCtFj26vOa
 2iZXE+RYFFL2SNIgvwJhtvScgwCeJKrk9zMwtzqp1vDDXMA9Pp9ZDQLSbgXp7Rn+UjHnVjx/TP6
 EQHnDtcQzl12LKl5U6kEMES9A024PYaLdBP0relgsNBx0WR9r2pNNNGsrgiXsFdkhSUgLoV7RKy
 0z/eFeMPgFMRmnGBIZxl9f78oBCcXmCuStqzufhu574JIpbXJ0qr1viCBndzRVL+ILeCbEpFFAW
 x4SY8F2lPb8n9SFRmMy4PNL3MGj0g7HLJoxbor3V6wOcsLhglFNMFlZH58IdNc64P8O/8BddjfL
 pML3EGcZMlUTol0W9ocILx3e8wC2ntrR7ZhmM1II5p23+rCWXq9VyNND/3q9d6P4TdFoRYLcCog
 ALNi0t6AycVikT2szeSQ+degnlpNAFlBICor5e18pnkIo6gxfzJwqgc9c4A1yJiY0NPSVXb0K3o
 1IYcm74K8k8VNa5Fxig==
X-Proofpoint-ORIG-GUID: oJRs7fzezQZ0zvjfPTEDRqRR24CZn9P-
X-Proofpoint-GUID: oJRs7fzezQZ0zvjfPTEDRqRR24CZn9P-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_030438_010223_38B68B4C 
X-CRM114-Status: GOOD (  11.08  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Drop all drivers from defconfig which have defaults in Kconfig.  Drop
also MDM_LCC_9615 which is gone since commit bac4675a4d1b ("clk: qcom:
drop lcc-mdm9615 in favour of lcc-msm8960").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on clock patches - this can wait a cycle.

Changes in v2:
1. New patch (split from previous)
---
 arch/arm/configs/multi_v7_defconfig |   9 ---
 arch/arm/configs/qcom_defconfig     |  14 -----
 arch/arm64/configs/defconfig        | 112 ------------------------------------
 3 files changed, 135 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6131cec01b0c..a0067d2280d4 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1100,15 +1100,6 @@ CONFIG_COMMON_CLK_S2MPS11=m
 CONFIG_CLK_TWL=m
 CONFIG_CLK_RASPBERRYPI=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_QCOM_A53PLL=y
-CONFIG_QCOM_CLK_APCS_MSM8916=y
-CONFIG_QCOM_CLK_RPM=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_APQ_MMCC_8084=y
-CONFIG_MSM_GCC_8660=y
-CONFIG_MSM_GCC_8916=y
-CONFIG_MSM_MMCC_8960=y
-CONFIG_MSM_MMCC_8974=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=y
 CONFIG_HWSPINLOCK_QCOM=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 03309b89ea4c..5316126fb41e 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -205,20 +205,6 @@ CONFIG_DMADEVICES=y
 CONFIG_QCOM_BAM_DMA=y
 CONFIG_STAGING=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_QCOM_A7PLL=y
-CONFIG_QCOM_CLK_APCS_SDX55=y
-CONFIG_QCOM_CLK_RPM=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_QCOM_CLK_RPMH=y
-CONFIG_APQ_MMCC_8084=y
-CONFIG_IPQ_GCC_4019=y
-CONFIG_IPQ_LCC_806X=y
-CONFIG_MSM_GCC_8660=y
-CONFIG_MSM_LCC_8960=y
-CONFIG_MDM_LCC_9615=y
-CONFIG_MSM_MMCC_8960=y
-CONFIG_MSM_MMCC_8974=y
-CONFIG_SDX_GCC_55=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_MAILBOX=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..c9560f0851b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1462,126 +1462,14 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_CLK_ELIZA_DISPCC=m
-CONFIG_CLK_ELIZA_GCC=y
-CONFIG_CLK_ELIZA_TCSRCC=m
-CONFIG_CLK_GLYMUR_DISPCC=m
-CONFIG_CLK_GLYMUR_GCC=y
-CONFIG_CLK_GLYMUR_TCSRCC=m
-CONFIG_CLK_KAANAPALI_CAMCC=m
-CONFIG_CLK_KAANAPALI_DISPCC=m
-CONFIG_CLK_KAANAPALI_GCC=y
-CONFIG_CLK_KAANAPALI_GPUCC=m
-CONFIG_CLK_KAANAPALI_TCSRCC=m
-CONFIG_CLK_KAANAPALI_VIDEOCC=m
-CONFIG_CLK_X1E80100_CAMCC=m
-CONFIG_CLK_X1E80100_DISPCC=m
-CONFIG_CLK_X1E80100_GCC=y
-CONFIG_CLK_X1E80100_GPUCC=m
-CONFIG_CLK_X1E80100_TCSRCC=y
-CONFIG_CLK_X1P42100_GPUCC=m
-CONFIG_CLK_QCM2290_GPUCC=m
-CONFIG_QCOM_A53PLL=y
-CONFIG_QCOM_CLK_APCS_MSM8916=y
-CONFIG_QCOM_CLK_APCC_MSM8996=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_QCOM_CLK_RPMH=y
-CONFIG_IPQ_APSS_6018=y
-CONFIG_IPQ_CMN_PLL=m
-CONFIG_IPQ_GCC_5018=y
-CONFIG_IPQ_GCC_5210=y
-CONFIG_IPQ_GCC_5332=y
-CONFIG_IPQ_GCC_5424=y
-CONFIG_IPQ_GCC_6018=y
-CONFIG_IPQ_GCC_8074=y
-CONFIG_IPQ_GCC_9574=y
-CONFIG_IPQ_NSSCC_5424=m
-CONFIG_IPQ_NSSCC_9574=m
-CONFIG_MSM_GCC_8916=y
-CONFIG_MSM_GCC_8953=y
-CONFIG_MSM_MMCC_8994=m
-CONFIG_MSM_GCC_8994=y
-CONFIG_MSM_GCC_8996=y
-CONFIG_MSM_MMCC_8996=m
-CONFIG_MSM_GCC_8998=y
-CONFIG_MSM_MMCC_8998=m
-CONFIG_QCM_GCC_2290=y
-CONFIG_QCM_DISPCC_2290=m
-CONFIG_QCS_DISPCC_615=m
-CONFIG_QCS_CAMCC_615=m
-CONFIG_QCS_GCC_404=y
-CONFIG_SA_CAMCC_8775P=m
-CONFIG_QCS_GCC_8300=y
-CONFIG_QCS_GCC_615=y
-CONFIG_QCS_GPUCC_615=m
-CONFIG_QCS_VIDEOCC_615=m
-CONFIG_SC_CAMCC_7280=m
-CONFIG_SC_CAMCC_8280XP=m
-CONFIG_SA_DISPCC_8775P=m
-CONFIG_SC_DISPCC_7280=m
-CONFIG_SC_DISPCC_8280XP=m
-CONFIG_SA_GCC_8775P=y
-CONFIG_SA_GPUCC_8775P=m
-CONFIG_SC_GCC_7180=y
-CONFIG_SC_GCC_7280=y
-CONFIG_SC_GCC_8180X=y
-CONFIG_SC_GCC_8280XP=y
-CONFIG_SC_GPUCC_7280=m
-CONFIG_SC_GPUCC_8280XP=m
-CONFIG_SC_LPASSCC_8280XP=m
-CONFIG_SC_LPASS_CORECC_7280=m
-CONFIG_SC_VIDEOCC_7280=m
-CONFIG_SDM_CAMCC_845=m
-CONFIG_QDU_GCC_1000=y
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
-CONFIG_SDM_LPASSCC_845=m
-CONFIG_SDX_GCC_75=y
-CONFIG_SM_CAMCC_6350=m
-CONFIG_SM_CAMCC_MILOS=m
-CONFIG_SM_CAMCC_8250=m
-CONFIG_SM_CAMCC_8550=m
-CONFIG_SM_CAMCC_8650=m
-CONFIG_SM_CAMCC_8750=m
-CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_DISPCC_6350=m
-CONFIG_SM_DISPCC_MILOS=m
-CONFIG_SM_DISPCC_8450=m
-CONFIG_SM_DISPCC_8550=m
-CONFIG_SM_DISPCC_8750=m
-CONFIG_SM_GCC_4450=y
-CONFIG_SM_GCC_6115=y
-CONFIG_SM_GCC_6350=y
-CONFIG_SM_GCC_MILOS=y
-CONFIG_SM_GCC_8350=y
-CONFIG_SM_GCC_8450=y
-CONFIG_SM_GCC_8550=y
-CONFIG_SM_GCC_8650=y
-CONFIG_SM_GCC_8750=y
-CONFIG_SM_GPUCC_6115=m
-CONFIG_SM_GPUCC_6350=m
-CONFIG_SM_GPUCC_MILOS=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_GPUCC_8350=m
-CONFIG_SM_GPUCC_8450=m
-CONFIG_SM_GPUCC_8550=m
-CONFIG_SM_GPUCC_8650=m
-CONFIG_SM_GPUCC_8750=m
-CONFIG_SM_TCSRCC_8550=y
-CONFIG_SM_TCSRCC_8650=y
-CONFIG_SM_TCSRCC_8750=m
-CONFIG_SA_VIDEOCC_8775P=m
-CONFIG_SM_VIDEOCC_6350=m
-CONFIG_SM_VIDEOCC_MILOS=m
 CONFIG_SM_VIDEOCC_8250=y
-CONFIG_SM_VIDEOCC_8550=m
-CONFIG_SM_VIDEOCC_8750=m
 CONFIG_QCOM_HFPLL=y
-CONFIG_CLK_GFM_LPASS_SM8250=m
-CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_EXYNOS_ACPM_CLK=m

-- 
2.53.0


