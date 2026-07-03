Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDwGHzKb0G48JC1+hRp3wH01XQW5D2hqtFQ6eD02BaA=; b=t+3yT9tL0G4Q1tmLvT60wczFk4
	uyweo45o2x78/8II5LpcrGYhUXYSJmxQw2QU/BQYNnf4vUmN2IbPUoVGfM1lb+ro8T5OSV254yc/h
	eQGZnbTN3JUZ6W6x9SZl58seUaSFuyb+MbJj4W0hASw150mF6DYp2xj2f5pBaVq0X9/xJCdyISk4N
	Q3ZQO6CxgiYUwqPNrG6ZXFr0oLgDU4Fl3JN7cI8rSDBjY/cJZ02BLenC9FoLoYaSx3UMfs1zR8kyR
	41l4/BmkkOg3iHOfANr2gdbOrMlUpPxWIva8Mfeu24xP42LRF8cbvldpok6kH12d24XyXDHB8LD7u
	C4btfF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiP7-00000007fSA-2B1s;
	Fri, 03 Jul 2026 18:14:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOe-00000007e87-1gMt;
	Fri, 03 Jul 2026 18:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IDwGHzKb0G48JC1+hRp3wH01XQW5D2hqtFQ6eD02BaA=; b=UIzaqDxTHEo+bPe8HJeRSfS5zX
	/+nSNuzVnwh8UGn7xrnTofInazhEtkSDam/SHv9qdLqE/c9E64wYrWpF7T+jN/HatgbIROXuyFd1S
	GfptOS1LsdK5Am4rsvp2Euxk2K6NTMGGlRJAMrVI7JTxF8dZrfSX8Bz/IoCn2iwxkshGcgbC2f8oI
	hxhH06FK+TuukK1PpeG1Q7sV0RTqBks2toa0/W2P5cEQTlFQGxgoBH7cyZ2fGI/9o71f6eeH4RR1j
	5ISDda0+kCuDoKoIvgvDE3+tSsuOpuAln+Du5a4jJqNktnPsE+4s3YOs+k5g46qc8SuyS6HiPyULv
	Y3LLdSVQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfiOa-000000053jJ-3NuC;
	Fri, 03 Jul 2026 18:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102414;
	bh=4X9eFjcBaJHCtFU4hA401y9jwD+dcI01OT23M3giXnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hAL0EQr3M5y3tT9Zsq11gLv3dwjl4U/YSrFvWFKyRCNo8vRW+bV/QMaBbvzBNTCqH
	 HEwhJT6woYAoeSy08Q1TsXOuVTDvB/KlsG98Xjcik2n71R8ZKq78ocHXmx3pdx+oBs
	 aaEHKWqCpjJ8DQBt3A+qHvPlu/RYIM4aG/00eQA6qm+QntZYGa6jTHgdWYMOHbWEbI
	 i6UaoDHv/D68o0Zlk98C/wq+G/8IfEodWl+f7xPYCW7UMbt3dYdpD2NHw9F+SmESde
	 W9w7ejucCzIjRzHIDgSoogPbfYGQXof02EFluefuiPaUqMO8dXTrUPsUa9wafMt2i9
	 xsAOT4/yV6eKA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D316217E1559;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A3C9B48006F; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:44 +0200
Subject: [PATCH v10 28/36] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-28-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8xKdxlQxnjtIaYU3momd0YCs2YagqVfs
 sRnAGiWi+qh3IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qaclUP/jpS0Zz4Me4rYhzh3c5z4Wl12xb882eFMCf6epCMvVrKcxYlUZOn+fUq8JXnZMEEaw1
 qHpCd+HUogk09sbfIesXMJfOLmx/cor8PvPoztUcZDIaR+nlAQp0FYpu7FC6pQEuujfVfFFrSRv
 284fEwEiimMO1GBu9aeZiuj+Oi7VghfMJw3+z9t1DWTgdVdiMNQb7QQVQKwSHPb8tNjfjZ+4190
 9mclkjdv2BSQ47aRlf9zQgZcLdPOly9zgZsdoQaVfUul4Yg/SVkzGkvSZx9LHAptYCODxpvKoSK
 Mf8SkoAdFyFdloNJBrC/eAio6R1oWp/3eaqZzQkBhdyTVgG+9B/ZXuPc7Z3FjIU+IdN+xCHwQwh
 Rrz/xrNamr3teiT7Av6ySEEY5krWY7UeBZ9aQSahkudJlLv0cSUDpHCaOXbvFgLt2VW3mVS5L3u
 kCUrA1ua8wRYn8rUcw6JmDZV2DjEbGQ9ThxOzzWxxYSp4YsRaSwT3hOqO09s/l1IIV8ybqlMFpc
 0rWplZjTA9p0jJsTYkoiutxL8EdTi6PuGB8PsY+ZYlDBxGG0dD9346MbdCO/0hTGVn/d+FK1J2z
 /ijroUYdX3d7N3SEf697UaVfmatNaTP8elJ7BSF1QSbFFVmAm5IXyMIkBR48b4nj07cXaW1xyvU
 AvukhHxLQhqyjwJAfNFcv/A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_191349_032190_B74C6FEF 
X-CRM114-Status: GOOD (  11.60  )
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


