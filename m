Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F60FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 17:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rCWXm3oR7Q5xI1GaxkjUiMi5GbI6j7q7dpvjpbIdZc=; b=I0/h9S9HCRj18N/YIbMdp3QXfx
	/+rJwXD32l6NOfBo3Incy4E6028d8NHbeL4SeKOltCR8x6amcqSpNdv5PUCNou+AdIDuKrPHFpViQ
	zYKKScoMKu2S+4VJFCgW56xwU+pqYrYLCKR0B7hT5wmS9EVzjVNgNpoFwKRTI3A6MBFOXOBuI2eLE
	wHZLnhYxCKEKYeoY2uqofw6SbT0qeXSkurRus/+BkGJLCfF9o6rzuU8jW5epOZOE0NwNkNE7f3oQR
	8+uoytkg9XNhJDiImLuGrQod5WeZNJf9yXewAWCYSq02Cx0YQCQA6z3d+g3WYF0DyAzvEZVsEZNem
	GWXYQvJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2vej-0000000Gzjt-170O;
	Sun, 28 Sep 2025 17:57:53 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2vef-0000000Gzf7-2dcK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 17:57:50 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 311BD26151;
	Sun, 28 Sep 2025 19:57:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jDSkinZ6OKr; Sun, 28 Sep 2025 19:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082267; bh=G8POg89qhc3YFRtRay2TG6zhQ5wGIWVmGavGeCYc1jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=avOpMxvagnWapndS0g6pkU9rOzu32Ge0/JqVNiSg3Mhadtw5QIjgH0FnmGeTHnVoN
	 VLEV6c/dT/+UWJB9GpOgjebZVJtq1KldJs01HTIUD910mxozBOeND+w1yd3WLz4OO2
	 B/GGCP6EqjBiutggRBWs/CBFE+GkU2keCncqJfxmicNmlbtZjoP+b/pfB7s2A/stLs
	 WilxswbPT2xx6tNvaquQ+LzAAkGc+HoHkpFY9lDBcVgFqIOCFXH3NN4UI8+GTidGO+
	 aGZgiVMl47a3/SqGsYduly+ZJLo3fTeDoiYSZ5Vg6582JbLXp/7y3CZZoHa9DyUGB9
	 kk/Ki9vyra6ow==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:40 +0530
Subject: [PATCH v3 6/6] arm64: dts: exynos7870-j6lte: enable display panel
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-6-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=1965;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=G8POg89qhc3YFRtRay2TG6zhQ5wGIWVmGavGeCYc1jg=;
 b=yWWgBnadulfkxT6DEECzwI8LcB08R6butKr1fh8Ucd/eC0QfgCDlbARd9CHx+0r8IKeV4b1Gx
 zUpkQ9zSo+lAnwbGwQky/XHHTa110+oGWMw/zmHwFA3XAXUvXQkHZpi
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_105749_815610_6EDC613A 
X-CRM114-Status: UNSURE (   8.93  )
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

This device has a 720x1480 AMOLED Samsung AMS561RA01 panel with
S6E8AA5X01 controller.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 38 ++++++++++++++++---------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index b8ce433b93b1b488da31bbe4846f8092243611ad..f92e1f8fabf3e01b69583f82cf842178a21002a2 100644
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
@@ -119,8 +106,9 @@ ramoops@46e00000 {
 			pmsg-size = <0x4000>;
 		};
 
-		framebuffer@67000000 {
+		cont_splash_mem: framebuffer@67000000 {
 			reg = <0x0 0x67000000 (720 * 1480 * 4)>;
+			iommu-addresses = <&decon 0x67000000 (720 * 1480 * 4)>;
 			no-map;
 		};
 	};
@@ -133,6 +121,28 @@ vibrator {
 	};
 };
 
+&decon {
+	memory-region = <&cont_splash_mem>;
+
+	status = "okay";
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <500000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e8aa5x01-ams561ra01";
+		reg = <0>;
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.51.0


