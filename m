Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654A2CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qz+lfQbXh/vtgTAMDSA1zZvTCkG7VH3hIQ+H3511khQ=; b=nhvNc7G0cYtZeSB2S/hW/1nnax
	zqRGxhPf52PYEWpN1nV/ZTYfbvZ5JsuINntGX5KJFY22V7p1h8SqDXKt1kQ5+Sf1AQaThKPUKM4kA
	xzab2EWhDcIv53FK6NO73jKt1yXUDUjnjMlbzu5e18ZnYqoe3zzb3BYsC9Bi3haIUPc25HCEH0ZCV
	ctKpNHgi5az592U0dWJ8ArRnjY5hJiA9lL1QlgEzVPyg/O2ITAej4emTqtaUf+6q2Mhp8uKV4HjWe
	N6Cu2o/h/P9hLbs21Pw39Lu9O3r3Ob6FPK+z7C9vfd3rz9rk59abpAZT1oxszmEaKXmPDt64nrihR
	/zmbBcRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umySc-000000039st-0eKn;
	Fri, 15 Aug 2025 17:43:26 +0000
Received: from mail.grinn-global.com ([77.55.128.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx0m-00000002wAQ-39Bx;
	Fri, 15 Aug 2025 16:10:38 +0000
X-Virus-Scanned: by amavisd-new using ClamAV (8)
Received: from mateusz.grinndev.ovh (79.163.192.75.ipv4.supernova.orange.pl [79.163.192.75])
	by server220076.nazwa.pl (Postfix) with ESMTP id 302691BB0F9;
	Fri, 15 Aug 2025 18:10:33 +0200 (CEST)
From: Mateusz Koza <mateusz.koza@grinn-global.com>
To: angelogioacchino.delregno@collabora.com,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com,
	b.bilas@grinn-global.com,
	Mateusz Koza <mateusz.koza@grinn-global.com>
Subject: [PATCH 3/4] arch: dts: mediatek: mt8370: add Grinn GenioSBC-510
Date: Fri, 15 Aug 2025 18:08:36 +0200
Message-ID: <20250815160837.371592-4-mateusz.koza@grinn-global.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815160837.371592-1-mateusz.koza@grinn-global.com>
References: <20250815160837.371592-1-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.50
X-NA-AI-Is-Spam: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_091036_966514_B3569D17 
X-CRM114-Status: GOOD (  13.75  )
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

From: Bartosz Bilas <b.bilas@grinn-global.com>

Add support for Grinn GenioSBC-510. Based on the commit introducing
support for the Grinn GenioSBC-700, this change adds support for the
Grinn Genio SBC-510, a single-board computer based on the MediaTek Genio
510 SoC.

The GenioSBC-510 uses the same SoM and SBC base .dtsi files as the
GenioSBC-700, enabling reuse of the common hardware definitions while
providing a dedicated DTS for the Genio 510 variant.

More details about the hardware:
- https://grinn-global.com/products/grinn-geniosom-510
- https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc

Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8370-grinn-genio-510-sbc.dts   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 7383d75d8041..729d786b1236 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -102,6 +102,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk-eth.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-grinn-genio-510-sbc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-grinn-genio-700-sbc.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts b/arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
new file mode 100644
index 000000000000..632e2b35443a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
@@ -0,0 +1,19 @@
+/*
+ * Copyright (C) 2025 Grinn sp. z o.o.
+ * Author: Bartosz Bilas <bartosz.bilas@grinn-global.com>
+ */
+/dts-v1/;
+
+#include "mt8370.dtsi"
+#include "mt8390-grinn-genio-som.dtsi"
+#include "mt8390-grinn-genio-sbc.dtsi"
+
+/ {
+	model = "Grinn GenioSBC-510";
+	compatible = "grinn,genio-510-sbc", "mediatek,mt8370", "mediatek,mt8188";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 1 0x00000000>;
+	};
+};
-- 
2.43.0


