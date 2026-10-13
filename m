Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6546FCA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ju5ziU/jiU2DieDsoHgPIHDX76lNg1D2lb3AWXFDUFs=; b=P1RMDBLzif53qDpKWzfvacyNgJ
	1+QWFbWn9SEhsg5y13gKKr805ncEXXFhM5pXuBct+LZvFNoHWpnFa0HJXesf/ZGxWcCOEWI9J364m
	0lX6Rcp6SRYMcfDOowlgMuzfCDkKocnrpH5IvSCbgkbWcy3lnClHcTG5AnhA/KD7UQ4S9sTN5sS1r
	d974+ZE3b+fhOLfPqRrU5bTAU10J0TsTs0DTCmvM2ZFhUPk2E0XLSGKfMWc8iWopSsgjH2u/Q6zzT
	fvWkPvk65+GEk1pPOpZRyMAAvrdedE6Dx8eie6iY7T0Np/e7i7+QW1K8PTW3QpqPhYPBpnWvLFQYM
	aAp3myVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTSq-0000000Btwr-2IVD;
	Tue, 13 Oct 2026 03:46:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTSo-0000000Btva-1q0n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:46:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 095F043E4A;
	Tue, 13 Oct 2026 03:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAE54C2BCFA;
	Tue, 13 Oct 2026 03:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791863165;
	bh=N8m7KBF7NQ6WTdonuJlgr8ReC1ccHJp/7yH4LqgQIjs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TYR4LvfwDTmechHGDIOXR08hMssGuV+d0fMXjkV9oVr3APfBOJk9LxvCb0GQjLFh0
	 FGNiwKDJIn/YqIkB95sEp42HOxxhslcI+qdUdH8fbyBXBKU5omRlVWUHQE35c6lQ51
	 NcSwYKH5uhzcH7bqlKuwbE18u8/Nvqpc8b2vHVA5jylY7anQOO3+GTR6Jidx0OLfbJ
	 NfxClHyDJIa8S8bV/RHX7rp3RzXv7PYkvQJlxPL1lp23ve20x/S0VNbRieIzersadI
	 p3Ed5xTQHjajCi36UxKJY9h6914IMnnLWPh7ahUGoJmAWDCjpqKf+dw2rNOhWgpLBy
	 zQWzvrOVk3RyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B741CC6B03;
	Tue, 13 Oct 2026 03:46:05 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 13 Oct 2026 06:46:05 +0300
Subject: [PATCH v5 02/10] dt-bindings: arm: Add Cortina Systems CS7542 and
 Securifi Almond+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-cs75xx-v5-2-4e72aa383d39@gmail.com>
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
 Fil Dunsky <filipp.dunsky@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791863163; l=1646;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=iqp1aP4N83y9unmltEz85GKl1p1MyHyOFw1KaFYcgAM=;
 b=bDK6oEyfbXOtZeurvErVjtTC47tNZKu3lvFFzwq/lFMfHqV416DCmsBEJngKah2HGUtmW8zan
 J1QvB97MVRrCBywZYWq7wcdrmidJhWUwXbDhsm9qABcR/LM/aVlDmNp
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
index 000000000..1c04b1781
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



