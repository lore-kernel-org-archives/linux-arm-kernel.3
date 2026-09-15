Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E02DC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FoG1DUT/vpsn9oqiqrGQqvrS+j2edBODyPxEbXKHOhk=; b=I7H7Zh62JSakD8ZE4sbRBHT/HU
	m0f2PmCUQPoS3mPwSOV8dTddb+goNZSxyHuIQ4sc0nxJjyddEigANFRBHMh/OXwjRIJqnV2kivVYU
	bTCDtQYfQ33mah6uBMAVjjyuUWeJhVkx5MgPQZ+cIzuhMwQp9WFy8NIDguUXekUf1c6wQebt2v43T
	ve2KbqoN7w8laT4swmxddXAOTFehFSKpcmCvADlLYEu81pGkEJ42kdbTF5S2R+NBUQXY0mAPsEPOq
	IA/qpsVntmD6Rts/XDKTR1XmZbm3wPAcojY5eGIR1XtSmpm/1JKow6Y8x8l9m62M4kFoRfchD+Vyf
	ZG1gBHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Zbx-00000007ugz-0Tlc;
	Tue, 15 Sep 2026 20:18:37 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Zbu-00000007ugb-1ppC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 20:18:35 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id DEE2520474;
	Tue, 15 Sep 2026 22:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789503512;
	bh=FoG1DUT/vpsn9oqiqrGQqvrS+j2edBODyPxEbXKHOhk=; h=From:To:Subject;
	b=VVrKsw35Tg7HaoR68IDepSPGGq4hs2zjN9MUzNMyQAne/DAM5z302kkV50ilgDn1d
	 Kp1Hi2u12Tu2uPpJ/P2m0AR3eQgCfpSxGNI63OCeqApg+v+/GNNUfbjQy18KqjxnTU
	 eFcmTuL63jG4pPTUagKm3hltwmPpoQHBGGlBs9vWR2kxz9lJaYKBK+4t8DISlxLCXG
	 yrz6Xzkgs1bN4zbby0/ttwGZer/xZKYYqLvtqMUNuTEa5n4x7Hskt7RNjncHpGw417
	 4P85ohtN0jYRhYIsb0UcoqVD9LN42RtzP3Bophpd3R5jC1IG5CcVVPiuKlY9PnuMUQ
	 9oWTHMyzCdDJg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-aquila: fix gpio-line-names padding
Date: Tue, 15 Sep 2026 22:18:24 +0200
Message-ID: <20260915201825.24363-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_131834_641058_A2E71E02 
X-CRM114-Status: GOOD (  10.03  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

som_gpio_expander_1's gpio-line-names use "AQUILA_C1".."AQUILA_C4"
instead of the zero-padded "AQUILA_C01".."AQUILA_C04" used by every
other Cxx entry in this file and by k3-am69-aquila.dtsi, a different
board implementing the same Aquila Family Specification. The
zero-padded form is the official pin naming per the Aquila Family
Specification and the Aquila iMX95 module datasheet.

GPIO line names are meant to be stable across the whole Aquila
family, so userspace GPIO tooling that looks up a line by name works
the same on any Aquila SoM.

Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
Cc: stable@vger.kernel.org
Link: https://docs.toradex.com/116801-aquila_family_specification.pdf
Link: https://docs.toradex.com/117671-aquila_imx95_datasheet.pdf
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index f930965cb341..c5f4cf0541f2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -413,10 +413,10 @@ som_gpio_expander_1: gpio@21 {
 		#gpio-cells = <2>;
 		gpio-controller;
 		gpio-line-names =
-			"AQUILA_C1", /* 0 */
-			"AQUILA_C2",
-			"AQUILA_C3",
-			"AQUILA_C4",
+			"AQUILA_C01", /* 0 */
+			"AQUILA_C02",
+			"AQUILA_C03",
+			"AQUILA_C04",
 			"AQUILA_C36",
 			"AQUILA_B74",
 			"AQUILA_B75",
-- 
2.47.3


