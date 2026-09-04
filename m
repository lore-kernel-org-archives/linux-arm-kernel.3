Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10987C79F87
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvH12Wkw5GNJa7jFREGOQOlrScLWslkzq25GVdQ6L8Y=; b=3LgpBLQdDLAfTikaLoMx/rDPYN
	/nhnlGU+nFAM0xaIumA0Kch9RRrodV7M6pn5LVni1zp6k4L+9i0/f4gzRPM+Vftaxd6ZZc+E6de0k
	iWYj1CarVqiTowTORUuBXRSrKZgyEedP5FawErfH4UUBgvXYuCjIR25om6O6Bv2LJw5UjhUKSza3M
	m+oU8+39PTOY5XjO++70tNS0zKqb+5PPQS4zCdO4LsJpPzMw3w3MNmXyG06duJJq8SljK70d1lhnL
	ytb3TMwrFxAkHzuqeBVWLgFv8HZFQz2KN8VGMgi3k/UXXSAZH00ZakyMD/EfNgo9A/Y2ikj1RDqM8
	KQoDWegw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TZe-000000025l0-10zy;
	Fri, 04 Sep 2026 13:03:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TZa-000000025iI-25uD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:03:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 011B54E41509;
	Fri,  4 Sep 2026 13:03:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C876B6057F;
	Fri,  4 Sep 2026 13:03:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF8FF11C7ACEC;
	Fri,  4 Sep 2026 15:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526991; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MvH12Wkw5GNJa7jFREGOQOlrScLWslkzq25GVdQ6L8Y=;
	b=otStiFrDyfPjzH77zPPk2PHbXzCyuymGxP4JVUHXhAN86C1JuHH+TJxgXVK/EhcEgSoNeS
	o/cG8UkTROYFR1eci80hxh8Xz+e4zW+B2C8Ogu9CrnAFCCPTrml/Mg89tRQQ0UTrnhtrLR
	Hc62o/0BvlDJWU+x+RWMa1AnXcHcCuAqW1HcqTKKExmzKZ5LLDNA2mJQY0SfMxirkLHI/u
	sxR+4xXNPNIUiP7/2bFUxuNxnk7VkVOsdvYhxG9bzTLAejwzwg6wrceAfinGhKNyse4SAT
	1T1NjFuWMGMDCGIH7/WoTIPVeqwcIngyGXqZo8zhSgrARNHxWFShf+WHVAjPhw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 15:02:38 +0200
Subject: [PATCH v2 3/3] arm64: dts: nuvoton: Add NuMaker board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_060314_729370_B859104D 
X-CRM114-Status: GOOD (  12.54  )
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

Nuvoton MA35D SoC is used on the NuMaker SoM, itself plugged onto a
carrier board labelled NuMaker. Create a DTS including the SoM
description. As a first external component, mention the SPI NAND
connected to the Quad SPI controller.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 42 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
index 3bc9787801a5..4c82109c885a 100644
--- a/arch/arm64/boot/dts/nuvoton/Makefile
+++ b/arch/arm64/boot/dts/nuvoton/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MA35) += ma35d1-iot-512m.dtb
+dtb-$(CONFIG_ARCH_MA35) += ma35d1-numaker.dtb
 dtb-$(CONFIG_ARCH_MA35) += ma35d1-som-256m.dtb
 dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
new file mode 100644
index 000000000000..16c003998d3b
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 Bootlin
+ * Author: Miquel Raynal <miquel.raynal@bootlin.com>
+ */
+
+/dts-v1/;
+#include "ma35d1-som-256m.dts"
+
+/ {
+	model = "Nuvoton MA35D1 NuMaker";
+	compatible = "nuvoton,ma35d1-numaker", "nuvoton,ma35d1-som", "nuvoton,ma35d1";
+};
+
+&pinctrl {
+	spi-grp {
+		pinctrl_qspi0: qspi0-pins {
+			nuvoton,pins = <3 0 5>,
+				       <3 1 5>,
+				       <3 2 5>,
+				       <3 3 5>,
+				       <3 4 5>,
+				       <3 5 5>;
+			bias-disable;
+			power-source = <1>;
+		};
+	};
+};
+
+&qspi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi0>;
+	status = "okay";
+
+	flash: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <30000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};

-- 
2.54.0


