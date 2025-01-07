Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531B1E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gSoWQY/eDDpwLtJoE6aiLAjnCc8d40/2W7DJFumW/I=; b=MJEAYAfJoD/bwBrXt84k1PbY2D
	VuMyhoos8OTFY6ULdK63qsDlDLaJ5yFWZnAJwnLuf/loyUwwg5JctMUkwuwVgvmt2bTuvJMl1Om28
	RdrpS/zanqyhN9K84qf5n+6on+0chfHOsb4LnlZSaaz/uSzajeJCeHcBGIdGXladP6DXRzAy8ijH2
	5tFKJXNG3l+gUgv3iLIHri0f1vprD/MajzCLPz/jxKO9cJqAxd727NmeMKZvLmUQUdVK4xxAN2jRC
	ptNXAzRHnwUewJMxl4V5PHAv1Jg2c3MaixaKfs+4lZ0QygY4+RzRapwSTYWtPlxOakOApFnLK+m7Y
	O2uSp8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBHl-00000005NwQ-3AAd;
	Tue, 07 Jan 2025 15:14:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBFy-00000005NV1-3nib
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4gSoWQY/eDDpwLtJoE6aiLAjnCc8d40/2W7DJFumW/I=; b=OoLAg7KzDfXcPCgCVhCIwSnKBx
	/SXiH72xU1dmqGQrJcWQAE9z1ltDlAaelJlcXcr1GNYeHqyBv2+3qCufu0SqKzjlDXT6et5/kc2BW
	RnSDv+VJh6DLtmS8+A1OH0keI2BuU6FSStBLTPt4isOvObCVcFk2Ay3p9UhU/om3eeQaZHnQDEsrX
	tZ56HkISeDwBkJIjy4O/kMRC5sFu1QNqZSXZZPkg2pRcCa+du+W4jupPcyJJwsYegLOH8TkE5lsdB
	ZHNO/NvfPaoH1PuQ+48a7qjTAUn/ug6GOrZNF+IsRYE+Xdbuce6+zgL5IYx8sr69svb1YMZ0w9jw4
	aiJp2P9Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53354)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVBFo-0007eg-0H;
	Tue, 07 Jan 2025 15:12:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVBFk-0005OB-2j;
	Tue, 07 Jan 2025 15:12:20 +0000
Date: Tue, 7 Jan 2025 15:12:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <Z31EVPD-3CGGXxnq@shell.armlinux.org.uk>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_071234_943510_EB99BC2A 
X-CRM114-Status: GOOD (  27.79  )
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

On Tue, Jan 07, 2025 at 02:26:05PM +0100, Kory Maincent wrote:
> On Thu, 2 Jan 2025 18:03:52 +0100
> Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> 
> > On Thu, Jan 02, 2025 at 10:48:05AM +0000, Russell King (Oracle) wrote:
> > > On Sun, Dec 22, 2024 at 07:54:37PM +0100, Oleksij Rempel wrote:  
> > > > Here is updated version:
> > > > 
> > > > ports {
> > > >     /* 1000BaseT Port with Ethernet and simple PoE */
> > > >     port0: ethernet-port@0 {
> > > >         reg = <0>; /* Port index */
> > > >         label = "ETH0"; /* Physical label on the device */
> > > >         connector = "RJ45"; /* Connector type */
> > > >         supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported
> > > > modes */
> > > > 
> > > >         transformer {
> > > >             model = "ABC123"; /* Transformer model number */
> > > >             manufacturer = "TransformerCo"; /* Manufacturer name */
> > > > 
> > > >             pairs {
> > > >                 pair@0 {
> > > >                     name = "A"; /* Pair A */
> > > >                     pins = <1 2>; /* Connector pins */
> > > >                     phy-mapping = <PHY_TX0_P PHY_TX0_N>; /* PHY pin
> > > > mapping */ center-tap = "CT0"; /* Central tap identifier */
> > > >                     pse-negative = <PSE_GND>; /* CT0 connected to GND */
> > > >                 };
> > > >                 pair@1 {
> > > >                     name = "B"; /* Pair B */
> > > >                     pins = <3 6>; /* Connector pins */
> > > >                     phy-mapping = <PHY_RX0_P PHY_RX0_N>;
> > > >                     center-tap = "CT1"; /* Central tap identifier */
> > > >                     pse-positive = <PSE_OUT0>; /* CT1 connected to
> > > > PSE_OUT0 */ };
> > > >                 pair@2 {
> > > >                     name = "C"; /* Pair C */
> > > >                     pins = <4 5>; /* Connector pins */
> > > >                     phy-mapping = <PHY_TXRX1_P PHY_TXRX1_N>; /* PHY
> > > > connection only */ center-tap = "CT2"; /* Central tap identifier */
> > > >                     /* No power connection to CT2 */
> > > >                 };
> > > >                 pair@3 {
> > > >                     name = "D"; /* Pair D */
> > > >                     pins = <7 8>; /* Connector pins */
> > > >                     phy-mapping = <PHY_TXRX2_P PHY_TXRX2_N>; /* PHY
> > > > connection only */ center-tap = "CT3"; /* Central tap identifier */
> > > >                     /* No power connection to CT3 */
> > > >                 };
> > > >             };
> > > >         };  
> 
> Couldn't we begin with something simple like the following and add all the
> transformers and pairs information as you described later if the community feels
> we need it?

+1.

> mdis {
> 
>     /* 1000BaseT Port with Ethernet and PoE */
>     mdi0: ethernet-mdi@0 {
>         reg = <0>; /* Port index */
>         label = "ETH0"; /* Physical label on the device */
>         connector = "RJ45"; /* Connector type */
>         supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported modes */
>         lanes = <2>;
>         variant = "MDI-X"; /* MDI or MDI-X */
>         pse = <&pse1>;
>     };
> };

We already manage well enough without anything like this level of
detail of a RJ45 socket, so why don't we start off with something
very simple. I'm thinking that even giving the supported-modes
argument is too much here - have we *ever* had the case where an
ethernet port can't support all the speeds that it's associated
PHY supports?

> We can also add led, thermal and fuse subnodes later.
> Let's begin with something simple for the initial support, considering
> that it has places for additional details in the future.

What I think we both fear is having a complex DT description of a
port that the kernel mostly ignores. While we can come out with the
"but DT describes the hardware" claptrap, it's no good trying to
describe the hardware in a firmware description unless there is some
way to validate that the firmware description is correct - which
means there must be something that depends on it in order to work.

If we describe stuff that doesn't get used, there's no way to know
if it is actually correct. We then end up with a lot of buggy DT
descriptions with properties that can't be relied upon to be
correct, and that makes those properties utterly useless.

I'm sure DT maintainers will disagree due to the "DT describes the
hardware" but... I've said it here, and if we end up with stuff
over-described wrongly creating a mess, I'll be able to point back
at this!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

