Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A964CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQKMkzuKZ8aQNaYA0xm+uguK3peEC/PfCD9otnle504=; b=r9m9zEV0C2rKQmR2o5s940NulX
	vRnXMVPiI74KO+7VK0Y+6RAxZXwcgn/pbotKaICVmW24PsLWcWfcDh47Fp2+YB3L9+byR3Ng850Pu
	Odj6PbzY4obtG+oQa/7oAly4MwN2uV5uMFHstfONIke5EEqwFHClYEI+ep5CKXhawHdgQyXcDxpw8
	LWqSLUzWOhZLzURDKpdpbFoETBGNGVf0vzhbzA5fJbpEXssrZBI0xy2xJEXR33zj5hNMtb4HK4Jqk
	cIEf7kHgjCPX6WVWij3QsGtpbXKELvnZpNPd6sPELZl8hH/2yIhS/EHfsmFoGYDzbjNfc0/rikDeo
	5N/opF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um5tq-0000000CvgJ-3ln4;
	Wed, 13 Aug 2025 07:27:54 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um52u-0000000Cniu-3T9v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:33:14 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 14:33:01 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 13 Aug 2025 14:33:01 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Po-Yu
 Chuang <ratbert@faraday-tech.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<taoren@meta.com>, <bmc-sw2@aspeedtech.com>
Subject: [net-next v2 1/4] dt-bindings: net: ftgmac100: Restrict phy-mode and delay properties for AST2600
Date: Wed, 13 Aug 2025 14:32:58 +0800
Message-ID: <20250813063301.338851-2-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
References: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_233312_869283_385EEA69 
X-CRM114-Status: GOOD (  10.16  )
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

Create the new compatibles to identify AST2600 MAC0/1 and MAC3/4.
Add conditional schema constraints for Aspeed AST2600 MAC controllers:
- For "aspeed,ast2600-mac01", restrict phy-mode to "rgmii-id" and
  "rgmii-rxid", and require rx/tx-internal-delay-ps properties with 45ps
  step.
- For "aspeed,ast2600-mac23", require rx/tx-internal-delay-ps properties
  with 250ps step.
- Both require the "scu" property.
Other compatible values remain unrestricted.

Because the RGMII delay on AST2600 MAC0/1 is 45ps and its total delay
step is 32, cannot cover 2ns delay for RGMII to meet center. We need
the PHY side enables RX internal delay and the phy_mode must be
"rgmii-id" or "rgmii-rxid".

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/net/faraday,ftgmac100.yaml       | 50 +++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
index 55d6a8379025..82c7c81eab10 100644
--- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
+++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
@@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Faraday Technology FTGMAC100 gigabit ethernet controller
 
-allOf:
-  - $ref: ethernet-controller.yaml#
-
 maintainers:
   - Po-Yu Chuang <ratbert@faraday-tech.com>
 
@@ -21,6 +18,8 @@ properties:
               - aspeed,ast2400-mac
               - aspeed,ast2500-mac
               - aspeed,ast2600-mac
+              - aspeed,ast2600-mac01
+              - aspeed,ast2600-mac23
           - const: faraday,ftgmac100
 
   reg:
@@ -69,6 +68,12 @@ properties:
   mdio:
     $ref: /schemas/net/mdio.yaml#
 
+  scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SCU (System Control Unit) syscon node for Aspeed platform.
+      This reference is used by the MAC controller to configure the RGMII delays.
+
 required:
   - compatible
   - reg
@@ -76,6 +81,45 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: ethernet-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-mac01
+    then:
+      properties:
+        phy-mode:
+          enum: [rgmii-id, rgmii-rxid]
+        rx-internal-delay-ps:
+          minimum: 0
+          maximum: 1395
+          multipleOf: 45
+        tx-internal-delay-ps:
+          minimum: 0
+          maximum: 1395
+          multipleOf: 45
+      required:
+        - scu
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-mac23
+    then:
+      properties:
+        rx-internal-delay-ps:
+          minimum: 0
+          maximum: 7750
+          multipleOf: 250
+        tx-internal-delay-ps:
+          minimum: 0
+          maximum: 7750
+          multipleOf: 250
+      required:
+        - scu
+
 examples:
   - |
     ethernet@1e660000 {
-- 
2.43.0


