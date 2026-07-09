Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B83DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDwGHzKb0G48JC1+hRp3wH01XQW5D2hqtFQ6eD02BaA=; b=JPhSxDZmKPUYgBgmOavnuqo3CB
	U4kVWsEMKTIc0WFdjSba2IQMlXGGaF8u0+B0qNReGM3dd77V+iioShowEbb+ShzEW5K7RZdSOZZG8
	M/bPJsl8rr14sLDlyN3R1dQxEqrxkUbk75YYidUdWlK0qpYk2pqh5TVief0VODlSwJB+IhD0o7hk7
	J0rAb3W8+MvZ4vnlJJ6IWZzErrbWan70kEASl/4bAxAdJKVi/8XOzlbuiEGemWwQ5QzSgHnNl1hRG
	/HcJXHVV4aILnpJ7g0SKuZUb74ctC/aIjSiyFPSbn3RXTbugehx57Oy6qpoIU6NUhoRH84dt4UxNy
	/jQFx6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu2f-00000003OEn-0Thp;
	Thu, 09 Jul 2026 19:04:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu2Y-00000003OCn-1zuz;
	Thu, 09 Jul 2026 19:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IDwGHzKb0G48JC1+hRp3wH01XQW5D2hqtFQ6eD02BaA=; b=rBQV/DPH1S31h4SnzfN4v2tDwh
	ndy+mMp2ZbjmHIn/MSvPiZHyELvs/DwnHthgiteritQWGG6oCYgBVIQRrMicAiKKzjlq91wEMp0hQ
	B4KGVWhakHEb+b0K2J0wkzN2BV8PTUQpf0u07EL+DVS019q6STG563xk99P0w1Cm2ZCOXW8dfOYlK
	5UuNl4Af6QeE2e2/twwFRcvaCef5w31MFtfnEdpfuS2fGMlpiu6zAJ3O21Cd5KMoyrJObkCYwAPhe
	s7NLfUEky0LwMzCKPRA+qXTuV2CNDz5+4617yEIJOuh5nHyPMx+ehSBFKrSWRTUkVaSdOA+CB8/If
	Ydsllnbw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whu1B-00000009TN3-46bo;
	Thu, 09 Jul 2026 19:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=4X9eFjcBaJHCtFU4hA401y9jwD+dcI01OT23M3giXnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KxnJFhGOKeOyCNCu/i8D6ZEDuqIQeZgoxARnaGfVInx6BqhovC/tMg/I5igB8XEiu
	 IVJSaEPUk/JhyzfT9tbESKRZqHheFdQvjjRzbj7B4klF+TAtdsrcpP782w1PBGPf3G
	 kP3MfXaTWAWlsYhiBAU+cEMSwUz38EMADZe7YVlkktCtYaZixLK91fUVSlJhCkccnf
	 mVsKKXBG0xU9Ht5qU10jEgtlUA13PzpgWEFhOu8FifcvKCn156Aw2AtvGFVhWav6HS
	 mWmDB71U9EGtAjAKUNoaBf3DjUfKLovX4sN9dVWfv6dcG/TSeTokOVuVkjyDOYmCTi
	 B+WLJE+qK5hIA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF85A17E127A;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CCA1848006F; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:51 +0200
Subject: [PATCH v11 28/36] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-28-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4X9eFjcBaJHCtFU4hA401y9jwD+dcI01OT23M3giXnI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EWmJ7UgiPJxlFmypOxTVS7rcM6wogegx
 HInXB9THqAtWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaxRAP/iRidCIAUqeDbd0g8ayzjTupj4CKv2CwQ6cuJcrG1SfcO7IFg8KwQf3QxO1w2Wxzlu7
 vnwFZmhcb7s9ccPW5BIaRX3MODac/GW0YKWiHSdb5lzalsc0a+UPlq6KaaIg4jRAF8KD/Xpc8jO
 2GaORYEkJ1ohSWXRtdzjlhBkFAPCUl+/c53TVRPS2tkEDrPy1zdFcQHwoKoQUe9wFVH3wPxJSrE
 r6G/8WG8me9SvhhJr6BvxnKxVrhgOg3FLUrgcBAys+KhY37C+2ZaSJQl/u1CqLkCyImAHSP/za8
 RYP6QXEgsfdb9eAgF4TgXh6xSq08dp2yeX14mPM8tboqddND0Zvx74JZRw8qT3XOFRAQFXslrvf
 067YQh30FrEfI9ycVfpuuDan28sdl5CdlmlKgZ6nCrXuudmSuVxYchwBroiOM55jaTU1PTCqwJz
 6dT8ZPyHFJl7kDHR7e8Mhrft17YBgbab/AHN+Oml+cCot/x8nDNszfUVlYE1fNpzusxU92EtpHx
 MN2qob40yTuQwSmpdXL4plelXFP8XCH5oDDhtW5W0aRhHwGYFhJ6T56mkcn7hgdZkTURt4lZxEl
 UnvQ59duz/qw4uk6v8yO6sOwSl2mQgnLd2k7i3CGvHMBuUjdBekXo2zZA/5emk7LF1k8Fo2Pq1r
 2hlZcHwbAzo/6arXSA3YsFQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_200242_146484_E065C3D5 
X-CRM114-Status: GOOD (  11.55  )
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

Ensure that USB3 mode is not accidently enabled during PHY re-init
for systems that are configured as high-speed only via DT.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c645fea67c4d..694688ed387f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1009,7 +1009,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (ret)
 			return ret;
 
-		if (udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {

-- 
2.53.0


