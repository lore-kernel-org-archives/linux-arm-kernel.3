Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0B1C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eC5OgyvVzEosLtDBUitn4Br2QSqN+NjnARvdOrZ7fxc=; b=KWc1RqlFBabiCGuqTBA5PjDCqk
	oKFhtAtN3VlJE0vGZp6bvHMT0K6LNzddl82iO+5+hReY8jERON47+54FfsdlL1hmgAtA3Cxw2Mr9/
	uxIBSFLLLyBERwg+ZUjPHU5uP7Sayfkov0qu3bz5hvHxSDeObgwgtDYkNIX4n1v+f2G3ZM9syXymD
	YI5TAnQlYNvFEJ33GwVI+QmBVhL798uLTU66mXWZcm2c0pcP0IbNI+xJzx47Lz554i9SKd7nJxFiK
	+cN12VfE3edFXeFwZsd2TySa4ii/Zyfu2W4UxOTPFY0BffAS97XqALqAmYtdJnvBDqWPJDrEMDtb/
	lGEmTnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rkf-0000000DX2L-2zHs;
	Fri, 18 Sep 2026 06:07:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rke-0000000DX1L-2Fwr;
	Fri, 18 Sep 2026 06:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eC5OgyvVzEosLtDBUitn4Br2QSqN+NjnARvdOrZ7fxc=; b=khFNe5RW+9Xd3187xHQoJ+sfJz
	8ZxmX2OTGJiSjNBtNEiEEUaiTUi9ODJ2zbvxO06NPnnQekspN0UyiCB4xGMeSmqrwH7xZACMIznxF
	27fmG4E3Z1wJVvnc7CzjsVTj+YwvOXDHIqNrG4a2oMHRO3GZzDuLtNZxre1GGeUj66J4U8BNUKYXF
	OLjhEqweKuZxPhpNlpuB4E/wxkobSDEVDm88XlqKs0EybL3nmtw+SQni1gaRDyJkQtJ+HieqN8fcv
	SzS1lX5sAUieMs8xLuGQ/ji5i+a8vlPlHBl+7Ddu+r4tBq0ElErj7nA+VTFMwhYFjp8iLlkSEsg4F
	JX19Rerw==;
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Rkb-00000009d8Y-0hpn;
	Fri, 18 Sep 2026 06:07:11 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EB9E3200927;
	Fri, 18 Sep 2026 08:07:05 +0200 (CEST)
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 18 Sep 2026 08:07:03 +0200
Subject: [PATCH v4 3/4] arm64: dts: rockchip: rk3588: Add JPEG decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-rockchip-jpegdec-v4-3-0dd97df47abb@pengutronix.de>
References: <20260918-rockchip-jpegdec-v4-0-0dd97df47abb@pengutronix.de>
In-Reply-To: <20260918-rockchip-jpegdec-v4-0-0dd97df47abb@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789711625; l=2122;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=1JJVz9r1I2YKlPh7YDn7HbtgjT6XpDzjfnEG3nPQua8=;
 b=eUuHUUyU7vVmW4lwsxTq1Fxazll4yoErjnLr0cZeTpiDOtHnHLd0BWx303WsXcNzhn02+u/jq
 JNo1kezXGGVD4mRh1zKQLZ8Hw9j8Xf+PqRV0gVpot+R3erWV8esHRbB
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_070709_704650_64ED3660 
X-CRM114-Status: GOOD (  10.46  )
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

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK3588.

The decoder is at 0xfdb90000 with its MMU at 0xfdb90480.  It takes the
AXI and AHB clocks and resets, and sits in the VDPU power domain.  The
AXI clock is pinned to 600 MHz, which is the rate the downstream BSP
runs it at; it is a dedicated clock, not shared with another block.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd31622..ce02a0f753e33 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1317,6 +1317,30 @@ rga: rga@fdb80000 {
 		power-domains = <&power RK3588_PD_VDPU>;
 	};
 
+	jpegd: video-codec@fdb90000 {
+		compatible = "rockchip,rk3588-jpegd";
+		reg = <0x0 0xfdb90000 0x0 0x400>;
+		interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "axi", "ahb";
+		assigned-clocks = <&cru ACLK_JPEG_DECODER>;
+		assigned-clock-rates = <600000000>;
+		resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	jpegd_mmu: iommu@fdb90480 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdb90480 0x0 0x40>;
+		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	vepu121_0: video-codec@fdba0000 {
 		compatible = "rockchip,rk3588-vepu121";
 		reg = <0x0 0xfdba0000 0x0 0x800>;

-- 
2.47.3


