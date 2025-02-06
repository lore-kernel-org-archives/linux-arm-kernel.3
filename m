Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EEAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kH0+JGJ28AOCheBpS02kDekVXIgobDL51e4ShaB0Zjs=; b=iVJo8p902zNhU2CarW3/Mt1B2H
	a+cjEzgFISFr8jlwxrmcAnV4j3tcmwoCQ8obOisIi5ZWTQphxEHB28ghx1fC55B7qfSWs4zzrfE83
	aW58FlpCT7MJwExkLhTJvO4rw3ocpjXeqcPu3Mx9/8UoXLLUZnwL5pF7+AROgeU/3J21ZHhVdg0+C
	WDN9kc+puv55nl3zlhv/y0keOpuRbRsxrahelMLPjeGupiX8osOzHW53WxEyT2jqwz14mtBZ/AcBa
	hqxD2EQhaFeYYLBBDAXE3JpWOypy46NYbj4aEpwhRvoTg+XCGu88dLC5IJ8MvFdoyrdMu3XCCfI3D
	CTNav8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3zr-00000006jlz-0IOx;
	Thu, 06 Feb 2025 15:40:55 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3yR-00000006jTy-0zBV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:39:30 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B4F9B1FA0A;
	Thu,  6 Feb 2025 16:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1738856359;
	bh=kH0+JGJ28AOCheBpS02kDekVXIgobDL51e4ShaB0Zjs=; h=From:To:Subject;
	b=sNo7iFwFXaS/G6IrumBfAqnjDFIN5KPso8Am/Ghd0RMqQpT+D6DzlP7h4fmvEtmJU
	 vbUQlhZC6EXau5evJUgdZs0/eRdOD7Et7STwiVL3lOSk5/10vpmdbsjDcoXZj4Qi+J
	 sUQo5JgqQ9AIOiPuNFUrOgdCh6AA5DoXBskUWlvp5mW2/LbdwEcyYDKzhK1AXpwk0v
	 TecKe1fU+gGo0bSDIUXeyP1HhkIsaEiEj7fa6GNu348aWtlsZhps4LHuMoes3gvXgE
	 xz+yo9NAJ5IFyoWxxSGw5FuCs609qX9vJPq5AmTxnM8xoOT6Iha7ONVHRawR21EsJV
	 eV03cTtxB9Ugw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62p: Enable AUDIO_REFCLKx
Date: Thu,  6 Feb 2025 16:39:11 +0100
Message-Id: <20250206153911.414702-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_073928_322723_01861307 
X-CRM114-Status: UNSURE (   8.00  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

On AM62P-based SoCs the AUDIO_REFCLKx clocks can be used as an input to
external peripherals when configured through CTRL_MMR, so add the
clock nodes.

Link: http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am62px/clocks.html
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index 420c77c8e9e5..4b47b0774330 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -42,6 +42,26 @@ &inta_main_dmss {
 	ti,interrupt-ranges = <5 69 35>;
 };
 
+&main_conf {
+	audio_refclk0: clock-controller@82e0 {
+		compatible = "ti,am62-audio-refclk";
+		reg = <0x82e0 0x4>;
+		clocks = <&k3_clks 157 0>;
+		assigned-clocks = <&k3_clks 157 0>;
+		assigned-clock-parents = <&k3_clks 157 16>;
+		#clock-cells = <0>;
+	};
+
+	audio_refclk1: clock-controller@82e4 {
+		compatible = "ti,am62-audio-refclk";
+		reg = <0x82e4 0x4>;
+		clocks = <&k3_clks 157 18>;
+		assigned-clocks = <&k3_clks 157 18>;
+		assigned-clock-parents = <&k3_clks 157 34>;
+		#clock-cells = <0>;
+	};
+};
+
 &main_pmx0 {
 	pinctrl-single,gpio-range =
 		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
-- 
2.39.5


