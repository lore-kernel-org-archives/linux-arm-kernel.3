Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9645FCD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quTAIQusbPXue6VA6ottRurWfpIk3dCX1vZ/ZbFHJGo=; b=ebfFY7yev06MCgb8hy15GaWiRi
	jCvow6eIMsir6d3WRD1xf8CSNHQDIxtLZ6/gdQGT5AsKu9VjZYT0tJ04rk1yygJQDz8rcw1CMmy4T
	bZROdiePg+pSS0vdAhiWWx75eCelU9EXKX+h9kMVdNOTT2ScroHXEFfK1GWuWd3g36MsdA9mGOzwd
	hkg224CWbqAaO4cTkuA5Yw5YF7mL7r2C77F4L5aE9oAvKfB9KxTqaHk2hCsIwjnbZzk7i93tYZ2Vn
	bEe0AoTHpm8DBgXXHIyTrNrrAuqjQ8OWFidrjD43UH9VUB7YJp3Zt9ryMIleMuJikYdZG3lDDQFz6
	Mmb5I1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVT39-00000000ZQh-1RQ2;
	Fri, 05 Jun 2026 11:49:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVT36-00000000ZQC-3MGX;
	Fri, 05 Jun 2026 11:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DE9C407B4;
	Fri,  5 Jun 2026 11:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E54B0C2BCB9;
	Fri,  5 Jun 2026 11:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780660156;
	bh=mtnM3Sj2cMIy3e+ie4Hp0c1qRbSYoX8+8V4uSy2F+p4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wqe7pXeNMzMqmThbgCf+suxMyK0BxZrH03eXV8xdWUyUZpMRRds63h6LFlDkkjWk7
	 gijoZP2+DgXAzPhJHqNr5zDa7pfM4PYsdI6Wqs2XbtISxTKImqyGdmpP6N2NtI5YRa
	 ziQ41iEa9uV6GLYhkx+Qnx9evHFAtyyCLttOJdPJz1hxeGKyykmvwQ9y80XNO29YRN
	 Ro+CGQTuis+xSXrHZwHNw9ubmwNwmSxSPAlJoALbNod2xkHm464w1JNfONaBgS+A5Q
	 x0A9Od4e86XdRZCeqCWWNr6JbVyLvu+8J7hcQKyA7mb6UZUnVNPyPNKV4+aJCTRfHA
	 ivARXzcQC1pKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB19CD6E7C;
	Fri,  5 Jun 2026 11:49:15 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Fri, 05 Jun 2026 13:49:08 +0200
Subject: [PATCH v3 1/3] dt-bindings: net: add Realtek r8169 family PCIe
 Ethernet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-1-8a8857b39daf@pardini.net>
References: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net>
In-Reply-To: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net>
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=SwvhGPGzhgbbXrid/Pg1myL4wDhH+eVp/OO6aNuLepE=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWQpbd/FWGppYr/MysQiwyooP2dW8OqTcdMl65jLxefU5
 +/tbgnrZPRnYWDkYLAUU2RZI6HM8239q1N3PDomwwxiZQKZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6BjrGDFycAjDV7Jnsf7h/aG+smiH5n33aR5fpvm1HGk9JbnOR+ZyvtGbSZr/NEez3vliZRHl
 cy7E6L+Ks8C9P8m7j7wDDBLH8I0EOmvz8TZ9qFmyIWO1xpnP5v56Gy9/WbjZL3K18Yj9nk8zWfa
 E1llPti9cd+c8s3l4XMYdt4qtXHh//e3EfPuldmfhwcdpFR+2Up5vcY2+KavrNsgktveWxITQku
 Nt3m8zNh9z7Fm+qv9j1gfX7Fv8H1eVn8qMjZj2c1Jfgkm35iiHDpjXhQar2FEXm/ZZc8g75vYqn
 Pr5NWHZLat+KSzHRaXK7Qw/6hy8WaDx/TPSaYZU5q96/O533e1JvOrX/nVA+71utW8T1O3VnTnT
 2dJQyAgA=
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

Add a binding for fixed/soldered Realtek PCIe Ethernet controllers
driven by the r8169 driver (RTL8125/8126/8127/8168 and variants).

The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
compatibles documented in their own bindings (e.g. microchip,lan95xx)
so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
these PCI function nodes can be validated.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../devicetree/bindings/net/realtek,r8169.yaml     | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/realtek,r8169.yaml b/Documentation/devicetree/bindings/net/realtek,r8169.yaml
new file mode 100644
index 0000000000000..6923211ff4c93
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek,r8169.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/realtek,r8169.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek r8169 family PCIe Ethernet Controllers
+
+maintainers:
+  - Heiner Kallweit <hkallweit1@gmail.com>
+
+description:
+  PCI function node properties for fixed/soldered Realtek Ethernet
+  controllers driven by the r8169 driver.
+
+allOf:
+  - $ref: ethernet-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - pci10ec,8125  # RTL8125 2.5GbE
+      - pci10ec,8126  # RTL8126 5GbE
+      - pci10ec,8127  # RTL8127
+      - pci10ec,8161  # RTL8168 variant
+      - pci10ec,8162  # RTL8168 variant
+      - pci10ec,8168  # RTL8168/8111 GbE
+
+  reg:
+    maxItems: 1
+
+  local-mac-address: true
+  mac-address: true
+  nvmem-cells: true
+  nvmem-cell-names: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        ethernet@0,0 {
+            compatible = "pci10ec,8125";
+            reg = <0x10000 0 0 0 0>;
+            local-mac-address = [00 00 00 00 00 00];
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b539be153f6a4..6341de4fadb6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -134,6 +134,7 @@ M:	Heiner Kallweit <hkallweit1@gmail.com>
 M:	nic_swsd@realtek.com
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/realtek,r8169.yaml
 F:	drivers/net/ethernet/realtek/r8169*
 
 8250/16?50 (AND CLONE UARTS) SERIAL DRIVER

-- 
2.54.0



