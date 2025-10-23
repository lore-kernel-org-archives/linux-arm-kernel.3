Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD97CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 07:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuwZwT+5jyvhDDTG/W4OLKYq+tnCcDl94SXGHBKrC1o=; b=aoom9suDqGsJ/njr+RzM/rmQbg
	5RKrV72sx3brLcUBfddvtqwAl3dJGVS68habYLhleC6HNpPxRIjF76rFgGxUChcnJkaCs/Hmb0lPv
	wFQlAMqjKakEjV+yGdVjI7hUNTHtC8hPWLChibYTmAxN/Cd6b44So4X+kPu+/KpMw0x5aAjCnIJf0
	UhrPzLBiML44Y8O2F6FfXh5CPcQKsFok2ujqGyZYmzVBqg1PvO69J1VbJHF7c0LAjFpko5w7cOTpd
	hWWC4cVkcW4rBqidjWSAkaIqla119qKvvPnViuhGnQfo0WAl0rb1wKpuSsf0xxRLK1KVtv0a+na7L
	9MzVxIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpzE-00000005PfC-0DzT;
	Thu, 23 Oct 2025 07:43:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpzA-00000005Pc6-2ZGF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 07:43:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C2DC34E41295;
	Thu, 23 Oct 2025 07:43:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C6406062C;
	Thu, 23 Oct 2025 07:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC5BD102F2429;
	Thu, 23 Oct 2025 09:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761205424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FuwZwT+5jyvhDDTG/W4OLKYq+tnCcDl94SXGHBKrC1o=;
	b=KWG10gkjd1CX/r8TdNuB+zDc1mBWazqjexcpaPfoy9c1Itkz/VUMaMVGIg72x4Z10Mnovj
	Bsnrww7ShvAkm8U+6G1RSwVxRSeKSeVlXh+v95ZWtr9rV1XIYq7/nfnSF8zvMdPnlc3mrZ
	mqhbvqZIj/h3KZwoVZePWzhm/h2sPh2iVAH8FZ+RN58qg51UiQuo3N/CjLITx+oYuzXSQz
	uLcAREp/mbZz+YjwXbqqwl8okzC0jjXcyt3e5WjWGQezQl1LMBbKluUBgCM9euKYPfYLwf
	mgQz5raHiaT1D1UmIPtd406mEXQX4xjKfh83tFSlIE2txwKMJf0alP9ETs03mw==
Message-ID: <d798cbb4-74f8-47fd-98e8-0d6d6e9f8621@bootlin.com>
Date: Thu, 23 Oct 2025 09:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 03/16] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-4-maxime.chevallier@bootlin.com>
 <cb217bf8-763e-4c48-9233-e577b32b14a8@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <cb217bf8-763e-4c48-9233-e577b32b14a8@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_004348_924245_C7755AED 
X-CRM114-Status: GOOD (  18.28  )
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

Hi Andrew,

On 22/10/2025 23:42, Andrew Lunn wrote:
> On Mon, Oct 13, 2025 at 04:31:29PM +0200, Maxime Chevallier wrote:
>> In an effort to have a better representation of Ethernet ports,
>> introduce enumeration values representing the various ethernet Mediums.
>>
>> This is part of the 802.3 naming convention, for example :
>>
>> 1000 Base T 4
>>  |    |   | |
>>  |    |   | \_ lanes (4)
>>  |    |   \___ Medium (T == Twisted Copper Pairs)
>>  |    \_______ Baseband transmission
>>  \____________ Speed
> 
> Dumb question. Does 802.3 actually use the word lanes here?

Depending on the mode, 802.3 uses either "pair" or "lane" :

1.4.13 1000BASE-T: IEEE 802.3 Physical Layer specification for a
1000 Mb/s CSMA/CD LAN using four pairs of Category 5 balanced
copper cabling.

1.4.26 100GBASE-CR2: IEEE 802.3 Physical Layer specification for
100 Gb/s using 100GBASE-R encoding over two lanes of shielded
balanced copper cabling.

> I'm looking at the commit which added lanes:
> 
> commit 012ce4dd3102a0f4d80167de343e9d44b257c1b8
> 
>     Add 'ETHTOOL_A_LINKMODES_LANES' attribute and expand 'struct
>     ethtool_link_settings' with lanes field in order to implement a new
>     lanes-selector that will enable the user to advertise a specific number
>     of lanes as well.
> 
>     $ ethtool -s swp1 lanes 4
>     $ ethtool swp1
>       Settings for swp1:
>             Supported ports: [ FIBRE ]
>             Supported link modes:   1000baseKX/Full
>                                     10000baseKR/Full
>                                     40000baseCR4/Full
>                                     40000baseSR4/Full
>                                     40000baseLR4/Full
>                                     25000baseCR/Full
>                                     25000baseSR/Full
>                                     50000baseCR2/Full
>                                     100000baseSR4/Full
>                                     100000baseCR4/Full
>             Supported pause frame use: Symmetric Receive-only
>             Supports auto-negotiation: Yes
>             Supported FEC modes: Not reported
>             Advertised link modes:  40000baseCR4/Full
>                                     40000baseSR4/Full
>                                     40000baseLR4/Full
>                                     100000baseSR4/Full
>                                     100000baseCR4/Full
> 
> 
> For these link modes we are talking about 4 PCS outputs feeding an
> SFP module. The module when has one fibre pair, the media.
> 
> For baseT4 what you call a lane is a twisted pair, the media.
> 
> These two definitions seem to contradict each other.
> 
> For SGMII, 1000BaseX, we have 1 PCS lane, feeding a PHY with 4 pairs.
> 
> It gets more confusing at 10G, where the MAC might have 4 lanes
> feeding 4 pairs, or 1 lane feeding 4 pairs.
> 
> Also, looking at the example above, if i have a MAC/PHY combination
> which can do 10/100/1G and i did:
> 
>     $ ethtool -s swp1 lanes 2
> 
> would it then only advertise 10 and 100, since 1G need four 'lanes'?

Ah right ! Yeah so lanes isn't about the MDI directly then, so
clearly this won't work :(
> 
> Is reusing lanes going to cause us problems in the future, and maybe
> we should add a pairs member, to represent the media? And we can
> ignore bidi fibre modules for the moment :-)

That's a very good point, I think this makes more sense. I've also
seen the word "channel" around, but Pair would be more explicit.

thanks for the feedback !

Maxime
> 
>        Andrew


