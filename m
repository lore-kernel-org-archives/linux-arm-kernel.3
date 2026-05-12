Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B06CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtdXnQEVIb6c5aCwt7NTASRXJz0sr0Gu7xDW8knSUp0=; b=Ft4L0uSQdQg9UmtgSYOQWm3/Yc
	8Wdt6TTAuBrqxK8BAnHJsQ8zy2ESz222BORSKNFl8DAYivrMH3G4NSZxI6nSpqdC5soqqhwcAPnqC
	h4W44uDPNOJ1KsHThyQKURpxECUq/Ge/B0tQPmn5einS+tSHDhGT074zKneTh/7t0usuOR6NtJFOK
	Jc0atJnv/ZT6uScZVWDrgn69+JmYZeBFgPPOMIn5EKamLOizoXW816fv8PZFpCQXi+fVN2r/jp4Fu
	Ho+AzlcVOBSIUcrW3cn/IqAmN5560/YPstYErnphxcmrZeflK0DXCl0h8uypPUmZuDooARtkdCLRV
	S9Ng2ncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt2-0000000FN9Z-3mTk;
	Tue, 12 May 2026 03:34:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt1-0000000FN8e-3Jsy;
	Tue, 12 May 2026 03:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LtdXnQEVIb6c5aCwt7NTASRXJz0sr0Gu7xDW8knSUp0=; b=V0/v+Y0TTRZtaLu4QDyqCOwkRX
	/Wq1W3TqEUGEQmoKKGKXPnx5zfZWL/CeSGYhBpd/lRMDObT58nOql5GX2cduCfdnLrwd12SNBzuwM
	E+US4aaIp8rzs6gGtW/Fhv2hZyAxbpTe9gKnRekbZVzw6kGP1umW2n8zDa0Fg2C8mzAvxTZrV+Sre
	o1767Wcr/+QHFizJkpr3UYtCwoVR+FbBnlUZDlbruMNMRUOjZEWYH2Rx+PqP+89If9h0D96TXwgEa
	M4cR+keQRgoidUfz/79JXuGiLcMvv+M9aUYNDjqPabKU5cqMC28gDpZNB9Z6CkEBdgWha3HrRIhLh
	Nis9vmUA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdsw-0000000DYbF-2BHx;
	Tue, 12 May 2026 03:34:21 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64C3XJoF43571941, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778556799; bh=LtdXnQEVIb6c5aCwt7NTASRXJz0sr0Gu7xDW8knSUp0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=PH/ibe10a+mefQYnoIHyfTzenlMWsYQCsiyitA/1ih68ubpjh4k6+k9o7bZ0qieRw
	 PaDYkv2kH4AfQH0apvmW2y0R3AmXhvbyZx8kCVGVYAqtdcNTKffIieYTAIfAu73WNc
	 bG74IX0xoiIyGCHxctQB/gfrzLgQWr+UE97QgqCUaAzPbpSBx/DvdXDPjK2hasHQRb
	 xnfYO3PFRt+myy9gaBzM391GhMO4sOeVP0avb7ByxvJD+zwVm9a/LkFGNMi70CBzCT
	 6SA5VN1OvC6fQGIztGBzOIne5eXDRVhKHC2EbrBGio+kOOLzp6DuJbtlGM69b/zBDt
	 a/ZrCvPRA9YGg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 64C3XJoF43571941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2026 11:33:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:19 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:19 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 12 May 2026 11:33:19 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>,
        <mwalle@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
        <jic23@kernel.org>, <nuno.sa@analog.com>, <andy@kernel.org>,
        <dlechner@baylibre.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 5/7] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Date: Tue, 12 May 2026 11:33:15 +0800
Message-ID: <20260512033317.1602537-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512033317.1602537-1-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_043420_029250_1D24A0B9 
X-CRM114-Status: GOOD (  14.25  )
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

From: Tzuyi Chang <tychang@realtek.com>

Add the device tree bindings for the Realtek DHC (Digital Home Center)
RTD1625 GPIO controllers.

The RTD1625 GPIO controller features a per-pin register architecture
that differs significantly from previous generations. It utilizes
separate register blocks for GPIO configuration and interrupt control.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../bindings/gpio/realtek,rtd1625-gpio.yaml   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
new file mode 100644
index 000000000000..f13c910b73c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Realtek Semiconductor Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/realtek,rtd1625-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC RTD1625 GPIO controller
+
+maintainers:
+  - Tzuyi Chang <tychang@realtek.com>
+
+description: |
+  GPIO controller for the Realtek RTD1625 SoC, featuring a per-pin register
+  architecture that differs significantly from earlier RTD series controllers.
+  Each GPIO has dedicated registers for configuration (direction, input/output
+  values, debounce), and interrupt control supporting edge and level detection
+  modes.
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1625-iso-gpio
+      - realtek,rtd1625-isom-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Interrupt number of the assert GPIO interrupt, which is
+                     triggered when there is a rising edge.
+      - description: Interrupt number of the deassert GPIO interrupt, which is
+                     triggered when there is a falling edge.
+      - description: Interrupt number of the level-sensitive GPIO interrupt,
+                     triggered by a configured logic level.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-ranges
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@89100 {
+      compatible = "realtek,rtd1625-isom-gpio";
+      reg = <0x89100 0x30>;
+      interrupt-parent = <&iso_m_irq_mux>;
+      interrupts = <0>, <1>, <2>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      gpio-ranges = <&isom_pinctrl 0 0 4>;
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
-- 
2.34.1


