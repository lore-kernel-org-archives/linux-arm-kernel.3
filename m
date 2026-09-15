Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBB6C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ea/+Rwdel3pGhyUAK51+c5UpUhpQCRdU/ax/b4MwGs=; b=Nu1oRTuQ28cb0PojyUdsU+Jb5j
	RGP06GdKdIzMIGyyzdUZ+PSc5Vf/9KRJz4QaNQZ364/q+76Jph9X1NU2i7gkZERZln6wAFtO/+nsY
	HcicYhcem2HCLCJrmsUrlCjC2xH453yQ1Y7uMQ7xaWa8pDR2NFa6KBMHK3sC7taE3TQ89Iv6Wu1jd
	C+/VrQ1w6P8bbYYy17O+VA35ZqUvtIauUzxUUQa0Qbvq9JPsiMnYNSR+E6TTyylVaqizHcs/7soZG
	qfxbl4eEvU/I9N1Rth3NWDXjcddLXW2SU0Qh1Pwhft53V5JpSPTjzkLsD/OPav59yrIbyx4T8Edro
	68uxkk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZXv-00000007uTF-2ptd;
	Tue, 15 Sep 2026 20:14:27 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZXs-00000007uSX-0gaI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 20:14:26 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 7F8A61FABC;
	Tue, 15 Sep 2026 22:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789503258;
	bh=4ea/+Rwdel3pGhyUAK51+c5UpUhpQCRdU/ax/b4MwGs=; h=From:To:Subject;
	b=uktHQnVEI/P1daTNoRZzdmF16fV80IfH4+MVxOVFqprwm/iYldJEYDpvyzIfxPqS0
	 rEuxiGoZ87vRoPUqOr+ZFMhYQGvpkuJ9MQBerhwBj+6Y02/sPuK53PhPvls10ns9AJ
	 A6M9Is/fEGxC6YgaiVkuJ8DGNcMC3X9Cg7AjvQCQbu/B9lwETECTo/9728v/tC6ZDk
	 PGYoAeRADJbWoRrHIL7qY6a7Zlb2edPtF0C1hbjkqH/RUPCKha9MxtHfg0XsMKksHo
	 7xS5rgndHrOA8iFstdHow+cV7Nf8vrG9R1eFoRVkUeWKsse2Ivk+IeMQOlLsgRLbph
	 8cmGMCL6ljfEQ==
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
Subject: [PATCH v1] arm64: dts: freescale: imx8mp-toradex-smarc: fix SMARC_SLEEP# gpio-line-names typo
Date: Tue, 15 Sep 2026 22:14:10 +0200
Message-ID: <20260915201411.23118-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_131425_126314_CDA8539F 
X-CRM114-Status: GOOD (  10.42  )
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

gpio3's gpio-line-names has "SLEEP#" instead of "SMARC_SLEEP#" for the
SMARC SLEEP# connector signal, while the gpio-keys node driven by the
very same GPIO line already labels it "SMARC_SLEEP#", and the imx95
Toradex SMARC variant names the equivalent line "SMARC_SLEEP#" too.

GPIO line names are meant to be stable across the whole Toradex SMARC
family, using the official SMARC-connector signal names from the
SMARC specification and the SoM datasheet's pin assignment table, so
userspace GPIO tooling that looks up a line by name works the same on
any Toradex SMARC board.

Fixes: 97dc91c04558 ("arm64: dts: freescale: add Toradex SMARC iMX8MP")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 0348da385f23..eb8b9db7e3cd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -323,7 +323,7 @@ &gpio3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lvds_dsi_sel>;
 	gpio-line-names = "ETH_0_INT#", /* 0 */
-			  "SLEEP#",
+			  "SMARC_SLEEP#",
 			  "",
 			  "",
 			  "",
-- 
2.47.3


