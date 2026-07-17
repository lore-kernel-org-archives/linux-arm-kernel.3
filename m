Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548DCC44524
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhJPiBOn7qoBvAbf8Au6wuw+Yg8j8KZ2eCw0H8HfrZc=; b=ooxd5eGi6AGxSc5XSaRE6lm0yx
	wy6QQeH30bZlJAVAuJxm3tzwmHKQUkvQZCfRhyKo4KsCglwUpBetCn1l20Bpctah3iFsO1x7ewuNh
	A52ptS4OdiWP48MAPt5LS+cTO22jkVNGaViJcAIAU0SKDaLbFj1ztvfP089k8fQFIqJd22P83RVg7
	i4OSDW1TIYwlT7PrToGNnMjTAUnXJIUoSW9Koa7cwfoJo4ol3D6rcb9POjgv99YFctCKmHsfEpf90
	Qddd+8JB7JJrd4SOtRSwyKDFFnMm+BZQ/DscQie7CbcoP8044tbC0Bc7SqJk3oVQdBBa9cpoCD8pO
	YPXqovfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhX8-00000002Gce-1F8j;
	Fri, 17 Jul 2026 12:19:14 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhX1-00000002GYh-2mih
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:19:09 +0000
Received: from francesco-nb.. (unknown [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 2CC44228C9;
	Fri, 17 Jul 2026 14:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784290740;
	bh=MhJPiBOn7qoBvAbf8Au6wuw+Yg8j8KZ2eCw0H8HfrZc=; h=From:To:Subject;
	b=APwKamzGhTxH89PZZJMs3OKR8EHU6NE/1uaK2jb0GSO5SInwHyKlvzrBiXuw0dsTl
	 xKC5yH3MjY1dvjqoF4sPT9duWOx3fNwRRiBh9OagOWEyhePyZJXE1yJ4lZ6wOE6WoM
	 8hCTavJ5O/Y9BUoDN5ott6LFfdVs2Yfj/bDrLU259HFAAlZC/KiSqsnDhNjoyhE4pX
	 1j9IQJSNmoW2K9uWf9VLuwnpBxz25pCm8yCta7SYo+Tg8tU25Nhjd7H0Epw8TeNqO4
	 cAUr2pyrIfGjgrBI4ZJyCNjPRFn2gHnMQDrvbwYqfF20MeEQvSsHXT7YYkTBZIgXuN
	 2kre9RHrlT+iw==
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
Subject: [PATCH v1 3/4] ARM: dts: imx6ull-colibri: Set LCDIF format
Date: Fri, 17 Jul 2026 14:18:45 +0200
Message-ID: <20260717121847.488148-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717121847.488148-1-francesco@dolcini.it>
References: <20260717121847.488148-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_051907_862714_20796CBA 
X-CRM114-Status: UNSURE (   6.69  )
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
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index ec3c1e7301f4..e126fade2304 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -225,6 +225,7 @@ &lcdif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcdif_dat
 		     &pinctrl_lcdif_ctrl>;
+	interface-pix-fmt = "rgb666";
 	status = "disabled";
 
 	port {
-- 
2.47.3


