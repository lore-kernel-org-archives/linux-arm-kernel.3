Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58CFD59F55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFDRCa0XKMHFYOR3uG48ep5LCFtGy7INevzQqLdyhe0=; b=LXQ6XUd/ArHHBazGXIi1Qicgih
	5xDkqhtY2YNkwNZ90G1nj0a7G/JUj35+4Gu+aCTtNsY7uUCqTfR1LN0661iTbi268qnUAfZ6UmTCI
	3jsMPFXGFag2MWXCGQ+1E1fxzzYrc1BM2RUiUlj99sm59W9+L/05dbwpskjYwxe77Rmd0sMbE0kPd
	Ji5GzgxPyi84JEckuGhmMBo1gV/rhCT94nMCPgPAKgqus6H7GBTloPHbA/bUeN+bEaV0pb6GdmcNL
	etsHQB7u4esPFMvKOwMHLi5kVxkBUw3+GmrlzJdNafSGfp0EKVzi9ylH1fSH+GzQFLoquVjeZw8xt
	jJd3zYVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jNX-000000047DO-3wNt;
	Wed, 06 Nov 2024 16:59:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jLo-000000046lk-1A1P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:57:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C80895C4A0F;
	Wed,  6 Nov 2024 16:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9119CC4CEC6;
	Wed,  6 Nov 2024 16:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730912267;
	bh=kFDRCa0XKMHFYOR3uG48ep5LCFtGy7INevzQqLdyhe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3yxVTiBm47hSjot2DdT1qMfPqitnfZ1ftMpEVbNszJEhXknaWzfPwufHIOB9g9hK
	 m7hMugw2ooCnuVEOFYWW3nMazspNkD/Q2GhHm+uDCZTPb0wQd7L7R3G1q6S3z8mdye
	 8UJvWwrSxOqCq1P3bSBFad2iRMkbwXzjG/ySfkt8wMpm99V3euPdc4YDNncU3sB8gM
	 pNRerVg25YNkCWuBJ25s99UHUBADlbgvA0nJFF1yGP+WfYECnFNiWxcqanNqk5J5Kv
	 t4+2g/l2/U4pgnlbF1L8mmkY6hi8+J73TSwopd+NvcaT2yC8ccxHT14CfNS5heyo6P
	 UWQEjZHCE5b2A==
Date: Wed, 6 Nov 2024 16:57:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 01/21] dt-bindings: gpu: img: More explicit compatible
 strings
Message-ID: <20241106-flagstone-mandarin-8caf9da78f19@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-1-4ed30e865892@imgtec.com>
 <20241105-matron-gangway-64e78576ec47@spud>
 <d70a01d3-24d5-4e31-92ab-7f6626452852@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tUKQCQPIgKD2Ml6c"
Content-Disposition: inline
In-Reply-To: <d70a01d3-24d5-4e31-92ab-7f6626452852@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_085748_427718_C324F3FD 
X-CRM114-Status: GOOD (  30.15  )
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


--tUKQCQPIgKD2Ml6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:17:47AM +0000, Matt Coster wrote:
> On 05/11/2024 18:13, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 03:58:07PM +0000, Matt Coster wrote:
> >> The current compatible strings are not specific enough to constrain the
> >> hardware in devicetree. For example, the current "img,img-axe" string
> >> refers to the entire family of Series AXE GPUs. The more specific
> >> "img,img-axe-1-16m" string refers to the AXE-1-16M GPU which, unlike t=
he
> >> rest of its family, only uses a single power domain.
> >=20
> > That's not true, you could apply the rules using the ti,am62-gpu
> > compatible, no?
>=20
> The intent here is to draw a line between properties inherent to the IP
> core and choices made by the silicon vendor at integration time. The
> number of power domains is a property of the IP core, whereas the
> decision to use one or three clocks (next patch) is a vendor choice.

That's a different argument than the one in your commit message, but I
will accept it.

> >> Work is currently underway to add support for volcanic-based Imaginati=
on
> >> GPUs; also add a generic top-level "img,img-rogue" compatible string to
> >> allow for simpler differentiation in devicetrees.
> >=20
> > This makes no sense, how does adding another fallback compatible make
> > it simpler? I have to assume that this means there will be geothermally
> > powered axes in the future and you want to tell the difference between
> > them and those pesky rogue axes that chop the heads off of naughty
> > children?
>=20
> The intent is to add Volcanic bindings in img,powervr-volcanic.yaml, but
> the split between Rogue and Volcanic is... a bit weird. The BXS-4-64
> we're adding support for here is Rogue but, for example, the BXS-32-1024
> is Volcanic. I figured it would be nice to be able to grok from the
> devicetree which architecture a core is using without having to refer
> back to the bindings.

So not geothermally powered axes, but it was the rationale.

> The primary differentiator from a dt perspective is power topology. In
> Rogue, there are few (poorly named) power domains. Volcanic has (a)
> better domain names and (b) typically more granularity in domains,
> leading to actual dependency trees we need to care about besides the
> trivial A->B->... in Rogue.

Please add that detail to the commit message. Not all of it, but the
bits in the first paragraph.

Cheers,
Conor.

--tUKQCQPIgKD2Ml6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyugBQAKCRB4tDGHoIJi
0o5WAP9qdPoidxf7Wb9XEMajnxOl7aWPCFarHIxFdXJMcNDRsAD/SjbnAVWJB8zS
+/+GsnqRLs/GRLCfNIKRr1NjFUN4uw4=
=QMO4
-----END PGP SIGNATURE-----

--tUKQCQPIgKD2Ml6c--

