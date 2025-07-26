Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744F8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 21:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqIsyHweDQuU/cfkFMj4zECHx2q4S7M+MS7iuNNPSZM=; b=0JWgdCeq0a5y69IA/9ZaoD/Gjk
	4D+6XKV08VJnl3SCG39I2cIOxx9VyIvsrm2Yc76eTeNQ9i6ZtyVaOfR8fk5d5whIYp/YENmZmf5Iv
	DmLxbseMLnmWz5lpdHYkLtDlryD9a6xiArLAbUizkSn27NjP943mpeyiI9igUZPsW8OtKsZWFnZX7
	AuIabCHBYYi4fA1kG9pNGx4agdlJY9vB9tTHbrN5h9NA5IiIsPOT2VUjeAktbM1BRycNhlJDWGwKo
	f+0jJAZA7DCQFL7LoDB6A69YbW07ofW5UtTA0YDajmEtQe9Z2eeT4cnaHkzJ2Kmnhdq0+Z+NnaYBG
	NJglRvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmRI-0000000BwBl-1Iuw;
	Sat, 26 Jul 2025 21:28:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmNm-0000000BvpX-2ZKz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 21:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uqIsyHweDQuU/cfkFMj4zECHx2q4S7M+MS7iuNNPSZM=; b=iZCBryENHxBWgI+GZsRBHrXiTy
	eErR82jHlEPktXtCg+QSTH37YVCSi7sIlSpVqU0b2jGd0mWdtMisbLN/AXuztAPonw18G1bt5j6pZ
	Tuh5vGWU0kSOU6K4XV8BCmikFpoqOA15XyIbDgJ94v/SUxNFZwnUhBz9kykBYmvtxfoM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ufmNg-002y6t-0q; Sat, 26 Jul 2025 23:24:36 +0200
Date: Sat, 26 Jul 2025 23:24:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH net-next v10 11/15] net: phy: at803x: Support SFP through
 phy_port interface
Message-ID: <67dd0a3e-12ac-49ab-aec1-f238db7030e6@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-12-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-12-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_142442_658829_C653FFC0 
X-CRM114-Status: GOOD (  17.21  )
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

On Tue, Jul 22, 2025 at 02:16:16PM +0200, Maxime Chevallier wrote:
> Convert the at803x driver to use the generic phylib SFP handling, via a
> dedicated .attach_port() callback, populating the supported interfaces.
> 
> As these devices are limited to 1000BaseX, a workaround is used to also
> support, in a very limited way, copper modules. This is done by
> supporting SGMII but limiting it to 1G full duplex (in which case it's
> somwhat compatible with 1000BaseX).

Missing e

> +static int at8031_attach_port(struct phy_device *phydev, struct phy_port *port)
>  {

...

> +	if (!port->is_mii)
> +		return 0;

That seems common to all these drivers? Can it be pulled into the
core?

> -	if (iface == PHY_INTERFACE_MODE_SGMII)
> -		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");

I think we need to keep this warning. I don't remember the details,
but i think this is the kernel saying the hardware is broken, this
might not work, we will give it a go, but don't blame me if it does
not work. We need to keep this disclaimer.

	Andrew

