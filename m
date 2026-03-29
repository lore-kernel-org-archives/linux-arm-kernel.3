Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88ED10D1495
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 03:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUuZHrDWxaaWF4+/n4z56tn8qK+LyT2Zab514kfOXec=; b=ffaBNTQdn+tCqJAEKYjrqgMl5g
	I8tH7QNBwssJBO0xvmKdV6GfO/jdMGdB5Pli6bm32wtSpKHIASRIcx4ukv7Y4H7N1OzS943SiRVDo
	eL+Uo8PqtzCyW3mdsaeCCGcrRdGtOyKO5ZGtmxx2waiXaYusA6AgIOLkUZB2Ykcomqb2BIwPb5vr0
	PhB5cuHztiTuH9lqKBtKX4ImDDgJdikGfTkKF28WzcCzIArgCrZufpgpHg9mGDwpu9U/2mfYMijuN
	qh1He2HtDT+rPsJzTPUMs9WqqzbcUEFCyz9y4Z0AizgNti84q0pXMZ5OfWKFF6Gl54rMZrdSkFxNE
	Bx+nv1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ghm-00000009Wa0-2n4u;
	Sun, 29 Mar 2026 03:20:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ghk-00000009WZd-42Bp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 03:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=gUuZHrDWxaaWF4+/n4z56tn8qK+LyT2Zab514kfOXec=; b=1R
	wsmr+7CebtxmeC7zSCRBXBzSP8TtlMe1LeiLLkDCkbO6f1YWfIH9XlyyRJk9qfQmjPkiqnYrcJbYX
	fMvITKt05bjHr+c22rl8xd158RD+PJo097oMNQod4FzDa4iVhmf15I0Syp5CHamydP7ETNHRJKNb2
	A4sxszRKx5ltQz4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w6ghV-00Dr5E-2n; Sun, 29 Mar 2026 05:20:33 +0200
Date: Sun, 29 Mar 2026 05:20:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
Message-ID: <b8e4da26-ae8e-4b2d-b259-c13e3a4d0aa0@lunn.ch>
References: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com>
 <ed3d39df-0a0e-427b-86cf-b9b2d2094b51@lunn.ch>
 <CAJ13v3S7ucjd-ifmKFBDGtsg32MbOar2OBeiGMVEJBsH8+JP7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ13v3S7ucjd-ifmKFBDGtsg32MbOar2OBeiGMVEJBsH8+JP7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_202049_009292_D178F7AE 
X-CRM114-Status: GOOD (  26.62  )
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

On Sat, Mar 28, 2026 at 07:14:04PM -0500, Anirudh Srinivasan wrote:
> Hi Andrew
> 
> On Sat, Mar 28, 2026 at 7:05 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Sat, Mar 28, 2026 at 06:39:59PM -0500, Anirudh Srinivasan wrote:
> > > Adds the DT nodes needed for ethernet support for Asus Kommando, with
> > > phy mode set to rgmii-id.
> > >
> > > When this DT was originally added, the phy mode was set to rgmii (which
> > > was incorrect). It was suggested to remove networking support from the
> > > DT till the Aspeed networking driver was patched so that the correct phy
> > > mode could be used.
> > >
> > > The discussion in [1] mentions that u-boot was inserting clk delays that
> > > weren't needed, which resulted in needing to set the phy mode in linux
> > > to rgmii incorrectly. The solution suggested there was to patch u-boot to
> > > no longer insert these clk delays and use rgmii-id as the phy mode for
> > > any future DTs added to linux.
> > >
> > > This DT was tested with a u-boot DT modified to insert clk delays of 0
> > > (instead of patching u-boot itself). [2] adds a u-boot DT for this
> > > device (without networking) and describes how to patch it to add
> > > networking support. If this patched DT is used, then networking works
> > > with rgmii-id phy mode in both u-boot and linux.
> >
> > I've been looking at
> >
> > https://elixir.bootlin.com/u-boot/v2026.04-rc5/source/drivers/clk/aspeed/clk_ast2600.c
> >
> > And i don't see where mac2-clk-delay is implemented. Could you point
> > out the code?
> 
> I'm testing against the u-boot version that openbmc uses for its
> builds. I don't think upstream u-boot is used by openbmc.
> 
> https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/drivers/clk/aspeed/clk_ast2600.c#L999

Please include in the commit message that you need to use a fork of
u-boot.

	Andrew

