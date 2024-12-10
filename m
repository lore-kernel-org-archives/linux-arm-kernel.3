Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0F0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqR4+EDOTOKUygjAju/GpX8orxXt5neI5PHSlKTEs2U=; b=b7vTh6SG5a5lm72xiiutX4W4CN
	1q701xLno5lXR3mBp+NRrABHfpza0Fwvu3fNPC8mqXwT3pGgv/jqtwiJU/8lOymTKIQDqmmyOLfqg
	etxpFtipPpCc97CGvSrD8S0JvPg4Apq4Os4jdlzkyOytVnguSZEmczVFsM+R3Q3axnGMIo5rt7X0Z
	9Oo432mxWq7iQ0KKFuigCd3+BaFFA8KaEgpZWWVEiVYVQb+GfS6cdrNEvEcgqpsrh1O2dO/qQkJdW
	HeWRLu+AShaZd1hd7TK+B5u1EZJoWaKMDSYVr6UnbW/f+v3yDyrUZ8omXRXBgFRRYY58LoAAfEpKw
	jZTQMu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6KY-0000000CZw8-2SUx;
	Tue, 10 Dec 2024 19:55:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6JV-0000000CZo1-20v2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qqR4+EDOTOKUygjAju/GpX8orxXt5neI5PHSlKTEs2U=; b=cAsno5oYRVseXjiVyM/UxIK07w
	qtwmVLePT9tyGDCOACnIbCo40y4bTizPr6kk63/9XWmj/J55i3q114gzkNk4xoRKYXmQOOdNnUIwd
	e0z5ZPxhUJZrzSP4ACjLwX4i6KMaSWHX+743h08HRYQNDmcTQeeK8YlV1y3hzlnQT+Iw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tL6JH-00FqUX-Bp; Tue, 10 Dec 2024 20:54:19 +0100
Date: Tue, 10 Dec 2024 20:54:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Subject: Re: [PATCH v2 5/5] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and
 MBa62xx carrier board Device Trees
Message-ID: <2953e10c-0a57-4d49-b831-3864a07eefd5@lunn.ch>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <95ff66ca2c89f69d893c2ce9eed9a0c677633c7b.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
 <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
 <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
 <e16076d16349e929af82fa987a658bff1d9804c4.camel@ew.tq-group.com>
 <a2a2f201-73a4-4a99-baef-0d593a88c872@lunn.ch>
 <309052f3f69950fe43390505cc7254aee8c8f5c6.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <309052f3f69950fe43390505cc7254aee8c8f5c6.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_115433_522303_9D87092A 
X-CRM114-Status: GOOD (  34.14  )
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

On Tue, Dec 10, 2024 at 10:56:41AM +0100, Matthias Schiffer wrote:
> On Mon, 2024-12-09 at 17:14 +0100, Andrew Lunn wrote:
> > 
> > > Not our board, but the AM62 SoC. From the datasheet:
> > > 
> > > "TXC is delayed internally before being driven to the RGMII[x]_TXC pin. This
> > > internal delay is always enabled." So enabling the TX delay on the PHY side
> > > would result in a double delay.
> > 
> > phy-mode describes the board. If the board does not have extra long
> > clock lines, phy-mode should be rgmii-id.
> > 
> > The fact the MAC is doing something which no other MAC does should be
> > hidden away in the MAC driver, as much as possible.
> 
> Isn't it kind of a philosophical question whether a delay added by the SoC
> integration is part of the MAC or not? One could also argue that the MAC IP core
> is always the same, with some SoCs adding the delay and others not. (I don't
> know if there are actually SoCs with the same IP core that don't add a delay;
> I'm just not a big fan of hiding details in the driver that could easily be
> described by the Device Tree, thus making the driver more generic)

It is more about, what does phy-mode = "rgmii"; mean? It means the
board provides the delay via extra long clock lines. Except for when
some random MAC driver has a completely different meaning, it is not
documented it means something else, you have to read the sources and
the mailing lists, to find out what this particularly MAC driver is
doing for phy-mode = "rgmii".

Do we really want that. Or should we define that phy-mode = "rgmii"
means the PCB provides the delay. End of story, no exceptions. And
that "rgmii-id" means the MAC/PHY pair need to provide the delay? End
of story, no exceptions.

> > Since the MAC driver is forcing the TX delay, it needs to take the
> > value returned from of_get_phy_mode() and mask out the TX bit before
> > passing it to the PHY.
> 
> Hmm okay, this is what the similar ICSSG/PRUETH driver does. I've always found
> that solution to be particularly confusing, but if that's how it's supposed to
> work, I'll have to accept that.

It has to be that why. If the MAC does the delay, the MAC needs to
ensure the PHY does not do the delays and well, and it achieves that
by setting PHY_INTERFACE_MODE to indicate the PHY should not add
delays. Do you have a better idea how this can be done?

> In my opinion the documentation Documentation/networking/phy.rst is not very
> clear on this matter - the whole section "(RG)MII/electrical interface
> considerations" talks about whether the PHY inserts the delay or not, so my
> assumption was that phy-mode describes the PHY side of things and only that.
> 
> It gets even more confusing when taking into account
> Documentation/devicetree/bindings/net/ethernet-controller.yaml, which contains
> comments like "RGMII with internal RX delay provided by the PHY, the MAC should
> not add an RX delay in this case", which sounds like there are only the cases
> "delay is added by the PHY" and "delay is added by the MAC" - the case "delay is
> part of the board design, neither MAC nor PHY add it" doesn't even appear.

We have tried to improve the documentation. We have also been very
rigid in reviewing DT bindings, and what these things mean. But it
seems like many developers don't read reviews other developers get. Go
search the email archive. How many times have i had this very same
conversation?

Everybody gets pause wrong. Everybody gets EEE wrong. Everybody gets
RGMII delays wrong, not matter how many times we tell developers they
are getting it wrong.... phylink is helping with this, it takes it out
of developers hands so they cannot get pause or soon EEE wrong.

	Andrew

