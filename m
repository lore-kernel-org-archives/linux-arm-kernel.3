Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09276CFA45D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3xGyGswdGL9dKMzc/WMvHmRdt6Zg4+8xpvLGcGRCws=; b=4DeCt25H9ngeQwrC/ylOHumujG
	xkkMGxM+JDd3mtNSXuc8nzFXWeaz0tBu194FmqkuV8cn1Eq+7T+e+QvBJHyNZzNezoP8VotmX94Yi
	tMfHZrBFAotB6TTmqbGzkrhOb7ZXFX16W3iN3zmcytxNCQ8NxaQzvaLGVbHNd11gjZyGxwEjmEuUT
	g2vH9HQLzIs6wrgfGXX+1gfHr5nGnAIQRnJHVnHSDrXp8H0S5OiPwsA+6jxjupXJm00noHylkDj5F
	FOAketQfkH6WjB3rs4ncAlp21F7t9ZwWOp12P83wbJH4IaTwKKyIisbNlg9n+6NUW+NboN5+synk5
	eW66kAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fvO-0000000FUk9-3ItZ;
	Wed, 23 Oct 2024 18:17:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eio-0000000FH2T-0svV;
	Wed, 23 Oct 2024 17:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G3xGyGswdGL9dKMzc/WMvHmRdt6Zg4+8xpvLGcGRCws=; b=EBbQ4xAikA3a3z8MjFN5v7Qi9f
	dmJ7LAnWQdQ9Ubk/tqhdIEI3Tky4eH2JhnfdA47bvGf1BLkWVZ6y2Prf+MLFmIkJSr9e0p9hHlOkI
	EYyp8N/ijS/4iJg0y/a0hxEU4AQp+uAzM2Ug26xl90F8O37xPB/OGwafOE4qhJjlLBi7FCSVqyrJ9
	S0GXs4nM7TB332XKGBE37xsKIxFFQQbvGkpvJ4eTpHAfM18bOXEy8E/jHiMiNVaHujw3JjeG2iidM
	jFGPSh9iSW0sL6JcgjUbS1RkXPN09HxW8YRQxfq6v7gQpHmN8gHjKI1VW/TKoe/F3qXV/erWVAtbR
	bpNRFthw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eik-00000008ThT-2Dhy;
	Wed, 23 Oct 2024 17:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=G3xGyGswdGL9dKMzc/WMvHmRdt6Zg4+8xpvLGcGRCws=; b=QBA8zcHAK4iexT+ZJ6HFXGJ+JC
	xy1znc4M4jJuQ6FV4aZLNfumq9xWcVTNY2nGHiZCRbc028iDrOTGlCBn/HTauggc2Ongx/4+3pgUR
	tNJnTNp/cp1I70aVgIUd6xNsC9qzs/rDcAx9VQNrHlzdZNnql35yc/9cynJ3PfiiniTM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t3eic-00Azl0-R3; Wed, 23 Oct 2024 19:00:22 +0200
Date: Wed, 23 Oct 2024 19:00:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH v2 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <4ad7b2e9-ddf1-4a82-9d60-7afd1856c770@lunn.ch>
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
 <20241023161958.12056-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023161958.12056-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_180030_881779_5161B93A 
X-CRM114-Status: GOOD (  10.02  )
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

> +static int an8855_config_init(struct phy_device *phydev)
> +{
> +	struct air_an8855_priv *priv = phydev->priv;
> +	int ret;
> +
> +	/* Enable HW auto downshift */
> +	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_EXT_PAGE);
> +	if (ret)
> +		return ret;
> +	ret = phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
> +			   AN8855_PHY_EN_DOWN_SHFIT);
> +	if (ret)
> +		return ret;
> +	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_NORMAL_PAGE);
> +	if (ret)
> +		return ret;

There are locking issues here, which is why we have the helpers
phy_select_page() and phy_restore_page(). The air_en8811h.c gets this
right.

Is there anything in common with the en8811h? Does it also support
downshift? Can its LED code be used here?

	   Andrew

