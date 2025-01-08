Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7F9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 04:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=33QtUlxOPOmb/cO56wq3MJ9fAtcDp8zjHLoxp9vv/4I=; b=q5P2jzi7NVJ9mz1yOXX0sQq7HQ
	o4khIRKbYBH2mHVvbcYxd0JS36MBPzKOUAzJzIrT6OigZZ+lmateEQ9OcTZwmKmSpCCKAU7qTo7OK
	K765zk+t1HuFu+b6ScdFmbAoJJresEAJtZ7O/B5Znw/sWJfNrFi5p1PzzFhIl+H9u1XKZWroCk+Ao
	zYztMBU5Z4/Xoyja0w6seA/zRSZDulwHJ5Belj1rki+bb5L20mNDNLEYUT1L3O/dhJXHrWu8Olxx8
	nivAfV5EPA5IpKKapZphX62tRA8khxApPJQJzOraxL67zrIGqFok+6sMONZh0M9dpVDDDnLZ8R9fB
	qSOwwVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVNfw-000000076uf-0DEM;
	Wed, 08 Jan 2025 04:28:12 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVNej-000000076mz-1Yci;
	Wed, 08 Jan 2025 04:26:58 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1736310411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=33QtUlxOPOmb/cO56wq3MJ9fAtcDp8zjHLoxp9vv/4I=;
	b=bHXXh4nQ5KdPBDuBvMx1k+rYvc1hMzszD05ecS8fF0eWPBhAqyEto0JsUhGEbsVCmzBQd/
	vm4w/gzzUUwPxc4Njahs9n1tEGw8GxJkBbxt/hmVdT9RrK4atBFXjepbpWJ4WWu2oF+bxe
	/C0Xd40UvNgZRUCKJ5KRj2XJLeF7uEsHJ2BZ4OdP7uB/KaSUbATJRTswRIrEdihUfksf83
	F+qlFbETy/GyjvKkw0LHpoHWpVU4o+pjbMFdAmfW7vJmTM0M50+p+qRJZoR+mtOpK/72LE
	PrVqvDN1Mc8ejefFky4uuyCNkKkMig8VOBDfk86bN8QLv1CeHyk8i1lLvw/LIA==
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
Subject: [PATCH v2] arm64: dts: rockchip: Use "dma-noncoherent" in base RK3588 SoC dtsi
Date: Wed,  8 Jan 2025 05:26:45 +0100
Message-Id: <fa1a672dae3644bb3caa58f03216d0ca349db88b.1736279094.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_202657_577881_0E35E5CE 
X-CRM114-Status: UNSURE (   9.09  )
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
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---

Notes:
    Changes in v2:
      - Demoted the series to a single patch, as suggested by Marc [4]
      - Collected Acked-by tag from Marc [5]
    
    Link to v1: https://lore.kernel.org/linux-rockchip/cover.1735313870.git.dsimic@manjaro.org/T/#u
    
    [4] https://lore.kernel.org/linux-rockchip/87bjwxoyzo.wl-maz@kernel.org/
    [5] https://lore.kernel.org/linux-rockchip/87a5choyxg.wl-maz@kernel.org/

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

