Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D3CC5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ePTA8pgF790OhWjhPzybza21Jju8yXqqcRjJYT8EJ0=; b=aYh6FUR2ykcN45Hrlxzq/BHYmq
	zaeVqQXozFRYfx3EiZ4o53IrhcSuhKTZEVGmPXAbVw2aOve0q7dcR0Ulh9I3k97mzwvQd4gCXPPm0
	LB3siRWHqkLXyKyY56WY/He2g/fzDWxanmeOF+X34h/1y8ctyZqnh8qoVrWfygthX/ceN1Z4d80oQ
	XT6mJOOumwSD8vL7Do7QP1YT6sOawzIyTv1yA25VnKkcuNLd6kScvgu70ft/ZDegFiSHJopqkbfAU
	rAkDAWwidYv4U3d+/DL6/45i3a1kvHWY19jcb/nbbCehKIyv+uAjQatfGk7nvbLkpnU6qe0lln0uX
	cLN0qxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH7O-00000007jL7-3Ai1;
	Tue, 18 Aug 2026 10:32:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH78-00000007j4f-463y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0293044E93;
	Tue, 18 Aug 2026 10:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFF09C4AF0C;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787049133;
	bh=jEcPzTS2r9CRkRuHf/bP0CLeDxdimN8/GXo8Hz0PSGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lmMsA0G5Q8oZQVCxvjBSavux2XN9pcMMQ2yqJxzorr/srtzEr08xBhf2s1phw7p9N
	 1lSf6a+ws2OUAND5BAN/taHWwfCFNSwxTA+bg/qlZsIJ6vPy6GXbMSfmYxNLJBzEuK
	 2W5Yki/1O278pIdNJurvJwo8T2XmaZkRGnf5sFIu0d5WvPAi8A588Qw6TpMh5CiZLv
	 okFtuLZkENaKtOEEHNnMrpx6OOXxVkDIHHDulgXNI/CZCd7xnt6O9H4FnHT9XSFQEY
	 UYP/b/8Lcp+ePUGbwiU0YjFNo+JW0iEfW/c9MVIMkpba+dfUsxzHmaj5H64I++tjKK
	 w6hMzwavt2KQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B495CC5DF84;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 18 Aug 2026 18:31:19 +0800
Subject: [PATCH v5 05/12] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-cv75-v5-v5-5-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
In-Reply-To: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
 Long Zhao <zl020895@163.com>, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787049131; l=1941;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=Pngr7p+U3E/qWLbm7iUMOUjiAHv8IZUzMpz2/ZKNyVk=;
 b=ERm6YliqAyLiRYZMFDvJ/vS+LdTq7UeN8oTFIqiNI6KrdZKYs66DOsVTYT6sbgYEBuqfZgS2r
 3YpxPbqjO7WDEs0T54oSFzodxcJSxS/ZKO7XsH4b7e6RewM+4nGHJOa
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

Document the Ambarella CV75 GPIO bank compatible and the synthetic
arm,primecell-periphid used with the PL061 binding.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../devicetree/bindings/gpio/pl061-gpio.yaml       | 35 +++++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
index 4d970e55104b..414f8d4a3976 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
@@ -15,7 +15,9 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,pl061
+        enum:
+          - arm,pl061
+          - ambarella,cv75-gpio
   required:
     - compatible
 
@@ -24,9 +26,20 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    items:
-      - const: arm,pl061
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: arm,pl061
+          - const: arm,primecell
+      - items:
+          - const: ambarella,cv75-gpio
+          - const: arm,primecell
+
+  arm,primecell-periphid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value to override the hardware PrimeCell peripheral ID. Ambarella
+      variants use a synthetic ID retaining the PL061 part number because
+      the hardware has no discoverable ID or assigned designer ID.
 
   reg:
     maxItems: 1
@@ -57,6 +70,20 @@ properties:
     minItems: 1
     maxItems: 8
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ambarella,cv75-gpio
+    then:
+      properties:
+        arm,primecell-periphid:
+          const: 0x00000061
+      required:
+        - arm,primecell-periphid
+        - gpio-ranges
+
 required:
   - compatible
   - reg

-- 
2.34.1



