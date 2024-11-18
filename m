Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56E3D4921F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IKe+I9uZeIuSgyOafwq9J+0/n9X+I04Mh6gdPIr52o=; b=NQ4Q4fA43O9yuyxFsiO3BJ8lhl
	pTfW0yhxQG2lPlMJvtq28shik4mQI59RnaJVewcJd0lGsTm6iKSqrD5oAm19YtQkMT6/zwTtCrEKn
	wDkR/ahBWrfec/L7H337lOW871756gvue6xFCIfvFODpjVadaMmrsFbXa0MHQ/V4dUuxEGSG8q4vh
	WKeJPDEll+KmfuabBxM+nDsZ89fLjcWVPTR9MCmMPaYIMl9dYiffx308HISBnVjM6TnreEcSr72N5
	iBNoZkeFQ4v5k5xjLEW97Zt827ydRlLYGwfg3FKNlQPrXSIQCIold5UnF0n263KpT8Lg5mxVHHpEJ
	m3J7gPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1fm-00000009Xqi-2e9c;
	Mon, 18 Nov 2024 13:20:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1PD-00000009Tqe-2Lzm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Nov 2024 13:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2IKe+I9uZeIuSgyOafwq9J+0/n9X+I04Mh6gdPIr52o=; b=nvb+lhTUK8082f35krYKyU6+rk
	Q6lPZM1gDO7E2UiDQDEhLW6ftc5sKajxnLHICxzQeOpvAJkh0eyCrAIHFHyynVAF+AFCGgoD59OXZ
	BsPUV3qoaVFj1dkpIZCnSc2PctGZs30MGZt+e5JOkcbQ/Wi1nLxExkXD7981202zd0npwlUwniq6L
	O3ym3MBrbhmlhvG2zyHX8Tt2mhw8FfpM2YuCiJ7kHlY6u0+1/HDpfuDjOXGPruonx5jvAKrBDzISx
	zucy16T603QEbf9IAUhxKBi5MYPe4M8aHYRVSDSAS8wSQK/lz92+BHfw2vtV1Roev7/11ldyRKE5X
	BifFaCZA==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1P7-00000000Dq7-0sph
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:03:02 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICK2Ap027968;
	Mon, 18 Nov 2024 13:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=2
	IKe+I9uZeIuSgyOafwq9J+0/n9X+I04Mh6gdPIr52o=; b=adq82mf8/ZfaJB9Sf
	WyV+jG1o2KhmTn2J+Ib98oICmLdWuOnu5CC0FvT7ilVRd0KSGq1fOG6nFITiEHUF
	VISiswTL0vhyluLky9PuK+j+UF0Pz+eJr5BIWRgaxmus5OJCaoe8VOOvBOEsBIS/
	Ae7uc9tfUlRK8PIT2xtvppVdXO3kEx1iT9+uACt5t496IBcXw286FjJU0hhHWvoP
	u5NGyqUR1A568sjvRNtEBblW+1aDdwLFUzkyCrHexsF6Dbdb84Z6eFbWniqyrLjX
	GNYaOYz/8lxB4BYDvXdHd2daWoqY9bvaIpr6x+HGLs4lpJ3FpqEvh63atrGJYoY+
	hYiQQ==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj6-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Nov 2024 13:02:45 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:44 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:02:12 +0000
Subject: [PATCH v2 20/21] drm/imagination: Add support for TI AM68 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-20-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=fHj5SUJX98oTI0Lq7eQ/770V1/Ls+9Q5P+UrUicuRrc=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz1j2nqbJdvuwZ9qZsNzV1xNjBhPfMuVty/nemumb
 +nsKFvZUcrCIMbBICumyLJjheUKtT9qWhI3fhXDzGFlAhnCwMUpABM5foGRofHa9QMxHXvrb4Qr
 KhY9PzNl5smJ2e+WlVictHVhnG/n3sjwTyl55ykWyym7ZMwuMyvZ85WYrZrGO2399V8S7yNSP2w
 rYgcA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Gm9T2arOhYBj5Ykiv0Uqxmb0hqgGbpsl
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3af5 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=pgiMTOZqGIwqrSltCJAA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: Gm9T2arOhYBj5Ykiv0Uqxmb0hqgGbpsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_130257_416299_16DADFB4 
X-CRM114-Status: GOOD (  12.22  )
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

Add the new compatible string recently introduced in the dt bindings
("img,img-bxs-4-64") to the dt_match table and link the appropriate
firmware.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-20-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index e074cfb0d2055b5387dbb142ca972108977f9854..044321cab1114864aefa2ca0024f326ac52d4dd6 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -44,6 +44,7 @@
  * This driver supports the following PowerVR/IMG graphics cores from Imagination Technologies:
  *
  * * AXE-1-16M (found in Texas Instruments AM62)
+ * * BXS-4-64 MC1 (found in Texas Instruments J721S2/AM68)
  */
 
 /**
@@ -1501,6 +1502,12 @@ static const struct of_device_id dt_match[] = {
 
 	/* All supported GPU models */
 	{ .compatible = "img,img-axe-1-16m", .data = &pvr_device_overrides_default },
+	{ .compatible = "img,img-bxs-4-64", .data = &pvr_device_overrides_default },
+
+	/* Vendor integrations which require overrides */
+	{ .compatible = "ti,j721s2-gpu", .data = &(struct pvr_device_overrides){
+		.device_memory_force_cpu_cached = true,
+	} },
 
 	/*
 	 * This legacy compatible string was introduced early on before the more specific GPU
@@ -1532,3 +1539,4 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_IMPORT_NS(DMA_BUF);
 MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
+MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");

-- 
2.47.0


