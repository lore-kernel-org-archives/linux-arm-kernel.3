Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062A2E9B356
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90C5XzHvFjhq0nOW6I0PWlANFOENSaJmdkGqMXW/040=; b=Od8nzdQ5/qZXJPFeAkb8/ZXVAO
	2awXyCTqktG2VYT8LpwzcuSqfxmelNBDFw5xibOQIlgcRLaASrjxisRqDAny43yfHaS8Rkshi2a8u
	20jDyduNWZI94jNfVPm54FBiNfMpKHYpUvhg3tynh+515UifvB5MglqdqsECltrFKonbrVxJGRNx0
	eyy+nZy2Z16R/1uPRbsXCNAqZZwCKFGjFwjh2MF/pU6wmschCNdfZAy85ioNfc+OPhT5lfFnfBZHb
	Igw4g1HxNl8B0+BSBliewAb5K3Ibpmz/5gRGp0MvEuxReaEeA0nMHRk4AL96TCrKG+Gs8fEva/UM9
	vw1UGPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0SA-0000000Cgyx-2K7o;
	Mon, 02 Mar 2026 10:24:42 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0S8-0000000CgxJ-1hT9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:24:41 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 2 Mar
 2026 18:24:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 2 Mar 2026 18:24:30 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 2 Mar 2026 18:24:28 +0800
Subject: [PATCH net-next v6 1/5] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260302-rgmii_delay_2600-v6-1-68319a4c4110@aspeedtech.com>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
In-Reply-To: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772447070; l=3348;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=8NZwoYwb2VCG1LCRSHv+AVjZPo5V+zxxU36gRDN2zqs=;
 b=PrXtRYnWTobVOcowR92HfRVdDkG0LYGyRqdY74i9iNH9IHMIvgJ2igdf+fDectjVVH1j3VUZ4
 IAkoYlhVILJBXeARS7VrfUPv6pi7wmIWtKakW3rLfqU79Ohesamajv6
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_022440_477587_CE477E8C 
X-CRM114-Status: GOOD (  12.46  )
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

The AST2600 contains two dies, each with its own MAC, and these MACs
require different delay configurations.
Previously, these delay values were configured during the bootloader
stage rather than in the driver. This change introduces the use of the
standard properties defined in ethernet-controller.yaml to configure
the delay values directly in the driver.

Each Aspeed platform has its own delay step value. And for Aspeed platform,
the total steps of RGMII delay configuraion is 32 steps, so the total delay
is delay-step-ps * 32.
Default delay values are declared so that tx-internal-delay-ps and
rx-internal-delay-ps become optional. If these properties are not present,
the driver will use the default values instead.
Add conditional schema constraints for Aspeed AST2600 MAC controllers:
- For MAC0/1, per delay step for rgmii is 45 ps
- For MAC2/3, per delay step for rgmii is 250 ps
- Both require the "aspeed,scu" and "aspeed,rgmii-delay-ps" properties.
Other compatible values remain unrestricted.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../devicetree/bindings/net/faraday,ftgmac100.yaml | 42 +++++++++++++++++-----
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
index d14410018bcf..4cac216f7339 100644
--- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
+++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
@@ -69,6 +69,30 @@ properties:
   mdio:
     $ref: /schemas/net/mdio.yaml#
 
+  aspeed,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SCU (System Control Unit) syscon node for Aspeed platform.
+      This reference is used by the MAC controller to configure the RGMII delays.
+
+  rx-internal-delay-ps:
+    description:
+      RGMII Receive Clock Delay defined in pico seconds. There are 32
+      steps of RGMII delay for Aspeed platform. Each Aspeed platform has its
+      own delay step value, it is fixed by hardware design. Total delay is
+      calculated by delay-step * 32. A value of 0 ps will disable any
+      delay. The Default is no delay.
+    default: 0
+
+  tx-internal-delay-ps:
+    description:
+      RGMII Transmit Clock Delay defined in pico seconds. There are 32
+      steps of RGMII delay for Aspeed platform. Each Aspeed platform has its
+      own delay step value, it is fixed by hardware design. Total delay is
+      calculated by delay-step * 32. A value of 0 ps will disable any
+      delay. The Default is no delay.
+    default: 0
+
 required:
   - compatible
   - reg
@@ -77,17 +101,17 @@ required:
 allOf:
   - $ref: ethernet-controller.yaml#
   - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - aspeed,ast2600-mac
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - aspeed,ast2600-mac
     then:
       properties:
-        resets: true
-    else:
-      properties:
-        resets: false
+        aspeed,scu: false
+        rx-internal-delay-ps: false
+        tx-internal-delay-ps: false
 
 unevaluatedProperties: false
 

-- 
2.34.1


