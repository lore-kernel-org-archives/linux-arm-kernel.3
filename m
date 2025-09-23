Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8BDCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 18:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoA7Qt6p/doO1poK8qFimQ63AdK+bLNjKL/AePatJGY=; b=WfsV/yo496mkGvZ9+VN4xM6q0q
	Xv8tcQkRHN2u+iTzoxxTndoXxOP5hB6bOVW+T/HTh2okkc2e9wcIzWegR+IO+SP40ePtoTzuoZLFv
	BLCVbu6xXeYBL2MFVsEwIM9XNLvJIpVW50HYPP0aDp+Pkeb6mW2LwyrhNSxbl3jvPObpU3GlhcegK
	bQPdNPhHB3i5/USWkfgh2mCrQSvcEudh10EujNhoVoqbOtbWdxDb33puAhj3Tt5C0M1xUohZWYFf7
	suV6V3FI6oWu7uzgRE10pnhDrgIASdThnG7d235gEIKGisgQh14dqq0v5yzg0quUNbfKG2rNoVl/e
	4tr9PSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v17z4-0000000EYup-08S6;
	Tue, 23 Sep 2025 18:43:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v17z2-0000000EYuj-2bnK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 18:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C23B460258;
	Tue, 23 Sep 2025 18:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE49C4CEF5;
	Tue, 23 Sep 2025 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758653003;
	bh=BoA7Qt6p/doO1poK8qFimQ63AdK+bLNjKL/AePatJGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biZ9Rculpz5cocRFM0PpbiAITUomLI5qb5UE9K4ZTvcU/gwOon9KR4Z+1OotvO0+S
	 SDmJf2bWiGk0dmoOvc7VnUHMjADwKaozqZmSxPJnhmhZkOYurLN/Dv1qjpJJTD15XG
	 a2PkkA1+GRcCZMgH9xExcxPON9sEiH9Z8gf5EkhUbYQobrG/egSExmV9WSTOZIcEXh
	 MYktJkmbO2HTfy9UD08EJhXMhcL7iKv/aFdC5DdgOdQMhfwkHJEq/oNmMuzvF7ALdj
	 PsLUPdHRSKOGSG374skm+w7EMoN/UTdWitT6mUKEGbbJAkzrSnW/6Hes4l7tXhMBNz
	 8A2WnJSc522GQ==
Date: Tue, 23 Sep 2025 19:43:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v6 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <20250923-mummified-striking-192198266acf@spud>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
 <20250923143746.2857292-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PCBzagFcJLSc8BY1"
Content-Disposition: inline
In-Reply-To: <20250923143746.2857292-5-dario.binacchi@amarulasolutions.com>
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


--PCBzagFcJLSc8BY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PCBzagFcJLSc8BY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLqRQAKCRB4tDGHoIJi
0rxyAP9098hBDWKs7oTCrQx4WGee1/ChmLRYUWc4rCGntjhTSwEAtvglJdBLLB0X
KBL4Ckeg2RpE4A/0Kj7HJz/rNTYFWww=
=qofl
-----END PGP SIGNATURE-----

--PCBzagFcJLSc8BY1--

