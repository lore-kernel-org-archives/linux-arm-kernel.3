Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EE9D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 00:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKcCwwCRe4Td+QbPJzIZf+orW5JDnnyWAr8yiknjLA4=; b=qsIoOU8k1Tau+3pz6heCUMQDHU
	l4wCYi3kHKvbjSg1LJBzXfxIwS+ng4P6711fSgv+aYyDga1upC0H6RVZGfPmipSK+2rtrLIeQ6Rrh
	ADMWakj0g2IlkreKIVRXhtyKLNAqXvzxInYD7qqnmDmVIl71Vv/0VdW+SWlEz4Q8aQERgWQH8RfoS
	hYQgB33Y6KILw7ZfR33Flia+S48X74hhionC11ndJdjU5EbjeM/IHx+HlxiNKczS7wChjSl1cLQHR
	Zsq4w753o9nL6YHvLyFSZTTLv20xTPPjumUWiJP/5Hz2HVxXmuUv62TvdDKrue0PSDpI60UaEuVSV
	Kffg+Yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOmL4-0000000HLQe-2OXF;
	Fri, 28 Nov 2025 00:27:54 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOmKy-0000000HLOF-2RNA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 00:27:49 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 28 Nov
 2025 08:27:34 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 28 Nov 2025 08:27:34 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Fri, 28 Nov 2025 08:27:30 +0800
Subject: [PATCH v2 1/2] dt-bindings: usb: aspeed,usb-vhub: Add ast2700
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251128-upstream_vhub-v2-1-1fa66a5833c2@aspeedtech.com>
References: <20251128-upstream_vhub-v2-0-1fa66a5833c2@aspeedtech.com>
In-Reply-To: <20251128-upstream_vhub-v2-0-1fa66a5833c2@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764289654; l=1845;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=rHhaKj8gv7+Qbhqwp9C1BhoCdFoga26doEIHEcEHt24=;
 b=jH+dOWj6JNSZPqM2w11PcC1CvWoBV1OvZI8jZk8o66+YsIEjsINZM5OEsEv+x97WocFe8fItI
 ewxRui6nq2LD8hbA8zd6aZRwaQQk7odUEh/8YNQhZyTzd/+Z+7dNiCh
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_162748_626850_A92CBB07 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

Add the "aspeed,ast2700-usb-vhub" compatible. The ast2700 vhub
controller requires an reset, so make the "resets" property
mandatory for this compatible to reflect the hardware requirement.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../devicetree/bindings/usb/aspeed,usb-vhub.yaml   | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
index 7f22f9c031b2..b8bac2cce949 100644
--- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -17,8 +17,8 @@ description: |+
 
   Supported number of devices and endpoints vary depending on hardware
   revisions. AST2400 and AST2500 Virtual Hub supports 5 downstream devices
-  and 15 generic endpoints, while AST2600 Virtual Hub supports 7 downstream
-  devices and 21 generic endpoints.
+  and 15 generic endpoints, while AST2600 and AST2700 Virtual Hub supports
+  7 downstream devices and 21 generic endpoints.
 
 properties:
   compatible:
@@ -26,6 +26,7 @@ properties:
       - aspeed,ast2400-usb-vhub
       - aspeed,ast2500-usb-vhub
       - aspeed,ast2600-usb-vhub
+      - aspeed,ast2700-usb-vhub
 
   reg:
     maxItems: 1
@@ -33,6 +34,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
@@ -107,6 +111,20 @@ required:
   - aspeed,vhub-downstream-ports
   - aspeed,vhub-generic-endpoints
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: aspeed,ast2700-usb-vhub
+
+then:
+  required:
+    - resets
+
+else:
+  properties:
+    resets: false
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


