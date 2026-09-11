Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCB4C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=87iJ8eoqZ3OPjJLYPFsUWmmff1ZXOWQWTIDzAIwLa2g=; b=tcEqMSnwhMQFDO3LCY3UnNtY1s
	wkAxIRmjkvx5leJjVeyVPJBEwaH4S46wDcFVznjnrHwjfVZWAXVFC1yTV//T1AmIfahq2OD5G03nx
	psq9bL0StRC+upx5S65DqvKgcqmhn74MLSROVj/FPePmvJSjq204E7svI9fLqBEoG9RV0DmZd/6rV
	eUR3DUcrvEZ2fcOA3fXpHxPjFRrik5f6KyJO2bYyFO7UzB+LkMtgqCUWX4h5o3GlOCMeXcvFxfSD9
	KdBfCTFLCLYpcaGTBIRNKF/MOcDY3qzSvQyQhDvyqO1x0aKj6hGDH2+bWAnZykchAm7EvPl/63mB2
	Srnfby2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YW-0000000GmR1-47r1;
	Fri, 11 Sep 2026 13:44:40 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YN-0000000GmLU-25nq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:44:34 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 645B31FFA6;
	Fri, 11 Sep 2026 15:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789134268;
	bh=87iJ8eoqZ3OPjJLYPFsUWmmff1ZXOWQWTIDzAIwLa2g=; h=From:To:Subject;
	b=RSTz/0gA+qVD2TkRN/w0AOOqP5mSRoWI1xWj8h4KhN4ELdP1BREkv1ckj771WzcWu
	 jWnZ5ZBbqUDiul0YwaRF7jg9kg56X/o9b84uE9aX0AVL5+JfwjoqcOt4IlAurZDRWD
	 coxkNt38kC5mcvDiuG3jEXL/8ngzEAuBUE+xA1gXlO53cFTC3s0H93FxAy+7EUBf8C
	 BgTUILscT1U0Vr5l97H2yN2Up1QZY81jPSsz8v/6h0vkFuIS1q06CNEAKxlUXH2nZm
	 PH+CMxSB+qtmGYhcNc8mqd+66npeUKc9ee5181+g3WhhAr1bOyx6rGGlLI3yfgm9St
	 B09Yy8umRY+3w==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx7-colibri-iris-v2: drop no-op delete-property
Date: Fri, 11 Sep 2026 15:44:09 +0200
Message-ID: <20260911134410.178847-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_064433_159765_0D7E6FFD 
X-CRM114-Status: UNSURE (   7.98  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

usdhc1 never has a "keep-power-in-suspend" property set anywhere in
its inheritance chain, so this /delete-property/ is a no-op left over
since it was introduced.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Assisted-by: LLM
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi
index 1111111..2222222 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi
@@ -106,7 +106,6 @@
 /* Colibri MMC/SD, UHS-I capable uSD slot */
 &usdhc1 {
 	cap-power-off-card;
-	/delete-property/ keep-power-in-suspend;
 	/delete-property/ no-1-8-v;
 	vmmc-supply = <&reg_3v3_vmmc>;
 	status = "okay";
--
2.45.0


