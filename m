Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF6ECD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcFryAbGeyyrYRZWQtDh2JeS/xj09u5cZDJO8ct+7YA=; b=BSB5VFkd7z1lUij6voMmUCELUX
	shaN5JOtHIb8lj4hhQ112xuoaKpQzuwhqaNInlvfGWD+6YSZs8txdgj75h5el6axxgy0kjPTW6Ioa
	mh8jLabMZwP+gpE/8HIaiC4N4wbMdlBL09nHSNdIk4NqQKxLP24LpZSTCjv0ql8Hq73buFaN6fpqk
	iXLq5Qs/J03rqfrQOB5lcgdhTajuKC4Te6L7CjQnCtGtef4KJL8liz7Upk1ZYLzwQuR5WPBjhrjpm
	NM10nwsHzaqfrlHyG++mr6cKZ63KgpBwGozXHOL8l14ie0jpvDVNCxrNkgEGMHlif3F+ovoeRRzhb
	ZYxyFXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaZv-00000006Hwf-3odO;
	Thu, 14 May 2026 18:14:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaZu-00000006HwA-0cg6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 18:14:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F2F8443BD;
	Thu, 14 May 2026 18:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9E0C2BCFD;
	Thu, 14 May 2026 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782473;
	bh=uJ+OslMzGkZCCzZkBjIfav+BmWpyOjO8077z/eM7t/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1iZhv8n2vhLCyYDrIOoFYRJVaLKVZyJ07rcZ9+//ZJ+5w2J1zfWRqu0K8tv8Ys9T
	 RDcLHohpSIXSFOuCbFtYeXF2drvVfbOlukDdUnSPP/3yVKbzdvXW1ukjOq9KpM/yu5
	 bpNmY2IUNlaED4aeiOvdS8hJ0v0Dkfhd6JSFhTUf5dZA9Z/IXxAmrHbLpfeMpX46vN
	 Y5kPycRP6i7EUEUnku5piuOYJnJQXgSv+6eSjwOR0LJp+86Fm+zfAQHNVSnEMpeI5v
	 OENhrtenTVgWHflYw1lSQ68sDq8cYvxHHI50ue0iFC64ZYuuX3f3qpmcBpY3b5AnXH
	 CXzjL4BVOTs3A==
Date: Thu, 14 May 2026 19:14:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH 2/2] dt-bindings: timer: pit: add PIT node example for
 s32g2/3 platforms
Message-ID: <20260514-ovary-upload-469fb61d1c0b@spud>
References: <20260514070605.996462-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260514070605.996462-3-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LPyhFypBzE8ZWWrK"
Content-Disposition: inline
In-Reply-To: <20260514070605.996462-3-khristineandreea.barbulescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_111434_207950_7CCF3AEE 
X-CRM114-Status: GOOD (  14.78  )
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


--LPyhFypBzE8ZWWrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 09:06:05AM +0200, Khristine Andreea Barbulescu wrot=
e:
> Add devicetree binding example for the PIT timer as used on
> NXP S32G2 and S32G3 platforms.
>=20
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

This doesn't add anything to the binding of value, all properties appear
the same as the existing example?
pw-bot: rejected

Cheers,
Conor.

> ---
>  .../devicetree/bindings/timer/fsl,vf610-pit.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml b=
/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> index 42e130654d58..8696696776b3 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> +++ b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> @@ -57,3 +57,11 @@ examples:
>          clocks =3D <&clks VF610_CLK_PIT>;
>          clock-names =3D "pit";
>      };
> +
> +    pit@40188000 {
> +        compatible =3D "nxp,s32g2-pit";
> +        reg =3D <0x40188000 0x3000>;
> +        interrupts =3D <53 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clks 61>;
> +        clock-names =3D "pit";
> +    };
> --=20
> 2.34.1
>=20

--LPyhFypBzE8ZWWrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYRAwAKCRB4tDGHoIJi
0qe2AP43Jcddsk1vQtUeGmyvuM1PQfpHSFt1zeVsEASRUQa5kAD/Xgyk9cfO4R8Z
nUQtK+g102NNkzpri5rVTmvq/L6CvA8=
=SD0V
-----END PGP SIGNATURE-----

--LPyhFypBzE8ZWWrK--

