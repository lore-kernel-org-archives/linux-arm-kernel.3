Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F91C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae4Y1LKEtrS8HaD4L0HeXkOJ7/FVtmzDxwwoJBX8xFg=; b=GTUZY60nXaRFO8+Ba9GyYTj/GC
	wYya6QIUSsskCH+8XX9P/wxo1hzaavPUgfld+59LePpoAx5hSA5ObSMGLQFy8SdxAOovalWeS7PO0
	7RtMchetUmST40tOF57gyCA/wR6h6cFYYX3poiYtUg8hewrUSprRAGTn74+4RxfXzJ+Xb4xBooyX2
	Th4bP/FgNcWiWLFyDJJxxn2OTaLpzRXT50qG1ZqIMRnqMS+aWGO3oeIYBau6Ck09JJ8JdVj7k7y5l
	3gUP7obLJ+JiyqxMb3VtcczYB0dopHYTOlaGBlXss6STizGDbXLnzrlV6+FZwZG7jzE5GtNJXaDm+
	v5QD/4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPop-0000000Hb6D-20uI;
	Thu, 13 Aug 2026 07:25:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPon-0000000Hb4r-1xJQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:25:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 009204E411E3;
	Thu, 13 Aug 2026 07:25:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8813602B8;
	Thu, 13 Aug 2026 07:25:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 752AD11C4D9FD;
	Thu, 13 Aug 2026 09:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786605930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ae4Y1LKEtrS8HaD4L0HeXkOJ7/FVtmzDxwwoJBX8xFg=;
	b=0+M/66RMB64SC2dFcH8dQZsVj4piKukOs8uPS87RZImBAACr55XDgmyK8BKR97jWKcrEl3
	z5grx77YgnFag0y0TKSO/yytvOeEkuqI6MqrHdGY9cR2RxuLuwUmiCPl+oeRfWabhxkEOV
	XbTOcf03cxkzO8OS1nN54QTkqckL3QpB59shYBj7GGbuld7JxSMa4MRsbSeaqIQ8Zp+iS4
	OAPrzJknT2l71TY2kV9KgAc/UGFa8EkJ9elbhD3tZXGJPrtSuFk2W5kejLVAFTjbst3Dqn
	xr53xWKhRSxu9o4HQUHTaNwbTZ88v2CMdPEQAAECTRN36hW2DZ/L+w7j/cBbdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 09:25:07 +0200
Subject: [PATCH 2/2] arm64: dts: nuvoton: Add NuMaker board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-perso-ma35d1-upstream-dts-v1-2-bb237fd7c3c2@bootlin.com>
References: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
In-Reply-To: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
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
X-CRM114-CacheID: sfid-20260813_002537_653834_D38ECD97 
X-CRM114-Status: GOOD (  12.59  )
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
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 37 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

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
index 000000000000..01f1f800aef8
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 Bootlin
+ * Author: Miquel Raynal <miquel.raynal@bootlin.com>
+ */
+
+/dts-v1/;
+#include "ma35d1-som-256m.dts"
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


