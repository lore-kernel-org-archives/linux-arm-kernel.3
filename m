Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08DCD232E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 06:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eiZT9sXBg4HL79BKEk2OPu5rQrW7DOHG5+KhdLse1nM=; b=NeG541jxRW3/lKf4OQcv8Huxxk
	lDdZSPYRRJCJYYTkzy02TCCd8svS/wIuRgaLFy23uJjFqWbCBNAoOh7NYDVJeEiSDghj0+syXK5RF
	QAUnFz5jKOm/ZGUJk6ScgJ2Zx/GmKuyGZnTWG4/vFeBG5s0ryGHAcBvAXEubWdqpYDAQPh5ut38Rd
	HX4hJxG4XWd+M/4rSzQMR1o9KVsbc3eJuu9pdnHEcIPMeD1uKwP8fmKCJk+2kBa8GKViPNe9aos3a
	KSPah0EtkoPp6D4coyqDVDLQXU6NQJKDlH9cSJCkHQQya6T+E4sqlffmlIH/vPC88WGd1O9YcYTLP
	iehcrYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve65w-00000001arx-0pBD;
	Fri, 09 Jan 2026 06:35:36 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve65t-00000001ar7-2vPw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 06:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767940531;
	bh=eiZT9sXBg4HL79BKEk2OPu5rQrW7DOHG5+KhdLse1nM=;
	h=From:Date:Subject:To:Cc;
	b=beS2t433FJ6u6bIljM3aTHPk6T49f9Toc1y6B8godI9KhHF6D/lmHoIogkf36Iqyf
	 YMG5T18VIity3jOkFohkmYR6an3bP08DqZcAbTsTQwV7T8epMUYpGPvIUCGmHC7pxD
	 oe2D7QNlcYRP5uCa5Fby4FUbBKjA1CzAxSHw/WX7IPj7ck/QQjIdMnxB3+W/mXwA4B
	 QDiF2qdinPXMhiUXAsZdfAEtxnw5cWw/4BSJ9EMDKmgGm2XBtor/qn98V4PLrL6tLQ
	 sEugBUA7pg7ws0cSduUJQNSvLgnYVYGW/fpyjMV5j0Wm/roL21s1BqXzGeHNX3wZ7n
	 ACMQsT7TfWZbw==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5CBB97C834;
	Fri,  9 Jan 2026 14:35:30 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 09 Jan 2026 17:05:18 +1030
Subject: [PATCH] dt-bindings: mfd: Document smp-memram subnode for
 aspeed,ast2x00-scu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-dev-dt-warnings-mfd-v1-1-1aabe37e9a14@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAKWhYGkC/x3MPQqAMAxA4atIZgNtwd+riIOatGawSisqFO9uc
 fyG9xJEDsIR+iJB4Eui7D5DlwUs6+Qdo1A2GGVqpVWHxBfSifcUvHgXcbOEc9Ww4s7SYlvI5RH
 YyvNfh/F9P4+sds5lAAAA
X-Change-ID: 20260109-dev-dt-warnings-mfd-b57e0e9fdcf8
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_223534_134306_0F2A6C52 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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

The platform initialisation code for the AST2600 implements the custom
SMP bringup protocol, and searches for the relevant compatible. As a
consequence, define the requisite node and the compatible string, which
in-turn tidies up the dtb check results.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Hello,

This change was original part of an RFC series tidying up the AST2600
EVB devicetree at [1]. Many of those ended up being merged directly, so
I'm splitting out what remains into separate, smaller series.

Please review.

Changes since RFC:
- Address the warning from Rob's bot
- Tidy a description line that was dropped unnecessarily
- Remove RFC label

Link: https://lore.kernel.org/all/20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au/ [1]
---
 .../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index da1887d7a8fe..a87f31fce019 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -130,6 +130,23 @@ patternProperties:
           - description: silicon id information registers
           - description: unique chip id registers
 
+  '^smp-memram@[0-9a-f]+$':
+    description: Memory region used for the AST2600's custom SMP bringup protocol
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: aspeed,ast2600-smpmem
+
+      reg:
+        description: The SMP memory region
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
 required:
   - compatible
   - reg

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260109-dev-dt-warnings-mfd-b57e0e9fdcf8

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


