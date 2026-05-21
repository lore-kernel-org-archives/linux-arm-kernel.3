Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70CECD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slhWd0Q1qTyPtg7PQCyLo+eazT+tVYXEqR6QSkKtpXc=; b=aJhC7WLfM+fP2ltOAKXHKEZH8o
	I9kop6bdmFHUll2GONEc9efbEg6b0AqPZYisJOURLxzYGYnxblibo1/yVMxTs+zpb4Zfh6lk13spK
	MomcY6nA8JvZJWsdEDhGiqzDwN19rsLjkUEIXuL5E0lA4mxmQ8HHDl6VW6HF2zS11rBFHCFAdD1HL
	EN6SYYx4SDWj573kZYCZj7uVj05zIdeJy+h0GKSPNRmGA5gUuq0r7SpFPGECvqB8CEi0pDuNReFiR
	MgMY66VUpa51gC3GoHdPSqNN3pPAhPnWJ+igLorHxstw6b/pQ69BrSw9Z5NMncCwcOBYVV1GwUKWd
	ibbAQqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyfx-000000076uk-0IAW;
	Thu, 21 May 2026 08:22:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyfs-000000076rY-2rSc;
	Thu, 21 May 2026 08:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779351754;
	bh=Y+IAJzkmd/rISxvlVyEkLmIzLfH8WWPE8aSMRq9pKGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nTxFTC0BhxE765aJIxaBOV+ofGsmoZ4wfYpc1m/YKXgQ4CVaS8F+WNLxkArXEayUJ
	 drU9Ep4GkU1v9MpjnSaIO9oT6IolH36Kujelif9hOY/EoP8omFr2HyQrH7fC+9v+3J
	 suZe8EWiokuhpCPYyGyG14bK3vhfbJUpy9+t4LWK8FdSDuBgl6jsPB05ONJwJLdhpS
	 Uc7LzaB5kEJzxWEh+SMC/x0XkkDoVNaVaYROKqHtFXBK1RZ//i/InExIuRa+lPet/n
	 JfVXR8r7bVspdBpt75nwS+paVTjz4NbUsC93X+Bc0TO+DztJk5ByzqnNjX8HZYhFu6
	 SaMfQqQUSZSDg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86B7517E1305;
	Thu, 21 May 2026 10:22:32 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 21 May 2026 10:21:54 +0200
Subject: [PATCH net-next v4 1/6] dt-bindings: net: Add support for Airoha
 AN8801R GbE PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-airoha-an8801-support-v4-1-1e4837d30ef4@collabora.com>
References: <20260521-add-airoha-an8801-support-v4-0-1e4837d30ef4@collabora.com>
In-Reply-To: <20260521-add-airoha-an8801-support-v4-0-1e4837d30ef4@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com, 
 matthias.bgg@gmail.com, kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779351750; l=3910;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=YsYp+8rtZbrNoe09ovitl7Xxad+fzu5FOYhv2w4KdT0=;
 b=bPZzJxP2ZZmJVZxzmCZAJkwL8nSKR4arDuOZSjnswQBPoG/ZQBkCtWbyLGCgC1O2Ixuc4a1H3
 5tBBEJbZMyeC8VNnO5PgogihaWOj/ruSCbk+n11L8zcUi/GxLHWyMyH
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012236_904529_492BED80 
X-CRM114-Status: GOOD (  14.03  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add a new binding to support the Airoha AN8801R Series Gigabit
Ethernet PHY.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/net/airoha,an8801.yaml     | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,an8801.yaml b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
new file mode 100644
index 000000000000..fb2f70ceb33a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8801.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8801R Series PHY
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The Airoha AN8801R is a low power single-port Ethernet PHY Transceiver
+  with Single-port serdes interface for 1000Base-X/RGMII; this chip is
+  compliant with 10Base-T, 100Base-TX and 1000Base-T IEEE 802.3(u,ab)
+  and supports Energy Efficient Ethernet (802.3az), Full Duplex Control
+  Flow (802.3x), auto-negotiation, crossover detect and autocorrection,
+  Wake-on-LAN with Magic Packet, and Jumbo Frame up to 9 Kilobytes.
+  This PHY also supports up to three user-configurable LEDs, which are
+  usually used for LAN Activity, 100M, 1000M indication.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ethernet-phy-idc0ff.0421
+
+  reg:
+    maxItems: 1
+
+  leds:
+    type: object
+    description:
+      Describes the LEDs associated to the PHY
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        description: PHY LEDs
+        $ref: /schemas/leds/common.yaml#
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+          function-enumerator:
+            enum: [0, 1, 2]
+            description: |
+              Specifies a function for offloading LED functionality to the PHY:
+              0 - No offloading
+              1 - Link Availability
+              2 - Network Activity
+
+        required:
+          - reg
+
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enable Wake-on-LAN support
+
+required:
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-idc0ff.0421";
+            reg = <0>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    default-state = "keep";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <1>;
+                    default-state = "keep";
+                };
+
+                led@2 {
+                    reg = <2>;
+                    color = <LED_COLOR_ID_YELLOW>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <2>;
+                    default-state = "keep";
+                };
+            };
+        };
+    };

-- 
2.54.0


