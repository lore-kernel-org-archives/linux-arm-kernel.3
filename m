Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE16AC55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9RYvfhWxSn3k+lzwEVUe/TONrStK6sEJ9H+2bktoXC8=; b=r6f3mIZP5vdOiYRoTCOfeJ1BbD
	U1gaA7Nl243fZQ2PCU8BzDrcMIFAhMqsaj1pPrWjmbS6zH2/gQLF8e79NiJ3pfvaxdiorydMqtR+X
	N7BX0UTvYptUmktpniOF9t6+ttUm6HhPJ/XsKWJy3Dn2fOJAP9zaQdUDryZafZSABREj/ezkw/iJu
	VDkpUIxftKJGU5souKBB0iNUBBY8j2mIqKesjMmYGhKU8pvwekaqhtT17eteMNBRf+r00u3TJe+co
	fr+85750qjxaIATTHtPdXobA8MDL5AEOEZoQNiynPEYQcXSfsgjr2Pu+V99hcvkRjTU3g3IJ9v+VY
	gdTYFmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHvR-00000002J7b-26h3;
	Tue, 04 Aug 2026 16:23:33 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHvP-00000002J5U-0Fs7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 16:23:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B4E41195E2;
	Tue, 04 Aug 2026 18:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785860596; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=9RYvfhWxSn3k+lzwEVUe/TONrStK6sEJ9H+2bktoXC8=;
	b=HAZQkmOtJeVB312pLAOHxZb9JkXs59Sa68fuYtN3473fAX//swqU1yaJt3tOUvPsB6BPtx
	oLLmi2U8KVCbP9A6FFSmJ4NWtk9ZaK/zWsWot79vx1aulEmaurP/oB5DUpiH7j9yul9csg
	1+ToXNuz0yx6Q8BaT4db4xuHhQV3+23p2bJ1tM8P/4B51V5c5Z1X+Yh4gNcwVg9UgsvJhZ
	bmjYxt9QN4asymERCcL/WBmVfswTPbW0MdibUFU/L7YW4pL4dAMfkz5Ql7nmdpWJHM+fnT
	KwJ2OALb7ADqz/KXCNrzaXEcC8RMhEVWWftnJ0PvbFKwlPhb04ScrsMs3WgI/w==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Date: Tue,  4 Aug 2026 18:22:45 +0200
Message-ID: <20260804162310.24374-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_092331_305813_1BCA8534 
X-CRM114-Status: GOOD (  10.25  )
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

Add DT label to SPBA5 bus for usage in board DTs.
No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V6: New patch factored out of previous
    arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
V7: No change
V8: No change
V9: No change
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9cf9f6f08654d..bec64cbb36347 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1437,7 +1437,7 @@ aips5: bus@30df0000 {
 			#access-controller-cells = <3>;
 			ranges = <0x30c00000 0x30c00000 0x400000>;
 
-			spba-bus@30c00000 {
+			spba5: spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				reg = <0x30c00000 0x100000>;
 				#address-cells = <1>;
-- 
2.53.0


