Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB9DCA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiGr11fAHi/7AnQbTXosmTOB0Z2Y6vkn85Jogv4VtXM=; b=KGY0WWR0m7uNBE6U2dQsRqvIvp
	6OBCfvYnvEYDTTG31Pw1lKF/WDJgG1GrEMEUJwRvoYlQ6S1T/fCLFOLcWTQ1MnRBsrB8wvcZvjpUp
	nOisZUi8NDjK42iZyXolAPhQbILNJ+cwMvyoeNZxQug9WvCQeHMk2j6Cc45mOXG1XSbhqxnDagcuy
	u/E9I4BZuXpMvZ8NqDyac2LmE/ALhbquLj+sbqIxXKBbgbYWPOt9FiQdYu6vdzqI0eMf5kt6qgwwA
	zPno9IYRQmw6Zbul3+UeKpTLbGjMVoyihcoSzaiuGDGfAz3sKaljAskhcvzOgWfxlPMuG3n6AD50H
	nN4M3QNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGb5-00000009Bxe-03Kk;
	Thu, 01 Oct 2026 13:13:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGb3-00000009BtO-06bz;
	Thu, 01 Oct 2026 13:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KiGr11fAHi/7AnQbTXosmTOB0Z2Y6vkn85Jogv4VtXM=; b=finNThG15EwJTDQSNPq0cXzU2U
	IoKRaptwrYs9csgasvjQG3azPiYlXBxfuG9g8jSEUL4FrXVgfuHPWuHDgV8rBFtyL1O2ujBuYR5cf
	tS7nMYHpnDlR6ql6yfP/iG93PknHYXQIrx9wgLXQGk4ePB70mJzOY1Hix+AsgM/QYZaHZcwimtASV
	V32azhUQMd21g0LqneLlOeFZqZcsokkjKcUanWlTD0JCL7XyKzWVHIcrQb4gu8LXzWZ4B9zWsqVcq
	9NL3Jttk3rJsnau9WgRXaYj6dSbcq4cyuBY7SGkRbV1FvUbO9UUPekWquKLRfGO8yEG5tgpwsMqKN
	D9B0JDMw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCGaz-000000050P5-0l6x;
	Thu, 01 Oct 2026 13:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790860382;
	bh=P+YbvSg/zHk4rh/5DoiW/obrjfRyH/ubuevAC6b+9+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DctwH0EfioodF34jYitpL9ufl7e5DZ2C2mJpdEQjl7BOh/N2UWyQ13DZwDI3w9i/7
	 prcFJhh/k3BEP13ssTomPgqxGOBISf0Sn56puT/PAKzqkwoaVY+7fFjLovtMQ6nsLx
	 Pgl48BNsgvKLgxj2vCSivM47HgcAfwUQHiuTWOPTM8vHEZDWp4ndh5uufo9R9Chspe
	 Av3gTKB6aqdiH+LOsWfE0uEqfxT+UD22tttIxajhG0yyNbBZoQdS7tf9h8dCSfadC7
	 5WFZfXzntGSTAv8mNQIMBFrkO2Jz6UlC89hIyL70qaMwOtbwrKX/hbsKQlf4ULfs6m
	 4eHZ7bOp5sBtQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7439517E056B;
	Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 254C448002F; Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 01 Oct 2026 15:12:40 +0200
Subject: [PATCH v2 2/4] phy: rockchip: inno-usb2: drop duplicated update of
 rport->suspended
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-2-e01bf509359e@collabora.com>
References: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
In-Reply-To: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=P+YbvSg/zHk4rh/5DoiW/obrjfRyH/ubuevAC6b+9+A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq+XF5jSibh9SSHs85/tEuXM4mrYvkxhWQXz
 qesUuGwvsDt74kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvlxeAAoJENju1/PI
 O/qai3MP/17FpQ3tAeT30uQjQU1TyBlJjwIh3agesZ+kJVlzvuHtBAVKIVmmhRcLY5A/fvVBWH6
 INP/1vM0PT8p78YkLgUgKuJV7xSpN8bbhKBqSG9cK7e4xSDTqD07GdRb+xT/1dJW2JIriU+evd5
 T8jX3yThyYHljJSFv8JfbA+303N5MUdkcDpqVYfZrd0gH8sFN6v1jJ/VYJVzDmZtihDvWXEgUrf
 W5Ybt216WkDRA+QVnM7qfTkvHw5L+bw2LJayYa5yJpAGU7TW3SPjoG7C1dNaRwpAmhISVgti8tr
 1Zf3AwKJkXkTeurNgX4tmp3srKVkBEo8cw/IEc/rMc7TPCr1+u/nDE0JY/cphBpeeAaqKBaDAZA
 rMP7lilDQxj3oFXsRRuSzXphvB/xPj5xjjthJcvG1uj1pS92DDURYcN+bgqQ1MEKcFqKK6I3z/T
 YuJRy/xSUD57iEIx7Walr8YuU543iG6TMhhAOtmmvA4YRzXxO3/+Xx/zZTurVFsEMoqT6AaAwi7
 77ZBPJECgghnmK4PuSrJ0smUKhKqWQENfJyS6xUtvcDIgC4Ev0oRPgTYXxfTis74KbymWhangnJ
 jJ56kZ0G0WNfrCL9Hlr58ZYjLq1ZdjOmZRIqCBBB0qB3XY6QNeEe0UZgm9qo8VEzsRsiCwNJNdp
 60qr0WRWBFG41ED5RQWYmMw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_141309_324684_268D44E5 
X-CRM114-Status: GOOD (  11.75  )
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

rockchip_usb2phy_power_on and rockchip_usb2phy_power_off already update
rport->suspended in their success path. In case of error it's not
sensible to update rport->suspended. So drop the duplicated update.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 0ab054ee84cb..e4d8abf935c1 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -994,7 +994,6 @@ static void rockchip_usb2phy_sm_work(struct work_struct *work)
 		if (rport->suspended) {
 			dev_dbg(&rport->phy->dev, "Connected\n");
 			rockchip_usb2phy_power_on(rport->phy);
-			rport->suspended = false;
 		} else {
 			/* D+ line pull-up, D- line pull-down */
 			dev_dbg(&rport->phy->dev, "FS/LS online\n");
@@ -1004,7 +1003,6 @@ static void rockchip_usb2phy_sm_work(struct work_struct *work)
 		if (!rport->suspended) {
 			dev_dbg(&rport->phy->dev, "Disconnected\n");
 			rockchip_usb2phy_power_off(rport->phy);
-			rport->suspended = true;
 		}
 
 		/*

-- 
2.53.0


