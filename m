Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEC2C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+U4MyItRi5X6jc7HhXDVPcnvy7yp8eCksFCKaK5N7o=; b=mKYNmG+NNV2buk7Rkslq48UFdw
	hIkMxTh3/AfOQ0yUzhZew60a7M6pFjwX+J9vEvX+76UdI95TepXS7FVbRYya1Omk5FUQu0q1HCbSa
	9LEUiM6KpqnZs/ajaWAXg7Ct41cu9DCHU8Mv4GUC4XsAkmxzbmlLnMx+34JYokQg4d5JHmQFOVa0P
	ttzak1JdN3faxJtt7ebzFgrodTz9l9vTFHWXxvTgkZt9OCwU7BRCLxsNx/rDrs8K0puguZxSyU+RE
	ji7Fqpqov3Iv2L4x3HDQ3B1+gOCHTlY859FGQZ5tR0fIjydXR1uk0McZ+XRK32I5dv6IcS+eFE4WZ
	QD0lzx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjinv-0000000D5m1-38Dh;
	Tue, 14 Jul 2026 19:28:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimG-0000000D3Up-0DaN;
	Tue, 14 Jul 2026 19:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=x+U4MyItRi5X6jc7HhXDVPcnvy7yp8eCksFCKaK5N7o=; b=CIsLv+v8IAZCVGGkh8dxq4A5eB
	U3JZhtp06cjUyokpOAcUdcgTm5/UmMbBgO7QxDkbOhxY6vTxoig1HTNk0dnzZlNRUoRDE5e0Gwvl4
	yICLL4lODkiDixigLWMfW/m8d98Zxq87LNK4I5MHSxzN3Ck3AliEkb72k2JasoyxVUKsJDoVyoDex
	pLw05SnRg1Hq3rSo8NW0qwyY4UePd2pxuIIRMJnqMi8OiKbRNWV6qVoQr56BIZuLdihdqyaTPfuXV
	mjiGOg3B+zvWh0bS8yi5Xky5budMJuUNnSteDHJgHN7Lfxu3yjd6wHucmRgXoSTRzRn95g9c+EuC0
	nl3AoAIg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjim3-0000000Co9k-37qn;
	Tue, 14 Jul 2026 19:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057175;
	bh=/pjh5DQtiFs1nMCAmgRMNRjrSsE3EdF+7v+JGgVHc0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y7NblXpAMHY92eDvgIsGMqaNiOpU1CDlials5jPSpXLqJcHNpaP+mOsGgSreiWG9z
	 /4yTzdgIFLDYzrvo10FN+bA2BJRS3MtoZKIs1VYY3t1T20SgoAi5FUUGm3z0UVyoS5
	 NsSKR/9tvq6cg5cfaj7DydP0ASwNB8oij3oWD6+8m8/i/d/NWQp73rhCODDsxSsynU
	 lpox/Tg5Z1G8V6CbaGNu86eNMbhpPLr64YuOYulHgdUxVI5tGr8nvPn35vCaC8MMzX
	 FCHVGDqChxMaIt81ycErMxeWJcnttmn+7rNr7VkBv2W8KQe896sMPm7DW7/6w+0iVm
	 nCLopOurL8G3A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 30DCD17E37F3;
	Tue, 14 Jul 2026 21:26:15 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 07D13480074; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:31 +0200
Subject: [PATCH v13 30/35] phy: rockchip: usbdp: Add phy reset notification
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-30-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/pjh5DQtiFs1nMCAmgRMNRjrSsE3EdF+7v+JGgVHc0o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVAL9pEiZQ9ihCIjDcH/tBrhnBO0jsMJN
 /bol5XAcuhERokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaHLoP/3hruqK3aOWXTYXZRPGp52K27d4hDqUC6+2WHeDmXXTdTCw9gYW0yV5lwdiYJbhQwdJ
 3B0r/Wid3IwMdoqznfHyAsncAg0AQZBK2FASKBOP3IkELhvGGjLe+2d6vsS8KLVhf1obSMTG9dM
 ag3/YmGBtd6yt9aWcJ5JS6NVWUEQij8FM763t6/lGE+1mZRPSNmqdouvgR2zlWbGulKHA+w9ktq
 Ibpum05/8c+8uJCYuLOaT7P22xZO3f4EwvypUWojFH6siwW9OH5PGQc4djHViu/Rzd0dE2uJZpm
 DY2yDvd6go2syMnLuWzIYeU/0WiXPyWnB8cvro2kwlh719ovz/WQhch/fEqD71RKjC8auLJPfO1
 XHvarFojaaNn3B/rdcwxHt0hL/t0j/6VT1clVfzyRWalS6IOkVMBlwKYJKnHHOT1inGnkPWt8Ly
 sv3NQkuu65FaPebMg+9WdovOYdtwrjPnZ3R7WUGOyait+lXYvWR3RfK8GqxtP0fEu4mi2bPOyY7
 PZLuv9SSP2JMtQnunxkVcoHf46Lbp/vFx7/eiJh+P55QY1mNIb803fbAiOZw2LuC9c5veiMpIpT
 Ta9nD4mgQ/jrP01zYK1E1sEFq5xoy+RzOPhrqf83wiCFk76Tr4tXYwSjToDWu5zCM2zKo2qzujE
 E9mjFXXBTto54DARmbl857Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202641_946604_060A4381 
X-CRM114-Status: GOOD (  12.59  )
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

To resolve issues with running into permanent "cmn ana lcpll lock
timeout" errors after a few device replugs, add support for reset
notifications, which will be handled by the DWC3 driver to gracefully
handle the PHY being disabled. This avoids corrupting the controller's
internal state and the PIPE interface between the USB3 controller and
the PHY, thus fixing the issue.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 59b836a3796c..21f282216aef 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1005,24 +1005,39 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	} else if (udphy->phy_needs_reinit) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


