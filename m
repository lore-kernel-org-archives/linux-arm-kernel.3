Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B379EC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhu5Zn1Wg23eK1HSpIGKVt2RuBpOldavj9X8GIQnTbI=; b=BP0+oovjp3mTnLWhrQRXjRN5cz
	YmQlTdg1FF87IzlFnVtb75I/TEZ2w3ejWHdviGtj+iPMIXnncs5+PF7dQAaLeQ4sr0bZEWlpq19Qb
	JEhtLhUwgkMm/dUvYiGLCWa5oGN6uLOLRLgRYIrmnZv+XsVMUFIXEkF9LMq0RUz9r031yfPjWqhYB
	MJAQjonjXeBrxQCjOtagrcvK4WVT85jJp0KRt4j/MMsvZW0oxOZVFW1euvVsNLqQlusnwrZuczL2w
	uz7A2RhAdMomB2VnxrPGV1AQdPaAmN9PjX5l07b0Q9m/KqjuzVH+rmNIV93i+EVH93oOGB6/xPpAb
	5s0c/QJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhPs-00000006YFM-0fHz;
	Tue, 01 Jul 2025 20:17:20 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhMR-00000006XVj-3hfz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 20:13:49 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4BE191F00036
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 20:13:46 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id BF168AC968A; Tue,  1 Jul 2025 20:13:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 3D736AC9681;
	Tue,  1 Jul 2025 20:11:32 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
Date: Tue,  1 Jul 2025 22:11:20 +0200
Message-ID: <20250701201124.812882-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201124.812882-1-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_131348_077750_5F3ECFAA 
X-CRM114-Status: GOOD (  14.02  )
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

The original comment doesn't match the pin attribution, probably due
to a hasty copy/paste.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
index 696d7dd8d87b..2e3bd36a4410 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
@@ -45,7 +45,7 @@ static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "uart2"),		/* D1 */
+		  SUNXI_FUNCTION(0x2, "uart2"),		/* CTS */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),	/* PB_EINT3 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 4),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
-- 
2.49.0


