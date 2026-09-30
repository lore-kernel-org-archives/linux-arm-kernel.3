Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BDFCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvmjk8+3isiEx/PbL0NMnF+Vy0Eg5tTMHHc6McK7PbA=; b=uaHjAFjgORUS8WrXJZ0jj+8YmA
	mzak99t/2m6L0ys5uId1O1TC/Egwn10+slaTtDOru5th1E5NkAq+QI69xIKB0nhTOIV4ESZKQsdBP
	H15vZAboVuiTUvDeSmq5UTqBvR1LfLmWQ9qS/Y3ry3C1h8H5Wux5MRVEPIMV2vSlUr0d9hunF8Tml
	viQFAfQSa6Nt9FG9U1pgKbWGXWsBB6gy0gSwKmj4NzOGrAgC1qVAut+dvg73Z9aTM1kNP6C/bipJE
	VwCyR2abbHXG2E2yJG+ik1jqAnqlPCOnX+0fVJ9SJQSKjmhhoSaZhtqf+O03o/l6hpNZ7UkpphD7k
	GJ9IXdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBx8A-00000006hAR-4BWN;
	Wed, 30 Sep 2026 16:26:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBx80-00000006h76-0SqA;
	Wed, 30 Sep 2026 16:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=bvmjk8+3isiEx/PbL0NMnF+Vy0Eg5tTMHHc6McK7PbA=; b=wO/2gDNkwf4hBc6ZMg5S6Ut+Ze
	KmuIjHS6O/UNcjmbgbMNyp9u2XTVf9xEHW9WHErOwYGbIvPb6Fwv+87ChskiZ7Ms+ZBrllDTvCG11
	nJR5s0q5fiaeJTBIx04wLpI5TDc6/Bdn2tFNMkFXmxyHcIF1AWO1edSpGSs7kpmUAYOps+3AcaM+u
	3xjCaBkNjpH2nLBoukmmDPrCxR4P7LcyyWsnUF8fI75FYse2AHsfAkhNUZRgLviEBOxcc8cLfwLZx
	1MWPc9zV/ShKQ+2FISKdVpaUSZsxgC8CmH/eaHFKVX9bToGAsXUR5gf0y8zydBnksOxrb9cjqh4hD
	bdVn1IAA==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma Systems
Date: Wed, 30 Sep 2026 18:25:43 +0200
Message-ID: <20260930162545.2357505-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930162545.2357505-1-heiko@sntech.de>
References: <20260930162545.2357505-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_092556_198513_375CDED3 
X-CRM114-Status: GOOD (  11.16  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The DisplayPort carrier is a very simple baseboard only providing serial,
ethernet and a displayport output.

But its main functionality is that it routes the Analogix eDP controller
to this DisplayPort output, which allows to test that controller simply
by hooking it up to a suitable monitor.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..3b270690afca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1336,9 +1336,11 @@ properties:
           - const: tsd,rk3588-jaguar
           - const: rockchip,rk3588
 
-      - description: Theobroma Systems RK3588-Q7 with Haikou baseboard
+      - description: Theobroma Systems RK3588-Q7 with baseboards
         items:
-          - const: tsd,rk3588-tiger-haikou
+          - enum:
+              - tsd,rk3588-tiger-displayport-carrier
+              - tsd,rk3588-tiger-haikou
           - const: tsd,rk3588-tiger
           - const: rockchip,rk3588
 
-- 
2.47.3


