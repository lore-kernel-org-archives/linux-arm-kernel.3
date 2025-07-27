Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B994C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgcaSBrVCciGkW/9wHNmmtdtZky2ZFmyIYefiynEDqc=; b=BflinUX+PkoEZmBfk8qF9Auc8r
	2U1mbBYuFzJ9BMN5+BMYnK7VpEVE6Fn/rE2xKTxwH7BaJxS4qIAE6ZP6LTF6Wdtv6yI7YE4B9boAo
	Zk0cGE7kLAA9UQlXlHaMp2lfVCgCT2S3vpMnlHmpUCGaM93drivilWkEdrSDceWGQzvmUlUsyCYEC
	wiEIeFb8rTMiY8fsBkdagnMZObhkdZgS+uhBJgFShL3r40obHVFJNXCqbgKR6gLfBzZ6SIDpLdUCG
	32eUgbKCImqqQ1AnvywF1LDFv830RUUKGY3gOosqXOayK5lI4avhYIGCKlrEobmwxRKBG51p8SmwD
	SUsGckjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufyCd-0000000CZaX-2oTU;
	Sun, 27 Jul 2025 10:01:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufyA6-0000000CZBP-1c7x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 09:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bgcaSBrVCciGkW/9wHNmmtdtZky2ZFmyIYefiynEDqc=; b=Rw9v4iQZI8V77POV1SbIpK9YhU
	h+gtpTCZNqbgj5sZ3e/6KTwa4J1ulOO5aS1V0/lEnzKagZx7etOLTPnaiOu3RoOCnwPydslEz4pu0
	H8GSE6ZGDN5AGlB6A0yxJ4Eh4L9/EQfck95HGdfCXdarQRqlyGfmq8k/VFLQco2EEg/5c0/Rf5EMz
	kingW6H8tyaFUVBH98+Cag2A9EGkfQ+cibNdNgwdhwM5zCwpS749KowgdCDpi87btXj7zcyMAevOm
	Z8heZ2JV6vSzXhYtTDCji9wcvOdD01tdck1+9t+PSpk8UqlXdd5dDW8MDOiv5Je+iKDBQkd6sxTw1
	bYCYZkMQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47138)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ufy7o-00079q-34;
	Sun, 27 Jul 2025 10:57:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ufy7g-0003fM-1B;
	Sun, 27 Jul 2025 10:56:52 +0100
Date: Sun, 27 Jul 2025 10:56:52 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 07/15] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-8-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-8-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_025922_426542_586E7EDF 
X-CRM114-Status: GOOD (  13.16  )
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

On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
> +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
> +{
> +	struct phy_device *phydev = upstream;
> +	struct phy_port *port = phy_get_sfp_port(phydev);
> +
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
> +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> +	phy_interface_t iface;
> +
> +	linkmode_zero(sfp_support);
> +
> +	if (!port)
> +		return -EINVAL;
> +
> +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
> +
> +	if (phydev->n_ports == 1)
> +		phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
> +
> +	linkmode_and(sfp_support, port->supported, sfp_support);
> +
> +	if (linkmode_empty(sfp_support)) {
> +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> +		return -EINVAL;
> +	}
> +
> +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);

I've been moving phylink away from using sfp_select_interface() because
it requires two stages of translation - one from the module capabilties
to linkmodes, and then linkmodes to interfaces.

sfp_parse_support() now provides the interfaces that the optical module
supports, and the possible interfaces that a copper module _might_
support (but we don't know for certain about that until we discover a
PHY.)

The only place in phylink where this function continues to be used is
when there's an optical module which supports multiple different
speeds, and we need to select it based on the advertising mask provided
by userspace. Everywhere else shouldn't use this function, but should
instead use the interfaces returned from sfp_parse_support().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

