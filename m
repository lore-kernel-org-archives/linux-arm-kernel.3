Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90060C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y78VCoYM7VevEWRRosTle7tdkMGhmFsw5rVCtfwQPJE=; b=ngH6u8iPETecO7vStrm1DKMOvu
	i7wf+Th7/LEGTLBBsMtyHNTzBf5z7pmjk3blhqQyYy3AN/GgUjLq9411rfMZjHVg7hNC8y2TRe1li
	NyuOFvuxuX1YQiic5vBAQfobnPyGG2SFHEe9CbZIbV3ZKrAL6lsK2YkS29ZuqAr3BIvCfkw9D2Ltk
	OlGNj+GtVXa+IJX+/TFOkynDpckuYWbXioV6YWcuI6DsLyw+oZcJOFEkRTs2gLYsmAV7S2IYgoCOU
	vBB5LhXbJra09yklPMxz99wbRqPRwn/CAt9ewfQzHhH5PZkoZ9PJOGkqIiRmmbhQFdsJf2BIKot5N
	favoNL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM7f-0000000BsRf-2CKO;
	Thu, 03 Jul 2025 15:45:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKON-0000000BYeB-1CxC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751550861;
	bh=y78VCoYM7VevEWRRosTle7tdkMGhmFsw5rVCtfwQPJE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vn1T+Adm7dAOD3R6Sydh5vATGD9TWJZ4xQXiRE2DGkOlDTfk8bXDfo1eKlk5S0p09
	 Cs1wSRHanBGrFcD7QGpKHsDdMM6DPuPD5fq9rgNa+XNfdApZ+QCISKe+Ehdavsq38a
	 3/U6GI2l5Fd+yxnDlYMfCO+flzBFFXnm8D4eKs771kVmY/bUWBqJVEA1pSJTc/Umkh
	 Z0NjYxF51gOFpCuK07R3mhiGz1KP9VVVfkS0z6+nJACp5nzBw8zKn0b7lA50o6lNzI
	 x4oH7h8fKJJgQtvZ34p/4pPJ0J8CqnjwaSl+xugSXkP65tazWhdrDHqH96Kj65JoGQ
	 R6D9TUmYAR9FQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600c8F85cf092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA95C17E04C0;
	Thu,  3 Jul 2025 15:54:20 +0200 (CEST)
Message-ID: <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
Subject: Re: [PATCH v5 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Thu, 03 Jul 2025 15:54:20 +0200
In-Reply-To: <d4052ab3-9cd1-45e8-81b0-b6512822e646@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <5e1b26637706f6eac92acbbb3d5a7dafa0c2c232.camel@collabora.com>
	 <d4052ab3-9cd1-45e8-81b0-b6512822e646@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_065423_482795_1D1CA709 
X-CRM114-Status: GOOD (  40.72  )
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

On Thu, 2025-07-03 at 15:17 +0300, Cosmin Tanislav wrote:
>=20
>=20
> On 7/3/25 3:07 PM, Julien Massot wrote:
> > Hi Cosmin,
> >=20
> > On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
> > > This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devic=
es,
> > > replacing the few GMSL2 drivers already in upstream, and introducing =
a
> > > common framework that can be used to implement such GMSL chips, which
> > > avoids code duplication while also adding support for previously
> > > unsupported features.
> > >=20
> > > While the normally acceptable and polite way would be to extend the
> > > current mainline drivers, the choice was made here to add a totally n=
ew
> > > set of drivers. The current drivers support only a small subset of th=
e
> > > possible features, and only a few devices, so the end result after
> > > extending them would in any case be essentially fully rewritten, new
> > > drivers.
> > >=20
> > Thanks for your work,
> > The common framework will help a lot to drive new GMSL chips, and most =
of the
> > features are covered.
> >=20
> > > This series depends on support for internal pads, for which a patch h=
as
> > > been added.
> > >=20
> > > The previous version is at:
> > > https://lore.kernel.org/lkml/20250618095858.2145209-1-demonsingur@gma=
il.com
> > >=20
> > > The following deserializers are supported:
> > > =C2=A0=C2=A0* MAX96712 (already exists in staging)
> > > =C2=A0=C2=A0* MAX96714 (already exists)
> > > =C2=A0=C2=A0* MAX96714F (already exists)
> > > =C2=A0=C2=A0* MAX96714R (GMSL2)
> > > =C2=A0=C2=A0* MAX96716 (GMSL2)
> > > =C2=A0=C2=A0* MAX96724 (already exists as part of existing MAX96712 d=
river)
> > > =C2=A0=C2=A0* MAX96724F (GMSL2)
> > > =C2=A0=C2=A0* MAX96724R (GMSL2)
> > > =C2=A0=C2=A0* MAX9296A (GMSL2)
> > > =C2=A0=C2=A0* MAX96792A (GMSL3)
> > >=20
> > > The following serializers are supported:
> > > =C2=A0=C2=A0* MAX96717 (already exists)
> > > =C2=A0=C2=A0* MAX9295A (GMSL2)
> > > =C2=A0=C2=A0* MAX96793 (GMSL3)
> > >=20
> > > Known backward compatibility breakages:
> > > =C2=A0=C2=A0* No default routing. Default routing has been intentiona=
lly ommitted
> > > =C2=A0=C2=A0=C2=A0 as the devices support quite complex routing and i=
t would be
> > > =C2=A0=C2=A0=C2=A0 unfeasible to provide sane defaults for multi-link=
 deserialziers.
> > > =C2=A0=C2=A0=C2=A0 It is expected that userspace programs would set a=
ppropritate
> > > =C2=A0=C2=A0=C2=A0 routing.
> > >=20
> > This part is the most annoying one: at the moment, there is no way to s=
et the routing except by
> > manually enabling a boolean within the kernel source.
> > You can't guess what routing the user really wants, but please at least=
 provide a default
> > routing
> > table that allows using your drivers =E2=80=94 for example, the device'=
s default routing.
> >=20
>=20
> It's a very delicate issue... I'll try to see if I can do that.
> It would be great if we could enable the streams API globally since it's
> been merged since Jan 15 2023. It's been over two years.
>=20
>=20
> Thanks,
>=20
> >=20
> >=20
> > > The following list enumerates new features that are supported by the
> > > common framework and their respective chip-specific drivers:
> > > =C2=A0=C2=A0* Full Streams API support. Most deserializers have suppo=
rt for more
> > > =C2=A0=C2=A0=C2=A0 than one link, and more than one PHY. Streams supp=
ort allows
> > > =C2=A0=C2=A0=C2=A0 configuration of routing between these links and P=
HYs.
> > >=20
> > > =C2=A0=C2=A0* .get_frame_desc() support. Both the serializers and des=
erializers
> > > =C2=A0=C2=A0=C2=A0 implement this to query and provide frame descript=
or data. This is
> > > =C2=A0=C2=A0=C2=A0 used in features explained in-depth below.
> >=20
> > So are almost all the sensor drivers incompatible?
> >=20
>=20
> Yes, sensor drivers need to have .get_frame_desc() implemented... It's
> not a huge feat and it's the only way this type of bridge could work
> properly.
>=20
> Alternatively, we could add a fallback that bases its decision on the
> stream format, but I'd prefer if we didn't and we would just implement
> .get_frame_desc(). After this series is merged I can submit my patches
> for imx219.
There is already one pending on the mailing list
"media: i2c: imx219: Report streams using frame descriptors"
I guess it's fine if we require the sensor to implement this function.

But I had to do it for vgxy61.

Btw I tested:
TI AM62x + max96716 + 1 x max96717f + stvg5661 (tunnel mode)
With special lanes mapping and polarities.

And I had to:

- Apply pending patches for j721e to support the enable_stream API instead =
of s_stream
- Enable the experimental v4l2_subdev_enable_streams_api
- Add get_frame_desc to the sensor driver

