Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D3BCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73M7tW49m2K8uMh9lDk/bmUgfp3JFhduDvFKOahFF2A=; b=y4vRVD3CcSpa2T2ciFXL+W2eZL
	16Rhzro+j31q4KYpDxuwMBMaS0zeb6f2FlUWpXu668oPBQfWt/oG3uN6bKrUenvJrwV5NHJoPX6Zd
	UgilwtUil3G34XxxWiGFYc1LGWGzyFjnNrSzI5CkSBlfZiJAku0uKSX/HhBh5HDGGuZD0TG0o48ff
	XCOxcl7fFH0nj9YEKeTILx/a/mJOgAjuM60gt+dVjPs1myO6jurXKgS6bqQ2EEFs+gXKhBJOKjjze
	yNR7YAoh7MZFDM5U0OG95WIMecrspx3/WwPBGFpCKHs+Gf/UGyfe/yiMheHh3RJScmCmWrVnDbSj4
	YrBgfHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpFG-00000009NXR-1NGg;
	Mon, 03 Nov 2025 07:44:54 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpFE-00000009NVv-0WBr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 07:44:53 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 3 Nov
 2025 15:39:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 3 Nov 2025 15:39:31 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 3 Nov 2025 15:39:16 +0800
Subject: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
In-Reply-To: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <taoren@meta.com>, Jacky Chou
	<jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762155571; l=2708;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=PYQ6XsN2gnhIp8Xo10NhHRhhYIWg1cOPkDhVccPlR7M=;
 b=8dQN9gN9ej9i43GElLGYbszMymHwxeJW2OmcXiRvmXcYj/4GFfTzTlHQ1YGAWaPxG5n5BDaN+
 FO4ETMfGFPwAKTnDiLBELXw5qtDywwUeN9fTojTTX8W6/F85DDzewjc
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_234452_168185_F2ECA41A 
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

Create the new compatibles to identify AST2600 MAC0/1 and MAC3/4.
Add conditional schema constraints for Aspeed AST2600 MAC controllers:
- For "aspeed,ast2600-mac01", require rx/tx-internal-delay-ps properties
  with 45ps step.
- For "aspeed,ast2600-mac23", require rx/tx-internal-delay-ps properties
  with 250ps step.
- Both require the "scu" property.
Other compatible values remain unrestricted.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../devicetree/bindings/net/faraday,ftgmac100.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
index d14410018bcf..de646e7e3bca 100644
--- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
+++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
@@ -19,6 +19,12 @@ properties:
               - aspeed,ast2500-mac
               - aspeed,ast2600-mac
           - const: faraday,ftgmac100
+      - items:
+          - enum:
+              - aspeed,ast2600-mac01
+              - aspeed,ast2600-mac23
+          - const: aspeed,ast2600-mac
+          - const: faraday,ftgmac100
 
   reg:
     maxItems: 1
@@ -69,6 +75,12 @@ properties:
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
@@ -88,6 +100,44 @@ allOf:
     else:
       properties:
         resets: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-mac01
+    then:
+      properties:
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
+        - rx-internal-delay-ps
+        - tx-internal-delay-ps
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
+        - rx-internal-delay-ps
+        - tx-internal-delay-ps
 
 unevaluatedProperties: false
 

-- 
2.34.1


