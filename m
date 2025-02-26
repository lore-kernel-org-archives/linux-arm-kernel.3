Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA2AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qr8ZzAHwUGa1pa18g5lB7LpvO3T+N6fqzFerpRdWrhw=; b=J181VzPP4WXokNqCsZlwsUqNg1
	wSi6TXLgNMtzL2T/aKDK8UVoMWBdYiPnF0gOb+6y97M9M8qT1DW5av1PSvsY0P+NiqLBr7gQnpCG0
	57N+oXMYMk/znGp0XwPFxfQ7VWoz9Iw6dc7RcCxgmqpM8ulAcRX064ir4/hu4IkgAzisQyzshaZQ9
	vDsOfi4O3isohpTto1KUR0OPLfMrCDB6s4D+kZHC2VfXt2zrLONVNBIsW7oAp8ErQpBSsp4m9GpeL
	RVC9CDzK6j6QOc5Dgu4XugDQy4NLwfjO97FMW1r9A0GOionZFMnnWZCn41O7S8UhgVrBjDuFbqnKa
	BTV7SXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFg-00000004H4w-3O1M;
	Wed, 26 Feb 2025 15:23:12 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJ2h-00000004DTD-0oyB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:09:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57D6044262;
	Wed, 26 Feb 2025 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740582581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qr8ZzAHwUGa1pa18g5lB7LpvO3T+N6fqzFerpRdWrhw=;
	b=iKDOgaJ5wJ04L921BEqnnpQzVMZYbO+FPuNCfmaOfFvJBXvFXqSRGdmxiiyzN5wYUKGpTe
	ksC8H3kElU61IV8Rgvtmtey+NZpSMOrM0I6A2CjP2BzPZZm/kzgTFcmqafGH1cndkgwIrA
	gjzMkWft0EEuLzTYcjzr1+AqPdSpKUMStQB+KKVbnI0SNgp95ofpXrtoFHLWe5pabEGZWT
	VZeOdtBO3EP0aXdvQ/kqXOAcpP5tLmJUdzvT8cIfUk3q4vayLkTlnZAHBR23IVzBGj9ob4
	ZZRu/JA1Fp5OnabcH56WOTsUII9MNzAB2DK/3izzPlsaNB2PD1/wmndXu56vFQ==
Date: Wed, 26 Feb 2025 16:09:38 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v2 11/13] net: phy: phylink: Add a mapping
 between MAC_CAPS and LINK_CAPS
Message-ID: <20250226160938.101be22d@fedora.home>
In-Reply-To: <Z78fKCZl4-77NjeK@shell.armlinux.org.uk>
References: <20250226100929.1646454-1-maxime.chevallier@bootlin.com>
	<20250226100929.1646454-12-maxime.chevallier@bootlin.com>
	<Z78fKCZl4-77NjeK@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfelledvtdffvdekudeijeduueevvdevffehudehvdeuudetheekheeigfetheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepr
 ghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_070947_743111_8E7CBF98 
X-CRM114-Status: GOOD (  21.76  )
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

On Wed, 26 Feb 2025 14:03:20 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Feb 26, 2025 at 11:09:26AM +0100, Maxime Chevallier wrote:
> > phylink allows MAC drivers to report the capabilities in terms of speed,
> > duplex and pause support. This is done through a dedicated set of enum
> > values in the form of the MAC_ capabilities. They are very close to what
> > the LINK_CAPA_xxx can express, with the difference that LINK_CAPA don't
> > have any information about Pause/Asym Pause support.
> > 
> > To prepare converting phylink to using the phy_caps, add the mapping
> > between MAC capabilities and phy_caps. While doing so, we move the
> > phylink_caps_params array up a bit to simplify future commits.  
> 
> I still want to know why we need to do this type of thing -

Sorry not to have included more details on the why. The main reason is
for the phy_port work. In the previous phy_port series [1] I included an
attempt at making a first step forward with PHY-driven SFP, so that
phylib itself provides the sfp_upstream_ops and not individual PHY
drivers. That's to get a better handling for multi-port PHYs, which is
one of the end-goals.

[1]: https://lore.kernel.org/netdev/20250213101606.1154014-1-maxime.chevallier@bootlin.com/

As part of that PHY-sfp work, I find it very useful for PHY drivers to
be able to tell what phy_interface_t they can expose on their serdes
interfaces, and from then build a list of linkmodes to get an idea of
what we can support on that port. That's why I'm extracting that out of
phylink.

I did see that you suggested having phylink involved for PHY sfp maybe,
but TBH I don't even know where to start, so I took a safer approach
with phylib-driven SFPs.

> unfortunately I don't have time to review all your patches at the
> moment. I haven't reviewed all your patches since you've started
> posting them. Sorry.

No worries, I understand that that whole work is quite the mouthful and
implies some involved reviews. But even discussing higher level stuff,
like we do now, helps me steer that work in the right direction and
hopefully make it easier for you and the other PHY maintainers to
review that in the future.

Maxime

