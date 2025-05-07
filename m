Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104F0C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPv92qeDl4pk0EvtRAZ++xM5PSWUiHohLMDTH/RlBDs=; b=UEAHpgCAoUtY+oC0cpoaG4XyXQ
	ROr0uFMKBtJnT6hudurwHkhQ399csnCs5smVELXVyNaih2q8jwTaXz3Jo36NTNsj8i/nBluC6v7/C
	tldQkBxEvqTlGstY2oGywh2RUJ5sT/bEDJNsRlVRhCHEJGtWmuM6HHpDJXOfBLBEI+XgIF2EP3jgO
	Cg40ofR9PR5SV9XMHigX2V4S0Si4jXiaAnyJ7wKHL1EFTVKmuG5jxHITwTzxZXf2vIKetyWyP1Jz/
	9jsGy/B1J5qOvokqFSFSYlHO7NBnQ9RAbQCyBlRoLfl+rL8F5urrr8TOku3Ut89S9cY61zotG9XKh
	jwLoKltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCis2-0000000GOF3-2h9S;
	Wed, 07 May 2025 17:47:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiZ6-0000000GLCa-430s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:28:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-0001Ez-DN; Wed, 07 May 2025 19:28:09 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-001axU-1y;
	Wed, 07 May 2025 19:28:08 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-000ING-01;
	Wed, 07 May 2025 19:28:08 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 07 May 2025 19:28:02 +0200
Subject: [PATCH 2/2] pinctrl: at91: add FIXME about read back of struct
 gpio_chip::base
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-gpio-chip-base-readback-v1-2-ade56e38480b@pengutronix.de>
References: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
In-Reply-To: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_102817_017203_73E4B21F 
X-CRM114-Status: GOOD (  12.39  )
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

drivers/gpio/gpiolib.c has this:

  /*
   * TODO: it should not be necessary to reflect the
   * assigned base outside of the GPIO subsystem. Go over
   * drivers and see if anyone makes use of this, else
   * drop this and assign a poison instead.
   */
  gc->base = base;

This would break the driver, because it assumes gpio_chip::base to be
the same static base that was written into it.

Point that out in a comment, until it's fixed.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/pinctrl/pinctrl-at91.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 93ab277d9943cff3a0b771f3e997594cb144826c..b0e00f3793312de2288aa1b900793d9e2b6125d6 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -949,6 +949,11 @@ static int at91_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);
 
+	/*
+	 * The GPIO chip base is an internal detail that will
+	 * eventually go away alongside sysfs and the global numberspace.
+	 * FIXME: stop reading it back here
+	 */
 	mask = 1 << (offset - chip->base);
 
 	dev_dbg(npct->dev, "enable pin %u as PIO%c%d 0x%x\n",

-- 
2.39.5


