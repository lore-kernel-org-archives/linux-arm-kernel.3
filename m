Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C83FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIxqVpX2ER01KtkgbWKjRsQh4rTrodlTK1cA87LmQss=; b=pB0u9otcm89qEHuWH98yCzVIyR
	h3gyrQtC+UeYZTvOyC6UHtUALSAzFOCBzLQEJVw2G7soFquKB+U6+3gARkvHzJg5YsJn9WzRHB+6M
	JNJ917zQuxz2Mvnz3gBOs7qqLO6G1VrsJhKBViTO+JTtcDICNlgQh8/ehxLrseXZgKhqQ+UyppTGP
	Znuaj96PC4kGfSbxVTAQalwwa4/ujXN+j0SffAzokcBw3fNoBlMStUjxGrdPEnpwMNw3ug50VkyKO
	PLLw3dPOSwLF2qbjLZW0oCl/OgDRFAvL0Xn7fQ3yrg3n/B1f3wLL+m28xwg+AyppJiGUicJ+sKkDs
	5LONu0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4m-00000001t0o-1Wmm;
	Tue, 28 Apr 2026 16:14:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4f-00000001snl-05U4;
	Tue, 28 Apr 2026 16:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bIxqVpX2ER01KtkgbWKjRsQh4rTrodlTK1cA87LmQss=; b=qerayoren/3gBh5MLud1++W3Oq
	LVWqhyPuIMwRFPDgFCDsUHwRcQSXHBNVpvJLuJNtQJYAJ1J4G4lupAolxW/cNMPB+ijQaV990sK1+
	27/+WQWDxtHP3DCDZhih+u0B7hV2f27Ps4JFMhIP4/2M3fNH7sCHHAvKMkZa3pBEaweLQ/p+BTRh8
	alzqngHmpnoo19zd2FOICUNm8Wm02ZS0llWcUM+RROCS+EeNMKpSmyILMsC06o/pT2XUOHKeq/h+Y
	TX5rZgn+2cX6Fx/yIKVex77qMu/0MPhbjBN3Td/mvh3jJDcmfNkKjT0OczSor2X+0Q2AVMlJXnqJr
	TUzSzmUg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4a-00000003ZKB-1dtG;
	Tue, 28 Apr 2026 16:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392841;
	bh=lVMDgPrv/XqgshhEJQv3iup6/HEvG/vwnk6YBAh6auM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RBC6iJh70Ng9puW6JMdNu5KVfbha87tiDZ5g5Ny6imQmIHfOon5ATNv7CfeFg9qOh
	 sKUcu7PoKZ6jQiwa89gaAp0hB3NUpaMUlNBdVZwGJniOaJu0Xq3aBC9TyMi9varnWl
	 HIAQp9KjcqlRgiwyrE4anE5uVwSOl8J1DNOwscH9vFM4JbnQVL+vSivN17Roh6m/ap
	 BMk+OaAjR13vhNz8i9WAwtLag7MPXck/h3AxAkW4KjQogBri/dqVgYE2WJxtLBeAlS
	 8KhVO8/+JgDX/NfuhULDI0YwOMrBk/A1uid2PVu2fHklOOtb5hxb+E0C5iHjPwK89s
	 ggQM7+XA2vEUw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C640D17E131F;
	Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 82F84480031; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:42 +0200
Subject: [PATCH v4 03/16] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-3-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lVMDgPrv/XqgshhEJQv3iup6/HEvG/vwnk6YBAh6auM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3Mg17IfkYpPi/fviUG85PATBikSnAA4pr
 2aWLQeIAvq7AIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzIAAoJENju1/PI
 O/qa3Y4P/0EamDY5YtEJW1mTJU2BWbfCzMbcmKNlEXmJ4/SA0R/qs4XRDgtZoKCFEq1RblvDFaD
 k56HT8lR6tOm0bB4XiV+OUpvfqyZsQfplSbPFZv9bTSs+AUWNMgImi9q/rXYsGeCvYSlEuh9NPi
 CbJaU0UxnFA+3432hoVC6ElH6a2wvsuVwDTRbq5VDc1sL4jrfZOgo21E5aHbGfod1urBGdGDGJB
 iQbBVOBMEtqfcax8cFW3cVIi6u6hhBZctsQqXL6NP5Eo93c/fEogAVPFtYN6tE7rAQggr8Kn/R4
 zMJ+lfc8/l7RenFmhhbfoZKtu6ivWBBdbisaXfDJ0liKzNHEKIk4T9hQR5HBYpE4QqbgdKXZL5O
 UhVlMERXWM5tIT6x71SOi9inzfjwqqjj7bcT92+EjGj0m+BEpwIFOoQRpnft9RQiedUrUlLxljK
 V8ckFS60SabcxsNguiv+8GD2Tte/LzEJ6Lk8fKJUJoMUFY1tpdknTXUOdB3uU8HCouYJDV+f5jf
 RcrmHdeqPqoqa3rNzRsLAbRdhMlpoqlBXXa2ivfVt14iled9QAUDp3rGGy86GggUVlotVjevwMn
 TceiJKNl6XkkUgVICGP0fsxJsm84frxNVc+QWPNpmCE8vrjRXxi/0oYI1RLab3MBzNJLAUMY9/L
 xwtRyFnpXSQaFFFvEmFEspQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_171408_623373_DBAF6685 
X-CRM114-Status: GOOD (  10.39  )
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

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 744cc7c642f4..98562a888b42 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1012,8 +1012,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0


