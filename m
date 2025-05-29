Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B039C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBTL/STJmtvp2VqDgiDgK4iklSQ0paUUUgoWg/0K4tc=; b=cwCirkkTaWUA2HRipmEjBVuxE/
	BrpjPh4Br+J16BUNsPIguZH9TLuwgRdH7McGRp8ITh22rC09BKUfFPIiPy/HEDVK+RqCmP+yNEHAE
	Vjk+8sFD7bfx+tqLXjIiIOJ9LoxSZYKifuUrNx1ALFnkJ036Em6ywXrFq+JirQrXcAsCdVfWQdXzG
	oMcVNNF74S60Hl8BIrbJcWqAIhCygh9L62hro9vR/jOMIAh9jaZz2HVpewXOdRfS5IwZdUJbGiBc8
	/V06DbEOJrT957Dr747R6Zbl4SvWaMu78Hlehp/Q/8eZ1DgCPdQ680aHanl4XyvVgoneM0C7o3NHT
	R8Gc9bBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKe92-0000000FxP5-06bv;
	Thu, 29 May 2025 14:22:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdEU-0000000FqfO-2Nf5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zBTL/STJmtvp2VqDgiDgK4iklSQ0paUUUgoWg/0K4tc=; b=HV2UtNB2S1YdQPm65D3plaVeJJ
	rS8dbZCmEBE8hNa2SKqutR8/LSMMDcPJCzrBeKp7x9VeDvjUE8kZAiefsXQgFAYOyPLvpbJLscpb7
	hsUlRtD+mvZ7xh5a58YHxqMIL0Edd26bJ513M5L6iHeoHzpJdmLiktSVODuAfOXtH6Yoj7aKBP9rf
	bpFmXHijHgT4dfAYYFX+T1wiE+fxLo12DRGJOZJFDCAt//iquqt3pEiLLE4JnuwQkNeVIS1tJRC+K
	ZaGnGtO/q++vAZWrS88u3tU0udE6CGIc+ctokgqA56J/0xF3HrI3DYNHi8u4kDZzY/9jIx5DhK9l5
	UxuuEzjg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43512)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uKdEG-0001Qi-0z;
	Thu, 29 May 2025 14:23:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uKdEA-0003Ti-1O;
	Thu, 29 May 2025 14:23:22 +0100
Date: Thu, 29 May 2025 14:23:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
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
	Rob Herring <robh@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 06/14] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <aDhfyiSOnyA709oX@shell.armlinux.org.uk>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <23936783.6Emhk5qWAg@fw-rgant>
 <20250523145457.07b1e7db@2a02-8428-0f40-1901-f412-2f85-a503-26ba.rev.sfr.net>
 <13770694.uLZWGnKmhe@fw-rgant>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13770694.uLZWGnKmhe@fw-rgant>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_062342_607425_F2357FB9 
X-CRM114-Status: GOOD (  10.57  )
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

On Wed, May 28, 2025 at 09:35:35AM +0200, Romain Gantois wrote:
> > In that regard, you can consider 1000BaseX as a MII mode (we do have
> > PHY_INTERFACE_MODE_1000BASEX).
> > 
> 
> Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes you're 
> right.

1000BASE-X is exactly what is described in IEEE 802.3. It's a PHY
interface mode because PHYs that use SerDes can connect to the host
using SGMII or 1000BASE-X over the serial link.

1000BASE-X's purpose in IEEE 802.3 is as a protocol for use over
fibre links, as the basis for 1000BASE-SX, 1000BASE-LX, 1000BASE-EX
etc where the S, L, E etc are all to do with the properties of the
medium that the electrical 1000BASE-X is sent over. It even includes
1000BASE-CX which is over copper cable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

