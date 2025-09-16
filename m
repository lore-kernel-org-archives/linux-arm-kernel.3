Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCC8CAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyPH1zteKRK/JsOAsgkVZz5/Hkqr11ZvI1xMXdLU8qQ=; b=wz7LWW0FhsWtTapoJEowWyVuzl
	dn56RutJqFTrfmN6nzWk33/cPENlGGVeAGv2FT9xWlhvUHJ4wXniCQod7mhSxVyV9nbYFry/Gk1Lf
	84h0AlADeLs+t9yuAfJQda4peQ0eFwPCf7P02SMWB+PugZYpWdgQmwrNZjmV46CGj5Pan73+D3DVY
	fq2hSKNUUgZwclwvTAYRuf1/E/pVV891jI5KR+F16iV0Gdr8B+BRngfUsmI5NmlktW6fbY37aycRz
	nqYx6cm9k4o51jVi6QQm51k4TIIblQ4H+BhK/twad/bWbdf3FR9ZYx3oiwx7FvIIh2YyD6QlHbOkw
	gtylbfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEx-000000090lV-48fg;
	Tue, 16 Sep 2025 20:25:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEw-000000090iW-1XMM;
	Tue, 16 Sep 2025 20:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C61A36022A;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B570C2BC9E;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=p/pUs0MZFo/+qdpENMcLyBKM/numNqXrgeAhrFls3Eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X40rBasvR7PF9fN2qZQCQCcMCvK+/79psNEO7of+ZdYpkF69MAr0mnbIigzoHre2b
	 jx9HjMjRyRSaCrimkK/eqqMxWdoW8v3CHPEww8hrQLkp3csUFfFeLLyCdqCcSvu6zI
	 HWOA3QD+Ku2kR8Dj7zScHUzKEsTBPK+YbDobYP8GQmOebRUlZlvYmXKEXp/q0TX3Tl
	 /QvOaZLAcZoPr92AEA3siTedj5AV3iHptxfTowEYaB1heIfj7/B49bp/Nkns7ifsEF
	 x8qKh8xWD46Mbc8VfSb1g+8SGej7y5tanDSXVqUIxhCpLNSAFSz34bFs1DQJYUV3a/
	 qEDMtb68I2Azw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30ECFCAC598;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:02 +0700
Subject: [PATCH 05/25] dt-bindings: rtc: Add RDA Micro RDA8810PL RTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-5-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=1198;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=WXHBrmFovBDD+aODYzMgHF0ddvJv66eaBAA1wb46O10=;
 b=1AWpjOVHeC7A/fG05V5076Du73/ixlPO3tOlVdOzwByzDZgvNmGQVQIvJBjfRQdO6qHjcr8dk
 nUyBOunSsouDcKxdzeqOCwhm+B7f/3Zy6jwd0Awas0NtAUvq1ASF3OD
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

Add documentation describing the RTC found in RDA8810PL SoC.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 .../devicetree/bindings/rtc/rda,8810pl-rtc.yaml    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ceae294921cc3211cd775d9b3890393196faf82
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rda,8810pl-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RDA Micro RDA8810PL Real Time Clock
+
+maintainers:
+  - Dang Huynh <dang.huynh@mainlining.org>
+
+properties:
+  compatible:
+    const: rda,8810pl-rtc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@1a06000 {
+      compatible = "rda,8810pl-rtc";
+      reg = <0x1a06000 0x1000>;
+    };

-- 
2.51.0



