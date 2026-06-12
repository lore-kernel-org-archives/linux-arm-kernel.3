Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2236ECD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8GskhQ/tvLBpCO/qOaEalED8OJB7l2RGKXoWhNyljw=; b=OxKJj6C9fE5Jul7X+HR7zotvTT
	qpt7Ef054D6HIdPy9qO3k1TRm6+Wrd+b/fRAxVu8JwEgtGbVb2dBl5orTS5/mrnhWm07O0DAfSF+8
	y6VsHZB6ZIomQauKpwYheC9ibf2sm325sXmJ2P2FYuUPuD1Op8weBH6jiRV+f90Hv8Sl0XHQ4Wf/4
	5IzLYObQPybT47R/CJNfuNibVWwPd+fZ2ZzzPzkK/BKarpLOBgLGyCFUH17OKe1DMP1KgF0UrLgst
	7Y1t8wp8/+j+nQJZ7WEwXKN18PFyzu2KKnYbQH5mRNyXrr4VrUjuLD3tC+nOxcbrLDbgJaFrXE5tj
	Wa9PXGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4md-0000000BHlj-0AWV;
	Fri, 12 Jun 2026 16:31:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4mb-0000000BHlJ-1386;
	Fri, 12 Jun 2026 16:31:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAC6D40537;
	Fri, 12 Jun 2026 16:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBD71F000E9;
	Fri, 12 Jun 2026 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281860;
	bh=K8GskhQ/tvLBpCO/qOaEalED8OJB7l2RGKXoWhNyljw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ok9UBUAkTb5z4y6JJ4ufptlYuIasM4NiKJSPinBtW7Yx9kvSDI/ceui6RKEDve6kc
	 MF9P652NgwbizOshbZ2TclRbiDoHfPAOZjh/4tgTidEdW0OXjfEGj95JOdvU1wJN5n
	 NK+C3VZSFPab7Ytc7eCtBayYrm3XMZtedjjOxqya1YgYrZeBcRCWsCtQSGpRDEx0Ga
	 ZVthp80HmfrPqkJIE2fj0MWK4DCWBGOpJUuQggi4JH7ipQztt4REPNJuSST0pdBhqk
	 F2HRFKgPGNRAc6yrwc55inLLecPbjWmPNY2sjcNWFdaomFRPQqPqUxfjrdpSAw1T00
	 6g/AsGRSRHhXQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B8A121AC5AC2; Fri, 12 Jun 2026 17:30:57 +0100 (BST)
Date: Fri, 12 Jun 2026 17:30:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 4/4] regulator: Add support for UGREEN NASync DH2300 MCU
 SATA power gate
Message-ID: <aiw0QYnaYHQpIwiq@sirena.co.uk>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
 <20260612-dh2300-mcu-v1-4-ab8db1617bc0@flipper.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tE/94xOCtV2c14jP"
Content-Disposition: inline
In-Reply-To: <20260612-dh2300-mcu-v1-4-ab8db1617bc0@flipper.net>
X-Cookie: Nice guys get sick.
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


--tE/94xOCtV2c14jP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2026 at 07:34:17PM +0400, Alexey Charkov wrote:

> +static int ugreen_dh2300_mcu_regulator_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regulator_config config = { };
> +	struct regulator_dev *rdev;
> +	struct device_node *np;
> +
> +	np = of_get_child_by_name(dev->parent->of_node, "regulator");
> +	if (!np)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "missing regulator child node\n");

You should just be able to configured this in the regulator_desc rather
than describe it.

> +	config.init_data = of_get_regulator_init_data(dev, np,
> +						      &ugreen_dh2300_sata_desc);
> +

Similarly here, there should be no need for this open coding.

--tE/94xOCtV2c14jP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosNEAACgkQJNaLcl1U
h9CG6gf9HwhOxx3ksCksFflAdrKweMiutBoX2cLErbvcRtSA1Zuu+it3ilU8JPCu
LSdBkPkVH2KOlJaA6ioe5X/MOnnbHej4/QPEFEy2iL6vrcuFzuP4VoSGw3q6tOFK
3jS/J5gWMXJHYlHpDuc4JdrFAg25gAeYfA0wJyxUxPa61u220L4xzuJS2nSnyF8y
49HCO70Z6ks5Zn68hF5NL0bx6U4aDrdLROCKv0cHArzrXXuEQvgDC+B7wV+m9/Ea
1PjtxyuMyb0+D2DByndFI0Iq9lpcVok/4jwNaToUCCLP1LpZN2VvsM+7DI5Nn8MQ
aYqOVqnhUL6sUdE/Jf5G2Vozx6IJ1g==
=j+Gg
-----END PGP SIGNATURE-----

--tE/94xOCtV2c14jP--

