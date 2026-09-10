Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0C1C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZwW/rR/xM4e5v5wkgpc+UtwaIZwu9R/MtLJFPZXph8=; b=omGxwkiI7kVZm7CIDRh5z1o98B
	HMRJdlIiRQMzseu39J24sS64l2QwtBhkKRtzr20/VvQSVNEFGR/lHp+FMPXHkd5Fa2on6hzmTHCPe
	S3bGWdw8O6VBUTlTRcwVXj5r0/iDoHIOBXQlhoAO3W1WieRgxB6bznnfox562+2UkQzAbkQasJzl2
	r5zk2V6E0d/O1W0QmJOoIR1No+Mp+9tKk8qZBlZAAoMEVOthZPnp6gUho4Ku/+zucIxeIc7YOK4qN
	mOFJLCb294t4b0psq+7DJlAzH28KNSBRYzeGYxX4sg7jGuFd5IKX+7zYguAOi47Cc9sksxrWbsda+
	Pa+QuR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewM-0000000EUSW-15L5;
	Thu, 10 Sep 2026 13:35:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewG-0000000EULZ-2vat
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:35:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DA1622C7;
	Thu, 10 Sep 2026 06:35:36 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9220C3F528;
	Thu, 10 Sep 2026 06:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047340; bh=hSa/tH8M8jk5gYes5gwVXQnH3e8X4j6HtduRWqIb3Ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ufl9Fesw8ci7X2Kc4PTAqdtuKbfDNk+st4bNXYBhxmDMYOlz9TjgyfWh6sRuv1v9o
	 4juU4bwHRWNchv+K9SsLkDg/Cjrt2THjC5Kz22Fx7iL3pImZJnbqHUC5HqcWb9bEJQ
	 ZVD7Sy5FAi2WzcsvanRC8rC1EoFFOsxLHqa/1QnM=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A733
Date: Thu, 10 Sep 2026 15:35:16 +0200
Message-ID: <20260910133519.459011-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063540_793495_DF972E0A 
X-CRM114-Status: GOOD (  12.16  )
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

The A733 contains a pin controller similar to previous SoCs, although
with a change in the MMIO register frame layout.
This SoC uses the new style of DT binding, where the pinmux values for
each pin group are stored in the new "allwinner,pinmux" property in the
DT node.

Add the new compatible to the existing A523 binding, since they share a
lot of features, including the number of banks and clocks.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index f87b8274cc372..d7d0ba32ced4d 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Allwinner A523 Pin Controller
+title: Allwinner A523 & A733 Pin Controller
 
 maintainers:
   - Andre Przywara <andre.przywara@arm.com>
@@ -28,6 +28,8 @@ properties:
     enum:
       - allwinner,sun55i-a523-pinctrl
       - allwinner,sun55i-a523-r-pinctrl
+      - allwinner,sun60i-a733-pinctrl
+      - allwinner,sun60i-a733-r-pinctrl
 
   reg:
     maxItems: 1
@@ -126,6 +128,7 @@ allOf:
         compatible:
           enum:
             - allwinner,sun55i-a523-pinctrl
+            - allwinner,sun60i-a733-pinctrl
 
     then:
       properties:
@@ -138,6 +141,7 @@ allOf:
         compatible:
           enum:
             - allwinner,sun55i-a523-r-pinctrl
+            - allwinner,sun60i-a733-r-pinctrl
 
     then:
       properties:
-- 
2.47.3


