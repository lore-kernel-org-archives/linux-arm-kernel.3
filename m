Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E4DD59F5F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYAit9wpd1qdDJLaAzEIICqIfVUgl1o6lvxXggMuD/I=; b=fDFWLh46w2C/gYdVnbqxsF1hgL
	/qPU3C1Fqf2fzr7A7Cg4klEFERGpj1/Lw9+XB5r35q3njYfFneVJ1+FJryWEKWIWmcWOZB3vhpY9z
	QmFHigcIZy5vD/3vaFz/8ZUc/QKd85QzLaccC5g3SriB23gA+4PkZ+BG6u9JR5BPexQQrWYdkbOfw
	8qVDv1aQXvUXNrueSxsyOUWVZqtcXXXQsGZnDyWQTY/7YDL61RMzjGRunz+GAYRmD54nX6kV4iRB+
	xc1pGmTu1G4AzA5nKid9dg0DuBm95VksAUERvuc8azr2YU4Yv79qsXy7sME8e6r0oYBKID0SXNEpb
	IhHL7lNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFpK-00000001KPd-3aUu;
	Sat, 13 Dec 2025 02:57:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFp7-00000001KEh-2Enr;
	Sat, 13 Dec 2025 02:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AYAit9wpd1qdDJLaAzEIICqIfVUgl1o6lvxXggMuD/I=; b=hvUTWpzB0uZVmpX1rCcaR5LkNf
	5Ncc5LT53Q8jX/tlLQ3tA+PXSO4pKly2VyuAw0fnu3FE23IYI/9umIXrbQMe6AK8kw16lgfOBT0y0
	elScs9cZmvHRGFonopIek4mTZphDDSNGkfHZVymmYzwsCxHQgyVn8huZQmTc+RWuP0tt66vm50uCd
	ilvQp/jytQGSi65n5xWmokpWT51cCvIkpRfeanINUoUCAnvybmj/vlUxoq9rsP+jx/pWo49ayEhVc
	q5jn9m5+Xvc3xnNcS/YyDU2MWoBcHbNq5BMgJoS7Jhpq2BeyBxHkMWsBHrGJi7+q8LeMsT8sIn0nx
	Xqh/YmQw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVds-0000000091h-3XeV;
	Thu, 13 Nov 2025 11:37:37 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5ADCUALZ03591312, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763037010; bh=AYAit9wpd1qdDJLaAzEIICqIfVUgl1o6lvxXggMuD/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=lQFE+ko9mVOj55EeQ+eu7nQXcqmPtZsrytG0otXYV54GoJnG/VzWM2ctJVO3uXqPH
	 B9DtJxL8fQT4sEq3LW3+yvX9SFDt/P+pcM/H7lwobs6loBZ00CIbnuCF2zTZBpGbXW
	 M2aR1e6tqoZkChak25FgcrziwaabHoAEI0FvdgNQUH7OPnpvLL27QbHKT/PXTUEMaL
	 ckGx1Mexil3o+j4p8jFophL8yMeLPUrwCAVXhGgC8IzmjYUghZPT/A92FJYbsGFNjy
	 mM9bRAWQ7Ojz9cGSKgCdzDceSBsXr53DLtQoUdPSxcgqg1z2jDALEXLJMGEgAJziIE
	 5yoKx3tFeDFJA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5ADCUALZ03591312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Nov 2025 20:30:10 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 13 Nov 2025 20:30:10 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.1544.27 via Frontend
 Transport; Thu, 13 Nov 2025 20:30:10 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <afaerber@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <lee@kernel.org>, <james.tai@realtek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>
Subject: [PATCH v2 2/3] dt-bindings: mfd: Add Realtek MISC system controller
Date: Thu, 13 Nov 2025 20:30:08 +0800
Message-ID: <20251113123009.26568-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113123009.26568-1-eleanor.lin@realtek.com>
References: <20251113123009.26568-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_113734_114330_30A4B515 
X-CRM114-Status: GOOD (  11.49  )
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

Add DT binding schema for Realtek system controller.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../devicetree/bindings/mfd/realtek,misc.yaml | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,misc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/realtek,misc.yaml b/Documentation/devicetree/bindings/mfd/realtek,misc.yaml
new file mode 100644
index 000000000000..4f4a9ae250be
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,misc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/realtek,misc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek MISC System Controller
+
+description:
+  The Realtek MISC System Controller is a register area that contains
+  miscellaneous system registers for the SoC and serves as a parent node
+  for other functions.
+
+maintainers:
+  - James Tai <james.tai@realtek.com>
+  - Yu-Chun Lin <eleanor.lin@realtek.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - realtek,misc
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  "^serial@[0-9a-f]+$":
+    type: object
+    description: UART controllers inside MISC area
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    syscon@7000 {
+        compatible = "realtek,misc", "syscon", "simple-mfd";
+        reg = <0x7000 0x1000>;
+        ranges = <0x0 0x7000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        uart0: serial@800 {
+            compatible = "snps,dw-apb-uart";
+            reg = <0x800 0x100>;
+            clock-frequency = <432000000>;
+            interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+            reg-io-width = <4>;
+            reg-shift = <2>;
+            status = "disabled";
+        };
+    };
-- 
2.34.1


