Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351DECD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOngXcy4azYbeJnIGGVTceQl/NqW4hHU6sQbR3V0fVQ=; b=imFphOJUneeAckvgQhOtMTsuvE
	rkyMLY40bm6JV4fO1wLY10wmkhIsnlYrNsoFzA/frSb9500xJNnCAA9eKGCKuX8C3g4yOu9OhRm/x
	Vv1B//EcK1LI0vZNqxNxmpdwxVxKiTJKCd/+5CcyKjOkTMhxdOOUNtYkfZ1lo+zxCcaSwKYTLOxN1
	QmPsIgJREU7IUiQ3UAUdy56fRVkiVqa4cFNPvXhuI0jvA+RtAe6L1WZ4sPo3odbRGTS82D7HtGe5l
	21L/9diXQ39gVE6SHCzQjeyMivA0bAtpoUMvJHLJjwDN8o2wGyxgJfA7gi25IPCUF3siDw2lRz2ny
	d6/df92w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRK4P-0000000G0Gp-1Erc;
	Mon, 25 May 2026 01:25:29 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRK4M-0000000G0Fz-0TVL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779672313;
	bh=EOngXcy4azYbeJnIGGVTceQl/NqW4hHU6sQbR3V0fVQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JffiABGHYUUHJpRcyq52r58EKKZFnFNOItdblZO26LvoMu6Z1WgbnOWWe98KB9xT/
	 bKMFBaNjgUWO++o3Gn9EFyjUzwsXdXWqHbGcuix0hrx1Xv+arE4nLF7sCJ1sqTJKFG
	 /nLBKqh2IyFzs3DI1zYUXBg3NDsur/c/BDp8TNDDY6OWEKwt0YKhegt0UDB3QwIqGv
	 0dU/ReOxRsH4ImflO2/rX87zzUoPK9y2pP5FLbY+Lu4IxM0dAcGXMIkysgf0zN+8BH
	 ujNT3YpaSY35yasBunE671nwNQefM3HaZ2MoN/9SQpTDdweUe191b7re7LOYTVEFUy
	 pVvXa4PDxStiw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5671B60007;
	Mon, 25 May 2026 09:25:10 +0800 (AWST)
Message-ID: <5e5db092fbf80b88a95d38b3d0b655baac22c711.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus
 Kommando IPMI Card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andrew Lunn <andrew@lunn.ch>, Anirudh Srinivasan
 <anirudhsriniv@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 25 May 2026 10:55:09 +0930
In-Reply-To: <d8c7d7c9-6f2f-4d3f-95d4-877e8504a1b6@lunn.ch>
References: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
	 <CAJ13v3RtV+_P_ShfrM5vH+neT0cB6t5yAbqGiiw7S7Y8qpVY=Q@mail.gmail.com>
	 <d8c7d7c9-6f2f-4d3f-95d4-877e8504a1b6@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_182526_368954_57BA836F 
X-CRM114-Status: GOOD (  33.91  )
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

On Fri, 2026-05-22 at 14:05 +0200, Andrew Lunn wrote:
> On Thu, May 21, 2026 at 10:49:24PM -0500, Anirudh Srinivasan wrote:
> > Hi Andrew,
> >=20
> > On Tue, Mar 31, 2026 at 9:18=E2=80=AFAM Anirudh Srinivasan
> > <anirudhsriniv@gmail.com> wrote:
> > >=20
> > > Adds the DT nodes needed for ethernet support for Asus Kommando, with
> > > phy mode set to rgmii-id.
> > >=20
> > > When this DT was originally added, the phy mode was set to rgmii (whi=
ch
> > > was incorrect). It was suggested to remove networking support from th=
e
> > > DT till the Aspeed networking driver was patched so that the correct =
phy
> > > mode could be used.
> > >=20
> > > The discussion in [1] mentions that u-boot was inserting clk delays t=
hat
> > > weren't needed, which resulted in needing to set the phy mode in linu=
x
> > > to rgmii incorrectly. The solution suggested there was to patch u-boo=
t to
> > > no longer insert these clk delays and use rgmii-id as the phy mode fo=
r
> > > any future DTs added to linux.
> > >=20
> > > This DT was tested (on the OpenBMC u-boot fork [2]) with a u-boot DT
> > > modified to insert clk delays of 0 (instead of patching u-boot itself=
).
> > > [3] adds a u-boot DT for this device (without networking) and describ=
es
> > > how to patch it to add networking support. If this patched DT is used=
,
> > > then networking works with rgmii-id phy mode in both u-boot and linux=
.
> > >=20
> > > [1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5e=
cb9c777a@lunn.ch/
> > > [2] https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc
> > > [3] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656=
f8cd314@gmail.com/
> > >=20
> > > Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> > > ---
> > > This patch is based off aspeed/arm/dt from bmc tree
> > > ---
> > > Changes in v2:
> > > - Commit message now mentions that the u-boot tested against is the
> > > =C2=A0 openbmc u-boot fork
> > > - Link to v1: https://lore.kernel.org/r/20260328-asus-kommando-networ=
king-v1-1-66d308b88536@gmail.com
> > > ---
> > > =C2=A0.../dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts=C2=A0 | 1=
8 ++++++++++++++++++
> > > =C2=A01 file changed, 18 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-c=
ard.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> > > index ab7ad320067c1ddc0fea9ac386fd488c8ef28184..e0f7d92efa18ccbad2c33=
6236c3b9d01b7de1bba 100644
> > > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> > > @@ -107,6 +107,24 @@ &gpio1 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*18E0 32*/ "","","","",""=
,"","","";
> > > =C2=A0};
> > >=20
> > > +&mac2 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-mode =3D "rgmii-id";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-handle =3D <&ethphy2>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&pinctrl_rgmii3_=
default>;
> > > +};
> > > +
> > > +&mdio2 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethphy2: ethernet-phy@0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg =3D <0>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > +};
> > > +
> > > =C2=A0&vhub {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > =C2=A0};
> > >=20
> > > ---
> > > base-commit: 76b4ec8efdc3887cdbf730da2e55881fc1a18770
> > > change-id: 20260328-asus-kommando-networking-5c0612aa6b8c
> > >=20
> > > Best regards,
> > > --
> > > Anirudh Srinivasan <anirudhsriniv@gmail.com>
> > >=20
> >=20
> > While we're figuring out what to do with u-boot, what are your
> > thoughts on getting this patch in so that the kernel DTS changes
> > needed for networking land in this cycle?
> >=20
> > The current commit message might become somewhat outdated if the
> > u-boot patch changes though, so not sure if that's okay.
>=20
> The commit message explains "Why?", which is what is important. So it
> should not matter if it becomes outdated. And the DT is correct, no
> matter how the issue is solved.

Yeah, this was my thought too, so I intend to apply it.

>=20
> So i'm O.K. with this.

Thanks

Andrew

