Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9E7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4lUq4QP/mULXqetmOHgz7na8g0BDkjUVC/tFT/LXig=; b=olK1rfWiczYiSoNAyCE6KvCuce
	to3afHWcPeOEZKEY1L7egD5eZoOFD3uQFO/c8dfCH7VqAtiEjXrqSL/eXnsmQkKhtnnegZAOaQVVI
	Hd5jNGi7qLSdzw/vIPVRKcO7uYvfu6rXCDsAheLTt0XBXwqclohGSTEauUW+48vUyv/qh6Trx9tYn
	hDK9CHVs9xRZAVI6UXyQgpF8WFGKFj16jcLEd6At89BIk9yksqX1dtjgyVSUI1sYmh/SzOjIKLoYz
	AiJS3i4EhOi6rz8rlLhpaoS+aGRlfN1xcYXAlh7SVHAxMEl3qEk1ujsobP6J0F8kkQEI/hKZ+fF6q
	Vawe0LDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LR9-0000000CQjf-1jgm;
	Thu, 17 Apr 2025 09:21:35 +0000
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LGJ-0000000COQA-3552
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 09:10:26 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H503lL018418;
	Thu, 17 Apr 2025 10:10:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=s
	4lUq4QP/mULXqetmOHgz7na8g0BDkjUVC/tFT/LXig=; b=N3HnwOcJTklvsv3jy
	yChAsXJHm9joMR1dtWI9jbh+OADXcWA2RgmeJ1TZj1c4P13zYbq5g2YaR7crg2Sr
	DrnXqznea+O2WQEAOyyyo80qBJ/GAdBE3avSYcoKkjy7gl2iOO8OP0a7JmpUTxCy
	J/pMo5bXZ1Ci8h6oNdFkJ7SeOSImrlxqA8o+oR1qaSMAPAV23I3YBzCFSskGikto
	rHGnhDK7aGgETAkqtH76VYUZrVg1/IYKH/N7Dj7tsrmLxdxTp6Jh+fdCQoPEa2+k
	qpti9NsJyHtHpsizxEpwqINoHeEJkG+AKKnH0YNWPJwEnE0OIJpOZ6QS03VkriTL
	QpDww==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 461y2mh4tg-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Apr 2025 10:10:17 +0100 (BST)
Received: from Matts-MacBook-Pro.local (172.25.7.98) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 10:10:16 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 17 Apr 2025 10:10:03 +0100
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com>
References: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
In-Reply-To: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=epqyuI3DQyygM6mV3YXhwwbA6yUu0pXFY8MTDFxg8s0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQwHC1/K/fLX7GfPfbh102+RRnW7FM/uP2ICQrsezZ/z
 weZXezJHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRxLOMDJMn+n4XWMny+9f1
 Lwu/7fe42REoLmk6MaQj3brMzr5/Uy4jQ6NB4/6WNa8fPTnuxd7+4fU3uf07dz7ge536p7aX627
 hBH4A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.7.98]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=LbU86ifi c=1 sm=1 tr=0 ts=6800c579 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=Ff_bzIi4o_8fsuxLidAA:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: T5O5va56PNOO4qYhBwZnCAj8j75CCx2r
X-Proofpoint-ORIG-GUID: T5O5va56PNOO4qYhBwZnCAj8j75CCx2r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_021024_078168_B628F4FD 
X-CRM114-Status: UNSURE (   9.78  )
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

The J721S2 binding is based on the TI downstream binding in commit
54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
but with updated compatible strings.

The clock[2] and power[3] indices were verified from HTML docs, while
the intterupt index comes from the TRM[4] (appendix
"J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
"GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
[3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html
[4]: https://www.ti.com/lit/zip/spruj28 (revision E)

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- Add interrupt reference details
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com

This patch was previously sent as [DO NOT MERGE]:
https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5865f@imgtec.com
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e6133864428bd35a5e835 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
 		/* reserved for MAIN_R5F1_1 */
 		status = "reserved";
 	};
+
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 130 1>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
 };

-- 
2.49.0


