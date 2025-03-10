Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B31C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOafrjis4rlmeWlptFsFh4bdDZx32GpWyV/5UBeU/58=; b=GRAktBrYjExY0u3mMkpn17jI7H
	xt1Z9C179Y7NfZEegDy08wzDygcK6qH8gK6tv7xSxD9BYBf55rIUwGj2Ul7ljeYswxTysAQN8F0jq
	q3gHJBVg+yMsCQ/FLedhEQF3Y6t/jerEaX6psn0FCI79EeQIoPcyvp53aOEcIm8Bd8ToKuGBk5XjX
	gGFffdNNdSRc2vqMaQuMLsxQk3FVvn/WOsIX+3aOWZcb5EdU3kwJAIA/OHO1mdbPpSZvqiUQbC1UA
	8oJzyHpVStWFjYSqZK9OOgffbA/ih+nmw8JpqNSQZj2b0AEPJd2ht3EOeFNFzrboY2pD9Hlq33P38
	xc1DnXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbRu-00000002SGc-3ioH;
	Mon, 10 Mar 2025 11:37:34 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trapQ-00000002LjM-0Ukc;
	Mon, 10 Mar 2025 10:57:49 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so1883722a12.2;
        Mon, 10 Mar 2025 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741604266; x=1742209066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xOafrjis4rlmeWlptFsFh4bdDZx32GpWyV/5UBeU/58=;
        b=LU/RQS+F535WXrjj2CK3ldgf08qkhZK4guPnH+StiBXSQvPO+tSkocfwicQpRIVhVX
         0fkWBZ24GoVvfQJ04Lh3g5KbN5e2Nfh+6WVWT8ebzmvyHZsxdA9ccc8whagXPzAxqvDu
         QPsnF5q28Bfk7p93pq9XFA6CQCiGS/A7E+7F08jOg3d4zIrU7xc/88UBoh8GEo10b8OK
         jqUZuSYnyEDu1xy4S9IQNWi6f2Y3nZ+ZwXDKDvgY9kxwki+7zfce13ok4jcP5DaWOR3x
         60YvIvlzWSom/wYZhZvLA6AZH94D/xsg0MmdGUdKLpEiwAH2EFQiZJJ4/1HcyRiJ+1Ub
         O4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741604266; x=1742209066;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOafrjis4rlmeWlptFsFh4bdDZx32GpWyV/5UBeU/58=;
        b=ng8VdoR5rz14OLpwlzmSeUPBc6Ll1KaqqCxP7WWr8+CGeleaosegsZOa1fJnawBgcg
         Z0tUm0FaI1I9UrbecpK1LG4PyGrFluN6X2IzFtGtuv6Jymqrscpv/HMwg578pmJ6v47H
         UmM9xJKk2P5/jPyZhSqTireeHnW2XDev2m3fNZAd3f7Dn+5Raz9Q4JMjkTfncuxylZji
         e0xJc5UJHBHJJGjBAI36kZ5Pvvr++W11f60535+Hc2uY6ov9dYH7qhjbW9qT0o+Sowzd
         6LDJSiqyquGT37HMGTyOsfaJnVVjg5dfiL0UqJAWEyD6K7/e7Weccy2iE01gyBA0l9H9
         dS0w==
X-Forwarded-Encrypted: i=1; AJvYcCUAI62Wy4S9LeloAxNSb6tqGyODcRy+8iEZJpAR0yTMj2lwAuJqAsAUiyPs2Z+uovKqNvWCD3Irxg72InAHZ90=@lists.infradead.org, AJvYcCV6sBwW+AzJmy8u9Ha3Y3zWDADfMsJLJ2StVRKsyvtvWLTRXdczZ6w73uiRPaClG8BygdoYd/v32pa2DcVhcQ9y@lists.infradead.org
X-Gm-Message-State: AOJu0YzPtvwVKYVZe0H092L+pTG6NRCDfOSVjIwgqbexH9v2VebMsG35
	xRUl8m/s5AijwTSb3H2rMppPynfmNbyfiRWZNQNyFnhJyvYngEGq
X-Gm-Gg: ASbGncvoypElf9jbhROqHy7dFkAu+M8VDAdjL+/xfW7HMCskmeO11npaaBEoY+cJdF6
	PrzvRkTv8cBP7FKGIiQ/PmbzspHFAPgyQSYz+0Sc0rBspdaj/Onwii/hiR4iy7cj1u3rS8B7kC8
	Ybj8e88RihPn/EOYSr/c1bBvFa8viMj04678hKNKpBDODVInZCceBZFibjznDQ0S5MJF3jqwG1I
	EagHZeA/kxCZglIegE0YCl0joHcJEZJSH4RO10ED0HAFHqWDKAFJZFlMpEYMtzoWT3whS7346Jc
	fMfiQVvgKeTqQESJvsiNmY+JXR/cvreVq+dLrbStpw==
X-Google-Smtp-Source: AGHT+IGLrFwyyNplAxUO1/Ogn4TU95VnBR/ptGo3XUAJNa2IReXJQVvMshhinBV/v52EUsoHkt8Upg==
X-Received: by 2002:a17:907:94cb:b0:abf:40a2:40c8 with SMTP id a640c23a62f3a-ac252ae1b6emr1330310766b.28.1741604266018;
        Mon, 10 Mar 2025 03:57:46 -0700 (PDT)
Received: from Ansuel-XPS. ([85.119.46.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2856445b1sm321901566b.60.2025.03.10.03.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:57:45 -0700 (PDT)
Message-ID: <67cec5a9.170a0220.93f86.9dcf@mx.google.com>
X-Google-Original-Message-ID: <Z87FpUEtUUQYB6s-@Ansuel-XPS.>
Date: Mon, 10 Mar 2025 11:57:41 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 12/13] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-13-ansuelsmth@gmail.com>
 <Z83WgMeg_IxgbxhO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z83WgMeg_IxgbxhO@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_035748_161694_6F61709E 
X-CRM114-Status: GOOD (  31.73  )
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

On Sun, Mar 09, 2025 at 05:57:20PM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 09, 2025 at 06:26:57PM +0100, Christian Marangi wrote:
> > +static int an8855_port_enable(struct dsa_switch *ds, int port,
> > +			      struct phy_device *phy)
> > +{
> > +	struct an8855_priv *priv = ds->priv;
> > +
> > +	return regmap_set_bits(priv->regmap, AN8855_PMCR_P(port),
> > +			       AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN);
> 
> Shouldn't you wait for phylink to call your mac_link_up() method?
>

Did something change recently for this? I checked the pattern for other
driver and port enable normally just enable TX/RX traffic for the port.

Any hint for this?

> > +}
> > +
> > +static void an8855_port_disable(struct dsa_switch *ds, int port)
> > +{
> > +	struct an8855_priv *priv = ds->priv;
> > +	int ret;
> > +
> > +	ret = regmap_clear_bits(priv->regmap, AN8855_PMCR_P(port),
> > +				AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN);
> > +	if (ret)
> > +		dev_err(priv->ds->dev, "failed to disable port: %d\n", ret);
> 
> Doesn't the link get set down before this is called? IOW, doesn't
> phylink call your mac_link_down() method first?
> 
> ...
> 
> > +static void an8855_phylink_mac_link_up(struct phylink_config *config,
> > +				       struct phy_device *phydev, unsigned int mode,
> > +				       phy_interface_t interface, int speed,
> > +				       int duplex, bool tx_pause, bool rx_pause)
> > +{
> > +	struct dsa_port *dp = dsa_phylink_to_port(config);
> > +	struct an8855_priv *priv = dp->ds->priv;
> > +	int port = dp->index;
> > +	u32 reg;
> > +
> > +	reg = regmap_read(priv->regmap, AN8855_PMCR_P(port), &reg);
> > +	if (phylink_autoneg_inband(mode)) {
> > +		reg &= ~AN8855_PMCR_FORCE_MODE;
> > +	} else {
> > +		reg |= AN8855_PMCR_FORCE_MODE | AN8855_PMCR_FORCE_LNK;
> > +
> > +		reg &= ~AN8855_PMCR_FORCE_SPEED;
> > +		switch (speed) {
> > +		case SPEED_10:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_10;
> > +			break;
> > +		case SPEED_100:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_100;
> > +			break;
> > +		case SPEED_1000:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_1000;
> > +			break;
> > +		case SPEED_2500:
> > +			reg |= AN8855_PMCR_FORCE_SPEED_2500;
> > +			break;
> > +		case SPEED_5000:
> > +			dev_err(priv->ds->dev, "Missing support for 5G speed. Aborting...\n");
> > +			return;
> > +		}
> > +
> > +		reg &= ~AN8855_PMCR_FORCE_FDX;
> > +		if (duplex == DUPLEX_FULL)
> > +			reg |= AN8855_PMCR_FORCE_FDX;
> > +
> > +		reg &= ~AN8855_PMCR_RX_FC_EN;
> > +		if (rx_pause || dsa_port_is_cpu(dp))
> > +			reg |= AN8855_PMCR_RX_FC_EN;
> > +
> > +		reg &= ~AN8855_PMCR_TX_FC_EN;
> > +		if (rx_pause || dsa_port_is_cpu(dp))
> > +			reg |= AN8855_PMCR_TX_FC_EN;
> > +
> > +		/* Disable any EEE options */
> > +		reg &= ~(AN8855_PMCR_FORCE_EEE5G | AN8855_PMCR_FORCE_EEE2P5G |
> > +			 AN8855_PMCR_FORCE_EEE1G | AN8855_PMCR_FORCE_EEE100);
> 
> Why? Maybe consider implementing the phylink tx_lpi functions for EEE
> support.
> 

Will do, I disabled this as the EEE rework was being approved.

> > +	}
> > +
> > +	reg |= AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN;
> > +
> > +	regmap_write(priv->regmap, AN8855_PMCR_P(port), reg);
> > +}
> > +
> > +static unsigned int an8855_pcs_inband_caps(struct phylink_pcs *pcs,
> > +					   phy_interface_t interface)
> > +{
> > +	/* SGMII can be configured to use inband with AN result */
> > +	if (interface == PHY_INTERFACE_MODE_SGMII)
> > +		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
> > +
> > +	/* inband is not supported in 2500-baseX and must be disabled */
> > +	return  LINK_INBAND_DISABLE;
> 
> Spurious double space.
> 

Will drop.

> > +}
> > +
> > +static void an8855_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
> > +				 struct phylink_link_state *state)
> > +{
> > +	struct an8855_priv *priv = container_of(pcs, struct an8855_priv, pcs);
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = regmap_read(priv->regmap, AN8855_PMSR_P(AN8855_CPU_PORT), &val);
> > +	if (ret < 0) {
> > +		state->link = false;
> > +		return;
> > +	}
> > +
> > +	state->link = !!(val & AN8855_PMSR_LNK);
> > +	state->an_complete = state->link;
> > +	state->duplex = (val & AN8855_PMSR_DPX) ? DUPLEX_FULL :
> > +						  DUPLEX_HALF;
> > +
> > +	switch (val & AN8855_PMSR_SPEED) {
> > +	case AN8855_PMSR_SPEED_10:
> > +		state->speed = SPEED_10;
> > +		break;
> > +	case AN8855_PMSR_SPEED_100:
> > +		state->speed = SPEED_100;
> > +		break;
> > +	case AN8855_PMSR_SPEED_1000:
> > +		state->speed = SPEED_1000;
> > +		break;
> > +	case AN8855_PMSR_SPEED_2500:
> > +		state->speed = SPEED_2500;
> > +		break;
> > +	case AN8855_PMSR_SPEED_5000:
> > +		dev_err(priv->ds->dev, "Missing support for 5G speed. Setting Unknown.\n");
> > +		fallthrough;
> 
> Which is wrong now, we have SPEED_5000.
> 

Maybe the comments weren't so clear. The Switch doesn't support the
speed... Even if it does have bits, the switch doesn't support it. And
the 2500 speed is really only for the CPU port. The user port are only
gigabit.

> > +	default:
> > +		state->speed = SPEED_UNKNOWN;
> > +		break;
> > +	}
> > +
> > +	if (val & AN8855_PMSR_RX_FC)
> > +		state->pause |= MLO_PAUSE_RX;
> > +	if (val & AN8855_PMSR_TX_FC)
> > +		state->pause |= MLO_PAUSE_TX;
> > +}
> > +
> > +static int an8855_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
> > +			     phy_interface_t interface,
> > +			     const unsigned long *advertising,
> > +			     bool permit_pause_to_mac)
> > +{
> > +	struct an8855_priv *priv = container_of(pcs, struct an8855_priv, pcs);
> > +	u32 val;
> > +	int ret;
> > +
> > +	/*                   !!! WELCOME TO HELL !!!                   */
> > +
> [... hell ...]

Will drop :( It was an easter egg for the 300 lines to configure PCS.

> > +	ret = regmap_write(priv->regmap, AN8855_MSG_RX_LIK_STS_2,
> > +			   AN8855_RG_RXFC_AN_BYPASS_P3 |
> > +			   AN8855_RG_RXFC_AN_BYPASS_P2 |
> > +			   AN8855_RG_RXFC_AN_BYPASS_P1 |
> > +			   AN8855_RG_TXFC_AN_BYPASS_P3 |
> > +			   AN8855_RG_TXFC_AN_BYPASS_P2 |
> > +			   AN8855_RG_TXFC_AN_BYPASS_P1 |
> > +			   AN8855_RG_DPX_AN_BYPASS_P3 |
> > +			   AN8855_RG_DPX_AN_BYPASS_P2 |
> > +			   AN8855_RG_DPX_AN_BYPASS_P1 |
> > +			   AN8855_RG_DPX_AN_BYPASS_P0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> 
> Is this disruptive to the link if the link is up, and this is called
> (e.g. to change the advertisement rather than switch interface mode).
> If so, please do something about that - e.g. only doing the bulk of
> the configuration if the interface mode has changed.

Airoha confirmed this is not disruptive, applying these config doesn't
terminate or disrupt the link.

> 
> I guess, however, that as you're only using SGMII with in-band, it
> probably doesn't make much difference, but having similar behaviour
> in the various drivers helps with ongoing maintenance.

Do we have some driver that implement the logic of skipping the bulk of
configuration if the mode doesn't change?

Maybe we can introduce some kind of additional OP like .init to apply
the very initial configuration that are not related to the mode.
Or something like .setup?

-- 
	Ansuel

