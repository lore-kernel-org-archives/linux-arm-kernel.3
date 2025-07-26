Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0201C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 20:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdOZ/BpVWuZo4SXqhPcslF3K2uypFYqv/BJB8/Epd/U=; b=lvYEbMQAduljOQyuOxRSoJSX0l
	5mh+4OO5HSrWhAwhpDv2I37GupLMUM6AzGqgra6Zfx3QSjQyCJKMDmpyfakRebN0jANY4L6e4yKJ4
	ngxJ2yiRlHmu94zwkWhs0YFr4L+q1PG1rSHEAsoFxO6LOwpH+3c9qoy15cXhZDa76tTEDO+5nhIcr
	hD9laVmNlWWcKS8JVoDhYq7bo8zQkNah5nY0eWv+ZaTJkiW95n5nBAHPQhs7CBhSXYHaQ9xyuyD8X
	fhiibsqFwnGmqKaVL6bYE6FLHg5uWp3qS9EX/20HV44AqrIEPOusmK+bcAE30Gdc980/ARE/pAN+D
	fHH3aDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflho-0000000Bruz-06FL;
	Sat, 26 Jul 2025 20:41:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflfC-0000000BrZz-1eRq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 20:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IdOZ/BpVWuZo4SXqhPcslF3K2uypFYqv/BJB8/Epd/U=; b=N6zFuSXx39EWTD28RZSXtzT2UI
	5s014y1jMHntFTUyLiW+BSGmS0T+ZXfmQQwYAA4G7EuiAalogyD/zaY/Mr+r2s1b0RiS4bhGaPn9p
	1j8T3MkambSaVb6OusqZd7+uzyPUE0F5Kaz2v+LZhefJlYGryYLxqcDPv2jnlja9OwNM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uflf6-002xsg-Fy; Sat, 26 Jul 2025 22:38:32 +0200
Date: Sat, 26 Jul 2025 22:38:32 +0200
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
Subject: Re: [PATCH net-next v10 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <bec1b52f-d33d-4088-9d88-3345ecd0fa69@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-5-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-5-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_133838_437708_60E45BD9 
X-CRM114-Status: UNSURE (   9.90  )
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

> +static int phy_default_setup_single_port(struct phy_device *phydev)
> +{
> +	struct phy_port *port = phy_port_alloc();
> +
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->parent_type = PHY_PORT_PHY;
> +	port->phy = phydev;
> +
> +	/* Let the PHY driver know that this port was never described anywhere.
> +	 * This is the usual case, where we assume single-port PHY devices with
> +	 * no SFP. In that case, the port supports exactly the same thing as
> +	 * the PHY itself.

I wounder if you should hook into __set_phy_supported() so that DT
max-speed, and the MAC driver calling phy_set_max_speed() are covered?

	   Andrew

