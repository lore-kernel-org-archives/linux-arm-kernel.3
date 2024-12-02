Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94C9D78336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPvEJTUF4fKxgp1idQKN86io/QitnQDoclBYB6IW9fI=; b=TALHgDAQ48MokYLb3ak9Bem3Nm
	oHwIqoTyyv7L51kDw1QgAXi+gJrGuEfC22IJlM3am67+8FQg6WOKZ+HA032mHhE/RAipYwO85OV4x
	DRkfqMkYpFK1FU5qjMWEqDLcshI/yUKhPiuEs4WVGP3lVchb9kvz/YNIhY8VcRSafpWRF1Ga66d+j
	pmzYUBvjbGoGGxXDcJrPQI3M7CPwhj8AtJG0w/M9Gp/CYMmEQU1flk8AWJPFxdjkJOFF47DNxh46d
	QKozBamQSbo4gmd5Z70KQUAScpbV3NNIfaJk5jWV2IUIZcrbFOReUlb8ioYC1ijSQJkQIaHfjmbml
	tw3DqVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9Ly-00000006rew-0PVC;
	Mon, 02 Dec 2024 16:32:54 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9C0-00000006pVs-0zec
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:22:37 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y28Fj54PKzGpHL;
	Mon, 02 Dec 2024 16:22:33 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y28FY6vqyz6tkR;
	Mon,  2 Dec 2024 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733156548;
	bh=wmnPzi5qSZXoOHQdV8XxTwA45ynaj0iN/09u5qaTPy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mvbEfbbSWVGxWuUD1gmzcIl04n9KYr/8PUw/umRTwSY7mBRgTIFbey8buj7wMZ3DL
	 0J0S0xqwMoMtNPvt++SbOpy12FR2gaFju9N5J2WQ2lG3OcboIzuNp4dWUbZQSILluL
	 nM4SJ04XUC3sdilhLQbCvL4sNAX1/F/x1WppceGVHtDu4vTLbledcEbGwa8i5ksF1Z
	 6S1deCt/T6X7bpR06UcT/O2mgsOfUO//bd74ulUimyL/RR2S8RjELhkRa6CmphLdIY
	 TQYWJm3Z+NahME6SBPRcGpyo2T345NZ7XQeDI86ig7A66k2pf7zrqE3u4hjsmc5HHe
	 /AX5aNsUA0Pxw==
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
Subject: [PATCH v3 3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
Date: Mon,  2 Dec 2024 16:21:57 +0000
Message-ID: <20241202162158.5208-4-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
References: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_082236_293307_7DC45605 
X-CRM114-Status: GOOD (  15.22  )
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

Add initial support for the Samsung Galaxy S20 5G (x1s/SM-G981B)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 12GB of RAM and 128GB of UFS 3.0 storage.

This device tree adds support for the following:

- SimpleFB
- 12GB RAM
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile          |  1 +
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts | 28 ++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7a934499b..deb8dc509 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
 	exynos990-c1s.dtb		\
+	exynos990-x1s.dtb		\
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s.dts b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
new file mode 100644
index 000000000..162961446
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1s.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 5G (x1s/SM-G981B) device tree source
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
+	model = "Samsung Galaxy S20 5G";
+	compatible = "samsung,x1s", "samsung,exynos990";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x3ab00000>,
+		      /* Memory hole */
+		      <0x0 0xc1200000 0x0 0x1ee00000>,
+		      /* Memory hole */
+		      <0x0 0xe1900000 0x0 0x1e700000>,
+		      /* Memory hole */
+		      <0x8 0x80000000 0x2 0x7e800000>;
+	};
+};
-- 
2.47.1


