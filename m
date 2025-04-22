Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1BEC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0S8t/6FGxg47c0LEtOaE/CH+Zrp13P24zwNFo5jGGw=; b=yzR6CMZydu8y9LKBz6M/r2IDd/
	ZBZ3TJXCe/S92jDzfihjDbOBq20oXMo7VEszUPYeBkOOFSbY1U+dVuQJFsMh5+pxhazGdp4kx+NOB
	lbPlVWBiXk8EZTFnnvTaSKhoJyjbW1NLMA+f0U0Bu0XXpxPIziNZYIL+K02hI5X42d/41ziSIg6Vb
	PN+ap4CtbwVLqdLOkASSUS4Rw3LqyvRhErXqh4mD6xexqIbsn88EUXLGMXBkX0dru9KXyGM7JvUa3
	C/mf3+YKcgwE2nWdI+AccOQsA65TDbLPY4oSHU/Pbg5JPhurW9A2lSWD8eU4W5tNUIkvkeuYZimRS
	kFh0SePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8a-000000085dJ-2aaP;
	Tue, 22 Apr 2025 18:14:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Enm-00000007Xzu-41TX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=W0S8t/6FGxg47c0LEtOaE/CH+Zrp13P24zwNFo5jGGw=; b=LNDMR9KGZUOWw2nq8JndcvNeF/
	UlrAChAS6n9brfhMKUvxfErkEiAKWZfUakTgo1Kkbz1sy/lTjGFy4FUuQ/j1f6howOfcfwKPT3E3w
	xIqAYCKilAfznPhLUM091UBTLzpjpG4jgH+P8NwnhBhr/88g68aCbnmxfY71+QOETvkc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u7EnR-00ADBy-Ka; Tue, 22 Apr 2025 16:40:25 +0200
Date: Tue, 22 Apr 2025 16:40:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <d79ed229-f0b7-441a-b075-31fd2b2f8fe6@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
 <cd483b43465d6e50b75f0b11d0fae57251cdc3db.camel@ew.tq-group.com>
 <5d74d4b2-f442-4cb8-910e-cb1cc7eb2b3d@ti.com>
 <b53fba84c8435859a40288f3a12db40685b8863a.camel@ew.tq-group.com>
 <aAdZoMge_CKtqokU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAdZoMge_CKtqokU@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_074046_995361_C1671CB8 
X-CRM114-Status: GOOD (  23.80  )
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

> I'm hoping that Andrew will read my email form yesterday and reconsider
> because to me this is a backwards step

I will get back to that in a minute.

> > On Linux, there currently isn't a way for the MAC driver to query from the PHY
> > whether it could include the delays itself. My assumption is that most PHYs
> > either don't have internal delays, or the delays are configurable.
> 
> motorcomm, dp83tg720, icplus, marvell, dp 838678, adin, micrel, tja11xx,
> vitesse, dp83822, mscc, at803x, microchip_t1, broadcom, dp83869,
> intel-xway, realtek all do handle internal delays. I haven't checked
> whether there are PHYs that don't - that's harder because we don't know
> whether PHYs that don't mention RGMII in the driver actually support
> RGMII or not.

I did look through this once. There are no PHYs with Linux drivers
which support any of the RGMII without supporting all 4 RGMII
modes. So we should just assume all RGMII PHYs can add the delays.

If i remember the history correctly, Renesas built an RDK with a PHY
which did not support RGMII delays. So they where forced to do the
delays in the MAC. But it seems like mainline support for that PHY
never happened.

> 
> > If this is
> > the case, having the MAC add them in internal-delay modes and not adding them on
> > the PHY side would be the best default (also for PHY-less/fixed-link setups,
> > which should be handled like a PHY without internal delay capabilities.)
> 
> See my "advanced" use case above. We do have drivers doing that.

I agree with Russell here, it is the worse default, not the best
default. It makes it different to nearly every other MAC driver. It
needs extra work in the MAC, which most MAC drivers get wrong. They
also tend not to call out they have done it different to every other
MAC driver in Linux, and so it does not get the needed extra review,
and so is broken. I also think there is some 'vendor SDK' mentality
here. Our MAC can do this, our SDK allows it, the Linux driver must
have it and use it. Pretty much all hardware has features which never
get used, but vendors sometimes have issues with just leaving it
unused.

	Andrew

