Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14A9C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lThSrftMBiV3yOWLSB0EV72gteOBtzX2Dz82vacKA8o=; b=sk7bKrUh1nqu9tsv6dWymSHoMo
	qKp2xkSARoaBBagnwMGQg419V9LXXdfthjENNb1JsErAjpynu3hGgTSTKgafidfb21C91G5K9JgTi
	gpWCDn5FE3zrP81T4//WZOcM2DQMEHCdT/aCtj2KZIblxUlg17syoXgF4YOA3LwLUeGhqIs2uUTyh
	sWHGiLM4sC/c3L3B4G6CU3+wv9ES1jtE0W0NL9dn0PrQD9oHCcpoc4ypjAeWQQiTKsb3lxb9YX6xQ
	aJEPNe43KMEaBag3PB5Oh7Io+h672BY5l8K9xiOPglA3FzmbSZavengxmuHdVH7iA6AkSVvNadZ/a
	h5zFnR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvNB-0000000CyUt-2uP0;
	Thu, 26 Jun 2025 22:47:13 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUszZ-0000000CitQ-0Upp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:14:42 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F33CC25F8C;
	Thu, 26 Jun 2025 22:14:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROlUM-guIM2E; Thu, 26 Jun 2025 22:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968879; bh=cg7s6ZiVvmErjdj1DTXd7oxh6Zhi0Y1dn8W/u4K8qBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UVaRZlgG9nWYsZtd+jxjqxzTwkGvROfDUUMR780HiuU6G3dbVIKviaEvSMWhypouh
	 OOfzEMv/cCmp+ozPpOGlea0q4rIcFlnTA6eAGKxt0Z4ePRRsdI0NNGwZaCy5RCmVuA
	 NGBrY6nJK2vxE8A986TmFZBXVZRvnlURjE9nxMbfHozyB1dY5iXGQ+2qpn4VCbLX5H
	 m29Mu9QLBoaioXBXAqoSg82dcU76oo7i7tU87tCGadL7uElhTfZX5SMKqkbV9DeWvF
	 0EF7b/TMv18b93fE9rmw0IAsuWLVQDxEDQwVVhPpsBCIhtoz2L1Fzd9hK+S+x7oqQt
	 1Zhu1Rkduaf/Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:29 +0530
Subject: [PATCH v2 6/6] arm64: dts: exynos7870-j6lte: enable display panel
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-6-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=1916;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=cg7s6ZiVvmErjdj1DTXd7oxh6Zhi0Y1dn8W/u4K8qBE=;
 b=pqzZ0zpa9IlCWMHbS2c9JInserNn+o8T+yBmHd8KRENeWQfhVP3CCni/c0jioa1iZn/kjJvHg
 0BO5isJX0MOD5qO3IqlUcew7aAyB/kk8e0ROSIrMxEQenW54uhd6Nxq
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_131441_292535_4577EA2B 
X-CRM114-Status: UNSURE (   8.83  )
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

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, remove the
simple-framebuffer node in favor of the panel.

This device has a 720x1480 AMOLED Samsung S6E8AA5X01 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 49 ++++++++++++++++++-------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index 61eec1aff32ef397c69ee3f0cba8050755f74fc6..6d57f583d687003850f0b03bd19fa9e2f6e33332 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -27,20 +27,7 @@ aliases {
 	};
 
 	chosen {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges;
-
 		stdout-path = &serial2;
-
-		framebuffer@67000000 {
-			compatible = "simple-framebuffer";
-			reg = <0x0 0x67000000 (720 * 1480 * 4)>;
-			width = <720>;
-			height = <1480>;
-			stride = <(720 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	gpio-hall-effect-sensor {
@@ -133,6 +120,42 @@ vibrator {
 	};
 };
 
+&decon {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <500000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	panel@0 {
+		compatible = "samsung,s6e8aa5x01";
+		reg = <0>;
+
+		width-mm = <62>;
+		height-mm = <128>;
+
+		panel-timing {
+			clock-frequency = <73094400>;
+
+			hactive = <720>;
+			hsync-len = <2>;
+			hfront-porch = <62>;
+			hback-porch = <26>;
+
+			vactive = <1480>;
+			vsync-len = <2>;
+			vfront-porch = <12>;
+			vback-porch = <10>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.49.0


