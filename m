Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AF0C61DF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01IcA3hC/sgAL4CzyvN2ywyr74Knmu4UDDknO8sV4e0=; b=BRYk7XxGLngjlf/12jx1DSG7zz
	Y5p9Kcdt2diYhR3uXFwlEyPe+fRpFEHF4Kg0d8+SmJ3WwVpuim8q4GnEGEZ5lcTrBQwoqW67yqoyV
	/9kMeNrzEFTveFWq0MffoL2MCLFeCQog3z28QhJBYSqa8wDpHLDzZiYRpsVYcZd9rHICTo8kojLNZ
	Xhcn8zBdZunoCzQ1oQLcx/E/a+mE1ynfjwTY3OTSQStPbWrnolwOo/pDURAnkKJMp0qyj1vLxCnsg
	0b2dnXwCHmORb4pyohrlYXMPPv67Os1cmfI6Rc4cQr4O10QvV7cWSW/I9/Jxyp2BHLpuUqG8mP+tR
	ofBS2owQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0I-000000082s7-1sHw;
	Sun, 30 Aug 2026 20:19:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0G-000000082p8-3E1J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2723243E4F;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0DF0C2BD05;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=ST4ik3WBagvYGb9odthpBturzioGl2ubZbVZscCANes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=il+834lR+fWeOP4pJPPnSK6EDG91BxP5ko5nafIyH7USSuZl9kwerhiSFA6APWiIO
	 PCdmAgG6lQVahHs8iYNWXB0VmoEPx7qu3ZEwoRRIkZJQqGvQ2YqfpuipCRAkCaTaWv
	 xDeMNTYvcTsuaEafMnf8s3uC01WMPs4aXnqKoM8obnc1yrgA9Ws0ZV+kKlvKyciJ1Z
	 3jbaqIN5GVBV9WEMH0kY+B4jsstBIBQTqV5Fm3cLEbO4sM7HYp8lV+KfKZpQG1BUmi
	 IUHlA4sA7ke1n2TXRrMNHQHLbRkLb3Qa+CcCK1yeeMlphO/HhQDwUlvYfEoe8TJl76
	 CAQImfT+Gp6qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0EEC61DF1;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:22 +0200
Subject: [PATCH 04/19] dt-bindings: thunderbolt: Add Apple USB4/Thunderbolt
 NHI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-4-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6395; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=ST4ik3WBagvYGb9odthpBturzioGl2ubZbVZscCANes=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCSEBrgwKebrpG/+knlBjvKEQsijsQnr6Me4rogLlM
 /6+DWjpKGVhEONikBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzkZTfD/4zUd9GLIzY+Znz1
 wFnrxf49lxcm73i47Qfz1YOS15pEOK0Y/ru/Nnrv5OPcFmm+9Pe5g4X3WD6vWve9YvnyN1NjWWJ
 +P+YFAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

The Native Host Interface (NHI) provides the TX and RX rings used by the
software connection manager on Apple Silicon SoCs.

The NHI is part of the ACIO host router and is exposed to the main SoC
bus while the ACIO co-processor is running.

T6000 and T6020 use one DART stream for the TX and RX control rings and
one shared by all other rings, which are used for XDomain connections.
This likely improves the isolation of those host-to-host connections.

The M3 generation uses a slightly insane set of 24 IOMMU entries. These
are probably one DART stream for each TX and RX ring.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../bindings/thunderbolt/apple,t8103-usb4-nhi.yaml | 151 +++++++++++++++++++++
 MAINTAINERS                                        |   2 +
 2 files changed, 153 insertions(+)

diff --git a/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-nhi.yaml b/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-nhi.yaml
new file mode 100644
index 000000000000..a80c8db3ef51
--- /dev/null
+++ b/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-nhi.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thunderbolt/apple,t8103-usb4-nhi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Silicon USB4/Thunderbolt Native Host Interface (NHI)
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description: |
+  On Apple Silicon SoCs the Native Host Interface (NHI) is part of the ACIO
+  host router. It provides the transmit and receive rings used by the software
+  connection manager.
+
+  The ACIO co-processor exposes its registers to the main SoC bus while it is
+  running. The NHI is therefore represented as a child of the ACIO node.
+
+properties:
+  compatible:
+    oneOf:
+      - const: apple,t8103-usb4-nhi
+      - items:
+          - enum:
+              - apple,t6000-usb4-nhi
+              - apple,t6020-usb4-nhi
+              - apple,t6030-usb4-nhi
+              - apple,t6031-usb4-nhi
+              - apple,t8112-usb4-nhi
+              - apple,t8122-usb4-nhi
+          - const: apple,t8103-usb4-nhi
+
+  reg:
+    items:
+      - description: NHI registers with the transmit and receive rings
+      - description:
+          Protocol Defined Field (PDF) bitmasks selecting which frames are
+          accepted by each receive ring
+
+  reg-names:
+    items:
+      - const: nhi
+      - const: pdf
+
+  interrupts:
+    description:
+      One interrupt for each of the 12 transmit rings followed by one for each
+      of the 12 receive rings.
+    maxItems: 24
+
+  interrupt-names:
+    items:
+      - const: txring0
+      - const: txring1
+      - const: txring2
+      - const: txring3
+      - const: txring4
+      - const: txring5
+      - const: txring6
+      - const: txring7
+      - const: txring8
+      - const: txring9
+      - const: txring10
+      - const: txring11
+      - const: rxring0
+      - const: rxring1
+      - const: rxring2
+      - const: rxring3
+      - const: rxring4
+      - const: rxring5
+      - const: rxring6
+      - const: rxring7
+      - const: rxring8
+      - const: rxring9
+      - const: rxring10
+      - const: rxring11
+
+  iommus:
+    minItems: 1
+    maxItems: 24
+    description: |
+      T8103 and T8112 use a single IOMMU for all DMA transactions.
+
+      T6000 and T6020 use two IOMMUs: The first is used for transmit ring 0
+      and receive ring 0 which carry control traffic. The second is shared by
+      all other rings which are only used for XDomain connections to other
+      hosts.
+
+      T6030, T6031 and T8122 use 24 IOMMUs. These are most likely one DART
+      stream for each of the 12 transmit and 12 receive rings.
+
+  apple,thunderbolt-drom:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      DROM of the host router built by the bootloader from Apple's Device Tree.
+
+  apple,tunable-nhi:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Register offset
+        - description: Mask of bits to clear
+        - description: Bits to set
+    description: |
+      List of (register offset, mask, value) tuples copied from Apple's Device
+      Tree, converted by the bootloader and used to configure the NHI after
+      the co-processor has booted.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - apple,thunderbolt-drom
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - apple,t6030-usb4-nhi
+              - apple,t6031-usb4-nhi
+              - apple,t8122-usb4-nhi
+    then:
+      properties:
+        iommus:
+          minItems: 24
+          maxItems: 24
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - apple,t6000-usb4-nhi
+                - apple,t6020-usb4-nhi
+      then:
+        properties:
+          iommus:
+            minItems: 2
+            maxItems: 2
+      else:
+        properties:
+          iommus:
+            maxItems: 1
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..bb26036a043f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2658,6 +2658,7 @@ F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+F:	Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-nhi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	Documentation/hwmon/macsmc-hwmon.rst
@@ -27215,6 +27216,7 @@ L:	linux-usb@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git
 F:	Documentation/admin-guide/thunderbolt.rst
+F:	Documentation/devicetree/bindings/thunderbolt/
 F:	drivers/thunderbolt/
 F:	include/linux/thunderbolt.h
 

-- 
2.55.0



