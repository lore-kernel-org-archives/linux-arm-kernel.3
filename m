Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7692EC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjpXsUWuH/r9E8s8lUfUdg5PLs7m5CliRJpnNLInJrI=; b=W/opigeFwhPvbqdU4ijwyWMpgZ
	7pvpEmWiDnYqb80jilR9Fm5Co4XZPgfZqmU5SeXF3TFa6/75pnh4Cq9cNPDuY7cyvUMoD730VCZSJ
	kOG0IknTnZs+234YdEwk6P3bO6gP9m9pDPsUDhcPMmGZeP4mQe8LrQJ0ZOs9bFk8X+d1U8yEzboWM
	aj2gaK0k0WMrDfHdWMJ+0ynO8zpflIZZU7kUn+/U/X/tpUgYWfDjhu7z6XsePVCR5DbQsLcxCKGYt
	MJ1csuV812dPY/gXXNpF+LnpYE9lRujMRZSGexqjUsBmz11KpPfzNd6KmFAwJX01+nzjCKejC5xQV
	5NYEkpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvo-0000000Bjng-1bYY;
	Mon, 10 Aug 2026 12:16:40 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvZ-0000000BjGT-30gY;
	Mon, 10 Aug 2026 12:16:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C870C0514;
	Mon, 10 Aug 2026 15:16:21 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364183; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PjpXsUWuH/r9E8s8lUfUdg5PLs7m5CliRJpnNLInJrI=;
	b=gP+S9Yoax+x4I/pvI/7/l8RziF3Wh1xJY/9F+IBe/aiziSieWgj1PjbSrlmdHgpINK9/ur
	ojW4UQ7TKnmZlPW6z9o7fSPuma/8WSnPdW0txTOI8ysyjVlMqfWLhmtRV7WFJhLZKURKYp
	z37wYXPacIYGb2jVFV1uNRfrHWJ8AVp9/VVqr5659ry8v+GYEoSGLExVvhde8y5gkddOIa
	mLsp73El1xT49aklCBSXtnQvGRQ/03i6W2w9zPzKJortrM4TYqFflsnrwqwxeaKm4xIbn9
	fk4HYtE4xKdp9g2M+165tMF/kv8aKieQYYVTDcXChVaMhiYlIyD7vrHi/97laA==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 19/25] ARM: dts: rockchip: Add SPI nodes for RV1106
Date: Mon, 10 Aug 2026 15:11:10 +0300
Message-ID: <20260810121121.210040-20-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051626_039670_840B7ED0 
X-CRM114-Status: GOOD (  10.27  )
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

Rockchip RV1106 has two SPI controllers. Add the spi0 and spi1 nodes
together with their aliases, using the m0 pinmux and the DMA channels
of the single DMAC.

Compared to Rockchip BSP kernel add missing SCLK_IN_SPI1 to spi1 node.

Both nodes default to status = "disabled" and are enabled per-board.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 58ac297e4d75..ce2f169b1acd 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -30,6 +30,8 @@ aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
+		spi0 = &spi0;
+		spi1 = &spi1;
 	};
 
 	cpus {
@@ -370,6 +372,38 @@ uart5: serial@ff4f0000 {
 			status = "disabled";
 		};
 
+		spi0: spi@ff500000 {
+			compatible = "rockchip,rv1106-spi", "rockchip,rk3066-spi";
+			reg = <0xff500000 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_SPI0>, <&cru PCLK_SPI0>, <&cru SCLK_IN_SPI0>;
+			clock-names = "spiclk", "apb_pclk", "sclk_in";
+			dmas = <&dmac 1>, <&dmac 0>;
+			dma-names = "tx", "rx";
+			num-cs = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0m0_cs0 &spi0m0_cs1 &spi0m0_pins>;
+			status = "disabled";
+		};
+
+		spi1: spi@ff510000 {
+			compatible = "rockchip,rv1106-spi", "rockchip,rk3066-spi";
+			reg = <0xff510000 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_SPI1>, <&cru PCLK_SPI1>, <&cru SCLK_IN_SPI1>;
+			clock-names = "spiclk", "apb_pclk", "sclk_in";
+			dmas = <&dmac 3>, <&dmac 2>;
+			dma-names = "tx", "rx";
+			num-cs = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1m0_cs0 &spi1m0_cs1 &spi1m0_pins>;
+			status = "disabled";
+		};
+
 		gpio1_ioc: syscon@ff538000 {
 			compatible = "rockchip,rv1106-gpio1-ioc", "syscon";
 			reg = <0xff538000 0x8000>;
-- 
2.47.3


