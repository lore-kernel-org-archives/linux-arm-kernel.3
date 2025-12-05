Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8620D2F7CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHQEZvIaT9ZEN2IviuzwdDi6REMVFYwYRfKloz4i2+4=; b=3zxE4l6FF9LydW1ME0Ge/hecZF
	Cs/B9amyHpsWMJN68EelLGjTGArfzV8GmVvCNbHAz0f6+Ibmm2RKaUrIsCKDzCorufJDssUD+/sl3
	ork0pey6tLfv5DcUYhCrWqY/BqfPWDLlnsM3Zk9h8nBGJEDNVEqlCMedz6Oni6FVeHTzpOwv/S+9f
	fTHArnycrfoL7uroszZTKi+g33tGFEGWSDdBgLqVL9jNpedQD4j/08DvFWVeYRMzl0KtLS3TCtEjl
	ofWAZmOTsr3AGAM6bm2qW2BtKSMe2Xo0sEYPigrqb8TBVAD8/qaNBA3M+642HPdB0a8KKkrG8aIDk
	gtvGzAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSVG-00000009KuC-19ki;
	Fri, 05 Dec 2025 09:53:30 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSVD-00000009Kqn-3q0T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 09:53:29 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 5 Dec
 2025 17:53:15 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 5 Dec 2025 17:53:15 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Fri, 5 Dec 2025 17:53:15 +0800
Subject: [PATCH net-next v5 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-rgmii_delay_2600-v5-1-bd2820ad3da7@aspeedtech.com>
References: <20251205-rgmii_delay_2600-v5-0-bd2820ad3da7@aspeedtech.com>
In-Reply-To: <20251205-rgmii_delay_2600-v5-0-bd2820ad3da7@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764928395; l=2965;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=10M+NTu6cKgwCMa/PYvFJoSlsso1k74bA21xmxMKlok=;
 b=Kh2WP6QLBI3wSvDKNvjpCbZYvYBuRfBemttZPEqGdj/Ge9IxrY3cZQc6Xr69W9YTeqqLiTmJa
 9+yHR4PJKdGDUalzjzU4tP10JMDte6PU5geXmz+L06GIe8aumCVoqoa
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_015327_974146_2F6BE701 
X-CRM114-Status: GOOD (  11.58  )
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
 .../devicetree/bindings/net/faraday,ftgmac100.yaml | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
index d14410018bcf..00f7a0e56106 100644
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
@@ -85,6 +109,9 @@ allOf:
     then:
       properties:
         resets: true
+        aspeed,scu: true
+        rx-internal-delay-ps: true
+        tx-internal-delay-ps: true
     else:
       properties:
         resets: false

-- 
2.34.1


