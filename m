Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92324606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CalqM8fq;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s7X35nOR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p45uZWS6r+fa4kUICgrgUA0w8yqag3p0NNOZUwZi7wM=; b=CalqM8fqtZ/9AkUpqB+9135pqG
	w84K0tggOO+7s2mlyG30BC/GxwHPRzGCUEIRPs5q4gez72heNEl6mWVXlMvK+KJEtRwhaRU5jzL0h
	L/sYRfZiNwYiWCNgBUDr8suqunXg01aA51XCzZYvNfncIp+nmDwuZBz227f4KwmPOtH7mNFl6yOPr
	p0craH6t84IHoBfjHIQR3ZjgtKbceftVCNrDEmst6wAbQ95c0rJ1S6Mw0TaMr4/058dBQgBjnS0k4
	Uaj3SbYuEDAVARBybASAXD612RVUb3SJOfE1YNTrQCbNck3bk/OTiAUDzbIBKVWbD0+FvFFeaPwP5
	8GKx1hHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW5m-0000000BsMy-1Job;
	Wed, 21 Oct 2026 13:10:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW5c-0000000BsEo-2UeE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:10:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5678A4E41296;
	Wed, 21 Oct 2026 13:10:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C21D606E3;
	Wed, 21 Oct 2026 13:10:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A2FA10328E6F;
	Wed, 21 Oct 2026 15:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588240; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p45uZWS6r+fa4kUICgrgUA0w8yqag3p0NNOZUwZi7wM=;
	b=s7X35nORMe3Plo0FxJ0tkB4CXl/lwHTWKBepyvGE63ClvLCIp67QxZoey2tZr4lk1I1Wmo
	o009ruqSpHMbMQh0IsTCVUoppBnioyuNRhrxlJAY1nyqtrS3didIKN1Yrq9K4H1d23q/Mq
	EiNkXupk7zHjab9dPnamiwd5VGzLux+Q/RLvYrCeW4dMEphJmr5LvI0HVy0IUIywws+Cu8
	dfys6SBPs/GrGOb3BsojDn+Ef7g5ldmvWstngxdqAK2KlfSw1cI2RUKjlnpPJSr5NsE7qx
	dT/rHjpA7g5EFuqdSOvQ+Bimd75AqgTMZJZ78hLj//hCkjaQegi/nAvuVkMxKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 21 Oct 2026 15:10:01 +0200
Subject: [PATCH 5/5] arm64: dts: imx8mp: Drop VIDEO_PLL1 assigned rate
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-ge-clk-lcm-v1-5-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_061044_779331_0427E557 
X-CRM114-Status: GOOD (  10.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This rate has never been assigned for good reasons. It was assigning a
frequency only adapted to the panel of some evaluation board, while
allowing a rate division by 7 and 14 for the needs of the LDB.

Linux now has an LCM-based divisor calculation that allows us from
dropping that inappropriate assignment.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

I believe most of the users of this DTS set their own frequency in their
downstream DTS, just because the existing assignment won't fit their
panels, so while in theory this change could break bootloaders/other OS
pulling this file, in practice it is unlikely it will. I don't know if
we really want to do that cleanup or not since at most it is an
incorrect and useless assignment, but at least one should know that it
can (should?) be removed.
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9cf9f6f08654..7691d917646e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1988,16 +1988,14 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
 						  <&clk IMX8MP_CLK_MEDIA_APB>,
 						  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
 						  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
-						  <&clk IMX8MP_CLK_MEDIA_ISP>,
-						  <&clk IMX8MP_VIDEO_PLL1>;
+						  <&clk IMX8MP_CLK_MEDIA_ISP>;
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
 							 <&clk IMX8MP_SYS_PLL1_800M>,
 							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
 							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
 							 <&clk IMX8MP_SYS_PLL2_500M>;
 				assigned-clock-rates = <500000000>, <200000000>,
-						       <0>, <0>, <500000000>,
-						       <1039500000>;
+						       <0>, <0>, <500000000>;
 				#power-domain-cells = <1>;
 
 				lvds_bridge: bridge@5c {

-- 
2.56.0


