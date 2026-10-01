Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A91CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+zwGGV7ihofYpqOYK7iJnQ5635HlS3lYL7TQsZckEE=; b=wo6rvR5BwsNijqX5c3/Qwzs4xS
	g01VoqtFUlxdp2MDhoogUGD5Ndce4/vB8tiSwJD+7zqOuVWh/z0mPYtamWFR2tLBA0VWB24R8FSx0
	xK0ZAZbg8oV2MDE5NaFqm0cOhUf0Uq5BkfvrZmjsgaxyBHnkran2sa9hzQg0K0X8j0ZeaNvyLK5r+
	AhnyD2i79eIVHwRlYkFcV+LhhKzWSZaNBijtuaytUkFnnaaHyn2kvdzouIXoj/j/hO43cMjnAt3Qa
	+oecF1a4JmhwWl2D6KrQ+EQkJhprHmDu8XyOFZafNula4apiL3qhSi3I9OKqpCcI7d8n7XXVMcbGB
	+95CZJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNNB-0000000A9a8-00cW;
	Thu, 01 Oct 2026 20:27:21 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNMy-0000000A9Tx-1DeW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 20:27:10 +0000
Received: by chaosmail.tech (Postfix) id 11A6F1C8DB2;
	Thu, 01 Oct 2026 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1790886422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+zwGGV7ihofYpqOYK7iJnQ5635HlS3lYL7TQsZckEE=;
	b=Mn/r1KrYyIcdpuPGXO+80+SB7lNpz70rHhIFeJuW7fAVUL1p835Vym0NQT8cU4QdRQ3/pT
	EiGLINwMST7UPSD5N0TVK9dJb04L47dO2J+TVREU0eZxBJ+bJ6+xZ+WTy8leSMTBAluO5m
	bok5r3ZdGFbXY8b+8PChGqbS8YEUp/c=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Thu, 01 Oct 2026 22:26:56 +0200
Subject: [PATCH v10 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-t603x-spmi-v10-1-ff815c66c73f@chaosmail.tech>
References: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
In-Reply-To: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790886421; l=1694;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=hB41yiTeB7yUdgLmPck4QL6QQEw/Im8eycw8rMjdcpE=;
 b=tYhSRgI62c8w8T20AZaKQqeBjXJreQT+gRgFVKrGaSB/3+I5ouCmKpMi6hulQIqQPHBMl2rHn
 rrdlPm64MPwAi6OfKNyAkHP6IUqoDWbMAx81Afvu8z178sVlPebNPPP
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_132708_845880_EA75E1DF 
X-CRM114-Status: UNSURE (   8.36  )
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

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Reviewed-by: Janne Grunau <j@jannau.net>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..4e73083ecec3 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,8 +20,11 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -34,10 +37,36 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - apple,t8122-spmi
+          - apple,t6030-spmi
+          - apple,t6031-spmi
+then:
+  required:
+    - interrupt-controller
+    - "#interrupt-cells"
+    - interrupts
+
 unevaluatedProperties: false
 
 examples:

-- 
2.55.0


