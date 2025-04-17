Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DD1C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D+h2TZ9lOvg86CwKBD1NqPPfMjTY1kN80xOtNUeXHzc=; b=vvK7V4XVnUPSIo
	Y6dvjQQtaquAf77+sAchpx/wv97Qiw+RgkwS45T9yX9s3dbkouMKYylrCK56wFjPnRs1Gb6h32cRm
	Aj++K0sPG35lksGeB49/yrO0O+HERhPfQxig5+Od/VaSF+cSLrRrsE35talAyBpcbVImnvWmpO0pK
	pfkutjwoAQZ8+uo/YM0VhD/ebIF+oIMHBgDKgIy6A3AkMAYeqwA5It1aRA+UwgrSGWsksOVA2KdI5
	q6tdqdqiRhecLqT3EyTmjme23MdhrcOu6G7S1Md4R1XGF0Fy3zHWGanXjCAemEncPSkCXqT8psJKM
	H8qMP7yNqnODc6rcmRFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LPI-0000000CQBJ-2cwI;
	Thu, 17 Apr 2025 09:19:40 +0000
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LGJ-0000000COQ4-10re
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 09:10:25 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H503lJ018418;
	Thu, 17 Apr 2025 10:10:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=D+h2TZ9lOvg86CwKBD1NqPP
	fMjTY1kN80xOtNUeXHzc=; b=Wxu0hpjuRqf0La5w+XDNluu+PEaBPV7DZ1s828k
	mrAS0qqoCrnpf1IuQGXKyuyBgiBrnCQBh74sT3nySS4PNARI/bZgUktJAZcv+vcT
	ANdQKmDH4rIvrKxo1uSujIo4c3X2POtG92oj6gy0sR1gpJwDuucg2UhJm6UWknPQ
	2bZSZEA4QCg+9tpVXcEUG03OGxJM0ge0u29KzL15s18f8uN2EjxMBFLhr/W5eU0I
	zohEkYw+aXRkJmgDton2U6Hw3hcwHwSgag7xZ87Wru0P1yv2G/Zu8QYDFLm8xp8x
	EPOyzTuqH8N8VduUcaZ8/xuEzdYEBs8+Z+d65RkYYAmLQDg==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 461y2mh4tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Apr 2025 10:10:16 +0100 (BST)
Received: from Matts-MacBook-Pro.local (172.25.7.98) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 10:10:15 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH v2 0/2] Imagination BXS-4-64 MC1 GPU support (DTS changes)
Date: Thu, 17 Apr 2025 10:10:01 +0100
Message-ID: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnFAGgC/3XMSw7CIBSF4a00d+w1gECrI/dhOqg82jvoI0BIT
 cPexc4d/ic53wHRBXIRHs0BwWWKtC41xKUBMw3L6JBsbRBMKCa5wvceUaKWaFNEc++kZV2rldJ
 QL1twnvaTe/W1J4ppDZ9Tz/y3/oEyR4a+tTc/MK2Fsk+ax+TM1awz9KWUL/UfaZSpAAAA
X-Change-ID: 20250415-bxs-4-64-dts-c984d0876556
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns <frank.binns@imgtec.com>,
        "Alessio Belle" <alessio.belle@imgtec.com>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Matt Coster
	<matt.coster@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=KqHU+hq3HbsSzafDT7vxpU6Suxp8dH6jbuuVA8bGmtk=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQwHC3bz3blnbad22vdG/PXqx/jbt42/XC34C7HmxMn9
 7geMt6s0FHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATWaTO8D/BRMtAI///OffC
 W/s4f0XoqZ3ojNWfe85MTUtPKGnfXhaG/1nHojfeVlnRLttpFs/n5if7RekUo+ssgdXLVbi/fq6
 ZwAgA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.7.98]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=LbU86ifi c=1 sm=1 tr=0 ts=6800c578 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=sozttTNsAAAA:8
 a=-EETvfFteC8Pj7O1jf4A:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: gBBFZuUz9O6x1AC4vTTdtQYDAkS9rPPi
X-Proofpoint-ORIG-GUID: gBBFZuUz9O6x1AC4vTTdtQYDAkS9rPPi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_021023_596308_85C4E979 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

Now that the binding and driver changes to support the Imagination
BXS-4-64 [1] have landed in a DRM tree, here are the corresponding DTS
changes without the [DO NOT MERGE] tag.

This GPU is found in the TI AM68 family of SoCs, with initial support
added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.

[1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>

---
Changes in v2:
- Add details of the source of the interrupt index
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com

---
Matt Coster (2):
      arm64: dts: ti: k3-am62: New GPU binding details
      arm64: dts: ti: k3-j721s2: Add GPU node

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi   |  4 +++-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: d6fe216caf15d196e1bf76591440f8f17d58e7ee
change-id: 20250415-bxs-4-64-dts-c984d0876556


