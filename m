Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03832C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wh9SZNt6ADV51iweiiph0QlthCm6lGBovfUZeQYzB0w=; b=Dwg2WpTrhek1Ya62aFXc51KvJL
	xYzUZnsoWMaHkWl9N9mMdBmgbE4ZrBfkukP0GWXCwLC809gfrjaoO8i30l/4Ec9NpCWpQ+/EGOpJg
	GYiD58X5N+QVhBRU13Tneu5mFc6R9mO1f7Jk1TdlhncfW9AF9SxiCda7QchQp9y7BzUREOh4PoCpS
	QwYwGpROMgc9kETHUvmiRNyh1f9m9Pqc9AFCBtnbD2C+vaBrge54/y+EkFN+E2CKWgriPiVNBsyu0
	Z7RHRv//aM6F2bTRvIBiwRpNkq8MYGiPV2x5c1mKWnT6eyx1PPNAoAc80FOWAEb8i22l8QvUqdf1G
	lWKAJhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBU-00000000OTf-1FCB;
	Thu, 13 Aug 2026 09:57:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBT-00000000OSz-28dj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4702641944;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F1DCC2BCC7;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786615031;
	bh=QoMXlPLzALhwByi+1x8x2yYmLLmFtvcOqO7OqLXmh3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WtLOIRNeIk9GweSGMkZBCGV0mLKufRKJCcvPQ4umeCEE8mBcpAlS/g+pwGGrzOsGI
	 RTNrgpSGGRa2c6JveuSbwymDjKC74v/MqFBc+O160kDb1+lQqwZNXn+xP3z+YPIUML
	 6L1+R7nHhmFNOz4BB+02mJ1KhA5OagVzOkeqI/bV4zsqYbgkHUtwwYyKtP1eZtlNJD
	 BDjeC/bV+wlOK7XWY1FitJwY0cEvsZ4rBFUhsW0r5HVcxGJioBIPdOgc8m6YwJ8uIQ
	 zLxuoVZZodwj2Ny5CCEqrKj/QsE1g9W63e9JPlSZr1XqqN/6OAABOYt2s2GHSgGE3e
	 zeo32K1f6pwKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0267EC5CFDB;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 13 Aug 2026 17:56:12 +0800
Subject: [PATCH v3 1/6] dt-bindings: arm: add Ambarella CV75 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-cv75-v3-a-v3-1-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
In-Reply-To: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786615029; l=1828;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=afPd4fMvs6m5AADxb0oc6RJxPyKNG50c78xrv0izT2E=;
 b=FfzHBtNw5HlISmo6udQC4oEZ/SBB5ags05+u2NZV8P60KxB/xQ8mXQqJM1Z7p36HjyPdJEtYF
 wbyzA21+8RnClLWBe+i2Gfho8WsA5mzaCIRHya4PBYk1J5P6/k3Ld1n
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

Add the Ambarella vendor prefix and CV75 EVK board compatible for the
initial SoC bring-up.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/ambarella.yaml         | 24 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ambarella.yaml b/Documentation/devicetree/bindings/arm/ambarella.yaml
new file mode 100644
index 000000000000..72946e94fa76
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ambarella.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/ambarella.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella SoC platforms
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+properties:
+  $nodename:
+    const: "/"
+
+  compatible:
+    oneOf:
+      - description: Ambarella CV75 boards
+        items:
+          - enum:
+              - ambarella,cv75-evk
+          - const: ambarella,cv75
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 85a27937832e..f48aa6dabbe9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -112,6 +112,8 @@ patternProperties:
     description: Amarula Solutions
   "^amazon,.*":
     description: Amazon.com, Inc.
+  "^ambarella,.*":
+    description: Ambarella, Inc.
   "^amcc,.*":
     description: Applied Micro Circuits Corporation (APM, formally AMCC)
   "^amd,.*":

-- 
2.34.1



