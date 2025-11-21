Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4864CCFC500
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 19:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfMc3/9164C8YzBzckk6E6TtXb+y1nhdvXc9ywLCyUM=; b=0eWuNM2OPO2j3hvxbFYDKMBWMw
	uv5nZdqIdu9FA4P7Ry1B10MMO5vOBYzEVU1vhxtd6oqgCXjb7/1pVq2Kw235ZtLzdBo9R9hOAiCDb
	QAU1di+70IgCuo8LxLQbqxOC9hU9CFfEMXowT+v3j8QM7GtPnXk5j3JPriIPukkpWQwxgTmOnFzb5
	k/BxdAx9nijII0PTJZ/88rT3tIJLruUi35BMjLpQGwECCeoYSybn9ZfT6sTtnISgIDOjTFPykiFSq
	Od2MN9JL/COLQVLer4o1bTd7kToHjxXsJ1xpa9Ew+qTdaHTfyExcxxrVrzDsOPXTnCowigMw8nDY8
	1u/KiGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMX65-00000008vHb-0PGK;
	Fri, 21 Nov 2025 19:47:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMX64-00000008vGw-0eJs;
	Fri, 21 Nov 2025 19:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E7CC601F0;
	Fri, 21 Nov 2025 19:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690D2C4CEF1;
	Fri, 21 Nov 2025 19:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763754426;
	bh=Vg/9WM4svuJxXmTZGYFyYyC/fQlAZAwS2uwXY2DgmR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HS/I0gDRR5ulP8YpCKhY0pGoC//uLtHpesK93QeLmDwHiWXgVF9PfspYCcY8YDa4e
	 QnodNPzsMmpz6DkDpNNgHyqQ4J63bUI2MoW12ViGmehzqFp9bWDuPmjnkp6kS0CvQS
	 oabcR2BgJpsitAfB7NNHtgePHZblvY8fPs4S/l4KvQHoem1aliLIO4FMggaYN6eqI6
	 PBCyKmFVL2E/c1ntLJU+gYavkSwA05ILhv6s7pKH1j6Mz7QkiodmlCv7istGTUFffJ
	 ANaSC6cjqLNnAtUDr7Ap7skCr6YQHKCThhTudU1ChxaK3UZVeoVpj46DLusTf2ly+o
	 VswKi+rmdKN6Q==
Date: Fri, 21 Nov 2025 20:42:34 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] kbuild: Support directory targets for building DTBs
Message-ID: <aSDAqhUb8_76IP0Y@derry.ads.avm.de>
References: <20251120204812.1983452-4-robh@kernel.org>
 <20251121063033.GA571346@ax162>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AfpfqPLkSPOJGvv9"
Content-Disposition: inline
In-Reply-To: <20251121063033.GA571346@ax162>
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


--AfpfqPLkSPOJGvv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 11:30:33PM -0700, Nathan Chancellor wrote:
> On Thu, Nov 20, 2025 at 02:48:13PM -0600, Rob Herring (Arm) wrote:
> > It is useful to be able to build all the DTBs for a vendor. One can list
> > all the .dts files in a directory and convert those to %.dtb targets,
> > but that doesn't work for base+overlay DTB targets.
> >=20
> > Adding the dts subdirectory is straight-forward, but building the
> > DTBs should only happen for certain targets (dtbs, dtbs_check, %.dtb,
> > %.dtbo, and the directory target(s)).
> >=20
> > The 'scripts_dtc' rule doesn't really depend on 'dt_binding_schemas',
> > but the directory target only depends on 'scripts' which depends on
> > 'scripts_dtc'.
> >=20
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Please ack and I'll take this in the DT tree.
> >=20
> > I don't really like looking at MAKECMDGOALS, but that's the only way I
> > could come up with that works. Maybe someone knows a better way.
>=20
> Yeah, I do worry that just looking for "dtb" in MAKECMDGOALS could
> result in some false positives but in the tree now, I only see one .c
> file that would trigger this logic, so maybe it is not that big of a
> deal?
>=20
>   $ fd dtb
>   arch/microblaze/boot/dts/linked_dtb.S
>   arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
>   arch/um/kernel/dtb.c
>   drivers/gpu/drm/ci/dtbs-check.sh
>   scripts/Makefile.dtbinst
>   scripts/Makefile.dtbs
>=20
> Unfortunately, my Make-fu is pretty weak right now so I do not have any
> immediate suggestions but Nicolas might... otherwise, we could probably
> ride this for right now and either revert it or forward fix it if
> problems come up in further testing, since this does seem rather useful
> for folks working on device tree files.

well, evaluating MAKECMDGOALS does not look that bad to me.  But I'd
rather like to reduce the use of findstring, see below.

>=20
> > v2:
> >  - Convert arm, mips and riscv. The other DT enabled arches don't have=
=20
> >    vendor directories.
> >  - Link to v1: https://lore.kernel.org/all/20251113225952.867138-1-robh=
@kernel.org/=20
> >=20
> > ---
> >  Makefile              | 2 +-
> >  arch/arm/Kbuild       | 2 ++
> >  arch/arm64/Kbuild     | 2 ++
> >  arch/mips/Kbuild      | 2 ++
> >  arch/riscv/Kbuild     | 2 ++
> >  scripts/Makefile.dtbs | 3 +++
> >  6 files changed, 12 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Makefile b/Makefile
> > index 17cfa11ca716..85018d461575 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1494,7 +1494,7 @@ export CHECK_DTBS=3Dy
> >  endif
> > =20
> >  ifneq ($(CHECK_DTBS),)
> > -dtbs_prepare: dt_binding_schemas
> > +scripts_dtc: dt_binding_schemas
> >  endif
> > =20
> >  dtbs_check: dtbs
> > diff --git a/arch/arm/Kbuild b/arch/arm/Kbuild
> > index 69de6b6243c7..af7dd53585c3 100644
> > --- a/arch/arm/Kbuild
> > +++ b/arch/arm/Kbuild
> > @@ -10,5 +10,7 @@ obj-y				+=3D probes/
> >  obj-y				+=3D net/
> >  obj-y				+=3D crypto/
> > =20
> > +subdir-y +=3D boot/dts
> > +
> >  # for cleaning
> >  subdir- +=3D boot
> > diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
> > index 5bfbf7d79c99..9e9820af48c9 100644
> > --- a/arch/arm64/Kbuild
> > +++ b/arch/arm64/Kbuild
> > @@ -5,5 +5,7 @@ obj-$(CONFIG_XEN)	+=3D xen/
> >  obj-$(subst m,y,$(CONFIG_HYPERV))	+=3D hyperv/
> >  obj-$(CONFIG_CRYPTO)	+=3D crypto/
> > =20
> > +subdir-y +=3D boot/dts
> > +
> >  # for cleaning
> >  subdir- +=3D boot
> > diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
> > index e901bf554483..6125d00cdcef 100644
> > --- a/arch/mips/Kbuild
> > +++ b/arch/mips/Kbuild
> > @@ -21,5 +21,7 @@ ifdef CONFIG_KVM
> >  obj-y +=3D kvm/
> >  endif
> > =20
> > +subdir-y +=3D boot/dts
> > +
> >  # for cleaning
> >  subdir- +=3D boot
> > diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
> > index 126fb738fc44..3cf7f84eb287 100644
> > --- a/arch/riscv/Kbuild
> > +++ b/arch/riscv/Kbuild
> > @@ -7,5 +7,7 @@ obj-$(CONFIG_KVM) +=3D kvm/
> > =20
> >  obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) +=3D purgatory/
> > =20
> > +subdir-y +=3D boot/dts
> > +
> >  # for cleaning
> >  subdir- +=3D boot
> > diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> > index 2d321b813600..4d0d164df275 100644
> > --- a/scripts/Makefile.dtbs
> > +++ b/scripts/Makefile.dtbs
> > @@ -14,7 +14,10 @@ dtb-y           :=3D $(addprefix $(obj)/, $(dtb-y))
> >  multi-dtb-y     :=3D $(addprefix $(obj)/, $(multi-dtb-y))
> >  real-dtb-y      :=3D $(addprefix $(obj)/, $(real-dtb-y))
> > =20
> > +ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(findstring dtb,$(MAKECMDGO=
ALS)),)

Using '$(filter )' instead of '$(findstring )' reduces the risk of false
positives, e.g.:

dtb-targets :=3D %/dts %.dtb %.dtbo dtbs dtbs_check
ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(filter $(dtb-targets),$(MAKECMD=
GOALS)),)


With (something like) that:
Tested-by: Nicolas Schier <nsc@kernel.org>
Acked-by: Nicolas Schier <nsc@kernel.org>

But [1] seems to break this patch.

[1]: https://lore.kernel.org/linux-kbuild/20251120140645.478623-1-thomas.de=
_schampheleire@nokia.com

Kind regards,
Nicolas

--AfpfqPLkSPOJGvv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmkgwKoACgkQB1IKcBYm
Emm8Qw/+MwI0xujbY4z6kH8eqisZOdw3rGVbln1KTIUnNXmON6raX7XFOnAxqaHI
BhYiwbUYWUHKeHApq1XCTR4WKNtzMYiID+zA0HuwxuqOlzdPwl35Xn+nvBw/Mmfw
xUF9nqlmFu7MH9xIOfbWotGMIgqBc5FKAflHwHGpjW009mvPQ5hnMqiXk0DVu8oz
rVLhviLqgjsx2ESl0sgkfiOBt0ygtzFKvUrqSVixl/sB5nI7sOhU190u8qvpZ/bV
Pc6s9+IUhTv5+iaxhTUcsQjZTgHp5KJSrlmcIUY5eLdwFQRFAB3w4Kx8xNY8NO02
xLPZSQ28FcJaBuRyLTYFy4CaVOMKV2r2JW5DUdkUxuIwh9UdEkOjCQSWfomRALGc
PlZzKpsUp7p76fW2WkbjN9r45qCRFdaWEN3olr9vBh0Y5u+1AnZh7Ej/lws7Cj4z
sEBo6QdAlP0ofjB1JrNP98MMOQu1Tr3fOwkadCmyRtuYqJG72Tj7t6EBrC/JRoS0
MFl/XEPHgQcjRgVIWEfFtCwrflq2jO/f2fbfTZHPxbMbj99CATyDDTy+QWzB8bhT
RqrzlrejhI4WV27fReo4wMk/Og8ewO0/h2mloIi1hrORFClz5M+aU3CCEvFu2hfY
+hBhCWYDLSN4n5mUhA6nH/RFdZoNohijzS15aqmkCNWx1yM/g5I=
=pv6m
-----END PGP SIGNATURE-----

--AfpfqPLkSPOJGvv9--

