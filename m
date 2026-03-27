Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B205410ED65E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbzYxohRsQtED0PQPXDbYXTfQSUFvHwELsO2t75H6B8=; b=3RJ49aTr3eL9sx0qAjZMKp6WON
	EpA+7dNOtujd1DPk/MOwi0Id94me6RnZLTZqnD4/WuQa9KFpq4pmbg9baf3GPdiY1ZxuFeNhugU0P
	ZT7bOjs3e5aEpLw9nijMSnDswOp+5vfzSVXhpQLMj8NuO7345t9qL9W8wAiy12MobK/3wqB2InrOb
	737dnukk58tvqp1rs+lpdO1G480jsY7J7t7hKQgMiauf+Fm08VGh8T+qSJffyu60lojrYqRv1nyDr
	ldgH5rthmk7EFrHi1WJ9SxnLRZNhq01SyvAZe1OS4y+nS3zEpKEbocKzBoF0wyPWYvsuUlburXlVw
	pdx1iTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65OV-00000007Doa-1zuk;
	Fri, 27 Mar 2026 11:30:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65OP-00000007Dm4-2BQQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:30:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0A77359D;
	Fri, 27 Mar 2026 04:30:14 -0700 (PDT)
Received: from e142021.cambridge.arm.com (e142021.arm.com [10.1.36.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 114463F915;
	Fri, 27 Mar 2026 04:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774611020; bh=g52Al9YWCGtwUmdi2nk9qV8gQKZV5m7STqJ7l17xicE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hLG0PUl2wPr3QJUujLbGVwlya+RVrjtmTqqcNnDXLcXt30X1wQVX0yKYOkkstTCZX
	 vwF1cEDYsEMnzcvFLgDsxIM7SzneSBWO4CColqroxIRWEpizSTNCZ4LxWB7T32eoLG
	 E9Fb++Pl4Pkz0kcGitc0RHJdDQTRLOBHt2hZ6NYk=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: increase IRQ banks number
Date: Fri, 27 Mar 2026 11:30:05 +0000
Message-ID: <20260327113006.3135663-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043021_595412_22831D5F 
X-CRM114-Status: GOOD (  12.06  )
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

The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
instance, but it skips the first bank (PortA), so their index goes from
1 to 10. The same is actually true for the IRQ banks: there are registers
for 11 banks, though the first bank is not implemented (RAZ/WI).
In contrast to previous SoCs, the count of the IRQ banks starts with this
first unimplemented bank, so we need to provide an interrupt for it.
And indeed the A523 user manual lists an interrupt number for PortA, so we
need to increase the maximum number of interrupts per pin controller to 11,
to be able to assign the correct interrupt number for each bank.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index 154e03da8ce9..f87b8274cc37 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -34,7 +34,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 10
+    maxItems: 11
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -61,7 +61,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 10
+    maxItems: 11
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -130,8 +130,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 10
-          maxItems: 10
+          minItems: 11
+          maxItems: 11
 
   - if:
       properties:
-- 
2.43.0


