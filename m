Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8457AC5620A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhOBr3j0QjVNF9J4gCRF8jBCfEh6FyCNnHEL79rdVEo=; b=2N1mlOCkQWm8E48tB1Yzc/UCvf
	Gqjz205D57AfWf50ENGtnPZ3vrbtSoDOf2fEvYtqDJOpfk2Pf5kOvb5M4NHvX22Y07lLalNpGY791
	bFlUDTIWdSbTuSMoNd6vrNzsdQ8xhpJnCo6U7GN+EX53cSuFPEaaN5oBHgS7glqPFCKL9v5ZlgbSk
	5SEXcSqXgBm0wE904P7+qCATks6wsDDAbNxJk1FSfbN0MP5e0CHeuhB2V+QCK8wQ/ldmTGGEcd9wY
	8L4eX7RuOSOIXCp/0J7HUv1Sf341oS/cZxqKQslB/uuf9QWiqo6MwiLXceXSMF7WeTIAw6fBUDfGG
	/69eScdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUj-00000005OQW-2lCe;
	Thu, 06 Aug 2026 09:34:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUd-00000005OM2-0OZj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8ACF643F87;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 506F1C2BCF7;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786008866;
	bh=xksXNR3RIxdAAWa4ZhBc1ec5Me5J0Ftc6OOeqFa8oRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r+t+ygdUF8iAuJnJfsPUYCXVRoWcg8xWExj72eAjkTdVqixYikWlnvx3aQx6hkGeN
	 Z3gSL3+r7X8+MTZEm4vPxjL/tBa388Vw1D7PgUM+RHJMtaWx1QjcFyPbihV2ePTeub
	 hxyRdn3kj4WBlm0mSpnmtM9QnxXpYwY5GMQ84sV2aHHP0jlbGlr7xHDeiVEQ22wzdU
	 ZwTWF+EaftOF6m56yQfOd/TN42wyiLTzTxK/fo2vN2O8tdO3UEjnsjx7gPd4lr9jIL
	 4bFckpT7+IARfxqhVf0wDdIU0QVCVrPtaVKDEwE/TAI4w/3co+HnzYKHMJRz0NlGmi
	 m77BIKwbYMMoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEA4C56208;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 06 Aug 2026 17:34:10 +0800
Subject: [PATCH v2 02/10] dt-bindings: soc: add Ambarella secure scratchpad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-longzhao-upstream-cv75-v2-v2-2-6b09707c5fe9@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786008863; l=1545;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=1vmye3CK0HpbkUmTNeoU7Oscgo8VwkmeZd901TWonnk=;
 b=f3oS0meErI2j00TKtSZ8nQ8sMS+wTYXOy+doYgvXLIsQdTWSBNPan7rytIrwLIoZznhElBAee
 KuyY6KX+IeZBHkpzWLPBo4zGKFpEpuqUX2LsFzPBeafjNNlDGKeEVi7
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

Document the Ambarella secure scratchpad syscon used by CV75.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../ambarella/ambarella,cv75-sec-scratchpad.yaml   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ambarella/ambarella,cv75-sec-scratchpad.yaml b/Documentation/devicetree/bindings/soc/ambarella/ambarella,cv75-sec-scratchpad.yaml
new file mode 100644
index 000000000000..4bfeca0ac3da
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ambarella/ambarella,cv75-sec-scratchpad.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ambarella/ambarella,cv75-sec-scratchpad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 Secure Scratchpad Registers
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+description:
+  The secure scratchpad block contains shared system registers used by
+  other Ambarella SoC blocks through syscon regmap lookups.
+
+allOf:
+  - $ref: /schemas/mfd/syscon-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: ambarella,cv75-sec-scratchpad
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    scratchpad@e002e000 {
+        compatible = "ambarella,cv75-sec-scratchpad", "syscon";
+        reg = <0xe002e000 0x1000>;
+    };

-- 
2.34.1



