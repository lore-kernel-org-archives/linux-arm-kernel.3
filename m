Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A85C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSCK7w44JmsX0Wyn5E85NYbQ0N5E71LQIaQGd0NzzGM=; b=L+/XEHUu+M6RADxIkBCk6zFYkS
	5pEyqZUAwWj7BPlX0KUhinSu2D37tcRsC8yykWRcbCHvS1tKAgIRBBoZwgI/kMlmFHzMiYphkOHTR
	qMANAEpPpZA5PbvwWolSKDP0EH+nLmkHOak3oo2+BGnzvzhsyYTROhoRj2tyjHrqgcs9kJ45MRa3m
	GvoVpLA8CK1URr5PIvXQ0aD6V9TmuQca5YlCwdd6J31AdxzsGErP/S9ryrrOM41RWoZ6ySOCt5ty8
	jsK2GVCGuBx5JZ9+TVL3PRgvjuX6xhhV8cGRXd+ToNzjZxlZXWUYfk/xjhqaiXvA9ujoQtsYKJwFp
	w6J4YQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqLn-00000003GYO-3Qd1;
	Mon, 07 Jul 2025 18:13:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpR1-000000038u9-3XCF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 17:15:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 259CC168F;
	Mon,  7 Jul 2025 10:15:06 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E195F3F66E;
	Mon,  7 Jul 2025 10:15:15 -0700 (PDT)
Date: Mon, 7 Jul 2025 18:15:13 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net 0/2] allwinner: a523: Rename emac0 to gmac0
Message-ID: <20250707181513.6efc6558@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v64vxtAVi3QK3a=mvDz2u+gKQ6XPMN-JB46eEuwfusMG2w@mail.gmail.com>
References: <20250628054438.2864220-1-wens@kernel.org>
	<20250705083600.2916bf0c@minigeek.lan>
	<CAGb2v64My=A_Jw+CBCsqno3SsSSTtBFKXOrgLv+Nyq_z5oeYBg@mail.gmail.com>
	<e9c5949d-9ac5-4b33-810d-b716ccce5fe9@lunn.ch>
	<20250706002223.128ff760@minigeek.lan>
	<CAGb2v64vxtAVi3QK3a=mvDz2u+gKQ6XPMN-JB46eEuwfusMG2w@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_101519_964887_B2DBC587 
X-CRM114-Status: GOOD (  44.36  )
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

On Sun, 6 Jul 2025 21:14:09 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> On Sun, Jul 6, 2025 at 7:23=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > On Sat, 5 Jul 2025 17:53:17 +0200
> > Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > Hi Andrew,
> > =20
> > > > So it's really whatever Allwinner wants to call it. I would rather =
have
> > > > the names follow the datasheet than us making some scheme up. =20
> > >
> > > Are the datasheets publicly available? =20
> >
> > We collect them in the sunxi wiki (see the links below), but just to
> > make sure:
> > I am not disputing that GMAC is the name mentioned in the A523 manual,
> > and would have probably been the right name to use originally - even
> > though it's not very consistent, as the same IP is called EMAC in the
> > older SoCs' manuals. I am also not against renaming identifiers or even
> > (internal) DT labels. But the problem here is that the renaming affects
> > the DT compatible string and the pinctrl function name, both of which
> > are used as an interface between the devicetree and its users, which is
> > not only the Linux kernel, but also U-Boot and other OSes like the BSDs=
. =20
>=20
> I reiterate my position: they are not stable until they actually hit a
> release. This provides some time to fix mistakes before they are set in
> stone.
>=20
> > In this particular case we would probably get away with it, because
> > it's indeed very early in the development cycle for this SoC, but for
> > instance the "emac0" function name is already used in some U-Boot
> > patch series on the list:
> > https://lore.kernel.org/linux-sunxi/20250323113544.7933-18-andre.przywa=
ra@arm.com/
> >
> > If we REALLY need to rename this, it wouldn't be the end of the world,
> > but would create some churn on the U-Boot side.
> >
> > I just wanted to point out that any changes to the DT bindings have
> > some impact to other projects, even if they are proposed as a coherent
> > series on the Linux side. Hence my question if this is really necessary=
. =20
>=20
> For the compatible string, I can live with having a comment in the binding
> stating the name used in the datasheet for reference.

For the compatible string going with a fallback name, I can live with
renaming it ;-)

> For the pinctrl stuff, which is the contentious bit here, I thought the
> whole idea of the newer pinctrl bindings is that the driver uses
> "allwinner,pinmux" instead of "function". I think having both being valid
> is confusing, and likely to cause conflicts later on. If we're going to
> use the hardware register values in the device tree, I'd really like them
> to be the only source of truth. The commit message for the binding also
> sort of suggests that "allwinner,pinmux" is the part that matters.

Yes, it should be, but it turns out to be convenient for U-Boot to
continue using the old method - until someone writes a driver for the new
schema. And a function name is still mandatory, it's just mostly for
reference now (so would indeed be fine to rename).

So if you really insist on this: please go ahead and merge it, so that
the 6.16 release contains the new name.

But please note my silent protest about those cosmetic name changes in the
DT realm, which establishes an interface reaching beyond just the Linux
kernel. When it comes to new boards, the U-Boot DT sync process is rather
slow, so I really am eager to cherry-pick -rc1 DTs already, instead of
waiting another 7 weeks - which bites me in this case. It's not merged
yet, so is fine in this case, but I would really like to avoid similar
hiccups in the future.

Cheers,
Andre.

