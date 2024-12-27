Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5304DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpAoN691ZMq93DDFamwdYsr4hx8aHUG0+VLaMt58XnA=; b=a8xVuIckV1dHTbGz89UQSVfdHn
	/US8a7cR3g9WhMVqlkSKgXCGZ16KL5E5qU98cv8G3gQ7zWMXXeV701OCVjYUIDauf6S5RAXLDV5lb
	/YHHQ7b+/H02o5sOeF75pPvTDeetV8AfIm9PSTp7EfMZrBZfKK5PhHB/V3HiJ/Pso8ljOUZ2RcIlU
	Ktd9SRgTts2xEmdzTpb712KcfcXk1q0jJqGkLhwxKdleXv8b/4Q1MkY6wqVxLQ3GKoURVDtDKK45Q
	ZBpbFVOJXfzqCrRsWHxrMbzjc9HtOoZ17QGONZ96lGq2526jpXeDTRJTaFflCmCmD/Hm4Sb339Ify
	VsQQRTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCWO-00000000Yab-11IF;
	Fri, 27 Dec 2024 15:45:04 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCU4-00000000YCj-0YQ8;
	Fri, 27 Dec 2024 15:42:42 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1735314158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fpAoN691ZMq93DDFamwdYsr4hx8aHUG0+VLaMt58XnA=;
	b=nyx6qur0Mtqhp/NKCI8DlvrPDj77GRamoTO4n2Kl+Lzrh6yjlT07t9r35Ahyuv0Q9uR8+y
	XGWuAqw/teJHX1yPhBNErnfBlf5lKTBfF/vwwFYENrEVW9eiF2ViYcB0mHOVI25H3OUm1g
	DivoLe4jeA+jmgYUZ8V0uTBnczrgfFDll2IQOagt+vFVvfpsA0jenPavvAPO8biFddZkBf
	vlN/ko5lCRTydOgrkN1PBU+yhFLRBtMg+8LsgCxE9yvIB5BGW4C1G2/o3Wqw7qFaAUUNeG
	K0yY2HMPB8F8lKzRGVkgwdg4bbIXT9bM7Qj0+cCj0skVDexnWFQy7HiaEOGMmw==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	maz@kernel.org,
	tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Use "dma-noncoherent" in base RK3588 SoC dtsi
Date: Fri, 27 Dec 2024 16:42:23 +0100
Message-Id: <ecf3505af1a690ed8b975f60d095331778593339.1735313870.git.dsimic@manjaro.org>
In-Reply-To: <cover.1735313870.git.dsimic@manjaro.org>
References: <cover.1735313870.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_074240_321704_30AC966E 
X-CRM114-Status: UNSURE (   8.37  )
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

The preferred way to denote hardware with non-coherent DMA is to use the
"dma-noncoherent" DT property, at both the GIC redistributor and the GIC ITS
levels, [1] instead of relying on the compatibles to handle hardware errata,
in this case the Rockchip 3588001 errata. [2]

Let's have the preferred way employed in the base Rockchip RK3588 SoC dtsi,
which also goes along with adding initial support for the Rockchip RK3582 SoC
variant, with its separate compatible. [2][3]

[1] Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
[2] https://lore.kernel.org/linux-rockchip/86msgoozqa.wl-maz@kernel.org/
[3] https://lore.kernel.org/linux-rockchip/20241222030355.2246-4-naoki@radxa.com/

Cc: Marc Zyngier <maz@kernel.org>
Cc: FUKAUMI Naoki <naoki@radxa.com>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index d97d84b88837..bd2385b6bd7f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1972,27 +1972,30 @@ &i2s3_sdi
 
 	gic: interrupt-controller@fe600000 {
 		compatible = "arm,gic-v3";
+		dma-noncoherent;
 		reg = <0x0 0xfe600000 0 0x10000>, /* GICD */
 		      <0x0 0xfe680000 0 0x100000>; /* GICR */
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
 		interrupt-controller;
 		mbi-alias = <0x0 0xfe610000>;
 		mbi-ranges = <424 56>;
 		msi-controller;
 		ranges;
 		#address-cells = <2>;
 		#interrupt-cells = <4>;
 		#size-cells = <2>;
 
 		its0: msi-controller@fe640000 {
 			compatible = "arm,gic-v3-its";
+			dma-noncoherent;
 			reg = <0x0 0xfe640000 0x0 0x20000>;
 			msi-controller;
 			#msi-cells = <1>;
 		};
 
 		its1: msi-controller@fe660000 {
 			compatible = "arm,gic-v3-its";
+			dma-noncoherent;
 			reg = <0x0 0xfe660000 0x0 0x20000>;
 			msi-controller;
 			#msi-cells = <1>;

