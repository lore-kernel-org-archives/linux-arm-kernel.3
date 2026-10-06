Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1E7CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCdpAxAR9LPiFJewHOt+P62KcCSHumpdSoT6HHqFqDU=; b=L9QFG4bmmPJEWEPanvu2HZFdyj
	ZG8O44Ink06lZsJDcq5OSdmWZ+GTn+FTSxlpcmmQynklZecVIZLyIrC6RaBYjGabLZ37MuKVQkERI
	opfDRPfeQobv4PyPj1RX/wdHQ61VNfcf/PUxyIS7SatdcML4c8o6h34+zzo/vjhCHbedGq5jPcbKf
	bobnS+2ZWYTRyzQiTKDwlgORNtxhsh7n0a9A+VxP/zz+lQ4eXwjaGE8sizrtgIAA3UDfE/2urliou
	JNN7gpYvZ48/APonYB5vBp5mG6URhCo2++4fA+8vRQRvmJbIIdZ7ELsCFLaqGhs+J8WPytogx1v9A
	uhdQG+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9jX-00000001FPd-3n4p;
	Tue, 06 Oct 2026 18:17:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9jS-00000001FNL-3wWK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 18:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F6BA447A4;
	Tue,  6 Oct 2026 18:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0260FC4AF61;
	Tue,  6 Oct 2026 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791310662;
	bh=W7EOXXQDlUMaWVgYhY8BMz5JI4xh7+YOuI9AivYq5Eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fwIHmX8eTYLT4q4Bl62hlMFcK1NJO4nAPW6bBvQL6JAM0F5aoXNXC5YtHfBpPKejf
	 YByIuaLViC0W9n+dBBkUkq1BoHXPqKcEx+PP2zX8rj1WK6rBoBYt8lvdQzSlJqEzg6
	 cWFj/gzkaKeMI84pRUg6iim9FxkW81VFiWqW/YvzHfpp1KadwK+KlcBB+RUNPxcx1X
	 p1Dw6WwiFzAWcA1gFbo30NamHcllHODfa0NCDbaf8PF0ahQNq+Z9s6gshk/wDD8Mfo
	 NwYZoAuZbKEE7q+L4+I2kaqaFGi2uXw9/U8QH1cdr8O5lovYcDU0UoUltCUL5avax+
	 h0gSXNz//+iQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DCECA6004;
	Tue,  6 Oct 2026 18:17:41 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 21:17:40 +0300
Subject: [PATCH RFC v2 02/10] dt-bindings: arm: Add Cortina Systems CS7542
 and Securifi Almond+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-cs75xx-v2-2-b7d6e1e24d44@gmail.com>
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com>
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
 Fil Dunsky <filipp.dunsky@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791310659; l=1650;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=u9vcchuBRQjMDBDa3tgX0acQUdpNwNiXPJgpX95TxlI=;
 b=bCoh+DvJKe6bFuI2RUXJWYEMMLlvgghxCfNaa1hKKy0AC1d1F7XEgdQePShWzXCMVedpZ0A1P
 YRefPLhSlsFBynPWxqCNZgMdaztaAwkf4JfWON2mOL8459486lBHG8n
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

Add the top-level binding for boards built around the Cortina Systems
CS7542 ("Goldengate G2") network processor, a dual Cortex-A9 SoC, and
the first such board, the Securifi Almond+ touchscreen router.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/cortina.yaml | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cortina.yaml b/Documentation/devicetree/bindings/arm/cortina.yaml
new file mode 100644
index 00000000000..1c04b178159
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cortina.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/cortina.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS75xx platforms
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The CS75xx ("Goldengate G2") family are network processors from Cortina
+  Systems. The CS7542 has two Cortex-A9 cores with an SCU, GIC, private
+  timers and a PL310 L2 cache controller, a packet processing engine, three
+  PCIe root ports, a NAND flash controller and low speed peripherals.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: CS7542 based boards
+        items:
+          - enum:
+              - securifi,almondplus
+          - const: cortina,cs7542
+
+additionalProperties: true
+
+...

-- 
2.53.0



