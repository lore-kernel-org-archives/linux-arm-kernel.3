Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF79EC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZ9FTjEGtTisOYCax20EILr8HSn05AbqSO3mzr/wneE=; b=S8PwS7KBGEmWH7Bzw4o7tTEQiB
	zijwfwupwBi00m29XkXvUPbZudGPK+k35dcd0iqPvsi6y1IRwUJw/9J29r4xLTnnSqyZzu+iEsTsF
	jZa5Hi3oISf6e00+tqS7GieF/EAZ/5v6yIQXGp4bBO5ucnKgx8nVndIPlOf24zdTfG6jeI6MvhERf
	bSdkziv1lGRmpRK7t4n6bibDhq5nYjr4+LWamSXtxFXh9/Z9M4guXCpC9zUZSQl7eZGFPiy1gWfSQ
	YZmYmh7FOcwQaGtmjYgR0hiSXZ/FFVlq0mKZS2KtluwAUEphc80pOdi9qZX+oiBRErsrc96fkAuwY
	1fpEFZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYq0p-00000003DWG-45cZ;
	Mon, 07 Jul 2025 17:52:19 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp6v-000000035FJ-0kja
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:54:34 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id ACA2C1F0003D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 16:54:31 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 33757ACAEF9; Mon,  7 Jul 2025 16:54:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 6C9C4ACAEE4;
	Mon,  7 Jul 2025 16:52:09 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: a100: Add EMAC support
Date: Mon,  7 Jul 2025 18:51:54 +0200
Message-ID: <20250707165155.581579-4-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095433_374922_442AA262 
X-CRM114-Status: GOOD (  13.59  )
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

The Allwinner A100/A133 Ethernet MAC (EMAC) is compatible with the A64
one and needs access to the syscon register for control of the
top-level integration of the unit.

Note that there are two such controllers on the sun50iw10 die, which are
the same unit with a different top-level syscon register offset.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 7d5be0975371..bb5f9e4f3d42 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -420,6 +420,26 @@ i2c3: i2c@5002c00 {
 			#size-cells = <0>;
 		};
 
+		emac0: ethernet@5020000 {
+			compatible = "allwinner,sun50i-a100-emac",
+				     "allwinner,sun50i-a64-emac";
+			reg = <0x5020000 0x10000>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&ccu CLK_BUS_EMAC>;
+			clock-names = "stmmaceth";
+			resets = <&ccu RST_BUS_EMAC>;
+			reset-names = "stmmaceth";
+			syscon = <&syscon>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		ths: thermal-sensor@5070400 {
 			compatible = "allwinner,sun50i-a100-ths";
 			reg = <0x05070400 0x100>;
-- 
2.49.0


