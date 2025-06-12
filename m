Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FFC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsO3256oNrILR7WyUK2nTd+1F+J7wio89CVQUJeR8no=; b=fUxrXiNyZuepGK3OunQNPMAC7T
	ksZ/uoWjX8DfsxntEOWcvN7GKXC9QWzo6tZg+bNxQt8yInUlYRlBuMTvdc+tXTrqtvZXEY1Cl9p4f
	HDJJKrjSAw+DuUPFDf/1eav8QTR7f+1EbouRRtaw8Z5dl2nkIY68d3T24gjzhQheqG2M90bWsDocO
	xZWPliQfrJZGQYMttH6E/7ajQO6M0FtuZLtiVi1WcKBrxGrjXsuVTXe630MoSFbRlbnaNPN60J3I3
	mWhPuK3CStjGZqG8r9oHw0MWxX07pksvhI+IP5BZJ9hBQaiTfQwDdk0QbyvRSwEO5pbVoCFUgMSu5
	CnHCnd9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq77-0000000EjNX-3oCy;
	Thu, 12 Jun 2025 22:09:37 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjmv-0000000DmJ6-2vyb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:24:22 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 92F7B23069;
	Thu, 12 Jun 2025 17:24:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uAinr5v5Vkf; Thu, 12 Jun 2025 17:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741859; bh=W/nkKTD79z758WQYParQygtnrS69BZz3GsqxffvPYMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AkWx6u+XW097M1uy+DN8YqHuvpeHd+nFZVWmImaV4oLpv6pQ4eEfBa5lwTVX7bYTv
	 XJixKJCgRXikkjnnx9FsohvIGtZ8OYW2bjYZ4yfmfL8W90rntslmB5kcCLrWYLB9wF
	 /zEjV2ZPtDblV1mGBjZi927u7GA+dTCbAJ+fMAkcHGkWQwCwBIZrTodzLou6E1tOmd
	 DJNU5hTcDT6RiIiWwsNVGmbofXR/85A5oD6CGlUTCI9S++mD2XUWb4NPgHEiWlA8RF
	 HiPfNkVPx7uuavYW3dj2Ul44RqcrsIE0yOFlYnmfM6hOKcpIdN6UiB45fNDHBiRZax
	 taHQLvrb8smUQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:53:39 +0530
Subject: [PATCH 3/5] arch: arm64: dts: exynos7870-on7xelte: enable display
 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-drm-dts-v1-3-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=1722;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=W/nkKTD79z758WQYParQygtnrS69BZz3GsqxffvPYMg=;
 b=67U66+f78PB0MYl2wyiD9HsWaqEzJEReAsaeb17NmF43CNe5hmXPI6QUkH1sJHbN2EVPk9c/I
 ERXl1ASIfjuDoihJYxLOEPJPzNzpRJGyEN7pjJflLlI7zkvftd9M2QP
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082421_873362_A59A7B89 
X-CRM114-Status: UNSURE (   8.14  )
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
appropriate panel timings for this device. Also, disable the
simple-framebuffer node in favor of the panel.

This device has a 1080x1920 Synaptics TD4300 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index eb97dcc415423f405d7df9b9869b2db3432fb483..86a7fc2554a137752862c37d27cf9813b3ac5514 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -40,6 +40,8 @@ framebuffer@67000000 {
 			height = <1920>;
 			stride = <(1080 * 4)>;
 			format = "a8r8g8b8";
+
+			status = "disabled";
 		};
 	};
 
@@ -122,6 +124,44 @@ vibrator {
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
+	samsung,burst-clock-frequency = <1001000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	panel@0 {
+		compatible = "syna,td4300-panel";
+		reg = <0>;
+
+		backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
+
+		width-mm = <68>;
+		height-mm = <121>;
+
+		panel-timing {
+			clock-frequency = <144389520>;
+
+			hactive = <1080>;
+			hsync-len = <4>;
+			hfront-porch = <120>;
+			hback-porch = <32>;
+
+			vactive = <1920>;
+			vsync-len = <2>;
+			vfront-porch = <21>;
+			vback-porch = <4>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.49.0


