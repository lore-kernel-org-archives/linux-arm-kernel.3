Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29913C44526
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hI+gYh3/TRT6FFcKJZ0XasSEEdmxHbnk71spIov2KOs=; b=lVj7qmmrV9zjwHpypZxl6RK0s8
	qZ8kA4HQPuS3m/iGNEaBA65J8tmKieKfVHEa+cbO5eRSL++OfS4qW5cut3/c2uKN2y/uNRRxMjdjJ
	xaGOlAOaunNZhiWLDPJX7NoXTvkRmxJtsp8a5ZKhHUN0Td6XImD2ggr0kpm/p1QBIb7FUtI0zHr4i
	OlHFuP6vFPn7lXDzOCtCG6kMfF+HYKjq6WY3b41mHqeN3MEV3iU1k2uN0bPJI3rL9lfeQ1SPZiPVV
	mP6b4tFsR3yUh+xDMkqC0IRMP2L3Jjz0wSuC6ARzFAsR5RnmlC5h2Oz1O+4PebOVFpb8/a6CNaUyI
	tJLWWChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhX8-00000002GcM-0sFK;
	Fri, 17 Jul 2026 12:19:14 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhWz-00000002GYk-3WFd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:19:08 +0000
Received: from francesco-nb.. (unknown [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id F0DE4228CB;
	Fri, 17 Jul 2026 14:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784290741;
	bh=hI+gYh3/TRT6FFcKJZ0XasSEEdmxHbnk71spIov2KOs=; h=From:To:Subject;
	b=Cs0qV0ZyWBc8who59FcP+pRQEY7jRK39z+biHbA6BwPqkBxFHqLipsa/nxacukSmu
	 CiNbzozUCxp8zHowxMtWry8aa5Or6WoIm62YOfq0ha42cDaToUjtMsU7YuoEFXio7x
	 oRl4Rrk34wpY1/xUoxPCv35aIKgwqkpDMuT00WFzNheQHpdPdTb5A7qdkD6bDrNFsu
	 nQjAj/zQFt/CcWa4OgFG1U1Qx9qiZUfQCxeO61Ig+TSdd9LjA/jm1FLqmmUW+xB9sj
	 +rfoEqbYmmjBWcqra5b/s57mXBIxDChHgwzJhbFi4IY+cXGxJ70JHrgXaYsS3kRGyE
	 U9EQ2D7CmCHrw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/4] ARM: dts: imx7-colibri: Set LCDIF format
Date: Fri, 17 Jul 2026 14:18:46 +0200
Message-ID: <20260717121847.488148-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717121847.488148-1-francesco@dolcini.it>
References: <20260717121847.488148-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_051906_790208_A3F60BF3 
X-CRM114-Status: UNSURE (   6.58  )
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

The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
the interface-pix-fmt accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 8666dcd7fe97..f820a613109a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -533,6 +533,7 @@ &lcdif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcdif_dat
 		     &pinctrl_lcdif_ctrl>;
+	interface-pix-fmt = "rgb666";
 	status = "disabled";
 
 	port {
-- 
2.47.3


