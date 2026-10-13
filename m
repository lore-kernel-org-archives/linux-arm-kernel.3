Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D3BCA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yPRjrVeVs50xXn24OzzYBPzR66HKp/3Lz4kqyKtgTw=; b=oEGMUNnHI+/0wnDnoSGFcL2PPl
	WxZyCRQerjJLgO/fgCtvRxzEFdzEK4x1kThYB+D+5dsrDh82hK31mH/H/5N5Xkx1iZYlV1p7sE04r
	30UMMC/6hz+F95LY/blXQWksZG1dEs8a0E66/JpvSj8hmanZMXzIoooD4aB59VegaHQJao16M+3jg
	fAP5lsW+WN3XDP70Lk07hWUuKS815IF5aM5SwEAEye8TW7cLjPKEg3F85WrshLXzveM9uPumb+nBs
	BX6zQvu5mMY/wPwHzp5p59AnnqsP++elAdmCxi4NY/QFLXKDk09GclRIy9lQJU3xWcmhNENmE5eVE
	BxjJ3mmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTT7-0000000Bu8Y-1Yew;
	Tue, 13 Oct 2026 03:46:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTSp-0000000Btvr-1zUW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 869C760A60;
	Tue, 13 Oct 2026 03:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE136C4DDE9;
	Tue, 13 Oct 2026 03:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791863166;
	bh=8gR7BhNXPoHr5C+6JPztbmGwaJrI/VU6fS5GUB1Vw7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UT8TgpPSKGwNM8yj/rvWbYVxaFED30yBnH52KgvTHDCzB3prK6gdD1tQ6ebhxVRQX
	 bwDf7ixbxFcZjSGt5CbZmGbPJDgbm9rtgJuhnwdUiVHeahKUTFa7+LrAvq98LCT8VS
	 RNqJifoowOh2t0kxFldlWSkQRrWvvwPbKEVb+TYiNhPIlv+d00aFsONOk3+SLz24Pd
	 RaIaInwZtLI9hDB42WirEIHKpY0eYBRxcCneqWqKew9CStcX2Z435MCILV+HE5KXKE
	 Z4efs+qwcLc/jhSqq+5tag5tP5ZaPvcRVNX0mSYMRc0goGXH4r6fW56+08zRTnbYYt
	 XSoGyziKwk+mQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9562CA9ED0;
	Tue, 13 Oct 2026 03:46:05 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 13 Oct 2026 06:46:09 +0300
Subject: [PATCH v5 06/10] dt-bindings: serial: Add Cortina Systems CS7542
 UART
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-cs75xx-v5-6-4e72aa383d39@gmail.com>
References: <20261013-b4-cs75xx-v5-0-4e72aa383d39@gmail.com>
In-Reply-To: <20261013-b4-cs75xx-v5-0-4e72aa383d39@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791863163; l=1934;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=DBYjTP1f13Z8VgqM2RKT5FXuSk8m/3+wuQ5DQ1oXB5o=;
 b=7L0wt+3xmgjQtTNdPSmKzDxji8tKUaLGD3t0doz7lmcLEdkR+DgmJ7r01GgTmBGcptbi/Xnwy
 2+92vXS+2eUBUmkJaHcY4qyb/D9bT69u4Ve0KR2vcRqHooCRZ/svUxk
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

Add the binding for the UART found in the Cortina Systems CS75xx
(Goldengate G2) SoCs such as the CS7542.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/serial/cortina,cs7542-uart.yaml       | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml b/Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
new file mode 100644
index 000000000..2879a7188
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/cortina,cs7542-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina UART
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The UART found in the Cortina Systems CS7542 (Goldengate G2) SoC. It has
+  transmit and receive FIFOs and a 24-bit baud rate divider running from the
+  peripheral (APB) clock. Other SoCs with the same block, the rest of the
+  CS75xx family and the Cortina Access parts, are to be added with their own
+  compatible string and "cortina,cs7542-uart" as the fallback.
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial@f0070110 {
+        compatible = "cortina,cs7542-uart";
+        reg = <0xf0070110 0x30>;
+        interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&apb_clk>;
+    };

-- 
2.53.0



