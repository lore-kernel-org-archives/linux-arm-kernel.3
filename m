Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EEBC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MLb9zDlg/d9s4myJ0Qsd41nhgKKz3nxmkZB9+vRO0RY=; b=GT3whJxxVUfwSJ
	OcOZcOh3wOksSThdYddlCrGuzEzDNkkrp/Eyt1bmQ1AjtllsG+9/hyVq2YAbiJp/iJbuTrmfKreor
	Amcxc+5j0qh48hVGW0Q8sg5tIYeIFCSPQv7eg5vjrWUJH9jlGHkGYnXOg97q52L0nYozIzWAGH84T
	9yG8SB/CeK6s8lWTTUuROv3cKgl3WzN7QAsIBrjakEMln1Tt1/M2VpkPLo4luQOYgTYgiqvQeVeGk
	X8AoxQAp4S3SEebchAXumbMBJxB7DpmX14VmKKHVdxN45YniYJ3+E8M2FwwxDQ8FO9yiMR1lNT8Ai
	S4jP9/7Q9aOAw1k4PRGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCity-0000000GOa6-1nfX;
	Wed, 07 May 2025 17:49:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiZ6-0000000GLCU-44ki
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:28:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-0001Ex-DO; Wed, 07 May 2025 19:28:09 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-001axS-1u;
	Wed, 07 May 2025 19:28:08 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-000ING-3D;
	Wed, 07 May 2025 19:28:08 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/2] gpio: TODO: add item about GPIO drivers reading struct
 gpio_chip::base
Date: Wed, 07 May 2025 19:28:00 +0200
Message-Id: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACCYG2gC/x3MQQqAIBBA0avErBuwIrKuEi10nHIIVBQiiO6et
 HyL/x8onIULLM0DmS8pEkNF1zZA3oSDUVw19Kof1agmPJJEJC8JrSmMmY2zhk6kyWm22g7kZqh
 1yrzL/Z/X7X0/GKFvzmkAAAA=
X-Change-ID: 20250507-gpio-chip-base-readback-c7d8eb8b3cd9
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_102817_021494_7389EDF5 
X-CRM114-Status: UNSURE (   8.18  )
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

Bartosz requested that I add this to the TODO, so here goes.
While at it, I also added a FIXME into the driver.

I'll be away most of the month, so feel free to squash changes as
appropriate.

---
Ahmad Fatoum (2):
      gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base
      pinctrl: at91: add FIXME about read back of struct gpio_chip::base

 drivers/gpio/TODO              | 7 +++++++
 drivers/pinctrl/pinctrl-at91.c | 5 +++++
 2 files changed, 12 insertions(+)
---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250507-gpio-chip-base-readback-c7d8eb8b3cd9

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


