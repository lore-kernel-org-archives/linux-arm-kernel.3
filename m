Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD04CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3z5r9tfQ4r+DNFMChlsTwNUlm2I6IUbweEqbsJ4Nos=; b=rHmIzOM9OPQCm8FvO/CIC3vTNd
	/kp5xAm0s9ZQxBfRd1ppp2fW3wMNM1/w2NWd4kjgysKcJu6BOt7/2QLhiANdkO/uH6TUqcRZOtBU6
	zUr2MGgMUCg3fVWnsX2o+VFCbecBWW1AvdvhGHQoLK6qa+Ck9dBLqo/yb4KPhLcxwax5jRmrSaUn/
	0Bbgi2zBJFHcavuDCewIraS5c8NGd8q3xIQw36XDRQD+6GtG6zW0P909WM9rsIoLABb31ysfKIhq+
	LLK9k/yQ0WU2yvRtEPEQ9/ESFmTeMiXs4GoOs+82bd9kHgvms6YjBvFAm0ikSHZKnLXXkJ0s+l4B8
	sfeqMTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtFi-00000002HID-1Bek;
	Tue, 26 May 2026 14:59:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtFZ-00000002HC5-2aQQ;
	Tue, 26 May 2026 14:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779807558;
	bh=jnjkd94RUMpF3IkbOII2OEsJPkhLiCqeJjlmx+sxlEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=emz5cx1RN9j/jc2l+4sjwVfbLBkCaw+ZdMXLwdeDggQTU8DX+ONoMB2JLgrZ8fnVC
	 gGBvsnyz34H7P+XCkd8YVEDOvAcBpVuHFEPa92jahxRxfxyiMCm76JtS6iUrwKFVTp
	 TW3dSqBSFOxikwXiXGBiyRn08TImHzxstiuAmn2pzo38zXI1WRzUY2qmeVShaKodNR
	 qdzLwdn9B5Ykdx3+RXPxfcMByVg38MaV5TBZKplPjixIpfJBsMiVon3iqdKRG9Bv1z
	 jB9re98J+b27nt1XVF3D0hKlUA2HWjP5Uv8/rPSlJz7lZXZlfVaaQbxhcxq5xXExnP
	 hZ0zhEIw/Bnmg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2531B17E0DD3;
	Tue, 26 May 2026 16:59:17 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 26 May 2026 16:58:06 +0200
Subject: [PATCH net-next v5 1/6] dt-bindings: net: Add support for Airoha
 AN8801R GbE PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-add-airoha-an8801-support-v5-1-01aea8dee69b@collabora.com>
References: <20260526-add-airoha-an8801-support-v5-0-01aea8dee69b@collabora.com>
In-Reply-To: <20260526-add-airoha-an8801-support-v5-0-01aea8dee69b@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779807555; l=3989;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=cHsrbSP2OxYlHlAYxTNFdvkiUfl9C3Vj73alAJHVnUo=;
 b=5Urn83jCctCngaKRIubjEOz/UJJu7RW9RwCFWd8iSYVV40rgGb/Tlh1q2IgxUDpY9VwOReoCj
 aC7TMIi23OPAPG5Owgda1tXuWu/qxiOAOaua5kpwbCnAIGBWdHY4VKg
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_075921_809598_576F3A4F 
X-CRM114-Status: GOOD (  14.31  )
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
 .../devicetree/bindings/net/airoha,an8801.yaml     | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,an8801.yaml b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
new file mode 100644
index 000000000000..d6e5a60a6b20
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
@@ -0,0 +1,120 @@
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
+        unevaluatedProperties: false
+
+    additionalProperties: false
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


