Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A63CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXq8TjfuRwBJDFmcjQaKf5Ac9Rz8xfKy5c9Zpo6weko=; b=k9moTfcmc5uH+VJI/XXnrdLkjL
	QK5jo+ixcRQFaVGzgWxRXjJCIGa8WcIHUFz8fL9Iq2RmtauB1TGcz/2GlPMmzIBbJGh5f0nAMB01X
	pfClQvpKnT9jrM8Sg3WtqIGrOfm5Az8mDoJt0+4QI8BW9yyREFf/gEHymCbwzJCYMQoGP290UxB0F
	2eANlGjwYcvQ0Z4ShVILKAsjP8Q1RH9NjFTpsT1AH93+wuiZ1k9tQIfl9YUAf6yRLS2/IamzREpfU
	zRTghHMgmWiKhQWCjGt+0Tbspwa2EvcmIYXHpBEsVTUti4EwvN4UWkeoHmmzIsiGMzEa4wqnSridj
	2D/XvZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ493-000000080lu-22qN;
	Thu, 21 May 2026 14:13:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ48z-000000080kS-1Ok0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:13:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6AE540393;
	Thu, 21 May 2026 14:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA34D1F000E9;
	Thu, 21 May 2026 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779372780;
	bh=MXq8TjfuRwBJDFmcjQaKf5Ac9Rz8xfKy5c9Zpo6weko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PvEZzZ1655FGmbd6zXJ6T/rMFb7CmhUfEtbJLoTjU4tmYnoX6+Tqswijm+UqlUu+8
	 ouyZbpZ1dwiKOU8M2Rmncv8jA2PnfKJhZcWGDR4432ZtareJ+vhZjDS9sNe1eymlb4
	 C5m+SRVzQDOkvlSnW5WAWS4rKl43pyPTozTbRuXJ3E5Kz7Lx1mcl3i5UCwQMEek6Zc
	 XAWGv4rFOEhcUKSDFhPyU6BfRrxSczoaj21AiNDGVo6aHIQN3CdBIsGVVNzl2MvnFw
	 juL43kkVxDrWvidYTzZ1IcfvvxXLYnZ49hcXZqzOvkfCdXyg4om6GUOED5oYQ9Jr24
	 +JU7LEVKranRg==
Date: Thu, 21 May 2026 15:12:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Srirangan Madhavan <smadhavan@nvidia.com>, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org,
	sudeep.holla@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, vsethi@nvidia.com, jevans@nvidia.com,
	raghupathyk@nvidia.com, srikars@nvidia.com, nbenech@nvidia.com,
	alwilliamson@nvidia.com, Dan Williams <danwilliams@nvidia.com>
Subject: Re: [RFC PATCH 2/2] arm64: mm: add SMCCC-backed cache invalidate
 provider
Message-ID: <20260521-cried-unburned-b1bef70a7a69@spud>
References: <20260521073047.320614-1-smadhavan@nvidia.com>
 <20260521073047.320614-3-smadhavan@nvidia.com>
 <20260521121812.2e4abd71@jic23-huawei>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B3Dc7X1SeOCF54Ze"
Content-Disposition: inline
In-Reply-To: <20260521121812.2e4abd71@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_071301_481340_6B4EC001 
X-CRM114-Status: GOOD (  29.61  )
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


--B3Dc7X1SeOCF54Ze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 12:18:12PM +0100, Jonathan Cameron wrote:
> On Thu, 21 May 2026 07:30:47 +0000
> Srirangan Madhavan <smadhavan@nvidia.com> wrote:
>=20
> > Add an arm64 cache maintenance backend that discovers SMCCC cache
> > clean+invalidate support, queries attributes, handles transient BUSY and
> > RATE_LIMITED responses with bounded retries, and registers with the gen=
eric
> > cache coherency framework.
> >=20
> > Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Hi Srirangan,
>=20
> Other than the file location and Kconfig option comments, everything else
> is really trivial. + some musings about maybe being worth more clever
> fusing of ops in the future if it turns out to be useful.
>=20
> > ---
> >  MAINTAINERS                 |   1 +
> >  arch/arm64/mm/Makefile      |   1 +
> >  arch/arm64/mm/cache_maint.c | 180 ++++++++++++++++++++++++++++++++++++
>=20
> File location wise, this is a driver for a subsystem, be it one closely
> coupled to arm.  Arm maintainers, do you want it in there or in drivers/c=
ache ?
> My personal preference is always to keep drivers with subsystems but I do=
n't
> care that much.

At the risk of stepping on Will's/Catalin's toes, I'll butt in here..

If this was on riscv, using an ecall into sbi firmware, I'd be asking
for it to be put in drivers/cache. The mechanism for requesting the
ops is arch-specific, but the actual execution of it is not, right?
The actual execution is going to depend on the device-specific
firmware that the smc is made to. That puts it in the same boat as
clk-scmi to me, but I'm not really familiar with how these things break
down on arm64 to be sure.

> >  3 files changed, 182 insertions(+)
> >  create mode 100644 arch/arm64/mm/cache_maint.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2fb1c75afd16..33c35f8e6e40 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25383,6 +25383,7 @@ M:	Jonathan Cameron <jic23@kernel.org>
> >  S:	Maintained
> >  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> >  F:	Documentation/devicetree/bindings/cache/
> > +F:	arch/arm64/mm/cache_maint.c
>=20
> I wonder if this should just have a separate maintainers entry?=20
> We did that for the hisi driver.
>=20
> If not maybe add yourself as at least a Reviewer so that you get +CC'd
> on relevant changes.
>=20
> Conor, what do you think makes sense here.

I think it is very weird to have an arch/arm64/mm file in this entry,
implying that I would be applying patches for it, which I do not
consider to be appropriate. If it gets moved to drivers/cache, then it
I think a standalone maintainers entry for the driver is a good idea.

Cheers,
Conor.

--B3Dc7X1SeOCF54Ze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag8S0QAKCRB4tDGHoIJi
0rO7AQDTYhq4WHwZ2SbzpeFW1Iak0z7hL6cFW6LeaPWHDMqiVQEA4bNnsd3mMhtD
Lk8HFV8lYUn76z12P8ziDObCXHs8IAA=
=NF1t
-----END PGP SIGNATURE-----

--B3Dc7X1SeOCF54Ze--

