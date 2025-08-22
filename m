Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C95FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cVjVZ5wfnye80ZbXrAniO6QjKQrZFpfgRoqYcTlg4w=; b=g5adNP3PqnIpAxL3WTdLTz4UPz
	6qsNUZItpZ1rgR46s1itK+3MHQE5QyuVtFjy/6y9bznTcafaH5y25YeG1BRfT8WKR/QYKDvUK7wxZ
	AfW/RH75BoVqNtLLy37ztC4HD66eK6qw5q0lRcN7WbW7prAzwhV31exhJmUIqnixsJgWCt0WgvYzO
	QqFwJ7OmEgWtgVuvJ3VLS/rRT8tC1H+UfGa33Izd062s4RYSQ6daXNDEwuzcZJCi0n2yeI/5tLiNs
	uA1VInwIB2emi3Gl4LSJjUnVFOKsWpCApBMGvIpJzPutwmVOOg20CUAbb3G9XzVYf90zue53JCnpk
	AbD1a8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZbu-00000003YBE-3L04;
	Fri, 22 Aug 2025 21:47:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOiM-000000029sq-0Fjk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:09:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9A1651A0BD3;
	Fri, 22 Aug 2025 10:09:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 671B8604AD;
	Fri, 22 Aug 2025 10:09:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 064AF1C22CE69;
	Fri, 22 Aug 2025 12:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755857378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6cVjVZ5wfnye80ZbXrAniO6QjKQrZFpfgRoqYcTlg4w=;
	b=1D3gQZVHT49ReUfvBPoqsjhy5kAYBmEOOV3UyYLH7mKyxQqQDOi+nlP4rdGSfeKwuE7Hfr
	0whhtCYevKSVM1zUub/qm+jbfOsQDsKCC3ry8/raGb19f+gru2PjyJ0f6lVSet5hj3AigZ
	D/eSO0D57bC9mxgTjJLpLte7t/2xEH2JMjm1HpdvoOyCkL4A/AQo4RcU+vqy16i2k0yDtl
	uZgasz8gZ1WPKGx2JxF4/y4rcL6DObniEvDvHYFNjdgBMtr4FCozKZhXhObVB19MYYpSu/
	03d2cX2haqW3hwkWm0vEqOCPaz8NZUEHqVb/JEUWSeYn/eDjGazviSoFtIQ50A==
Message-ID: <a30d00cd-9148-423b-a3e5-b11d6c5c270b@bootlin.com>
Date: Fri, 22 Aug 2025 12:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 07/15] net: phy: Introduce generic SFP
 handling for PHY drivers
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-8-maxime.chevallier@bootlin.com>
 <aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_030942_239613_A597D809 
X-CRM114-Status: GOOD (  19.20  )
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

Hello Russell,

I'm re-replying here even though a more recent version was sent, as I 
realise I forgot to fully address that.

On 27/07/2025 11:56, Russell King (Oracle) wrote:
> On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
>> +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
>> +{
>> +	struct phy_device *phydev = upstream;
>> +	struct phy_port *port = phy_get_sfp_port(phydev);
>> +
>> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
>> +	DECLARE_PHY_INTERFACE_MASK(interfaces);
>> +	phy_interface_t iface;
>> +
>> +	linkmode_zero(sfp_support);
>> +
>> +	if (!port)
>> +		return -EINVAL;
>> +
>> +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
>> +
>> +	if (phydev->n_ports == 1)
>> +		phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
>> +
>> +	linkmode_and(sfp_support, port->supported, sfp_support);
>> +
>> +	if (linkmode_empty(sfp_support)) {
>> +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> 
> I've been moving phylink away from using sfp_select_interface() because
> it requires two stages of translation - one from the module capabilties
> to linkmodes, and then linkmodes to interfaces.
> 
> sfp_parse_support() now provides the interfaces that the optical module
> supports, and the possible interfaces that a copper module _might_
> support (but we don't know for certain about that until we discover a
> PHY.)
> 
> The only place in phylink where this function continues to be used is
> when there's an optical module which supports multiple different
> speeds, and we need to select it based on the advertising mask provided
> by userspace. Everywhere else shouldn't use this function, but should
> instead use the interfaces returned from sfp_parse_support().
> 

In any case, we'll eventually have to select one of the interfaces if 
there are multiple matches from the sfp_parse_support. phylink maintains 
a sorted list of interfaces used as a preference, I think we should use 
the same list for phy-driver SFP. I'm thinking about moving 
phylink_choose_sfp_interface() in the sfp code, would you be OK with that ?

Maxime


