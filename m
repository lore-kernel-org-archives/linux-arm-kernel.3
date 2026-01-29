Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F958D73E84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAmX64ByYSYyBNX4ug4iq9iPBytwAhNBu+AgO+lObEE=; b=C7o+IeZwBGJjiP4tr8kT8IPRhz
	wUNXIDxwY1RSnkThyBD+wUEx1Smgnf6k0UpV0FKFW4NpS1m8mQDKOT1xBf3FNrnlwd+sPPE6w8kcm
	2G/WdBwkbgK9EAPHYKFtMsFJBe11r2jcV9YxipdhanRsQBzHGz0d2yFvUOnPUCxFJRGZKHmxpzqa9
	WmINnj+XTmLm9OBOi4kZ5FPkKgGStktZidYeElnOpn7DWr1d8xbWn0pHnaKoBF42d504XIYR8M4Qj
	PXFGpESStDF13DBVLSE0JjF9QJrSUGaWbu3HU6XAhR67MSsb4JZU90oHP+FaG0VWVGSPi2XWrZjEr
	2ah1os1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWSY-00000000UJW-1aVN;
	Thu, 29 Jan 2026 18:09:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWSW-00000000UJ2-1aM7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 18:09:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A28DE4348C;
	Thu, 29 Jan 2026 18:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97F7C4CEF7;
	Thu, 29 Jan 2026 18:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769710173;
	bh=X3dIjavYFpRlf4UuxeHHbJVM2yWZQYTwqnTNrnYY9F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lz0ivwafeBsWx2ZmOe0viGtVa9AHt5i1IiadOM6KxbnZ3Z9M2/ZeH7DNRogB4hdan
	 GA7y2gHDtUWEUUZjlR0gWMufwN51RlQu53R/mVtj1Fd0t29n5GocegUS6bGU6XG0qt
	 QLMoH6ANs8tl4uuhpEViwx/AzSL0WzWEZOC1WrJ+YBocJg8xy+JDvufWxVsjIhk7/2
	 ottcCYSTRMgzz3UMQp/G7Ma60+CuqSO3XO+3SDvrSWaM16OL44JuybrEjqsVpwnSkD
	 KgHrYAT4s7ybwUP7cSXIFE5u1kY7I9QTKU+9SmqZNJUuchXzNo4BckQw1ceuKqU4mU
	 6GRssTCwytyvQ==
Date: Thu, 29 Jan 2026 18:09:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <a17602f1-537e-46e6-a85d-8a005a0443a2@sirena.org.uk>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
 <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qaLgfkh9drmjEuxE"
Content-Disposition: inline
In-Reply-To: <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
X-Cookie: You have taken yourself too seriously.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_100936_454815_1F10E182 
X-CRM114-Status: GOOD (  23.12  )
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


--qaLgfkh9drmjEuxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 12:46:27PM -0500, Sean Anderson wrote:
> On 1/29/26 12:27, Mark Brown wrote:
> > On Thu, Jan 29, 2026 at 12:23:15PM -0500, Sean Anderson wrote:

> >> -	ret =3D of_property_read_u32(node, "xlnx,num-channels", &drv_data->c=
hannels);

> >> -	ret =3D of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_wi=
dth);

> > Given that the properties already exist it seems wise to continue to
> > parse them if available and prefer them over what we read from the
> > hardware, it would not shock me to discover that hardware exists where
> > the registers are inaccurate or need overriding due to bugs.

> I would be surprised if such hardware exists. These properties are
> automatically generated by Xilinx's tools based on the HDL core's
> properties. This has a few consequences:

> - They always exactly match the hardware unless someone has gone in and
>   modified them. I think this is unlikely in this case because they
>   directly reflect parameters that should not need to be adjusted.
> - Driver authors tend to use them even when there are hardware registers
>   available with the same information, as Xilinx has not always been
>   consistent in adding such registers.

I'm not sure I follow your second point - driver authors tend to use
what? =20

> I am not aware of any errata regarding incorrect generation of
> properties for this device or cases where the number of channels or bit
> depth was incorrect.

I'd still rather see the properties get used if present, worst case
they're redundant best case we avoid regressing a currently working
system.  The code is already there, it just needs tweaking to make parse
failures non-fatal.

--qaLgfkh9drmjEuxE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7olgACgkQJNaLcl1U
h9Brugf/Sf1L+2pbe418c3gbruA16NIxAYYuKlLIaYzui7BO5qunhWEDV8iJuhhE
cYJvfiZvXGoJwT9xiz6SoE3o54HVnh8HHYrejMDPFLSHP8aPOOKuObHYKkocMXq2
GnR70fnln4bKdw9RNg+KJhikOr7kv4LIVhkwo3lLOmGQcheKQqqDAiheo2mmb4wO
Zjhy7VyarQuAkPBncrcrjXxGPymHa3JuMS9/ZvvHh0QISxM0sstke+ai0Z4toqMW
15xLcjyjs8DjbBLMWLF331wScYITq3ICWu01T8ajasZVQ8lRuB1lSW3ZBVxZ9AOb
9V6t3cMd6HxwzY8FLgzBNaUA6N83BQ==
=3AUd
-----END PGP SIGNATURE-----

--qaLgfkh9drmjEuxE--

