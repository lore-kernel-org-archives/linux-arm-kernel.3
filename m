Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9F0E6BF3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 22:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHObMvUlxXW475nFTygdQs5EuNfKBMKSf4m21mBwUNE=; b=OCMtBl3See3Rc/WU1mKdhoD7B7
	y5xr1HLuQ4fcAN16q7U/tUxVv6j4jR6i8/9Qw3SW/HoYbSTxQzgupP8WaBMkZNnw8+nS/wg8U3ZXU
	3ZepSDkz1t4rpqJPUXcfK0HRPiReQ8l/CnZkRP8oT9CAvxeIw0St1bVWaMH8bsgCh/Vi4URyYOI9V
	Ztn5a73RbYzP3XHb70qgEmaJUF6/DCLqJavdu/NeJQl0r3hBvh2hPgvFHG2TJbJoNI/aCU6x5eIxp
	Xww6rW78r9lKwp9JcoJmRc51dMUFBD0ygGwlSwcs0vShC3sZLOe5niqyfNh0Q9bn6l9cXA6qZFblT
	/5EGy+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxNO-000000024pR-1IvA;
	Fri, 30 Jan 2026 22:54:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxNM-000000024p5-0hg5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 22:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BEE140346;
	Fri, 30 Jan 2026 22:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95264C4CEF7;
	Fri, 30 Jan 2026 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769813643;
	bh=BC9YUeb9WKTkaJYQAKVMGEgmblMkguJiuXzL58qwZdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQuQ/WcumE1JiQ//1BD6xkMbC7920ppd98IUaxn07imyq6dlfHJoBd6f7/urcHey/
	 hINeibsZzFMxfIhdTUmecKzDRv/4rrVMjIj+aEhIu7eqObigZ6K9oXzGOhBSvIaTeZ
	 GC+nN9ylQumoJi6pqJCwsB0h8E9T3OWnWUG4fOy7WGTvWJatWL1UFuatOrQNGbIYsf
	 Ja+2WDWHqaIzVv89lrJnH36fTI4dUNQH65b7WWtr5UG/N9QqQsYarLXz7xRfjhsjux
	 IwjEa0erbNQKHWkM5xQVuZfH873ncLYwBhGLLz89JPaQ2d7z82gnP0FSc8b4Y9mNUt
	 owqXJzO7UbZBw==
Date: Fri, 30 Jan 2026 23:54:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: imx-tpm: keep channel state instead of counting
Message-ID: <hgq3sqxuav3z3fgxyighfgqan6hliu2bev7bthgrmzlwsjecmv@7bxor6zucgct>
References: <20260130143720.778514-1-viorel.suman@oss.nxp.com>
 <aXztQkefafsgFJvN@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywia3zssrqv4e5f3"
Content-Disposition: inline
In-Reply-To: <aXztQkefafsgFJvN@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_145404_225258_8BE3876B 
X-CRM114-Status: GOOD (  13.64  )
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


--ywia3zssrqv4e5f3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: imx-tpm: keep channel state instead of counting
MIME-Version: 1.0

On Fri, Jan 30, 2026 at 12:41:22PM -0500, Frank Li wrote:
> On Fri, Jan 30, 2026 at 04:37:20PM +0200, Viorel Suman (OSS) wrote:
> > @@ -166,6 +166,10 @@ static int pwm_imx_tpm_get_state(struct pwm_chip *=
chip,
> >
> >  	/* get channel status */
> >  	state->enabled =3D FIELD_GET(PWM_IMX_TPM_CnSC_ELS, val) ? true : fals=
e;
> > +	if (state->enabled)
> > +		tpm->enabled_channels |=3D BIT(pwm->hwpwm);
> > +	else
> > +		tpm->enabled_channels &=3D ~BIT(pwm->hwpwm);
>=20
> Do you have lock for RMW? or you should atomic_or() and atomic_and()

=2Eget_state() is called under the chip lock, so the locking should be
fine.

Best regards
Uwe

--ywia3zssrqv4e5f3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAml9NnAACgkQj4D7WH0S
/k4HZAgAgpYz3BG+3flQ7e8bEdfouy6v7sOSUJ7IDh3f9w/p8HjkSIFaQbbRCsKf
vMlD3WQf2bD87YysBuN/oSDlUI/L3qUWRS4PerGgeBAR1kWwMuY/g7E5mVz/OdxV
kSGVkvBhTVsjE3M3R1XHX0AlKzFR1hGPkZxw18ggECdtwj81QhxS8ZUWmUJaZxle
w9mFBvYt75QBvXG/am97eJ9hyVv9Br0R1yUYbJazN53Pw0dvWR2ZpL6SFPCscVKX
EUz+UK6Bj2grSG4/T6jJHJ2B0I/bqhBrn/7jEuY5/x9vLCLm8uLBSihQgDwMg16D
Ex8i2jdJutn4q67nVavlxs5sjCEerw==
=coeH
-----END PGP SIGNATURE-----

--ywia3zssrqv4e5f3--

