Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2913C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2S6YDDMwCU2+WqTESVpXyI2fQYYUrTudhc3TbUc1v0=; b=ht6yYEcPlVb9/E1yAOLRg0MYEI
	1oroWlBH2ca7VfuzZCWQrwXyGQt+IeM7TtbJYnCG4ZgCif3IJkp5d7hYnVlDDLu3Z78NfB6GxPPvk
	P8Xep8ncF+u6gIDdD8SLogmfedINi8o2CWlu+o+xKgRNZf1QP76U04Fn8YqwUqnymWUkjRgTDF4QV
	YvxQbpZhVrdL1sISPNx5juWiZfA/kROuo2eCNtwgyKxeNBwoYWblR126Qo/PSqbmIvz7x11j17Kxs
	fbJl0ImLe2IfPBknETt3yFLJe5J48/+apoO5wsAMP3VLcNMTPy4youGUcyLedJ0YqSljSASw78ctT
	kviEvyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUj-00000005ORE-3vEW;
	Thu, 06 Aug 2026 09:34:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUd-00000005OMm-2DnH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA7C243FB6;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88BE3C2BCFF;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786008866;
	bh=xUgMhJisYvLuqDZcdPp4HG6wSEX/KHSUvHPVx8bBVro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mIIDQ00j1xrM959FClKDZK5VJnm8wwPwNCrONSyIdy7SeLn7N+cY4rmiEQaYx3MqG
	 ecVHbeUJhniU6XDfuH+9REe6U/nwfQ2EpCEfy6Vq25HL/P2ZfEedKyoDf8gCsyj7LH
	 BFSXFHfCdAJFaLlF0KSGz7Dvr7fjx47h/1eRBu+TjxyIzc+IhIhMkg4CGPppqbWlA4
	 I0CjM45+gDasdmGfoHkv9KrF5d7OncEaFTB/8fFM/QCqtC+F6bDHfBg8wyKkbd3/4V
	 khbQDLrevVGF3EfcAMQ+qbDWqkBKA3dXj1anqrjKFnhE+tj/pTTbRqOjhROsJR+ryK
	 BYNDY9x/vM7BQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72765C55838;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 06 Aug 2026 17:34:13 +0800
Subject: [PATCH v2 05/10] dt-bindings: serial: add Ambarella UART
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-longzhao-upstream-cv75-v2-v2-5-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786008863; l=1437;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=3IBRZ3r8aIVqSKUt911TKSBxsBmqjCi8qDWSpR60+wA=;
 b=M6+0z8dDfmpElcLgzbEbUfUoySjemhkkbs6T71oYsaDIRGkmIvWuGiAI40PfLWa3hP6Qi0wI0
 0li8Y/TnBYSCa1X2yPoCMk2J9YWaf1jHSF9yoqV/fpNFTwIayiYcOkg
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Document the Ambarella UART controller.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../bindings/serial/ambarella,cv75-uart.yaml       | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ambarella,cv75-uart.yaml b/Documentation/devicetree/bindings/serial/ambarella,cv75-uart.yaml
new file mode 100644
index 000000000000..86d6d8a61ace
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ambarella,cv75-uart.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/ambarella,cv75-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 UART
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: ambarella,cv75-uart
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
+    serial@e4000000 {
+        compatible = "ambarella,cv75-uart";
+        reg = <0xe4000000 0x1000>;
+        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&uart_clk>;
+    };

-- 
2.34.1



