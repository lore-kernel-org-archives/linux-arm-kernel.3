Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64833E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srFWPZoJ66oVYdqKwY3sWmsblGraM2scIhYsTRfasUQ=; b=pS5W+b4uN/aSOdymVO5btlAmSD
	PAF1mzR21FWndV/spzfQCzSQWhys3jWKdjY1nhwSuB44p+7Z0794Bko9utv+1G3ji2i0hV5HHDZfs
	Ip+Cv1o0v+w/999g72syJBfHBa3Wpq6uNFBjT7HET0uCiBaX+HIER64ksVf+ConkKJPIadWNzE8gx
	QiK1VReU8QbHBmpBoXxrNnB6u5EYD5YBDWilggG8s5DQY9P0fl8h1GkSZBJ3lETDWadVWC9xMx+jg
	UQKYyWmV6DjxyVzS4gpMafboLc6ZzGbtF/VuXlprjC1+Qzhm1lZuUWgcz1XMNuAfG9vxgNFHK++Kj
	j2ckMmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNc8-0000000Aliu-2yda;
	Thu, 02 Jan 2025 16:00:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNWx-0000000Aktj-0PG8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 15:54:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4495153B;
	Thu,  2 Jan 2025 07:55:06 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A5293F673;
	Thu,  2 Jan 2025 07:54:36 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 3/4] arm64: dts: morello: Add support for soc dts
Date: Thu,  2 Jan 2025 15:54:15 +0000
Message-ID: <20250102155416.13159-4-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102155416.13159-1-vincenzo.frascino@arm.com>
References: <20250102155416.13159-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_075439_187357_6D24826E 
X-CRM114-Status: GOOD (  13.84  )
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

The Morello architecture is an experimental extension to Armv8.2-A,
which extends the AArch64 state with the principles proposed in
version 7 of the Capability Hardware Enhanced RISC Instructions
(CHERI) ISA.

Introduce Morello SoC dts.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 arch/arm64/boot/dts/arm/Makefile        |  1 +
 arch/arm64/boot/dts/arm/morello-sdp.dts | 55 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/arm64/boot/dts/arm/morello-sdp.dts

diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
index d908e96d7ddc..869667bef7c0 100644
--- a/arch/arm64/boot/dts/arm/Makefile
+++ b/arch/arm64/boot/dts/arm/Makefile
@@ -7,3 +7,4 @@ dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7-ca53x2.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += fvp-base-revc.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += corstone1000-fvp.dtb corstone1000-mps3.dtb
+dtb-$(CONFIG_ARCH_VEXPRESS) += morello-sdp.dtb
diff --git a/arch/arm64/boot/dts/arm/morello-sdp.dts b/arch/arm64/boot/dts/arm/morello-sdp.dts
new file mode 100644
index 000000000000..68926f511362
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/morello-sdp.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (c) 2021-2024, Arm Limited. All rights reserved.
+
+ */
+
+/dts-v1/;
+#include "morello.dtsi"
+
+/ {
+	model = "Arm Morello System Development Platform";
+	compatible = "arm,morello-sdp", "arm,morello";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&gic {
+	reg = <0x0 0x30000000 0 0x10000>,	/* GICD */
+	      <0x0 0x300c0000 0 0x80000>;	/* GICR */
+	interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+	its1: msi-controller@30040000 {
+		compatible = "arm,gic-v3-its";
+		msi-controller;
+		#msi-cells = <1>;
+		reg = <0x0 0x30040000 0x0 0x20000>;
+	};
+
+	its2: msi-controller@30060000 {
+		compatible = "arm,gic-v3-its";
+		msi-controller;
+		#msi-cells = <1>;
+		reg = <0x0 0x30060000 0x0 0x20000>;
+	};
+
+	its_ccix: msi-controller@30080000 {
+		compatible = "arm,gic-v3-its";
+		msi-controller;
+		#msi-cells = <1>;
+		reg = <0x0 0x30080000 0x0 0x20000>;
+	};
+
+	its_pcie: msi-controller@300a0000 {
+		compatible = "arm,gic-v3-its";
+		msi-controller;
+		#msi-cells = <1>;
+		reg = <0x0 0x300a0000 0x0 0x20000>;
+	};
+};
-- 
2.43.0


