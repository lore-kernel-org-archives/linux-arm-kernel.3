Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EBFC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 07:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1t9kgo32n46P3lCiA/YsRG69hKIm2B9bRzkw/n0hCc=; b=mYdjAePOOQEIf7OPjlZGuv/jmm
	q8/ZEu72Y7KeynvRLqrT8h7eNvrptsltcV9f4ma2pu/9e27QbbEo+Y13euhI7vjRelNHTGkkllSbR
	DfwZ5AM/ZC19Gc3ATHzY5q+880v8B7MbymvA73XnJAR3tLeOUpDt+KttGqceRqJb+/5/hESH3RwuL
	vuzJX7kb6GEvBrHlih/HEPcEEd3GKf7On6fHa4QmBLf483UBbxrHUlHbQz7SR4iCF6YicABhXleck
	EUZ8lq3iQQXOeNS3F/tumGaLFx2U8BijY95STGQ+G+3NuX9kItAeFp9skzKlh8klBZxgToQ8acvqd
	pIedHIIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXacJ-0000000DXZY-3bQ2;
	Fri, 04 Jul 2025 07:13:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaZz-0000000DXCO-2YY0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u1t9kgo32n46P3lCiA/YsRG69hKIm2B9bRzkw/n0hCc=; b=gVgbFs1kn09dMTNw/50SHizQNQ
	8uliOglufKwAMGdQhLVYWAWooHhyKHKoQNHpPdHaBWjszTp6QXdv6V+Ll65lEH4UfFCsKJlZ/3J1n
	Wevrv4GOP5vWecArr6QMYblJMYPrtuRlggMe6uV0mYGVWwPxKXRe6fnMmc7YPeuMio9++D2zYEQ1n
	Mw97ugqmBPtUxpbSyGQcgqFSDAbN0seaMLkDSZHxweZNhh4WdR41kO7PYpUQ5WG99Xj49Mn590fkt
	9yAq6MjQXKDNWS/DPdQBdeR1wnWLRFHQ9a6RkUY7W64AaJSyBQx0B4HpoJ+3DLovcmLG5ToPlHZ/P
	hD0o663w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaZu-00000007nta-3qtL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751613078;
	bh=u1t9kgo32n46P3lCiA/YsRG69hKIm2B9bRzkw/n0hCc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VrV1onEDAPBj1gXtmoDisI701xglCoEK1T4zryC7ADJ75bTtZGaIAJCx4Y+zBoPs9
	 jM2f/d/caI78n4W2MpPqQao8YaRoUF7u30y0XWeTUEDxLcBtmqmPRMGR2ST4oDCJu+
	 Qx6XV7KY1/PubEW2Ziu6FYhvT5UhsTk+aXN8llhNT+E67Ib9Wug3a8gxAQe8iyLJx6
	 tIcOVLsKDZ8XcymS+x2gdF32VGkyCvLqBB1epj+7AvtkVbnqQFHINFE/8SvYN0tDMH
	 hyzc0M3q8/ZRbKrqC64M/xogbPmQeeNgeV7X/3VYKjRNVS/7aJk6Sgjm1Ztl1SbsLF
	 Qt9f/pWZD7hsw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600C8F85cF092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B028B17E0EB8;
	Fri,  4 Jul 2025 09:11:17 +0200 (CEST)
Message-ID: <f2f39aad24dc000bd1066ade7a7a38a072a00664.camel@collabora.com>
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
Date: Fri, 04 Jul 2025 09:11:16 +0200
In-Reply-To: <cbf8d7bd-24a4-4dc1-8d9f-bbc4bee45d8d@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <5e1b26637706f6eac92acbbb3d5a7dafa0c2c232.camel@collabora.com>
	 <d4052ab3-9cd1-45e8-81b0-b6512822e646@gmail.com>
	 <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
	 <cbf8d7bd-24a4-4dc1-8d9f-bbc4bee45d8d@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_081123_106355_B91972C5 
X-CRM114-Status: GOOD (  50.17  )
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

On Thu, 2025-07-03 at 17:46 +0300, Cosmin Tanislav wrote:
>=20
>=20
> On 7/3/25 4:54 PM, Julien Massot wrote:
> > On Thu, 2025-07-03 at 15:17 +0300, Cosmin Tanislav wrote:
> > >=20
> > >=20
> > > On 7/3/25 3:07 PM, Julien Massot wrote:
> > > > Hi Cosmin,
> > > >=20
> > > > On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
> > > > > This series adds new drivers for multiple Maxim GMSL2 and GMSL3 d=
evices,
> > > > > replacing the few GMSL2 drivers already in upstream, and introduc=
ing a
> > > > > common framework that can be used to implement such GMSL chips, w=
hich
> > > > > avoids code duplication while also adding support for previously
> > > > > unsupported features.
> > > > >=20
> > > > > While the normally acceptable and polite way would be to extend t=
he
> > > > > current mainline drivers, the choice was made here to add a total=
ly new
> > > > > set of drivers. The current drivers support only a small subset o=
f the
> > > > > possible features, and only a few devices, so the end result afte=
r
> > > > > extending them would in any case be essentially fully rewritten, =
new
> > > > > drivers.
> > > > >=20
> > > > Thanks for your work,
> > > > The common framework will help a lot to drive new GMSL chips, and m=
ost of the
> > > > features are covered.
> > > >=20
> > > > > This series depends on support for internal pads, for which a pat=
ch has
> > > > > been added.
> > > > >=20
> > > > > The previous version is at:
> > > > > https://lore.kernel.org/lkml/20250618095858.2145209-1-demonsingur=
@gmail.com
> > > > >=20
> > > > > The following deserializers are supported:
> > > > > =C2=A0=C2=A0=C2=A0* MAX96712 (already exists in staging)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96714 (already exists)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96714F (already exists)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96714R (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96716 (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96724 (already exists as part of existing =
MAX96712 driver)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96724F (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96724R (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX9296A (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96792A (GMSL3)
> > > > >=20
> > > > > The following serializers are supported:
> > > > > =C2=A0=C2=A0=C2=A0* MAX96717 (already exists)
> > > > > =C2=A0=C2=A0=C2=A0* MAX9295A (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96793 (GMSL3)
> > > > >=20
> > > > > Known backward compatibility breakages:
> > > > > =C2=A0=C2=A0=C2=A0* No default routing. Default routing has been =
intentionally ommitted
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 as the devices support quite complex rou=
ting and it would be
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 unfeasible to provide sane defaults for =
multi-link deserialziers.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 It is expected that userspace programs w=
ould set appropritate
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 routing.
> > > > >=20
> > > > This part is the most annoying one: at the moment, there is no way =
to set the routing except
> > > > by
> > > > manually enabling a boolean within the kernel source.
> > > > You can't guess what routing the user really wants, but please at l=
east provide a default
> > > > routing
> > > > table that allows using your drivers =E2=80=94 for example, the dev=
ice's default routing.
> > > >=20
> > >=20
> > > It's a very delicate issue... I'll try to see if I can do that.
> > > It would be great if we could enable the streams API globally since i=
t's
> > > been merged since Jan 15 2023. It's been over two years.
> > >=20
> > >=20
> > > Thanks,
> > >=20
> > > >=20
> > > >=20
> > > > > The following list enumerates new features that are supported by =
the
> > > > > common framework and their respective chip-specific drivers:
> > > > > =C2=A0=C2=A0=C2=A0* Full Streams API support. Most deserializers =
have support for more
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 than one link, and more than one PHY. St=
reams support allows
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 configuration of routing between these l=
inks and PHYs.
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0* .get_frame_desc() support. Both the serialize=
rs and deserializers
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 implement this to query and provide fram=
e descriptor data. This is
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 used in features explained in-depth belo=
w.
> > > >=20
> > > > So are almost all the sensor drivers incompatible?
> > > >=20
> > >=20
> > > Yes, sensor drivers need to have .get_frame_desc() implemented... It'=
s
> > > not a huge feat and it's the only way this type of bridge could work
> > > properly.
> > >=20
> > > Alternatively, we could add a fallback that bases its decision on the
> > > stream format, but I'd prefer if we didn't and we would just implemen=
t
> > > .get_frame_desc(). After this series is merged I can submit my patche=
s
> > > for imx219.
> > There is already one pending on the mailing list
> > "media: i2c: imx219: Report streams using frame descriptors"
> > I guess it's fine if we require the sensor to implement this function.
> >=20
> > But I had to do it for vgxy61.
> >=20
> > Btw I tested:
> > TI AM62x + max96716 + 1 x max96717f + stvg5661 (tunnel mode)
> > With special lanes mapping and polarities.
> >=20
> > And I had to:
> >=20
> > - Apply pending patches for j721e to support the enable_stream API inst=
ead of s_stream
> > - Enable the experimental v4l2_subdev_enable_streams_api
> > - Add get_frame_desc to the sensor driver
>=20
> Did it work without issues with those changes?
>=20
Yes :)
btw you can add:
Tested-by: Julien Massot <julien.massot@collabora.com>
>=20
> If that's the case then I think all I can do to make it is easier is to
> add default routing. I'm not a fan of each driver having its own
> get_frame_desc() fallback, especially when it's a very small change to
> do to the sensor drivers.
Ok for me.

Ragards,
--=20
Julien

