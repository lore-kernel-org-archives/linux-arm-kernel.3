Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408F6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa5QaNYOW2oOBLPWGenpaGtAyXRyDyKvHVOQ8KRPF1Q=; b=IWjjOrPAD/0fyF/UeNP0sijm5y
	lgZe0ksD95l+hshdnFao9B4KpxYnE0hJOYxLZQgvukpfcby5W/u1AribzZvrJp0sHksyWMAYMAbZ2
	8PFLnFcEPDt87yFXSRhaKaqDBEErviU5tgzsKxpky+Hgz4qrNaVia8/9tZ5hdbU3k+qDuiHAkCkak
	Wi9GUy5aMYcIDhoOwCF3FzSB62Fu4+T2xW8pcOUAT07Of2Zmxje1HnVG1qIr2/MX8359icz2Cq0PQ
	lb6UXIs6vXLLh8ERZQCdGGnO2F3PWIsbPzaEAaIP5vqEQxyrb/b2dAFK/ATWwQqs3Fjvi3HAjVKa+
	ro10D7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYj4F-0000000HVJM-1WnG;
	Fri, 17 Jan 2025 09:55:07 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYj1k-0000000HUkf-1Js7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 09:52:33 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 17 Jan
 2025 17:52:20 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 17 Jan 2025 17:52:20 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <elbadrym@google.com>
CC: Kevin Chen <kevin_chen@aspeedtech.com>
Subject: [PATCH v0 1/3] dt-binding: aspeed: Add LPC PCC controller
Date: Fri, 17 Jan 2025 17:52:15 +0800
Message-ID: <20250117095217.661070-2-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250117095217.661070-1-kevin_chen@aspeedtech.com>
References: <20250117095217.661070-1-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_015232_351047_5DC4E08C 
X-CRM114-Status: GOOD (  11.51  )
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

Add dt-bindings for Aspeed for Aspeed LPC POST code capture controller.

Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
---
 .../bindings/soc/aspeed/lpc-pcc.yaml          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/lpc-pcc.yaml

diff --git a/Documentation/devicetree/bindings/soc/aspeed/lpc-pcc.yaml b/Documentation/devicetree/bindings/soc/aspeed/lpc-pcc.yaml
new file mode 100644
index 000000000000..6c2134497de2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/lpc-pcc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# # Copyright (c) 2024 Aspeed Technology Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed Post Cost Capture Controller
+
+maintainers:
+  - Kevin Chen <kevin_chen@aspeedtech.com>
+  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+
+description:
+  The Aspeed PCC control allow to capture POST code from Host.
+
+  This driver is for the BMC side. POST code data can be access by
+  /dev/aspeed-lpc-pcc0. For example, POST code data is below.
+  ~# hexdump /dev/aspeed-lpc-pcc0
+  0000000 40b3 40a0 40a3 40a2 40a2 40b4 40a5 40ee
+  0000010 40ee 40ee 40ee 40ee 40ee 40ee 40ee 40ee
+  0000020 40ee 40ee 40ee 40ee 40ee 40ee 40ee 40a6
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2600-lpc-pcc
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    lpc: lpc@1e789000 {
+        compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
+        reg = <0x1e789000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e789000 0x1000>;
+
+        lpc_pcc: lpc-pcc@0 {
+          compatible = "aspeed,ast2600-lpc-pcc";
+          reg = <0x0 0x140>;
+        };
+    };
-- 
2.34.1


