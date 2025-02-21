Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C2BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 01:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/W2+jtFddTBYLlY9/lM0sqBExxGNt9XucF2Wh1n46Ds=; b=ssa9+ulGgneOWox6a/gEnxsn9V
	2Q51ihh25qFTw7qh6iONprkVUlhJcv5ImADkhdvnr19CZtjSF1kkAvXyTmI093g/Xu/idJNgwxU5I
	bpPMW1eYLA1MkvDZDRYZ7ytR0RMD918r+eG3v5EqHBNeOfVdxfbW9S6GDjhpmwSH7EW8t1x+QSc3F
	Pz5IcjxR4uG7k07al7cy9r9Vp/8Np/3Fv3V9zumXUflbaPNjy+SKEHY2WRDDxYd42ceZ+5Y4iIWs4
	c3WbJyj5Wiulm0iDWYjv2gltuy36xBZfaawo+mWMiOOPvcLk6BtQGL03Cp9X/iIsK/rNrx9Tgu7nG
	Al9kspvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHWC-00000003cKI-3rsl;
	Fri, 21 Feb 2025 01:07:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHOy-00000003azj-2tNP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 01:00:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E7DD1C01;
	Thu, 20 Feb 2025 17:00:42 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C56083F59E;
	Thu, 20 Feb 2025 17:00:21 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: allwinner: h616: Add Mali GPU node
Date: Fri, 21 Feb 2025 00:58:01 +0000
Message-ID: <20250221005802.11001-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250221005802.11001-1-andre.przywara@arm.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_170024_768934_4F86A346 
X-CRM114-Status: GOOD (  11.15  )
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


