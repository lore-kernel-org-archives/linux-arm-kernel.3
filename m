Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190C1CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 04:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAUDklng+BZKqI8KusNe8mWtzFQ70FVKUEy2GEFuPik=; b=rjot1xB+Ic2wmZOkfAbLwcyxnF
	H1LRt3fxW4wmR0w1/34jubRQLn41OhMnTh1H57g8NT2qDYwLUcB8M+r1F1cjAevkCXj1EiGGe6wjU
	QFWFsJtsuJrSMH5DI8AvlVICwygnBMqY9v/7JxCQ4pk0oHLNrFfC+YwD9vmYLKq6OWi2A1aIk0djv
	0AONbwG2BrJ996XWOBfFPmwGM51r0m0thZI5fWT7bZzC+Mt/yHTPTmfZBoz/eeSH+52vRSTWPmP2c
	J8AX55XSlfBFqpgt7P4Rmbr1UbYUTJTd2fKuhvRaG286mDDLwXwWt+SI43HjEFgo7EJKRGZYvMkSd
	AajU0RgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOK8-0000000B4hh-0R2g;
	Mon, 24 Nov 2025 04:37:12 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOK5-0000000B4hF-42Re
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 04:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763959020;
	bh=hAUDklng+BZKqI8KusNe8mWtzFQ70FVKUEy2GEFuPik=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hLEZV6MSqW4qgVqLjIdJTLJBeZMw2XDp88xQXAHJOVtBBvmKT8dd9bNtgY/yYQ4yU
	 b0KAynblrFCdrVvos9RXuzvRPvqxWpFiPCIke8xLJdNqFntEi0qmJGytgd0ZsvFzpK
	 Myh1HT3MU8A6IVvivAy4gqwwRdb1jqrfIUr2uMEe5N0Ke6kdKQ28l6q/JXCS0RKBO3
	 y1gCweF3qsJCwk3oBdTZPfQAHQFZDn02nAYKHMCfcFBUps/gWJ8b8S5rGcZF2OXJb2
	 dIY7Uo1lrNsPsEOHqsHXvKj+M5Rz8AYo0Mz1d1baUG32sMhaXxdyNdxnQwRguRk8gH
	 E8Tu2eBdVge6A==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 30E4464DF5;
	Mon, 24 Nov 2025 12:36:57 +0800 (AWST)
Message-ID: <b610d86a2f71bf8289deeaa1c361005146985d2a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Mon, 24 Nov 2025 15:06:56 +1030
In-Reply-To: <aRbLqH8pLWCQryhu@molberding.nvidia.com>
References: <20251108-msx1_devicetree-v3-0-c7cb477ade27@nvidia.com>
	 <20251108-msx1_devicetree-v3-2-c7cb477ade27@nvidia.com>
	 <a030d7a2e2d36064bd86fe2af1ec6e4baabd9946.camel@codeconstruct.com.au>
	 <aRbLqH8pLWCQryhu@molberding.nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_203710_208473_568CF127 
X-CRM114-Status: GOOD (  26.06  )
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

On Thu, 2025-11-13 at 22:26 -0800, Marc Olberding wrote:
> On Fri, Nov 14, 2025 at 02:46:19PM +1030, Andrew Jeffery wrote:
> > > +	model =3D "AST2600 MSX4 Kernel";
> >=20
> > I find this to be a curious model name :)
> >=20
> > Are there no other reasonable names?
> >=20
> For better or worse, this is the most accurate name, and matches the hpm =
hardware itself.

hpm?

> We may need multi-hpm support for the resulting firmware at some point, s=
o matching
> the hpm to the device tree seemed like the simplest thing to do. If this =
doesn't
> match the way the kernel deals with this sort of thing, please let me kno=
w the best path forward.

I guess to clarify my concern: what does "Kernel" refer to here?

The devicetree describes the hardware, so references to things such as
"driver" and "kernel" tend to be a little suspicious.

For reference, here's a sample of other model names that have been
used:

   > git grep model arch/arm/boot/dts/aspeed/ | shuf | head
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts: model =3D "Faceb=
ook Harma";
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts:       model =
=3D "ASRock E3C256D4I BMC";
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dts:      model =
=3D "Facebook Minipack 100 BMC";
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts:  model =
=3D "Facebook Santabarbara BMC";
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts:        model =
=3D "Facebook Elbert BMC";
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts:    model =
=3D "Facebook Greatlakes BMC";
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts:       model =3D "Fuji"=
;
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dts:   model =3D "Faceb=
ook Backpack CMM BMC";
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dts:   model =3D "Balco=
nes";
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dts:    model =3D "YADRO=
 VEGMAN Rx20 BMC";

These don't tend to reference either the SoC or the kernel, rather the
platform that the SoC sits in. "MSX4" might be enough?

>=20
> > > +	compatible =3D "nvidia,msx4-bmc", "aspeed,ast2600";
> > > +
> > > +	aliases {
> > > +		serial0 =3D &uart1;
> > > +		serial1 =3D &uart2;
> > > +		serial2 =3D &uart3;
> > > +		serial3 =3D &uart4;
> > > +		serial4 =3D &uart5;
> >=20
> > Just checking whether you're actually using all of these? I guess the
> > uart nodes further down suggest so?
> >=20
>=20
> These UARTs are wired up on this platform. Userspace may not use them tod=
ay,
> but we want to enable doing so without needing further device tree update=
s, in
> case they are needed for debug where a BMC firmware flash would be unpala=
table.
>=20
> >=20
> > Seems curious to enable all of these I2C controllers yet have no
> > devices under them? Can you elaborate?
> >=20
> > Andrew
>=20
> Unfortunately, the devices that we need over i2c are not
> guaranteed to be available at BMC boot, and are probed in userspace throu=
gh
> the new_device sysfs node from the i2c subsystem. The BMC doesn't
> have direct control over when these devices are accessible,
> they are available after the host has completed POST.
>=20
> As far as I can tell, there isn't a great way to defer probe for devices
> that the BMC doesn't have immediate control over whether its accessible.
> Regulators seem like a match, but it seems to assume that you can directl=
y
> turn on the power domain that the device is tied to, which isn't the case=
 here
> for various reasons.
>=20
> Please let me know if I'm ignorant of a way to deal with this issue.

No dramas, however, I'd appreciate a comment in the devicetree along
these lines.

Andrew

