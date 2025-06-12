Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F88C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nxFhgBW8M3kP5ud52XBzDKCxNeDdVPMjzwByHw28So=; b=z1x7rUx+igfFlr6fh7ZcPdwgEP
	Vy54A3phSaNH/iORVQ2FbyCGMzzJ2ACBcbEBTEJ9rUr8rKwFKn1dE+svnDo5qrtLOcwcKuU9ekREi
	eTJvxSgJsIMFUa+h9m4G4R/P7WVWeyt6tbPax2ICH0d2fhGAi9Hy2reE6octdk4odQncWRYjp84mR
	HnaS3GoNoaJ5Y2UFCRst8VqbxqVbNNzNAQ6LldAUWNyJ7z9v1BVSLaPUwugPFNO+sdI7eUGAymr32
	KzvuMhuGnmnmua1zHECs1QX54Yjqus/mIpAr/WXFu6S7vGtsMF8Larvlef/UvGrAExY3euVn3YuPv
	V3hlzehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq79-0000000EjQG-0e6J;
	Thu, 12 Jun 2025 22:09:39 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjnD-0000000DmM4-3O5s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:24:40 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A35D820E0F;
	Thu, 12 Jun 2025 17:24:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLGkYtw-cleb; Thu, 12 Jun 2025 17:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741877; bh=dM2Z/gryzzHW7j5yS/KndPCdNXBlq15MThiR+9m4HWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MEUxKW+dELW/ZrkX5GhpZjCRc1NrBnFp7rE83rXNZ8t3omYW5EvekXVs813GaEArm
	 8WV5gs4T8kXoooSJ6Ah1q+FI0WAUcJfV03MdBysOhLHRTsWw5/2p6qUCvxjwOqDDw/
	 pXm/1kXguFm2cq+pWjNZ7Ecqgyq9gVM1B9eIUhwrjh/wfGjI3kTBnh4q0XnPtx2/xt
	 GO6k/eL2mopUjtMXjujSmn/KVrh3uOzOAIQ+Vw6DKdqga2gTqLenhCNcHqcVuS5wAH
	 0BHV6vuZK3GNLHlhBBmCY74+/fa/Nm8fu6KnEpNfguRof+n5VT9zs32qPhjFrSgiDk
	 iA0ypXpm/gDnQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:53:41 +0530
Subject: [PATCH 5/5] arch: arm64: dts: exynos7870-j6lte: enable display
 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-drm-dts-v1-5-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=1663;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dM2Z/gryzzHW7j5yS/KndPCdNXBlq15MThiR+9m4HWc=;
 b=8GKEVrDaEbt8wAMJvbls5aQ4KOddtwtaGL4CE8aZ2DvLCFjth7SMdPXv5PsNdR2Qiu6TW+0in
 3F6772Ht3jNCFNS/NsdkA+PRxD7zG6Fni5iEh9VyzW/B33jfGj/fVBw
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082439_982278_3DDEF2F4 
X-CRM114-Status: UNSURE (   7.99  )
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

This device has a 720x1480 AMOLED Samsung S6E8AA5X01 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index 61eec1aff32ef397c69ee3f0cba8050755f74fc6..ad0170d52a7773d5f5e59b4dc0e4a35d9111c43d 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -40,6 +40,8 @@ framebuffer@67000000 {
 			height = <1480>;
 			stride = <(720 * 4)>;
 			format = "a8r8g8b8";
+
+			status = "disabled";
 		};
 	};
 
@@ -133,6 +135,42 @@ vibrator {
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


