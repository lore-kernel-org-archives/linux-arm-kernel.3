Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C716C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Fo9ToH3pLPMr2zwb/Z6iLOvttp8yuK2qbp0VymJufo=; b=Lw1zqUXTgNPpGroc+Ap6SfjbJN
	gt0LcetZP5iGfPVNT3CD1AW5WlAqILAzvH5+A+a37xaUq9TmWUHfdLeqsPx8cGBgfXBv19gBqFlWd
	/faai4ZTxLUOvpWWiRQSS2fGz5DQHs0Ee+fynYvZsYkch1tE6WXPTLYbGXFk4rh9PxJmBYmZwgirN
	VT5grQejysUTzCrtD4HSN/baKHIb8dRVtNgPaOzBPIw/irhMcwRP0tys/xAw8viUk9qs5uY4XE2vY
	4xwyICtYaEjARdcwNNl4KfOto9H+olQb3+ANlg92+EReKwNpqBKIv0husEux0pgMRMmYYZu6Ej+Gy
	E+u9QrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENn-00000005KlW-490L;
	Fri, 10 Jul 2026 16:47:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMz-00000005JNP-2RoV;
	Fri, 10 Jul 2026 16:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2Fo9ToH3pLPMr2zwb/Z6iLOvttp8yuK2qbp0VymJufo=; b=IMf3+a7fIk6VkycpjcsjnA4YHG
	sauBqzkM2HUr9peOSEE8YabL1xrfCCeae8hJZc78WmdDP5Z71ELvbGhKc1PZyAMGXnJFt/R1K1fjh
	aHT0nRDlPqBFpfyld1M3mzviJCa905MAthIRaiNHz6ZMF9C+55s4gZL14YcrGkah+Q7pCIazk0ijI
	naIfRNlgoYI42Aaohh7VTZQcH0DD0O5M6zsD1TozLMk5/lfj0httMH7svCrCOkXArjwef0vBlOogt
	XpEpuO9lHUHWkpvp4hiXZ6vA5rtoR571EKCWPaDjm2Kem+B9nlSgHKf9ll8QvgDS+HAbASSNOvgAh
	PVFEXObw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wiEMw-0000000AAat-1hWE;
	Fri, 10 Jul 2026 16:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=JEzDlofvAuUDkbxOysD5mFj1UY3uEY+FfXEJ0lIXwmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U8g2Mj+f1FZitaV5pScXtnHTG7ZNY9qYA+zyaVkHXcdHHRrgmZipcGdDixmjMGo9J
	 bmc5z8e56PMn2/nK9mMJ+Ru+NzsyWZFNjn5zasTbHGIDAyGfAxP6neIGO/isTMxp/n
	 ESUrSgKVmrG4ICCWwZ3QRhxy2LpZcW3UdlHV7ptWi8VVHMJiQXH7wGaHC5xVoeDEOa
	 NFBllvHJ808ctGZwF+7ZDFJuncm7OUqG23U01xRdIum9bxBDK/4a8lTyyt9q4ostN9
	 x7bAz+kn1jCKggd/5WKY/85OaFNI14aoD51O8Hfcc6GCmrCoQxpJuVcAQsgglI6x7K
	 w6o61yu3ggxfg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F98017E127A;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0ED7748006D; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:04 +0200
Subject: [PATCH v12 26/36] phy: rockchip: usbdp: Avoid xHCI SErrors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-26-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=JEzDlofvAuUDkbxOysD5mFj1UY3uEY+FfXEJ0lIXwmg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdnmuK2Hp8wMpumqAEsjEu40uZWt0IHM+
 JE797gyAXISRokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qa2iEQAIlsYPItJFo798GBS5QVmJq96VPvRVoNfXyGbNXifYZUj/w9zzV0ybrjzMSThSD/TPm
 zQnCZfVEmrxdHSw8Ii1ZowTFFksBIgpphsnLs2rfGIMgSGpxaQ0hmyIIYMAgUvb6/OJ2o01fBnu
 fvUGviICa2bFZ3ptymKlvYNjeWFmmS/2DXahXSOYmscaK9Ifbp5b1qd/ousF/eGWUNULJLn2DrM
 74alvkI6Xb62+uhz4b+p7I3nx0HgMZUw7IA3N2jIqfdmvlX6SitCB+fho+X0y/6aKiuysRhNrMO
 5YO1AQs3MV8zyljzzH0MxZjp0vCzAZHyHNnFYeo8UoIr5ukTTVIIhoTO8ppjbPLvslSxXyeaKq+
 vDcwZtoLCIxCn97asfKPasrVeFIha3H/l7LFo++xxrlhePKek+mpC35svVFkKru+79++GkW/TDJ
 ryzV13pwyO1MsEmrHhwk5Uvp4M17hEBo2URSenO6cUMfVE2BjlO+ndE7M5Czv8eWWw4H9OIuCKo
 wgOGJcRVjga8erlEbo8njMl92xtS2Om+bFOAKx18MtwpZatsRPJUUDjxqRMvjzPiPx5AQbadwoQ
 oxj5PDj2lkthV1zhSw8LwK0HKcF0sPZ3JvGtwYTEwlCrQPEfURskX+EGIP3Z3+lI30EEdtOo61B
 wgNeoYtt9PPg9cKpx2nY4Zw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_174630_607372_4AF41C24 
X-CRM114-Status: GOOD (  15.57  )
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

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index edee27933d89..ff768e5b43ca 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,12 +1000,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	}
 

-- 
2.53.0


