Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B10C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 22:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yc4Au1Jug4OrUgD9WRgxiBXboCYA7XhnTBd4v2chERc=; b=rPSgkT2VlXpWjVsvn5flo5KSXo
	f5aSlwB6xhgjNCvlF1vUVRtFYj8NhxXxL5Ue/GEGQjS/W+QroCCu4QFvOcdr0Cq/z2YRvYWwPbU6O
	WPzmiYdPyMJFhQUPuKF4igroPuFET6oA2CwrlbXBIYDUFRS9054IfI3KOAcYHme+Oj/29BzNxhwFZ
	6YqS9fakNUbFRQL2SocamYIDhpq0idEFa7eVw2SGY6cUv12AbxfJ8HE47r++yvqm1UzDt8xS1LMcG
	3lKUFZ7ObF18mxHo2feMyNIbDmDt3M0uNOd3WfIcDr9IL5FFuiT9F2Kn4lxhhUhmJk7tuEbu9xh6G
	A9agyUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Bh1-0000000B62t-1cxH;
	Wed, 16 Apr 2025 22:57:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BZd-0000000B5Aj-45E9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 22:49:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F251595;
	Wed, 16 Apr 2025 15:49:39 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB4343F66E;
	Wed, 16 Apr 2025 15:49:39 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: allwinner: h616: Add Mali GPU node
Date: Wed, 16 Apr 2025 23:48:38 +0100
Message-ID: <20250416224839.9840-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250416224839.9840-1-andre.przywara@arm.com>
References: <20250416224839.9840-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_154942_057980_5FA3D6B7 
X-CRM114-Status: GOOD (  10.83  )
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

The Allwinner H616 SoC contains a Mali-G31 MP2 GPU, which is of the Mali
Bifrost family. There is a power domain specifically for that GPU, which
needs to be enabled to make use of the it.

Add the DT nodes for those two devices, and link them together through
the "power-domains" property.
Any board wishing to use the GPU would need to enable the GPU node and
specify the "mali-supply" regulator.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index cdce3dcb8ec02..ceedae9e399b6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -150,6 +150,21 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		gpu: gpu@1800000 {
+			compatible = "allwinner,sun50i-h616-mali",
+				     "arm,mali-bifrost";
+			reg = <0x1800000 0x40000>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&ccu CLK_GPU0>, <&ccu CLK_BUS_GPU>;
+			clock-names = "core", "bus";
+			power-domains = <&prcm_ppu 2>;
+			resets = <&ccu RST_BUS_GPU>;
+			status = "disabled";
+		};
+
 		crypto: crypto@1904000 {
 			compatible = "allwinner,sun50i-h616-crypto";
 			reg = <0x01904000 0x800>;
@@ -874,6 +889,12 @@ r_ccu: clock@7010000 {
 			#reset-cells = <1>;
 		};
 
+		prcm_ppu: power-controller@7010250 {
+			compatible = "allwinner,sun50i-h616-prcm-ppu";
+			reg = <0x07010250 0x10>;
+			#power-domain-cells = <1>;
+		};
+
 		nmi_intc: interrupt-controller@7010320 {
 			compatible = "allwinner,sun50i-h616-nmi",
 				     "allwinner,sun9i-a80-nmi";
-- 
2.46.3


