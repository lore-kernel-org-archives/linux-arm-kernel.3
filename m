Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81F2C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpEIQq05CQKtBrlDIucWXHyOI0We303ns/8nK+cp9f8=; b=ywQrMKXYq4qUvE7D6enXju+w3d
	IZbIieZwMuTGppRQj2lMxGsZTO6KtOSgSSyTmMXpv6KdwgADYft5APCme/GV1iAXfr+4+5zLMtYno
	DI1+DfKPKJi3iakke9XOvgVTTN9gsTS6yF7svhMz0r/lyG0hmQ0pt6I4o6I7uhgeX174qZQgPlULH
	28nUdzHPd6z4rQSbGUXXgcVq2mh0XOoL0IaCrdQN29jh73URhysXobH/JoYHw1kuWs9FIkAjUq/LN
	pKJzC/3+9+awQiSRO+/1+VlpQ8cr+e3GpCvO2c0oqmEeCWPNiJhzc98q0tUBSNLkmrDuZ+dbycUI7
	t8WIC+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvKv-0000000Cxz6-3wB8;
	Thu, 26 Jun 2025 22:44:53 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUszU-0000000CisZ-1eYu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:14:37 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4945C25DB0;
	Thu, 26 Jun 2025 22:14:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEQsEzve_yRw; Thu, 26 Jun 2025 22:14:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968874; bh=DwGlECXqMmhEMkOyKKhzxLoU57auUmzPgkRlX6Wyt/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XaazRoPRZkGBScYdqG6jSpaQBi0ye2beGgmatu6pLO81dATCAFNOuv+o6qLlmeVk4
	 hPyjkQAFUx3cNhCHLJTwCuRVj4yXTt/BUFr6YuDYZ5euJ2fPwoPG+nB311wI8iyesg
	 vcTWtehJKmyTIU4oB0mZJQ/d1cTvQ6wIoWhHa+322SKSFaGHT80Cf2yYJv7KniyZil
	 4X5zw5LVgPzlH8cOM0gUOStP5l6KqW1FTFb+jT+QSMWm2qGtQIKMHw0ZfESJIU8Dlo
	 lsVYIUtSBGeixlDOegZ6jdVD0w9dxxZZ/cYBI5zsXcSydkRhp4fyRMxvdAtmQ0PDak
	 xMdWj4OSFVQkA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:28 +0530
Subject: [PATCH v2 5/6] arm64: dts: exynos7870-a2corelte: enable display
 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-5-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=1961;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=DwGlECXqMmhEMkOyKKhzxLoU57auUmzPgkRlX6Wyt/I=;
 b=d4XHZ0N6TAbSf0AoCWYuxZd8YSq9RCR3p0wFPd7f86/IabovTwv7ISjiwjvA/fLZwPzbVSgIi
 Qk2XQIFCfleANOF6Vs0Xn4Z0x1Wu61rOO5dxmp8qsPz9ZK4iyDCHn9y
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_131436_568350_1684E7C7 
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

This device has a 540x960 Synaptics TD4101 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 52 ++++++++++++++++------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index eb7b48593187409ce6653b7d857b63f6946aa4f7..577c34b798438b2ed70f01b4f954dfa074e97941 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
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
-			reg = <0x0 0x67000000 (540 * 960 * 4)>;
-			width = <540>;
-			height = <960>;
-			stride = <(540 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	gpio-keys {
@@ -124,6 +111,45 @@ vibrator {
 	};
 };
 
+&decon {
+	status = "okay";
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <836000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "syna,td4101-panel";
+		reg = <0>;
+
+		backlight-gpios = <&gpd3 7 GPIO_ACTIVE_LOW>;
+
+		width-mm = <62>;
+		height-mm = <110>;
+
+		panel-timing {
+			clock-frequency = <69336720>;
+
+			hactive = <540>;
+			hsync-len = <4>;
+			hfront-porch = <364>;
+			hback-porch = <40>;
+
+			vactive = <960>;
+			vsync-len = <2>;
+			vfront-porch = <244>;
+			vback-porch = <13>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.49.0


