Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FDACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B27jTI/Q5d9ahPjBVpzy9cPRWGSbXJiqn0fKYgn90Gw=; b=AroqBM/1cFEeqOlQgDXPe1kZI8
	FcqKibCGh5c7vneCkfHiOPxxLX2oHwBj86ooaOhdU3FLdIAy4yy8g8QHHTVjHam7KT6PpqzsePwCN
	+6hPHuc70AXpkFFfJQBPnVpc/yVDDNBUQrQzqIU0dTe1+Ff5FCwH4icKJDWQSMArAwJ1w+d91dusd
	3dG98nlhn6DF5+G5zP+8YnWeo7Q/Ek2WYTIw2Lx6+HjoC+nwwo3dnx3igOFzvAnGmrZA6LoMcPD75
	4swlJ8EF7HeEtcIHd2xzUYdVIjtsveE51M2BhDPsLNZf7ho57VUPaQn863NIg9G9J4LtCA7YJgJxz
	diphOiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOdV-0000000AjFW-2YNY;
	Fri, 22 May 2026 12:05:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOdT-0000000AjEq-0AR6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 12:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=B27jTI/Q5d9ahPjBVpzy9cPRWGSbXJiqn0fKYgn90Gw=; b=BU
	5YJw0e+XWmNZ0vQxuvcesgoTNCR8EzxmheZvbut60r4DRcdatB4ErSYAj3Jz4DxlkuSZlkTED5AG5
	hARFJnnksoKbtLc4ql6Wqlu95tuiwhU8e/AszIyq3q8NNTcKQpPXKM1yfPbkvgHLPA9wRIQfRZdLW
	SfOeKqUJ6cu3b38=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wQOdK-004AQI-3E; Fri, 22 May 2026 14:05:42 +0200
Date: Fri, 22 May 2026 14:05:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
Message-ID: <d8c7d7c9-6f2f-4d3f-95d4-877e8504a1b6@lunn.ch>
References: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
 <CAJ13v3RtV+_P_ShfrM5vH+neT0cB6t5yAbqGiiw7S7Y8qpVY=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ13v3RtV+_P_ShfrM5vH+neT0cB6t5yAbqGiiw7S7Y8qpVY=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_050551_078718_00128808 
X-CRM114-Status: GOOD (  33.44  )
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

On Thu, May 21, 2026 at 10:49:24PM -0500, Anirudh Srinivasan wrote:
> Hi Andrew,
> 
> On Tue, Mar 31, 2026 at 9:18 AM Anirudh Srinivasan
> <anirudhsriniv@gmail.com> wrote:
> >
> > Adds the DT nodes needed for ethernet support for Asus Kommando, with
> > phy mode set to rgmii-id.
> >
> > When this DT was originally added, the phy mode was set to rgmii (which
> > was incorrect). It was suggested to remove networking support from the
> > DT till the Aspeed networking driver was patched so that the correct phy
> > mode could be used.
> >
> > The discussion in [1] mentions that u-boot was inserting clk delays that
> > weren't needed, which resulted in needing to set the phy mode in linux
> > to rgmii incorrectly. The solution suggested there was to patch u-boot to
> > no longer insert these clk delays and use rgmii-id as the phy mode for
> > any future DTs added to linux.
> >
> > This DT was tested (on the OpenBMC u-boot fork [2]) with a u-boot DT
> > modified to insert clk delays of 0 (instead of patching u-boot itself).
> > [3] adds a u-boot DT for this device (without networking) and describes
> > how to patch it to add networking support. If this patched DT is used,
> > then networking works with rgmii-id phy mode in both u-boot and linux.
> >
> > [1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c777a@lunn.ch/
> > [2] https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc
> > [3] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com/
> >
> > Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> > ---
> > This patch is based off aspeed/arm/dt from bmc tree
> > ---
> > Changes in v2:
> > - Commit message now mentions that the u-boot tested against is the
> >   openbmc u-boot fork
> > - Link to v1: https://lore.kernel.org/r/20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com
> > ---
> >  .../dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> > index ab7ad320067c1ddc0fea9ac386fd488c8ef28184..e0f7d92efa18ccbad2c336236c3b9d01b7de1bba 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> > @@ -107,6 +107,24 @@ &gpio1 {
> >         /*18E0 32*/ "","","","","","","","";
> >  };
> >
> > +&mac2 {
> > +       status = "okay";
> > +
> > +       phy-mode = "rgmii-id";
> > +       phy-handle = <&ethphy2>;
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_rgmii3_default>;
> > +};
> > +
> > +&mdio2 {
> > +       status = "okay";
> > +
> > +       ethphy2: ethernet-phy@0 {
> > +               compatible = "ethernet-phy-ieee802.3-c22";
> > +               reg = <0>;
> > +       };
> > +};
> > +
> >  &vhub {
> >         status = "okay";
> >  };
> >
> > ---
> > base-commit: 76b4ec8efdc3887cdbf730da2e55881fc1a18770
> > change-id: 20260328-asus-kommando-networking-5c0612aa6b8c
> >
> > Best regards,
> > --
> > Anirudh Srinivasan <anirudhsriniv@gmail.com>
> >
> 
> While we're figuring out what to do with u-boot, what are your
> thoughts on getting this patch in so that the kernel DTS changes
> needed for networking land in this cycle?
> 
> The current commit message might become somewhat outdated if the
> u-boot patch changes though, so not sure if that's okay.

The commit message explains "Why?", which is what is important. So it
should not matter if it becomes outdated. And the DT is correct, no
matter how the issue is solved.

So i'm O.K. with this.

   Andrew

