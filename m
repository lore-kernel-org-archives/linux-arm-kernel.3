Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08889FD7F9C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwWpfldxYj+gRbuWL4yQi0M0+T9IKtftHp175wOBUFE=; b=Tio59y1Gro4t4vxEyJGfC/qQNI
	U1osP2E5i1z8pyHZeWHoEaJTwrVcYUgv+0PA+JR+HnRnvIi79tsoEequxvNpHF3HI3eTUjQZ00dMP
	v3Pr6Beyh7d9xx+osr41OwOD/vAQ0K7Go/HX93t7o62y6egbweOj5+n8WNXVI0/igq+netS1jWosA
	v0FBVRXE5Tyeg7fQCbPlSZ+YzUN38r4nIrYgn0JdvSK3APQbF5W0k773LADDLliU9+d/F2OHVYi6X
	Dw/WFTKPsI6lnm+CQixrBsRdm4BLHywdewVIMFCxIkLdZ5iiHdkS/05rs4ky6fU8Tsq8gRDlMI7XQ
	vn56HKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3ge-000000092GS-2Vih;
	Fri, 27 Feb 2026 19:39:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3gc-000000092Fu-0VK3;
	Fri, 27 Feb 2026 19:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7111D42CB8;
	Fri, 27 Feb 2026 19:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A234C116C6;
	Fri, 27 Feb 2026 19:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221181;
	bh=O+WgI2+lvkCcEXyjLwH9WcugXMqBc51MClSIi5cbpU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGxoRRbTq5HmoPfWWmjM8VkM5jC9a9tIwebQMRE7aiqMXtR94apjmlmg7ROCdlX0y
	 1jj4BMbstJrAcOXMlpfHvA0Kx7IE6U4Ck/Q3KxD9kfoBwVOnaA9rHtBUULICbrAYVZ
	 vjmHETAgZ4OJt8keha+2DbffXBQ15rU7me72PzBT83ARMh7+ZlakJmTQoDaU/CUco+
	 4WHyVhq2OrwPoHc59OtXi8qWnmwKD2NYoqIvB7PhI21LvkIEkxWIijnzG/1AjEI/03
	 DNZH3VbjLcH8XbnNdZGlRD0KpYgC87RZBgNBkJ3KuIA2LyX7LLWm32jxJn1crHzsmh
	 v7XnGsJuwp/HA==
Date: Fri, 27 Feb 2026 19:39:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260227-urologist-gratitude-7984733f2d41@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
 <20260226-snide-foil-a05e1aa156a8@spud>
 <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
 <20260227-atonable-glamorous-920cfd832bc1@spud>
 <86f4e4ee-cf49-4ebe-8cc6-0a9763ade36a@collabora.com>
 <20260227-wreckage-cozily-200175c6efce@spud>
 <9cf5677d-8b90-4ccc-9b70-3e05a5a4a1c7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KNbYRtnhIM3FHQeV"
Content-Disposition: inline
In-Reply-To: <9cf5677d-8b90-4ccc-9b70-3e05a5a4a1c7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_113942_203175_1E168162 
X-CRM114-Status: GOOD (  41.41  )
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


--KNbYRtnhIM3FHQeV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 09:35:01PM +0200, Cristian Ciocaltea wrote:
> On 2/27/26 8:10 PM, Conor Dooley wrote:
> > On Fri, Feb 27, 2026 at 07:49:33PM +0200, Cristian Ciocaltea wrote:
> >> On 2/27/26 7:18 PM, Conor Dooley wrote:
> >>> On Thu, Feb 26, 2026 at 04:56:30PM -0500, Nicolas Dufresne wrote:
> >>>> Le jeudi 26 f=E9vrier 2026 =E0 20:59 +0000, Conor Dooley a =E9crit :
> >>>>> On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
> >>>>>> Le jeudi 26 f=E9vrier 2026 =E0 18:43 +0000, Conor Dooley a =E9crit=
 :
> >>>
> >>>>>>> Deprecating the order also makes little sense to me, given that s=
ome of
> >>>>>>> these devices only have one reg entry, which as far as I can tell=
 from
> >>>>>>> looking at the driver *is* the "function" region, so it can never=
 be
> >>>>>>> entirely deprecated.
> >>>>>>
> >>>>>> What I'd like to see, is a binding expression that behave like a s=
et, not a
> >>>>>> list, and leave the ordering open. As people keep repeating, there=
 is nothing in
> >>>>>> a binding that assist to define the right ordering (its not addres=
s or base
> >>>>>> addres aware). That basically means, we can't as reviewer see that=
 ordering is
> >>>>>> going to imposing using a base address in the unit name (which is =
a convenience,
> >>>>>> not a rule I suppose) that differ from the vendor documented base =
address.
> >>>>>>
> >>>>>> By explicitly removing the ordering in the binding, we create a st=
rict rule that
> >>>>>> driver should retrieve this by name, and never assume the ordering=
, which I
> >>>>>> personally like.
> >>>>>>
> >>>>>> thoughts ?
> >>>>>
> >>>>> Yeah, you can do this, but to avoid potential breaks you have to do=
 it
> >>>>> from the start, not after the fact. Probably there's bindings that =
get
> >>>>> acked every day that do do this. Even the retcon is okay to do when
> >>>>> reg-names is mandated by the binding and the users use reg-names in=
 my
> >>>>> opinion.
> >>>>
> >>>> I think from the above analyses, since the usage only starts in rc1,=
 we have
> >>>> room for improving it knowing we aren't creating problem for anyone.=
 Note that I
> >>>> have no idea what the syntax is to "do this", and I doubt either Det=
lev or
> >>>> Cristian have a clue.
> >>>
> >>> I think this is the only bit that really still needs a reply, this can
> >>> be solved by adding reg-names as "required" to the existing condition=
al
> >>> portion of the binding. There's probably hundreds of examples if one
> >>> does a search for "then:\n.*required:" to use a basis for the change
> >>> here. Probably should be an independent change, since it is needed ev=
en
> >>> without the re-order given the bug I brought up.
> >>
> >> As mentioned in my previous reply, the actual problem is that the bind=
ing has
> >> been already released, and I'm not sure we can change this without bre=
aking the
> >> ABI.
> =20
> [...]
>=20
> > So yes, while what I propose is an ABI break, the driver currently
> > expects reg-names to be mandatory for the rk3588-vdec. Additionally, new
> > required properties are only really a meaningful ABI break if the driver
> > is changed to required them, since that would render old devicetrees
> > non-functional. The driver in question already requires them, so that's
> > pretty moot!=20
>=20
> I think that's precisely the information I was looking for, i.e. breaking=
 ABI
> in this case is fully justified since we cannot really fix the driver.  I=
 mean=20
> we would have time to do this, since the rk3588 related changes landed in
> v7.0-rc1, but it's not feasible to accommodate to the current state of the
> binding, as you clearly pointed out.
>=20
> > Hopefully I've made my point about reg-names being mandatory this time
> > around?
>=20
> Totally, thanks for your time and sorry for the confusion around the topi=
c!

No worries. I as kinda wondering if I had someone gone nuts and
misunderstaood what the driver was doing!

> My only question now is how should we proceed with this particular change=
 - I'd
> handle it in a dedicated patch, preceding this one.

I would do it in a dedicated patch yeah, since it is independently
justifiable.

--KNbYRtnhIM3FHQeV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHy9wAKCRB4tDGHoIJi
0tK7AQCzlsxi7/2yPN6ZSV/qJFQ14fb1yJTyOOCqm57kOJpOygD8DJX6ftXfY1YT
2D9L4lqHhfRS8DyY6H2walzOQPY8sgQ=
=Hg14
-----END PGP SIGNATURE-----

--KNbYRtnhIM3FHQeV--

