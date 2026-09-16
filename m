Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2436BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/UK2qpKtNV1mnmu2lxIpo6gk6uPMJBOxxrjbjHOjE8=; b=Tn0LpC30CPzcw+aK5hMdaL3x+z
	wqEZkY22JFCc45/3i+WFjD04Nx/YS8eRh3sCTvF4fj3zmB08DR1FP0p47ehOGyJos+lshEHIZz9Sv
	KF+cU2glo0VPmxMHimxyGmx0Ufo17n3ex/HhnI3m8A+8EyAEuWCzXbSWFVTtto91go2c4PgM1NbnD
	TFbUk0z2W/nXmsUnAwOZETyvMGmVfOjejr3LB94ZaV2A7GH8w7vwn9pyzoYKruyK9lkRTGI6lHTt/
	qyhnbL2KTNwaJ79LKBRHo/GRUw3vudu+AdJqhwOSEEORD2yEZInxqfhE1ctbR06V0HYjNmU8OT+Zf
	LibLuKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hSm-00000008JLn-2iob;
	Wed, 16 Sep 2026 04:41:40 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hSi-00000008JKt-43hD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:41:39 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 5165D424F1;
	Wed, 16 Sep 2026 14:41:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1789533687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/UK2qpKtNV1mnmu2lxIpo6gk6uPMJBOxxrjbjHOjE8=;
	b=TVevDxfhqAX54sA9vZQWaBqtG2zSD+Fe4J8ZB3UfbBQbzBqtslXdfrAEeqtC1fQ96qI76z
	5AfPBj+mSDZoIrTHZDbnK0/kAvULYaMDkDb5IXM5+1UWsD21tn0VtitEEzOM1XSpsp4t0X
	TjhGRUUlZTgYMNWnBcstLBe6HvvG5M0v1LKn6Zu+AHLNs8qx468UcZaLwtaqLRfP93v4UK
	mbzORxn1jAJMkLN+Jp7l1AquUN2gxO6FsamKTCbbNAKiDquqOKCVgZNXoCiYKlN44CLkTU
	pDs6OkpBpQ2zyVIsaGpX5laoY6fOgDs5L6NPF/Q+H2vUuR4GqgvAojeeGH1nHA==
X-GPT-Reason: legitimate; this is a technical Linux kernel patch
	submission for device tree bindings. The mailbox (alastair@d-silva.org)
	aligns perfectly with the sender (Alastair D'Silva <alastair@d-silva.org>),
	and the content is a standard git-style patch for the net-next
	mailing list. The URL domain (devicetree.org) is relevant to the
	technical topic of hardware bindings, and there are no indicators
	of phishing, marketing, or urgency.
From: Alastair D'Silva <alastair@d-silva.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH net-next 1/4] dt-bindings: net: phy: Add Allwinner AC300 EPHY binding
Date: Wed, 16 Sep 2026 14:41:16 +1000
Message-ID: <20260916044119.475666-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916044119.475666-1-alastair@d-silva.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_214137_280882_62C5B860 
X-CRM114-Status: GOOD (  14.00  )
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

Add device tree binding documentation for the Allwinner AC300
Fast Ethernet Physical Layer (EPHY) co-packaged on Allwinner
H616 and H618 SoCs.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---

Notes:
    Tested on Mellow Fly-C5 (Allwinner H618) under Armbian with Linux 6.18 and
    7.x kernels, verifying schema validation with dt_binding_check.

 .../net/allwinner,sun50i-h618-ac300-ephy.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun50i-h618-ac300-ephy.yaml

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun50i-h618-ac300-ephy.yaml b/Documentation/devicetree/bindings/net/allwinner,sun50i-h618-ac300-ephy.yaml
new file mode 100644
index 000000000000..a04416e78138
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/allwinner,sun50i-h618-ac300-ephy.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/allwinner,sun50i-h618-ac300-ephy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner AC300 Ethernet PHY
+
+maintainers:
+  - Alastair D'Silva <alastair@d-silva.org>
+
+description:
+  The AC300 is an integrated Fast Ethernet Physical Layer (EPHY) co-packaged
+  with Allwinner H616 and H618 SoCs, communicated with over MDIO.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: allwinner,sun50i-h618-ac300-ephy
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: ethernet-phy-id0044.1400
+      - const: allwinner,sun50i-h618-ac300-ephy
+      - const: ethernet-phy-ieee802.3-c22
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: 25MHz reference clock from CCU
+      - description: 2MHz reference clock from PWM
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ephy
+      - const: pwm
+
+  nvmem-cells:
+    items:
+      - description: Calibration data from SID
+
+  nvmem-cell-names:
+    items:
+      - const: calibration
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0044.1400",
+                         "allwinner,sun50i-h618-ac300-ephy",
+                         "ethernet-phy-ieee802.3-c22";
+            reg = <0>;
+            clocks = <&ccu 81>, <&ac300_pwm_clk>;
+            clock-names = "ephy", "pwm";
+            nvmem-cells = <&ephy_calibration>;
+            nvmem-cell-names = "calibration";
+        };
+    };
-- 
2.53.0


