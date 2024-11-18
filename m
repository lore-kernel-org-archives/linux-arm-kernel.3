Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EE5D10F57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 05:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkkG2wUMLv7vXg7NqpwQ/x23P90Q1+pq1lbWCTs5Vu8=; b=lfpLH3KULnEvDCghF+V+WdDq3Y
	5wJvJWmNohjM0eHK2i9FugOq4eu91VaDnGLZmHQFs4FVE7X8QIRjzyWMY3z+hAkMWTRIb5SypNWol
	B00yPUgL1Fw0R6M7ii+rWCyeiiSzh3hLQCztZZXj9Z+7vk3tQVvDXQnGF8FtLhzj1791xXOKJ0R1Y
	PU7t+8SYIs3vFAjf2E1AigQ/nq5p/HH7fjdVxgMyJkD+fBNMawSjSCEdmKeLVWkSiqFUyxOme+ANe
	W9w9C9oi9MZhk5Rn3bZakgpVnZKlKB7yo7yXEiDmv7NCcxXTgtUcwqNHNuBFf6hsf5dnnZ62la7A7
	3sZoWn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuPl-00000008PlR-1vQW;
	Mon, 18 Nov 2024 05:35:09 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuOp-00000008PcU-3sIA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 05:34:13 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5Y8Bk031971;
	Sun, 17 Nov 2024 23:34:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731908048;
	bh=RkkG2wUMLv7vXg7NqpwQ/x23P90Q1+pq1lbWCTs5Vu8=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=KE7nZkW0DevOwXmNNmh9C+nyRc4uHlrK3TxyhM6T7gZKvX9n6nbjUChojhxYHWx9e
	 hIvmWF3Dc41NG1984wdNJiKmNagDyGgRUjTZCTJO91YGvrFrBGY9rWA/TcZOzvq/b8
	 p+n0DsEnKSrK+cE5YnOtoeOOi8jx6iZsG07tBl/o=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5Y8Gf013778;
	Sun, 17 Nov 2024 23:34:08 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 17
 Nov 2024 23:34:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 17 Nov 2024 23:34:08 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5Y80o041450;
	Sun, 17 Nov 2024 23:34:08 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Sun, 17 Nov 2024 23:34:08 -0600
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62l: add initial reference board
 file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241117-am62lx-v1-2-4e71e42d781d@ti.com>
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
In-Reply-To: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
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
X-CRM114-CacheID: sfid-20241117_213412_067375_F8D16F82 
X-CRM114-Status: GOOD (  11.46  )
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
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
new file mode 100644
index 0000000000000..2d59389765cab
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L3 Evaluation Module
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
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
+	aliases {
+		serial2 = &main_uart0;
+	};
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
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+};
+
+&pmx0 {
+	main_uart0_pins_default: main_uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01d4, PIN_INPUT, 1)	  /* (D7)  UART0_RXD */
+			AM62LX_IOPAD(0x01d8, PIN_OUTPUT, 1)	  /* (A6)  UART0_TXD */
+		>;
+		bootph-all;
+	};
+};
+
+&main_uart0 {
+	current-speed = <115200>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart0_pins_default>;
+	status = "okay";
+	bootph-all;
+};

-- 
2.46.0


