Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD876C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 19:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zvp77DVHsDdxeCL64RdzhlfSKqpDOoKg/3DLhfTCZk=; b=DgaxHMaRyH0H4O39NeTYNYh0cH
	oQXI7oZNO+ME6ORcj4yrsQXrk09gZ6jkb7p+jDBJsSxVu7wVyzi+hHifd7gHvbjEC7Nw2FCZGbTda
	8+wBSGww5XZgJnAfrDhCWTy7y9Hd5lXi6qRJ8uUNfORd2o4lJPK73hGiFe6ZGeEOUvK8eJfyDc6Qt
	mWGn3BphPtr982oBjh1NoFIqOZdbmDbTlASaxtKGy4gczZvsGFIBnLE9M0HNoMogBoTJ7Lo/KD8Qp
	zqA+xQatEGWeZtDU656mesDbEvEm0Pc4uk4amPfP1416mmLnmVfalzVCRGu0A/c5CX2mfQCB2xBN5
	DcwYQNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xHK-0000000BbSM-1wsR;
	Thu, 10 Apr 2025 19:09:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xFV-0000000BbER-1Ysx;
	Thu, 10 Apr 2025 19:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 401505C3ABF;
	Thu, 10 Apr 2025 19:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB136C4CEDD;
	Thu, 10 Apr 2025 19:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744312059;
	bh=9LzDhagF1B/m2ytbn3Sp4CBEK7Ris0Pmu1ba2tDdU0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLopckpMOaw2ss8AP4md5j7yUBTlWXUYEVbolOQZATbdY3kBcAvYGq7IuSF/3ACav
	 MC7Wn4ho2da//78A7fzeoumwGxh/FvbRF254J8mM24rIfoteD7S9mKnKZM5ZeUOoP2
	 cdzBHrsbi+0CCfTDiaUZLJIl0uXZOVPOv5snv2REC4WbhH0Z0wcf3p8DLrk1lASXCB
	 WVPwmmz7wTp3oXZzFl4q9MQJ2MTnQ7uYiaOK3hFcueSZkXSjqJItJEjBZW1GeacudA
	 Sn/ocE8Islx6tS6l9qyuM10986xbqWFPYY/2cIO60HE3CeSG5oXNq+LjvN8DxIt4bO
	 3OVSRNuXoCNLQ==
Date: Thu, 10 Apr 2025 20:07:33 +0100
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH v2 2/2] net: phy: mediatek: add Airoha PHY ID to
 SoC driver
Message-ID: <20250410190733.GV395307@horms.kernel.org>
References: <20250410100410.348-1-ansuelsmth@gmail.com>
 <20250410100410.348-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410100410.348-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_120741_453607_7BE600F8 
X-CRM114-Status: GOOD (  16.35  )
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

On Thu, Apr 10, 2025 at 12:04:04PM +0200, Christian Marangi wrote:
> Airoha AN7581 SoC ship with a Switch based on the MT753x Switch embedded
> in other SoC like the MT7581 and the MT7988. Similar to these they
> require configuring some pin to enable LED PHYs.
> 
> Add support for the PHY ID for the Airoha embedded Switch and define a
> simple probe function to toggle these pins. Also fill the LED functions
> and add dedicated function to define LED polarity.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

...

> diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c

...

> +static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
> +				       unsigned long modes)
> +{
> +	u32 mode;
> +	u16 val;
> +
> +	if (index >= MTK_PHY_MAX_LEDS)
> +		return -EINVAL;
> +
> +	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
> +		switch (mode) {
> +		case PHY_LED_ACTIVE_LOW:
> +			val = MTK_PHY_LED_ON_POLARITY;
> +			break;
> +		case PHY_LED_ACTIVE_HIGH:
> +			val = 0;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
> +			      MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
> +			      MTK_PHY_LED_ON_POLARITY, val);

Hi Christian,

Perhaps this cannot occur in practice, but if the for_each_set_bit
loop iterates zero times then val will be used uninitialised here.

Flagged by Smatch.

> +}

...

