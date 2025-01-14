Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83498E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 13:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXhz4v2yekrKs85FQBVnLqNAuOivEjZLOTeqH0/iKdE=; b=BRLKG9JbhF/y4R3INmy5wqfpYK
	FYBOk/BCpXqaTQxjrragekMQjfy3wKUX9WsOPMbengdnCV/Pi6fixS1SK4Mmm7rE/L1G77GQ+7ctU
	N/Sie/Lv4jRHDPnXKsrRT5gbOAMHm9Bd4VD2ajwAYJyhyeHhQWz+83EDGT/1//tARXMH8lLa7ads4
	BiYtppfOtOwDXuVTsoB9/Df5Z8yva+2hSSmigt0DDvzAhIJFtJCaT95Y9w8uG8vCCOgoAvcVxcxJE
	isv7a3vpxeEoEOqPIUamRI/TI6Jf9LJ0ykVhrio2MZH33jk00ZuPCdUmVwkluvZrSovaeA6WuhxsY
	nY+jSCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXh3p-00000008XdJ-2Uft;
	Tue, 14 Jan 2025 13:34:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXh1Q-00000008X8J-1UOA;
	Tue, 14 Jan 2025 13:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PXhz4v2yekrKs85FQBVnLqNAuOivEjZLOTeqH0/iKdE=; b=ACRsFW9WU2+DJBTNWVQgV68sLY
	8wp+9obPu/cISydMFEC83f8go9szWM5DNzJCdWaKur+4DIru28qW8x9cIwS62uRWlLWBX9ny0Ue/W
	7KDN63dX0MgCLHDs1FdaZB+MQqFa2oeUiHRZjwE05N7hURUleOdMR5Z3d3BMVzFMJ6MLMWRbJj4Bo
	bafLaSMof+vc7ySuTZNh23qoZcwSL3Ci2q6eWhScPvgh9fP0jWk9laKuJqHIhcc0hklkD4EMRJGFw
	1BQ558wpb3AyW76xEPS/WlvDa7NqxG37pfnlTGjZwp6n718edU9RET1/5V4FUtR9I5yhHhSz5p4S0
	Yocf6qhg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46624)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tXh0z-00086M-0K;
	Tue, 14 Jan 2025 13:31:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tXh0s-00057B-0b;
	Tue, 14 Jan 2025 13:31:22 +0000
Date: Tue, 14 Jan 2025 13:31:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next v2 5/5] net: phylink: provide fixed state for
 1000base-X and 2500base-X
Message-ID: <Z4ZnKpQgxZCbV5Yk@shell.armlinux.org.uk>
References: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
 <E1tXGei-000EtL-Fn@rmk-PC.armlinux.org.uk>
 <20250114125739.sgegfxibbzpc2uor@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114125739.sgegfxibbzpc2uor@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_053156_394323_F8CA83AF 
X-CRM114-Status: GOOD (  25.87  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Chester A. Unal" <chester.a.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Woudstra <ericwouds@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2025 at 02:57:39PM +0200, Vladimir Oltean wrote:
> On Mon, Jan 13, 2025 at 09:22:44AM +0000, Russell King (Oracle) wrote:
> > When decoding clause 22 state, if in-band is disabled and using either
> > 1000base-X or 2500base-X, rather than reporting link-down, we know the
> > speed, and we only support full duplex. Pause modes taken from XPCS.
> > 
> > This fixes a problem reported by Eric Woudstra.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/phy/phylink.c | 29 +++++++++++++++++++----------
> >  1 file changed, 19 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index b79f975bc164..ff0efb52189f 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -3882,27 +3882,36 @@ void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
> >  	if (!state->link)
> >  		return;
> >  
> > -	/* If in-band is disabled, then the advertisement data is not
> > -	 * meaningful.
> > -	 */
> > -	if (neg_mode != PHYLINK_PCS_NEG_INBAND_ENABLED)
> > -		return;
> > -
> >  	switch (state->interface) {
> >  	case PHY_INTERFACE_MODE_1000BASEX:
> > -		phylink_decode_c37_word(state, lpa, SPEED_1000);
> > +		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
> > +			phylink_decode_c37_word(state, lpa, SPEED_1000);
> > +		} else {
> > +			state->speed = SPEED_1000;
> > +			state->duplex = DUPLEX_FULL;
> > +			state->pause |= MLO_PAUSE_TX | MLO_PAUSE_RX;
> > +		}
> >  		break;
> >  
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> > -		phylink_decode_c37_word(state, lpa, SPEED_2500);
> > +		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
> > +			phylink_decode_c37_word(state, lpa, SPEED_2500);
> > +		} else {
> > +			state->speed = SPEED_2500;
> > +			state->duplex = DUPLEX_FULL;
> > +			state->pause |= MLO_PAUSE_TX | MLO_PAUSE_RX;
> > +		}
> >  		break;
> 
> Are the "else" branches necessary, given the "else" branch from
> phylink_mac_pcs_get_state?
> 
> static void phylink_mac_pcs_get_state(struct phylink *pl,
> 				      struct phylink_link_state *state)
> {
> 	struct phylink_pcs *pcs;
> 	bool autoneg;
> 
> 	linkmode_copy(state->advertising, pl->link_config.advertising);
> 	linkmode_zero(state->lp_advertising);
> 	state->interface = pl->link_config.interface;
> 	state->rate_matching = pl->link_config.rate_matching;
> 	state->an_complete = 0;
> 	state->link = 1;
> 
> 	pcs = pl->pcs;
> 	if (!pcs || pcs->neg_mode)
> 		autoneg = pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
> 	else
> 		autoneg = linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> 					    state->advertising);
> 
> 	if (autoneg) {
> 		state->speed = SPEED_UNKNOWN;
> 		state->duplex = DUPLEX_UNKNOWN;
> 		state->pause = MLO_PAUSE_NONE;
> 	} else {						|
> 		state->speed =  pl->link_config.speed;		|
> 		state->duplex = pl->link_config.duplex;		| this
> 		state->pause = pl->link_config.pause;		|
> 	}							|

This is fine for cases where ethtool is used to turn autoneg off, but
not if we're in in-band mode and the PCS/PHY have decided to have
autoneg off - in that case, nothing sets pl->link_config.* to anything
sensible.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

