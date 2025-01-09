Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C95DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmGYtV21jsy0C5YxWF/+p3yWmQUFPOm+4ZEyL+sjZzA=; b=DwqV4zzDdDG6ZdYstCSTBXX+9e
	q2iCoZaa6Z0qVqeMlQAqQNEt7OzU+iL8qUE4koPc+aJ7qI9szh8JcmjRy1yaDkG0nPLUfTJvASafT
	GyAmYW+JSi1fzFzcwK68MqeOc7QrTk6Z5fm6BVU6hdD4as1HTYC/F2SEheOehdKeGfO0b5GgO+eNc
	wOiv37KnN956wPCY3UAvvK6V7aiWK1Sxg+jQtMCw5SHS07Y6eMoDJAMTPIV9B5spEWuLtavGqpf9B
	Cc/a3aEFXpnUYrWUMFjGwDdfxsrdod8c2tySWITr0D/YJKIX3Zuq0wSVuktcftv35rty9/fn5ZVL2
	yc4OD0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvyK-0000000CmnC-1oqJ;
	Thu, 09 Jan 2025 17:05:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvvT-0000000CmIg-3Eos;
	Thu, 09 Jan 2025 17:02:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CA595C5AAD;
	Thu,  9 Jan 2025 17:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486B8C4CED2;
	Thu,  9 Jan 2025 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736442150;
	bh=Fg3vYZyTO2Fw+Xxth4e/W3NjOlbC7sP2c8f+MJ5K2ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBBk8lNaYerCF5M/6HUJQLFK2H9nv6ugX8pIQ6ULhnqMjYY5l0Hf6pGBJy8rTdnuc
	 1BL4mOfvX3nXoqhvpIrNBoH9Go1oDuuJo1BcKi4Ixl/rO0juAZFlWI4VL85zYV6hRy
	 1KOMj/ZB8WePQqQEdZ39UXHlvH5peHLFEYWxb9hSQovRvYAX04XdvZHKAeEOCr+8kF
	 5/4+5X6Bx2vHP4c85w7jb2FgadOGQTZQODLBHmk57Ju83dInKsMEOBSdvtNP6Ka4CZ
	 2kaF8OrF0NQo/SSUGcU47UcCex5CyYUF8oksXuetOpos5aAPdPuRfcNvQEBpMPBl0U
	 ZGbUvG8aumS4Q==
Date: Thu, 9 Jan 2025 17:02:22 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH net-next 1/5] net: phylink: use pcs_neg_mode in
 phylink_mac_pcs_get_state()
Message-ID: <20250109170222.GM7706@kernel.org>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
 <E1tVuFh-000BXQ-D7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tVuFh-000BXQ-D7@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_090231_890580_DFBF2CF5 
X-CRM114-Status: GOOD (  19.68  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Woudstra <ericwouds@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2025 at 03:15:17PM +0000, Russell King (Oracle) wrote:
> As in-band AN no longer just depends on MLO_AN_INBAND + Autoneg bit,
> we need to take account of the pcs_neg_mode when deciding how to
> initialise the speed, duplex and pause state members before calling
> into the .pcs_neg_mode() method. Add this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 31754d5fd659..d08cdbbbbc1e 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1492,12 +1492,24 @@ static int phylink_change_inband_advert(struct phylink *pl)
>  static void phylink_mac_pcs_get_state(struct phylink *pl,
>  				      struct phylink_link_state *state)
>  {
> +	struct phylink_pcs *pcs;
> +	bool autoneg;
> +
>  	linkmode_copy(state->advertising, pl->link_config.advertising);
>  	linkmode_zero(state->lp_advertising);
>  	state->interface = pl->link_config.interface;
>  	state->rate_matching = pl->link_config.rate_matching;
> -	if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> -			      state->advertising)) {
> +	state->an_complete = 0;
> +	state->link = 1;
> +
> +	pcs = pl->pcs;
> +	if (pcs->neg_mode)
> +		autoneg = pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
> +	else
> +		autoneg = linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> +					    state->advertising);
> +
> +	if (autoneg) {
>  		state->speed = SPEED_UNKNOWN;
>  		state->duplex = DUPLEX_UNKNOWN;
>  		state->pause = MLO_PAUSE_NONE;
> @@ -1506,11 +1518,9 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
>  		state->duplex = pl->link_config.duplex;
>  		state->pause = pl->link_config.pause;
>  	}
> -	state->an_complete = 0;
> -	state->link = 1;
>  
> -	if (pl->pcs)
> -		pl->pcs->ops->pcs_get_state(pl->pcs, state);
> +	if (pcs)
> +		pcs->ops->pcs_get_state(pcs, state);
>  	else
>  		state->link = 0;

Hi Russell,

Here it is assumed that pcs may be NULL.
But it is dereferenced unconditionally immediately
after it is assigned above.

This seems inconsistent.

Flagged by Smatch.

>  }
> -- 
> 2.30.2
> 
> 

