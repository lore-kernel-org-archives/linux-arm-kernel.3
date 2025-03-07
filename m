Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6993EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGSHFYQM0KbKQ0OHLPezUzKnVCoPtIByJfKB/rAWZgk=; b=DacM7V2EpAYW505iYze83Jkm0k
	cD5A2mSOSH+H3leiRXzbvYrDB72Rd+Xm0Nbp7J0/+8ASTCux+C85ds8qxE44CMLEHsPc7rCDiVni+
	vjnk9Z69P3JXDHycUQTURuECW0NF+hGfpEJfK8OttPvcVxP+n7I7VMwHJTILCo5Wj0Qu1kSuUy0Qk
	cEZAqA+4mV13rpY9z8sTYwSQ1V0iRls8dDSblHK52LjFKeyT4ySQ9kaHvMLOPUp/kDcnvX/PmQpHt
	76cskX1e50KPWgwIuL1YBPJ3lWMS+jBjDaglbFy9teadOynbI4Cr7MwgBxP21LfI2icYgHWaTWkjk
	OptoZINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM8d-0000000Cjw5-1rCN;
	Fri, 07 Mar 2025 01:04:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM1l-0000000ChrU-0uRI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:57:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51E761BC0;
	Thu,  6 Mar 2025 16:57:37 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3EB83F5A1;
	Thu,  6 Mar 2025 16:57:22 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 01/15] dt-bindings: mmc: sunxi: Simplify compatible string listing
Date: Fri,  7 Mar 2025 00:56:58 +0000
Message-ID: <20250307005712.16828-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_165725_384443_BFDFCC5C 
X-CRM114-Status: UNSURE (   7.43  )
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

New Allwinner SoCs only occasionally update their MMC IP, leading to many
pairs of compatible strings, though there are sometimes a number of them
being compatible with one particular SoC.

Collate the compatible string listing in the binding, to group those
being compatible together. This makes the list more readable, and allows
for easier addition of new SoC's MMC devices.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 36 ++++++++-----------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 0ccd632d56200..8e4c77b7e4ab9 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -30,38 +30,30 @@ properties:
       - const: allwinner,sun50i-a100-emmc
       - const: allwinner,sun50i-a100-mmc
       - items:
-          - const: allwinner,sun8i-a83t-mmc
+          - enum:
+              - allwinner,sun8i-a83t-mmc
+              - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
-          - const: allwinner,sun8i-r40-emmc
+          - enum:
+              - allwinner,sun8i-r40-emmc
+              - allwinner,sun50i-h5-emmc
+              - allwinner,sun50i-h6-emmc
           - const: allwinner,sun50i-a64-emmc
       - items:
-          - const: allwinner,sun8i-r40-mmc
+          - enum:
+              - allwinner,sun8i-r40-mmc
+              - allwinner,sun50i-h5-mmc
+              - allwinner,sun50i-h6-mmc
           - const: allwinner,sun50i-a64-mmc
       - items:
-          - const: allwinner,sun50i-h5-emmc
-          - const: allwinner,sun50i-a64-emmc
-      - items:
-          - const: allwinner,sun50i-h5-mmc
-          - const: allwinner,sun50i-a64-mmc
-      - items:
-          - const: allwinner,sun50i-h6-emmc
-          - const: allwinner,sun50i-a64-emmc
-      - items:
-          - const: allwinner,sun50i-h6-mmc
-          - const: allwinner,sun50i-a64-mmc
-      - items:
-          - const: allwinner,sun20i-d1-emmc
-          - const: allwinner,sun50i-a100-emmc
-      - items:
-          - const: allwinner,sun50i-h616-emmc
+          - enum:
+              - allwinner,sun20i-d1-emmc
+              - allwinner,sun50i-h616-emmc
           - const: allwinner,sun50i-a100-emmc
       - items:
           - const: allwinner,sun50i-h616-mmc
           - const: allwinner,sun50i-a100-mmc
-      - items:
-          - const: allwinner,suniv-f1c100s-mmc
-          - const: allwinner,sun7i-a20-mmc
 
   reg:
     maxItems: 1
-- 
2.46.3


