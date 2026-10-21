Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4147606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZVSrogS0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJY4eQXA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ss9+xgmqEFsNenyeczQqzZzI5zTV7SYF6kFMSc6ECM0=; b=ZVSrogS0nRGxj1ihwreLg4nvPm
	bp/zr9ZrjUYNQBEqZehGbUVjeahkji/jLhXSU9spiNe61ZW2hzj/OR1ZH3Ak0FdyElepikh09U9pZ
	SE3Re6zbJbuhNFuOOYPf4K3X91KkZJIT3YO3LkBrSn/SxC/7Siz/6JwkF/Ctt3nNU1dOnsQx8COoh
	18EtunJ5/4eG+cFC+816oyKMoL+LA9IrdHRUnEzZdm7d6vPt4iUjHZcS5ByF2ey7kHx2CH9PTepM2
	WrvZNNB42I9Vz8FLjdUbKKtyKLtXqLukXKJ7KuR6XQLqrYpadqk6/ioH0bay4yFFe6YDino8A9KkD
	VodSuETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYpi-0000000CLGl-1LAr;
	Wed, 21 Oct 2026 16:06:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYpg-0000000CLGF-3DdR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 16:06:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADF45601F6;
	Wed, 21 Oct 2026 16:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5151F000C1;
	Wed, 21 Oct 2026 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792598787;
	bh=Ss9+xgmqEFsNenyeczQqzZzI5zTV7SYF6kFMSc6ECM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BJY4eQXA4jwWnRnpNpNaVp3nRcgWyZui9VH23ubqT8fcYth5ZPk4f65s1+kY+bGjU
	 6FjgeDOJMm7lrYrkJgHksF7feOMRw863hLJCYxXJTJ94sfkul5938cx3fkzN1fqKIW
	 1+NNPDxldSFVGty/uRBvfZqpI1XYlIeFGMUIjKUmF/tWrXHOycCZNrbBxD5i+Pd0Nt
	 7DoEWLlBpxUZZ3+V6hrOe4zzRO/Qg8+2Bcdipq5LxeQNvhbMRL3RoyAveoucvOYDBk
	 gUrUyXn803gyhHqGkB5v5SJfnK5iu93uOrsfCkyXobuBC9hKKV3ohsKuUsfavnN4ge
	 Fex1LYOmCt5Pg==
Date: Wed, 21 Oct 2026 17:06:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <20261021-huddling-fabulous-75f0298c2fad@spud>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
 <20261002-prepaid-retired-3d2c9cbc035e@spud>
 <6uiccieqybi7rmdpf2bjgfppjdgpzt6sollr2y7ygex4ofssbh@anwfmi6qbyxp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vNj27yPJoswN/uUL"
Content-Disposition: inline
In-Reply-To: <6uiccieqybi7rmdpf2bjgfppjdgpzt6sollr2y7ygex4ofssbh@anwfmi6qbyxp>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--vNj27yPJoswN/uUL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 05:30:11PM +0200, Ernest Van Hoecke wrote:
> On Fri, Oct 02, 2026 at 06:05:24PM +0100, Conor Dooley wrote:
> > On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > [...]
> > > +  "#gpio-cells":
> > > +    const: 2
> > > +
> > > +  gpio-map:
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +
> > > +  gpio-map-mask:
> > > +    items:
> > > +      - const: 0xffffffff
> > > +      - const: 0
> > > +
> > > +  gpio-map-pass-thru:
> > > +    items:
> > > +      - const: 0
> > > +      - const: 0xffffffff
> >=20
> > These seem incredibly wide for something with only 4 gpios?
> >=20
> > Thanks,
> > Conor.
> >=20
>=20
> Hi Conor,
>=20
> Thanks for the chat at ELC and clarifying what was said here on the
> list.
>=20
> Regarding these masks and their width, they are indeed wide but they
> determine what to match against, and we have no reason to match anything
> except the exact number.
>=20
> This was previously shortly discussed here, and clarified by Rob:
> https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/
>=20
> I'll be sending a v3 of this with only the camera patches soon.

Ah, in that case I actually misunderstood the purpose of masks in next
nodes entirely!

--vNj27yPJoswN/uUL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatji/gAKCRB4tDGHoIJi
0gk5AP9sxjRlNjRUSh/6dQ4BD47xtrUFBlTOxV+oO53kFSNxVQD8Cwha6XPXEsBi
zZUmL6R2o0kyEqfwJlJTyz/W24/N/As=
=OKoW
-----END PGP SIGNATURE-----

--vNj27yPJoswN/uUL--

