Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64239D5CCAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 23:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5NIjULElgo1LTtoHiX0Vd8XER5gAsI7GEvLbKhD5ng=; b=4JjPK4iBd1xDNrBq8DEPEf8cMs
	7yPD+apqRlB758pArfxahazIDfYF3G/egm3jrmceKTwaWBljbFSa02RYUvaWWrcbXpwH/CjzveeaK
	IeTY115mLvFCfdWStpw25mrtFMxJAlOZICjH/PYxDM+wrCO4Ry/6L2vp5nUxSTvw4OIQ9/o8MHSHa
	8nDU9AZns1cnfYr81IT7s2NkYM/0e59SSWxuln37f/1O1WWBZIS3hc5u7bR52eWFAbXCsGtaAHNR7
	bJNRPJf3iz5fSVnucnWfkibJUi3hHawJI5p7coLxJcgyOZ9xtmFogYqb1BpB3JzeSsoOvDk37M4mY
	QDiFswGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6IIi-000000024Q9-1i2Q;
	Wed, 30 Oct 2024 23:40:32 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6I2Y-000000022yu-1x6D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 23:24:22 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Xf38z5GC0z4wLY;
	Wed, 30 Oct 2024 23:23:47 +0000 (UTC)
Received: from umer-b550pro4.lan (host-92-8-254-228.as13285.net [92.8.254.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Xf38r0vnvz8sWQ;
	Wed, 30 Oct 2024 23:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1730330622;
	bh=rrcxWMsdAW6NMlC1f4N45bAtmggSlI8lhfcgoRDdRok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HmC1ZMErsViEEu2EXu4cIxcumkp4pIFY61z3AWX1qVaJDzjOXSop4QEi0DKZDAS+9
	 JB+6XbmqWgUX2iO+PSezTTJ/6NCvrYiTinmeE6Yf3pY4ZH+KyiRj3Uq6FBTivAZ2qB
	 jGjJpAJSHnlCvaA7ufuxMRBSnn/ELhtie0rcyjGXeIdxdGkcVvPGJNO5ZGMeHTDRUW
	 oZhqyXBWZU1ybIvtNXofBCziv2XmBznbwg2tII1kjrN1KRQyVeRrDxNotjY4pgiP1c
	 UD1trLHG5+aXShk8XJ/OAG8Cs66gCldTZdpERaug0d5k2kRb2uGZAByw5vHLMPUOwT
	 L7sOeKBjmQyhw==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v3 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
Date: Wed, 30 Oct 2024 23:23:08 +0000
Message-ID: <20241030232308.72210-5-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030232308.72210-1-umer.uddin@mentallysanemainliners.org>
References: <20241030232308.72210-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_162350_566848_4D659727 
X-CRM114-Status: GOOD (  15.25  )
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

Add initial support for the Samsung Galaxy S20 (x1slte/SM-G980F)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 8GB of RAM and 128GB of UFS 3.0 storage.

This device tree adds support for the following:

- SimpleFB
- 8GB RAM
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile           |  1 +
 .../boot/dts/exynos/exynos990-x1slte.dts      | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index deb8dc509..783807249 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -10,5 +10,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos8895-dreamlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-x1s.dtb		\
+	exynos990-x1slte.dtb		\
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts b/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
new file mode 100644
index 000000000..7bca641e5
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 (x1slte/SM-G980F) device tree source
+ *
+ * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990-hubble-common.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	model = "Samsung Galaxy S20";
+	compatible = "samsung,x1slte", "samsung,exynos990";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x3ab00000>,
+		      /* Memory hole */
+		      <0x0 0xc1200000 0x0 0x1ee00000>,
+		      /* Memory hole */
+		      <0x0 0xe1900000 0x0 0x1e700000>,
+		      /* Memory hole */
+		      <0x8 0x80000000 0x1 0x7ec00000>;
+	};
+};
-- 
2.47.0


