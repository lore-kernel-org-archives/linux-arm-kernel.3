Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E2AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxovBajuiG9VZJ3XmWy0NzjagqDViV1ywWm/ai8Bd1M=; b=eOd9PF9t8yqCskWgn5qdktqba5
	wya1vV8QM07cD6WVMFQCEMNzOf7+P1XVxnDvfpAGhXIWb5AP9CakrgVhfyBCA5RX4axpCaIQXakLA
	Sayv78NSUFJNwtpbmmDVlYLoT1Gay9+BaAYsA2vg00iTEKtXhU5QeIvsxnsWU/lwkr4VWm1iPDwIm
	OT9KYR3wu5r8TQHci1zf3wMYZXOzN8hblwqr/n2nZMJ3PMlfciggIFe5DxmzQcuHNwHU9h/cpVN7T
	GKntkaEULfIVGbKSt5j/fFiGriyAl/Tpaizwc+PS0kc8XrHqwkohfFyc9J7vaHuXMXoxUg4VXPsUW
	9F2SbHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0UL-00000007DQt-0pIN;
	Tue, 10 Jun 2025 15:02:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyN5-00000006p6C-1za1;
	Tue, 10 Jun 2025 12:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IxovBajuiG9VZJ3XmWy0NzjagqDViV1ywWm/ai8Bd1M=; b=BZnUeqZb2cpmqjba015Ph2ldgR
	CRKkwzZQR1u2NQeMcBUCelRcMAEBSN8nhYSUbmlsNXkSk3FagH/PQLfGpwnotn6LDzRuqynA8Le+u
	C4DiwmiHxvq17ibl5CKUDRjD1dPNjSNzG2P++JvOwnpDzSd9pUKikqOF2kgEMxEG/bHwLDMS5D21X
	UgC3KAOtMX9bXm8bg5Hp8lqZghebCe0H964Y2pX1FwURlSDAVOTEYZFrkumAd6tmo5qgl7e249U5t
	+M5PBkQ4i3LPGW2zm00xNQzQ45PVpIfTS1uS40cWSF5CWsXMXK3PlV3ol7cviZpAzQwMVmfPizT/E
	QuJHkVgg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyN3-00000001pXJ-2RTP;
	Tue, 10 Jun 2025 12:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IxovBajuiG9VZJ3XmWy0NzjagqDViV1ywWm/ai8Bd1M=; b=hZoQ3j3IzpoxwljSwnB8bccPSM
	XRrBw7WFNZ8PxtzbiIXdJUnm/tkBx5fm8LE2KeugPzbPkZOxOSYZeqWHG27E/pZqa2VZB9z9EYDNc
	cwy1nsznvNnVMKnbEY13v7IRURpmJET03jHqxGcIuSW+kSzh3eWH+oyjvx03UBx9A2i8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uOyMc-00FGUL-0t; Tue, 10 Jun 2025 14:46:02 +0200
Date: Tue, 10 Jun 2025 14:46:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 4/4] net: phy: qca807x: use new GPIO line value setter
 callbacks
Message-ID: <5c9a127b-8538-4856-bdb3-cbee87993428@lunn.ch>
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
 <20250610-gpiochip-set-rv-net-v1-4-35668dd1c76f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-4-35668dd1c76f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_134629_694048_CC2CEEDD 
X-CRM114-Status: UNSURE (   8.92  )
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

> -static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> +static int qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
>  {
>  	struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
>  	u16 reg;
> @@ -390,14 +390,12 @@ static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int valu
>  	val |= QCA807X_GPIO_FORCE_EN;
>  	val |= FIELD_PREP(QCA807X_GPIO_FORCE_MODE_MASK, value);
>  
> -	phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
> +	return phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
>  }

The full function is:

static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
{
	struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
	u16 reg;
	int val;

	reg = QCA807X_MMD7_LED_FORCE_CTRL(offset);

	val = phy_read_mmd(priv->phy, MDIO_MMD_AN, reg);
	val &= ~QCA807X_GPIO_FORCE_MODE_MASK;
	val |= QCA807X_GPIO_FORCE_EN;
	val |= FIELD_PREP(QCA807X_GPIO_FORCE_MODE_MASK, value);

	phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
}

The phy_read_mmd() could also fail and return an error code.

    Andrew

---
pw-bot: cr

