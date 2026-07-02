Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD35C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/jJq83KWKt0QCWjI+OidApVFhXZRn6PdIkpN8WZmB4=; b=Ub7zDN826Jq7VwVKUtxAQ2ltZE
	gF7yJ1WNL8UwecqhIUzzcqZ22P4d9X0T2qpYKnGeqLx01Bpre3Ds0rlaB+cATo40Q70HsXgN3zxuk
	0wLX53/sCw3JqW/2y+wmEwBtxdu1xMGGqe6713/GkDPpPfb1lNFv3q8RbNLgfi4jTRHdHzyEOYqeY
	d0f8LZqoHgT9aH3g31AyIgswJhHFikncig8yPOTSE7x8X4V3JuA98y/K51zC9acs6AvazhWN2ifpB
	SW15FG6g5Pv3wOJoOovkNgmqZswB2Z6fudA3KGAoZyp51TKQSyzw03kRof/YHKSl1T/rQQQHvu5R3
	FdT57B9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDJ2-00000003wrB-3Oym;
	Thu, 02 Jul 2026 09:02:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDJ0-00000003wor-2aeP;
	Thu, 02 Jul 2026 09:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=N/jJq83KWKt0QCWjI+OidApVFhXZRn6PdIkpN8WZmB4=; b=AEZFvMRMTYXp7IBScHEBCwlvPY
	tpS8RF44otKOEaUnZkJ7RXU2uOc9b1Nbd2rotxepucfUnwXUhGBw4YAAu0FTRVfLqeRzZeGtoNFmK
	LSE0gLvYIQOWEGeimqK+Zbh7lLJA/k+PKqdRQs4KrGNhg83fGTH/BNhCwmjHivdiikpQSL3FCOy60
	fM1aJny0KvX3PGepINHxyqCke+a2yxeA3rjUKAuW2UPXeZyzCP9c+RPm7x0TEhvS71o8nKZua5Plh
	ccJHkca4LsIX1lodftNF9E3w17sBxNM7ta7mQw0Y1lE2QW7qVekp90whCI9PO/tVtrr20Q4xpJJ6x
	rR9Tmtig==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfDIv-00000003aUt-4B4C;
	Thu, 02 Jul 2026 09:01:57 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66291GYZ01817127, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782982876; bh=N/jJq83KWKt0QCWjI+OidApVFhXZRn6PdIkpN8WZmB4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=D5Ty5PWl6LZA9BnV7NKrp9PU9jXGYQWUxQxELBmTbZ+j0k+E5qqU8zSWDkLJmcLzq
	 GkAcC92UfBQQ377koFU4P352AwLj2IbwHrLewVzwolmwHCJe+3QjsCUbfHgZbQlFIP
	 Hi1Y3+L9CriR6WtfTjU4OXr2LDuT3VjIlbDQedDSrQfV/vooxDTxYSiVYPr7HYAfwD
	 T2z25w6PZ7F0k/Wj5nPJzyLPQ+BWt1pR5iMVvQXLVlHC4eRBAParDYv1wsHdNDCA6c
	 pvW50XJdXkR6tFIlxVwyyIudyhypn8jxinoEpASGSusWp21oR4IQu7wOqVSVUaZiT8
	 xqq7/2zDkRz8Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66291GYZ01817127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jul 2026 17:01:16 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 2 Jul 2026 17:01:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Jul 2026 17:01:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Date: Thu, 2 Jul 2026 17:01:12 +0800
Message-ID: <20260702090115.2564318-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260702090115.2564318-1-eleanor.lin@realtek.com>
References: <20260702090115.2564318-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_100154_769278_10804F4C 
X-CRM114-Status: GOOD (  14.13  )
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
Changes in v5:
- None.
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
2.43.0


