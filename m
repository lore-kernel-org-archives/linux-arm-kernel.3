Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC43CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 04:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGd9kLzjDaoi+l0HOQu5KE2dhKkmGdqUdNlJgfKDaQ4=; b=AmwCujjYDXxAIPh6sPkdyAKNwG
	C7hrnTg93LTV5nLrB3PKycZp4W4xxFH+ygtB23yTACYasxAywAt8G0tSD7MtK46SgqPyDhRrcygz0
	8dCEnR5XFBeU6wDresrQKLGdQxyHX4QOVhFm8LKKNU1miGdIUEeNOXir6ecjNDy+Yu+V+lew2hgXQ
	7ylG3Rk4ft82UN1cz5wfoOFTWS6DDUatnU4oAADdaw/VtcNSOgNuCx9AV4Yx2MjXUlO/kCSjJz0z8
	R92md0pmlyeng2IGG5+FYOBHClvcunmTSHpQA1C6XRCrCk/Dt7wSqo0aYT1eQTLM8TrPeaAv6PpsX
	JHs4PdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy0v7-00000002m5Q-1Vkl;
	Mon, 15 Sep 2025 04:34:29 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy0v5-00000002m50-0vcG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 04:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757910865;
	bh=jGd9kLzjDaoi+l0HOQu5KE2dhKkmGdqUdNlJgfKDaQ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j9l6rePl1LUachlMBzH84pJ4kBHHVvbIl05HfsxlWo/BECrz1cj/oTJUcTE+mwMxJ
	 1zhFaWpOsMOT+ws5vGcBytUoqpX60OAE2NGwm7D45vwRgVNN0oHUYMe/MVhyC4KyTz
	 WDq4LX4lbyF+4K/MdLmV2a5A1ag5A27ZrLDtKbHgyBhHaS/1eNp1XLeS7bCD4Au4HZ
	 Z5K6pTKPx4A9glzNAfLgQutJM+RqCu1DPmf9H3q+8nKyicoSF2LckL67+bC/qWSkN3
	 ij1vnEAI/uYsdu3Q8/nv4/oQRdRwiZDEd1crElwzz5MlsqhSSMsGMvotAV+bRScjPa
	 78Ag7Bu3F/cUA==
Received: from [IPv6:2405:6e00:2430:fb15:b2b4:1872:3690:c682] (unknown [120.20.190.44])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0452B64CF0;
	Mon, 15 Sep 2025 12:34:21 +0800 (AWST)
Message-ID: <ae46aa8e57d01208deb56a8fd01f26a9a0bf359b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Donald Shannon <donalds@nvidia.com>, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, etanous@nvidia.com
Date: Mon, 15 Sep 2025 14:04:19 +0930
In-Reply-To: <f0b75151-d355-4d03-a356-dfbfb7a9e803@nvidia.com>
References: <20250822203818.4062595-1-donalds@nvidia.com>
	 <20250822203818.4062595-3-donalds@nvidia.com>
	 <f9cd6015c47d390eef9c689d2cb4fcd301c4d123.camel@codeconstruct.com.au>
	 <fcd64668-4232-4d7b-98ec-5326d40d19d7@nvidia.com>
	 <f0b75151-d355-4d03-a356-dfbfb7a9e803@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_213427_463022_C22035C4 
X-CRM114-Status: GOOD (  27.46  )
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

Hi Donald,

On Wed, 2025-09-10 at 09:46 -0700, Donald Shannon wrote:
> On 9/9/25 16:05, Donald Shannon wrote:
> > On 9/3/25 00:07, Andrew Jeffery wrote:
> >=20
> > > Hi Donald,
> > >=20
> > > On Fri, 2025-08-22 at 13:38 -0700, Donald Shannon wrote:
> > > > This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
> > > > Platform.
> > > >=20

*snip*

> > > > +
> > > > +&mdio0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethphy0: ethernet-phy@0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg =3D <0>;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > +};
> > > > +
> > > > +&mac0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-mode =3D "rgmii-id";=20
> > > Is this correct, in the context of the query here?
> > >=20
> > > https://lore.kernel.org/all/6a3d7eb4-c091-437f-98f8-2b8577e539a7@lunn=
.ch/
> > >=20
> > > If not, please drop the node from the patch until the MAC driver is
> > > fixed with respect to the RGMII delays.
> > >=20
> > > Andrew=20
> >=20
> > Hi Andrew,
> >=20
> > I will change this to alphabetical order.
> >=20
> > The extra space in our flash is for root of trust application. I will n=
ote this in the next patch.
> >=20
> > I see that the ftgmac100 drivers do not use the phy-mode parameter so I=
 will leave it out.
> >=20
> > Thanks,
> > Don
> >=20
>=20
> Hi Andrew,
>=20
> I am getting conflicting messages in my v3 patch series and want to confi=
rm what the consensus
> is for removing or keeping the unused phy-mode parameter.
>=20

The background is that there's been some concerns over phy-mode wrt to
where the RGMII delays are inserted, and the impact on the phy
configuration. My intent was that if you were unsure that you would
remove the entire mac node rather than just the phy-mode property. That
way there's no networking that can break when ASPEED sort out issues
with the ftgmac100 driver. You would have to carry a downstream patch
to add the node back for networking, but I feel that's an improvement
on carrying the entire devicetree downstream.

However:

>  There is some inconsistency in
> the existing dts-es as well.

Yes, this is part of the problem.

>=20
> Our board phy implements tx and rx delay, so -id would be the appropriate=
 one to use if we
> decide to use it.

Right, so long as there's no delay configured for the MAC in the SCU
(see SCU340-35C) and networking functions for your board then I think
it's fine to keep the node and specify `phy-mode =3D "rgmii-id";`. Any
fixes to the driver shouldn't break that arrangement (as in this
configuration it should deconfigure any delays for the MAC in the SCU).

There's some good documentation here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/net/ethernet-controller.yaml?h=3Dv6.16#n264

and relevant discussion here:

https://lore.kernel.org/all/f28736b5-f4e4-488e-8c9b-55afc7316c5e@lunn.ch/

Sorry for the confusion.

Andrew

