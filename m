Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E56BFEFB71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLLZ0paeq/fuklwkgre95bDIsXxSXmcW8nRTjbuWQeo=; b=AVRwF/V6FRLdWeROPUAVbAYnV5
	onMNsTJZg3nypJNrRe+ojYhlVbWgTjLIdnXnDabwXD93dEJF6hDaQ0rpeziwyQKsr2WtJ24K402ty
	P080cYPf+j2y+qjAX9q4B8zXwGSVjLkL3Smaq1YlE1KHGGFibAQXRxNGSmlD1JTYlzFS3HFOeCIMe
	HR5tGvsWBXyPClI4+4b7ZoOWyFVtGZqLxOndO9oa4ro8LpO8wYI2mzXkBam+7Ib7hiLfHICTBHLiW
	7R2O9PdJ3Bonl9qknCXkW1V46tnHGqI1lWJpw81X4AcL+FHbR28SI/U3gTCoQpR2epbp5HUG5a0UT
	9dyajbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1jY-00000008oXu-1PEK;
	Fri, 27 Feb 2026 17:34:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1jW-00000008oXi-3Rbv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE15060008;
	Fri, 27 Feb 2026 17:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914E7C116C6;
	Fri, 27 Feb 2026 17:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772213673;
	bh=wLLZ0paeq/fuklwkgre95bDIsXxSXmcW8nRTjbuWQeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmKonAu16sV2qROCRaEfTBOM8soKfnF3oHOGYJbtHesaQWKHc4PqAyJv6LS7FoYT+
	 2b/QxaK2poGNykK4Y2euG1nfibvmqWKodofpNWnPvg52G8cVPQB2qHg/QUSM2F/OWl
	 k4m9wPpep7+3jbcDOcygTAYF1fc+ANO0AF7GSFz4ozOTsosn797/++6Zp35vSKzpyL
	 TlyYIzor4GYXinpNn/UnYdCHuG5kGydJWrLUwlRDk+tgLi+f/rWegVm3q2Y0He1kOe
	 NvZMp3zH+k8OvhxGA/KvhC9Vc95G++TgbxHwaabOf4dI0crG83x5zeMxJdhR3c3Pwj
	 E1bqfGxURVg2w==
Date: Fri, 27 Feb 2026 17:34:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/5] dt-bindings: arm: atmel,at91rm9200-sdramc:
 convert to DT schema
Message-ID: <20260227-consonant-marbled-f6b1d09afb40@spud>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
 <20260227-arm-microchip-v4-5-7e2ae1c5b5d6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fmUJDYSH5bgLM2lG"
Content-Disposition: inline
In-Reply-To: <20260227-arm-microchip-v4-5-7e2ae1c5b5d6@gmail.com>
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


--fmUJDYSH5bgLM2lG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--fmUJDYSH5bgLM2lG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHVpQAKCRB4tDGHoIJi
0jk3AP9tCw061KSaSLckgp/Nwi4l4L4Rz0Oq2E71WmBk5v5SVQEAps3quoV60bby
9R41LAb5a1fUS/C/24CRTHMJ8yNQAQc=
=/S6e
-----END PGP SIGNATURE-----

--fmUJDYSH5bgLM2lG--

