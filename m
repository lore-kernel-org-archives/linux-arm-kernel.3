Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40366EFD23D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+fRucl20FdKOFHwR98xnMI2CpradJDFDcAG3Cugf9A=; b=xsOTO9LBz2jmT/yF12i4btN9AN
	T3yu1kALf6ANYWMxHMkgruiPBxZcsCCKwoz3R2crugM9PdaCXiF8WUjfR3vnZoSiw1PVrTMOIZptA
	8cQPcnrUMFoDrNJ/Irtfl2J1b//9j4wRbPGozQSoSwPWGyjJX+waxHdQs8x4z+h71r1H54ihqUvfS
	NLnZA7CuGezaGvu/o1qC+hbNlscCufLdnjgfsMa8xdPZDcg3A80Jccxyjx1mdtB/vnonmrp0ptwV9
	fUowG/GUED+e786o3hUQzoQWWetheNC34CwOav+ewys081Ivzg8t2gR1ER9obt3OeJ+W9vOecM866
	l10IAxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBmp-00000003k3Z-0Xvi;
	Wed, 25 Feb 2026 10:06:31 +0000
Received: from mail-m49212.qiye.163.com ([45.254.49.212])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBml-00000003k1e-23zl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:06:29 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34ea9e545;
	Wed, 25 Feb 2026 18:06:19 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de,
	soc@kernel.org,
	krzk@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yangzh0906@thundersoft.com
Subject: [PATCH v6 1/2] arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
Date: Wed, 25 Feb 2026 18:06:12 +0800
Message-ID: <20260225100613.3791261-2-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225100613.3791261-1-yangzh0906@thundersoft.com>
References: <20260225100613.3791261-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c944388e609cckunm3fc0fc0ab1afe2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR1JVktJTUgaHk5IT0lDGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=IvKgzqCWGVMxhA/JTVX4uwWHHs8jZ3xconoHPSCZDjLmQQc7+Hmgy7CL6Ar++IMItYEM4K/n+fn5ZB3eielusXzNg8ksR37wDrDKfGV3t0nfcbp2mptcbXmnYaQDZNZBierRdOdwFZ3ER3G3SssYWxEGv1Y0IH52+heLC2XbawY=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=L+fRucl20FdKOFHwR98xnMI2CpradJDFDcAG3Cugf9A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_020627_728894_5F2C646C 
X-CRM114-Status: GOOD (  10.63  )
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

Add eMMC controller support to the BST C1200 device tree:

- bstc1200.dtsi: Add mmc0 node for the DWCMSHC SDHCI controller
  with basic configuration (disabled by default)
- bstc1200.dtsi: Add fixed clock definition for MMC controller
- bstc1200-cdcu1.0-adas_4c2g.dts: Enable mmc0 with board-specific
  configuration including 8-bit bus width and reserved SRAM buffer

The bounce buffer in reserved SRAM addresses hardware constraints
where the eMMC controller cannot access main system memory through
SMMU due to a hardware bug, and all DRAM is located outside the
4GB boundary.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>

---
Changes for v5:
- Split from platform series per Arnd's feedback

Changes for v4:
- Change compatible to bst,c1200-sdhci
- Move bus-width and non-removable to board dts

Changes for v3:
- Split defconfig into dedicated patch

Changes for v2:
- Reorganize memory map, standardize interrupt definitions
---
 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    | 19 +++++++++++++++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 18 ++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
index 5eb9ef369d8c..178ad4bf4f0a 100644
--- a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
+++ b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
@@ -17,6 +17,25 @@ memory@810000000 {
 		      <0x8 0xc0000000 0x1 0x0>,
 		      <0xc 0x00000000 0x0 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		mmc0_reserved: mmc0-reserved@5160000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x5160000 0x0 0x10000>;
+			no-map;
+		};
+	};
+};
+
+&mmc0 {
+	bus-width = <8>;
+	memory-region = <&mmc0_reserved>;
+	non-removable;
+	status = "okay";
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/bst/bstc1200.dtsi b/arch/arm64/boot/dts/bst/bstc1200.dtsi
index dd13c6bfc3c8..9660d8396e27 100644
--- a/arch/arm64/boot/dts/bst/bstc1200.dtsi
+++ b/arch/arm64/boot/dts/bst/bstc1200.dtsi
@@ -7,6 +7,12 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clk_mmc: clock-4000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <4000000>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -72,6 +78,18 @@ uart0: serial@20008000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@22200000 {
+			compatible = "bst,c1200-sdhci";
+			reg = <0x0 0x22200000 0x0 0x1000>,
+			      <0x0 0x23006000 0x0 0x1000>;
+			clocks = <&clk_mmc>;
+			clock-names = "core";
+			dma-coherent;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@32800000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x32800000 0x0 0x10000>,
-- 
2.43.0


