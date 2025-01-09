Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4223E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4v0m6DhAtwCcR2FHYeZKXNyq2xkLzonMXMc5I0H6zY=; b=UFXR64dRbd9OIdEdQuc7NLvE9d
	pI/8P0atBJNZ7ct1CAI0eXrvD4YSv7Jw4XjHWTMpjMaRG6nKp/sTRQ5cJ/qtT3cMW7ft2CLnn2x6H
	Fdfh0odJIkcu/oYuaKD33h0cCXh3V1tELAkv9d3sNvVSIZEiuipXQfCSlGxPooA6AdYErbnYb9g1L
	yYzjyHM35zKw6wLNedeH5DLmUnrAbZhxTejcLRNPUZw+WvrQh4f/fDbIDPeD+lACd6fFhuLGWzesh
	Uye0aQu6ZVvyfgcLvPWil6CHkcBFVeasOugUddD3xTK1sr/BX0z2hJZnCVpAM13Sxav2SBQeLsITn
	YMtXF0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVz38-0000000DDqs-0Xj0;
	Thu, 09 Jan 2025 20:22:38 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVz0j-0000000DDQF-1rDc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:20:10 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509KK3OP3011558
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 14:20:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736454004;
	bh=j4v0m6DhAtwCcR2FHYeZKXNyq2xkLzonMXMc5I0H6zY=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=Wwx4cIuoIm0nMqyOdKPZ96+QqOrEVZlqJFP4wzG8odYGuRNm3j7dMgnWkUJ+6rfvR
	 CRrG1pKUf+sQC4IL2cRL/crPhIqGA2Psu4U4gw3OZq+y1S3p4Q+GU2TMTeZrBUuJMv
	 bcnehRpLQXv49dAUIRXIb4pXUuTGpLRI77xGO8kM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509KK3DO043802
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 14:20:03 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 14:20:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 14:20:03 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509KK3nq051378;
	Thu, 9 Jan 2025 14:20:03 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Thu, 9 Jan 2025 14:20:04 -0600
Subject: [PATCH v3 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-am62lx-v3-3-ef171e789527@ti.com>
References: <20250109-am62lx-v3-0-ef171e789527@ti.com>
In-Reply-To: <20250109-am62lx-v3-0-ef171e789527@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_122009_580420_DE94E2A4 
X-CRM114-Status: GOOD (  12.94  )
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

From: Vignesh Raghavendra <vigneshr@ti.com>

Add the initial board file for the AM62L3's Evaluation Module.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes from v1:
 - switched to non-direct links so TRM updates are automatic
 - removed current-speed property from main_uart0
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected main_uart0 pinmux

Changes from v2:
 - alphabetized phandles
 - corrected macros and node names for main_uart0 pinmux node
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 43 ++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
new file mode 100644
index 0000000000000..ef06cf193c65b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L3 Evaluation Module
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
+ */
+
+/dts-v1/;
+
+#include "k3-am62l3.dtsi"
+
+/ {
+	compatible = "ti,am62l3-evm", "ti,am62l3";
+	model = "Texas Instruments AM62L3 Evaluation Module";
+
+	chosen {
+		stdout-path = &main_uart0;
+	};
+
+	memory@80000000 {
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+};
+
+&main_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart0_pins_default>;
+	status = "okay";
+	bootph-all;
+};
+
+&pmx0 {
+	main_uart0_pins_default: main-uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b4, PIN_INPUT, 0)	/* (D13) UART0_RXD */
+			AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0)	/* (C13) UART0_TXD */
+		>;
+		bootph-all;
+	};
+};

-- 
2.47.1


