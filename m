Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDCBCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvUZG8OFOWYSFaFznbd7VEZqz4mfURKI3BrueEuTWzw=; b=tv1W0RE1kR0gnC/Lcjro2LaiCZ
	pbSKMlfIXbW0M8/I8D8oIfkAoVtMJUVJm4o6qZ5pWC0GVAjV+cBoAHodiHBtQOhJ4ugeshWYJjptY
	bUOJabyIPfnj1xBDL9U896LHFKprcU7HOIFlJe/7JwhxR5yoT28OKzJKZNr8v3Vw6qT6x/YaXpQY+
	mVQ60PkTx7q1HwQhockXOoCa3MeIMjjadvJwxNikNi/FiUy+aG4VqTVkaAZq9le9bfPWaZSO7VHgM
	VE9TzPKgvFBFKcEOGHmtEcRFuvrvm+OZmwJ9MOEBQssLrkeu1Ge4aAfN626zfsBItoAegqhf9nlGf
	C/7UOYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwBY-00000008y29-0rNZ;
	Fri, 15 May 2026 17:18:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwBV-00000008y1Y-1GRW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 17:18:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A5C044203;
	Fri, 15 May 2026 17:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F06C2BCB0;
	Fri, 15 May 2026 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778865528;
	bh=pvUZG8OFOWYSFaFznbd7VEZqz4mfURKI3BrueEuTWzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liRR5gCgrghUx/YxVJAfx1NL632CmfqaPCvMsKr+4HE1Ogqi+h6+Y7HHYWE5GBbeY
	 R/aK6POAoUiksle7mNRiplPPutReaHupZGTLgyT8Bpg/Eb3zjeK9O4XwmtFjCFhJkN
	 10w1pG7VaYMKaXJoPfwhBFqMN+KVGmlf6q80WnwW13WxV4YN7iEMPh+c0jLFlaS0cu
	 xF3j6Kg0mq1NfqHOBWzJ9jm3R74wJlgnCI7ZCzLC8Ss1t3g3Z50A/Z4kxkt0+lkwOU
	 aResWYb5xog1FSM0lguF5nxi9rIAMx00XvVruIBjy0xS6uixx3+NOtmZB7a9gulnR3
	 5iFEMVXgKRyAA==
Date: Fri, 15 May 2026 18:18:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, patrickw3@meta.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
	openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC1 pinctrl
Message-ID: <20260515-schnapps-uncooked-177724828e23@spud>
References: <20260515-pinctrl-single-bit-v3-0-e97da4312104@aspeedtech.com>
 <20260515-pinctrl-single-bit-v3-1-e97da4312104@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l55Ya1GMCDxdgVnh"
Content-Disposition: inline
In-Reply-To: <20260515-pinctrl-single-bit-v3-1-e97da4312104@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_101849_360962_5DB625A7 
X-CRM114-Status: GOOD (  10.49  )
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


--l55Ya1GMCDxdgVnh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 05:37:37PM +0800, Billy Tsai wrote:
> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
>=20
> Allow the AST2700 SoC1 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
>=20
> There is no functional change to the SCU binding beyond permitting
> the aspeed,ast2700-soc1-pinctrl compatible string.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l55Ya1GMCDxdgVnh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdVcgAKCRB4tDGHoIJi
0o0eAQCfCKP4u1gucOjpM6unsuNYH1ObZr6/u9PFfMNjTIUy3QD/cc0ejlq8efRu
gg9kIhJOjzD5xQQu5JLiBVcerSsaPwU=
=JJiP
-----END PGP SIGNATURE-----

--l55Ya1GMCDxdgVnh--

