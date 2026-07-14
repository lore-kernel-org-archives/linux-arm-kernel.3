Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BB2C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04Q1/5CM1u/gDX8YLh1qS1oxoPePhvxl9hpK9cO3ONs=; b=HvdQ7dhIZKTGv+uQLDhtYLCrbq
	o90xhphvhX2SUlq2ULNBZki5PNzFtOeybEFJspum6+5af3GDaSVuO8Ik7aH3J/oW+QTWSIlxtpZG5
	QwKDrp+hN5j469cNEXFo6m2cpEpEmkbgH/DaBxAK0Xl6pduG3641af9CZpmh0mxOmnaNbLm10LT34
	z75Ot96ttQxF13N80nQ6N4shi/BygRXuuggJg5LIgiXRjZkbZqoEMIqgY9YdlO1/pGzrH/LUonEk4
	LWEx0d8OkuWiMggznyFEguzvE+8ioi+uKSngMCBTQ0OKuzlVaiL5hGSmt4p3Y6530KVH/QAiXeG7p
	ZHYOShWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjinK-0000000D50V-27Lt;
	Tue, 14 Jul 2026 19:27:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjim5-0000000D3FI-06D9;
	Tue, 14 Jul 2026 19:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=04Q1/5CM1u/gDX8YLh1qS1oxoPePhvxl9hpK9cO3ONs=; b=eQYotZwgo7P5qe9uR0FcrL7SMU
	GnDtZOD3OJqWdPjkG1oR378BGAv2DBVOEkfeS6d5K9T1eMZL55CoxRqPTyVNKUiW67Hzu4semwf8A
	lYqAJgfC8G/zDpy947iiVdQCTbG/yhdQu3Rj3qGPcrqL1VNg9ArULiL2CkIc/sHjZLLBDYoZNHWsL
	HOCBuA7M/NZh55u1SnOknNxVxAO4rizcyDiVl7oyrb6qfEWH4I4eHMPLW69SJQCJB5gAUl2xgu6lx
	5FX4Kx9fuvMTxFuMno7ZRR+wjVEoww22KBVQTktM+ewN14+NZkZfbHm6xWn1PN84c5auj5qCR1AR+
	w0Y4DjiA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjim1-0000000FoR3-2JZR;
	Tue, 14 Jul 2026 19:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=V63zlxbk2WwIpvUkzfZbShKKI8n4pibTtc1ZREWfyK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AUc3ZeZklmz6zTkda4UwrE4VKA8f/XvVPshTkGXqnxaj/Kx6Tvv4wMVCPXD2gx6fb
	 8JviOTx+R5jLeVqnUXcVbF7aEWXGBn0xkbT4EVnXIblO8KmVTNiyr6QOCC63fKhWb5
	 xarMp9ia59aGQDcNsIN3TJCsIxSSz4g0IRF9kkDhs7/lK0nLj+ABFxOz9BvB8b5GA2
	 QU7nOHIfh7DOlUZPUlbvsbQVFtgEyKXYatz/KJMeAA++aoZZ6Bg+mcpJ5isVg19IHj
	 gHxWfGvNjKY6hTEzl5MRdCHij7Q4OzH5Y43ONnystVXdHI8XNu7sNC2fp4SPzaiAum
	 RsBEg5euhNc0A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18C4517E120F;
	Tue, 14 Jul 2026 21:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0332548006E; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:28 +0200
Subject: [PATCH v13 27/35] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-27-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
 bh=V63zlxbk2WwIpvUkzfZbShKKI8n4pibTtc1ZREWfyK0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVAJ7QmSEvdWysGnof840cj44T1gR36gk
 uWBoj12xlU/f4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaElYP/3qvpmGnUJMDBxbC6Z8jMPqFXid2nRYDzLr4mTRZufmSXpwe/QnPg5Ts5ngwnKKhmig
 8G3ttivx/KU38sUHK7esljYtt837+z6jINnPGR+XgYCbxREJCdsoBunEayweVhFwZa7AOk+MVqI
 rHtRgCEYegnbzlWKT28my1NoBCIkcD6Z7XKqNlNKehrwRC9Dkh/nisHYwYY8z34PC+sEp3uHz5s
 cVsJFXAICY3O7r1HtdkZjHQMO+m7+hsA2W5HNj+9caM3NdfXckuWUKGrvEusILFulVlkI0WT0Rq
 P27ZcIj65HuxKmStjMXyrNS7zAnYv87rUtMIKw1/pdXh0Y3RE2K5j90+3cryiISnbknHedKhND0
 2ZjKAOMmWSNme7EYqhdXNjz4+yKT+4ffGouG3gGsPSbFdMWd31udJ8Beq/jR8xeuqEpll6XDvPe
 n+C9E73fbKMxW3fr11et1rjbWVJcBiZMkmB6Pc+p0lKJI2Jg3+6vevxmzaZaINlhOUPAoE6jmvG
 95raaQ0LE/6QDkKxUzxykkFg2khg27yrDOS66w8xhLex7ty72SXDkskQN6bmt8nNfFyA/HHtIyN
 i6r3+O0AyVfM5X/Hx8vHz86JnNhvP9xpJdtfyKYAiLIr2XmuKmfVSNySYrRyzg2lJbLCRptN9M4
 qzzNhmCfJQJTpweaAgq9B7Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202633_696383_FDD9CD98 
X-CRM114-Status: GOOD (  10.68  )
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
index 701c92ed6e2d..59b836a3796c 100644
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


