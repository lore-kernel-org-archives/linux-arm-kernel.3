Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB22C71150
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3K46LfadMMjb4rjotQOYvpnIqOb3gEbi6bucpevkHY=; b=icLQ0peGt5U2JYqhr19Lj0yxf6
	MWhRdTU3Ba9YVPVd5NQi9FgNNavd1eWoaF9b6O/wE0A3hfpFtQE+dGvaSSOpq3KBgF01SQIE2CykA
	or7xiThcDsSTkqcaMa80rsdzcfhSLVpZG02oOjYF7Qcg4eB3afeOe5fR388PN2dVOD43GNPh+W2BU
	vjfx246GTSlVNV9eW0k6BT3NwIqW8tGPWM0FgPHUW5rBZ8PI9nXSMXBxA75zLWwySD6x/rwjiDb7E
	xEz8ygREkm8UtPO8xXGqp+ABvIZPfjuYR9k1OEMf0QeIwfcEIlXvBCtNbZbG1e/ZNevrgYSkN8U8z
	ByluVfqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq78-0000000EjOv-2EIq;
	Thu, 12 Jun 2025 22:09:38 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjn2-0000000DmKO-2VY6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:24:29 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6C94F25F14;
	Thu, 12 Jun 2025 17:24:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBxoWwEKWPQX; Thu, 12 Jun 2025 17:24:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741866; bh=hP6/7Ulk7xtnGXya7SX9uWClvPQd8ylGJd5uaHnGFVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MsJ+4zoCu3ZpEWzPU+9mX+Brdhdzw4pz+7LXUAhVGBgPVjX7Tg97wI7GObyKHipJF
	 q84GMezIF8dJ1g/lCQ7aDw59WGwcC5Q5fOeBat1c+0kadvKHyJ4bEZey1NM7LK1yUI
	 x9CdlEQ+nqah/hfVvtZRc4UXWv9rd5qu+s2Co0TwuPzKxaUhXezvWpxdRnq91IV1BP
	 POt1eCRiM6lNSSJHDA2m/cL1V+GzmJrwSGe2bbU3d3bnbH2xiLRFtrtPwXi7BfIoaJ
	 r0wBvamDdqqKFbOes7tU934cBcSyBNgIyhhkh9/HRw4453GdbF5lcv9P2ZyNom4/0s
	 CMcxIqyB4lf8A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:53:40 +0530
Subject: [PATCH 4/5] arch: arm64: dts: exynos7870-a2corelte: enable display
 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-drm-dts-v1-4-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=1723;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=hP6/7Ulk7xtnGXya7SX9uWClvPQd8ylGJd5uaHnGFVk=;
 b=kD1QBIhiLnkG+6ETKI346c9XYAaR+cSO+lCQU28qlMFjMsPSG8c0/Y1xJ+9l1OQW79UZ7ldjm
 x9EqOjKxo/JCfA6uSY4oFylibUK/LbZY9LVY48202uYVVvAbmD9rbAR
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082428_771507_AAB302D7 
X-CRM114-Status: UNSURE (   8.39  )
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

This device has a 540x960 Synaptics TD4101 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index eb7b48593187409ce6653b7d857b63f6946aa4f7..d7104d42240d408f07d4d94750307e51d34b477c 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
@@ -40,6 +40,8 @@ framebuffer@67000000 {
 			height = <960>;
 			stride = <(540 * 4)>;
 			format = "a8r8g8b8";
+
+			status = "disabled";
 		};
 	};
 
@@ -124,6 +126,45 @@ vibrator {
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


