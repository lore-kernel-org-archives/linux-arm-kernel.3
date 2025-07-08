Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D632C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKjFwYg9ZQQxfjXsi9oN89dsMs+vx9jQgYZKL6hYutQ=; b=SgNPZCWljEG3dSBEWNNMzaDLFW
	4rxNSyR7st0WF+PEWhS2swTqTnmGhVvQsfl/EZ5Dz3lxXNdpc5LUQjmDVdCgg+wUss7MQ0Qb7X8il
	UoULMgnGcQeXF1cqIC8zsbbRudzovjw2SGnOXPOpT2DldwlB0exR9R5MXRIL8yopQETP9wfaYau6r
	AW1ounyan4RaVT1A4RJ46cCf7hzdR7KxgH0ggAcos0+rGwSx4si4OOAO76P5zZoYoDUW635sqBZYx
	zYMIjNAGOOnoRUm4/FFRJCr3owtcIpVB2JyzpdttqRs8Lad3I+RAm9p01yIKnKPRri1xnr4thOY5+
	5Ik0Goxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2LZ-00000004Wko-1Ims;
	Tue, 08 Jul 2025 07:02:33 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2F7-00000004Vng-1s5O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 06:55:54 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 8 Jul
 2025 14:55:44 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 8 Jul 2025 14:55:44 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<p.zabel@pengutronix.de>, <horms@kernel.org>, <jacob.e.keller@intel.com>,
	<u.kleine-koenig@baylibre.com>, <hkallweit1@gmail.com>
CC: <BMC-SW@aspeedtech.com>
Subject: [net-next v3 1/4] dt-bindings: net: ftgmac100: Add resets property
Date: Tue, 8 Jul 2025 14:55:41 +0800
Message-ID: <20250708065544.201896-2-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708065544.201896-1-jacky_chou@aspeedtech.com>
References: <20250708065544.201896-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_235553_501972_AE774074 
X-CRM114-Status: UNSURE (   8.26  )
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

Add optional resets property for Aspeed SoCs to reset the MAC and
RGMII/RMII.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/net/faraday,ftgmac100.yaml       | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
index 55d6a8379025..a2e7d439074a 100644
--- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
+++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
@@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Faraday Technology FTGMAC100 gigabit ethernet controller
 
-allOf:
-  - $ref: ethernet-controller.yaml#
-
 maintainers:
   - Po-Yu Chuang <ratbert@faraday-tech.com>
 
@@ -35,6 +32,11 @@ properties:
       - description: MAC IP clock
       - description: RMII RCLK gate for AST2500/2600
 
+  resets:
+    maxItems: 1
+    description:
+      Optional reset control for the MAC controller
+
   clock-names:
     minItems: 1
     items:
@@ -74,6 +76,21 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: ethernet-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - aspeed,ast2600-mac
+    then:
+      properties:
+        resets: true
+    else:
+      properties:
+        resets: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


