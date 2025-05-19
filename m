Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A11C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AthOD4LNfl4ytx8L1jBhPqKmtC06S3idEgadJoZm9YI=; b=iFrRExS7P3vDuHjlpr9zB5kXNF
	82TBNBa1o2R0TlSmtyM0S65HaCIsrk24uk+9xkIX+4sKR8/or8LdeHu9E4XcLxTZkO7kBRUpB0+3F
	W1HaSviRXO/hWVaDT0d/hGwusDZtQ3zy6vvQWOlRPUw4rx1mJ8U/UiyIaeGWB4bnVLiuonzri1zps
	H2oMBczG9YdV7dnYmVXq6PGDDjWOQFlic5dNWhb84iMGx6M8gEPW6AQ5zA/9vhgVAXkgXwuQe+8rj
	CveaxYFpDm4XJxzfWvOr/ShnOvvmdIi+hBJgUiBwrt+RemFx0CqVcQ0WQKuB6SlNVLiCVggIAm4gU
	N93+LYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3dn-00000009ri3-3VHO;
	Mon, 19 May 2025 16:47:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2yE-00000009ila-2Ejb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDA715C3B0F;
	Mon, 19 May 2025 16:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1739C4CEE4;
	Mon, 19 May 2025 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747670645;
	bh=YiciytpzBKZU6jliaO65tJGGDGQootlSrvvGG35Ktdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KnpeEQF9AXAlhGeeYGGwNM4vuPj26g+dg4Nt2tEQBNl1/zoUhsV8N1BECbhcTHrLb
	 d1dePDbkxEQTbZ7zgcDvRdOFdzyCu8xJogzBh7JYRBEy2W/+vY1D0/rIHP28LcXuZ/
	 r6H87jLQl8kAo/VND+R6hsCxqLQAW9OdFt6eqtmDd+AYGwWhhzPYpBL0OFmP8jtxQp
	 fP8NgT9rQGdTOPxyo2qfRfqDJzbzHhbe/fihZESj2dT2RLZh4Eybspg/KsLUHLQ2UP
	 Pi0xJ+rE1RDQc4aqzslBxTEH6wppS3apYCaNuS5LSVrp7yf4KuwE+QUo1KyIIgmn6/
	 CZQGHysnqEe7A==
Date: Mon, 19 May 2025 17:04:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Message-ID: <20250519-bucked-revolt-2b93a9a31422@spud>
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
 <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2cAhBHrdr3ZQFzJw"
Content-Disposition: inline
In-Reply-To: <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_090406_615082_C2CEFDD6 
X-CRM114-Status: GOOD (  17.18  )
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


--2cAhBHrdr3ZQFzJw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 02:03:43PM +0800, Haibo Chen wrote:
> Add optional ngpios and gpio-reserved-ranges property
>=20
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index 4fb32e9aec0a341a50088f3e4352ed4d36f649d3..5b98228466c6414be681c4941=
7bbdd82f2c45756 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -70,6 +70,12 @@ properties:
>      minItems: 1
>      maxItems: 4
> =20
> +  gpio-reserved-ranges: true
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32

Do these platforms have a default? I'd expect one to be added that
contains the default value from what the driver does now.

> +
>  patternProperties:
>    "^.+-hog(-[0-9]+)?$":
>      type: object
>=20
> --=20
> 2.34.1
>=20

--2cAhBHrdr3ZQFzJw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtWcAAKCRB4tDGHoIJi
0t2uAQC9WN2OYYXOrp610MPdWdT0m5i4i1tZeyTZdr3aD+wm0wD/fSCYfaimi/PV
1bDpFQcFtXElQhb4Wvjp3cwIUlEZNQs=
=IjWH
-----END PGP SIGNATURE-----

--2cAhBHrdr3ZQFzJw--

