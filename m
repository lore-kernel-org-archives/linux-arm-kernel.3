Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F55ED36136
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehmuV0mGF+56Q7DGeN7/B0OGtD8FDHl8tJhMc+L5J7c=; b=Fcs2obj6qe7fQq1cf3ngE9KUtp
	IH8440I+VbrUr/SYes3EnQXsZAeHd8X4Ftd+BAflfoWh2ebTx7yQ8UCtrueNgpvSS6BJ3p4BdYr1k
	zE7zlrJ0xVYCSMAMWWFCk1h26j55YfxnSlO1ky3Y9mc7SEx85cZa/ZrHbwAvUS4l83kwOua3JxbYr
	QhQCwHWwndCv0+B+2CaterENIfFtMVZzIdHhoaO4v3cn8QUdkOfq2vfhfkKNoyht+t3ozLKmVQ8ZJ
	LVmBuRFWPh2p1WDnEskWf+KJ0CvWdTp3xdM143SzQdJ6Ls3Clodx2FCWOzQM1LJ9ybXyMPJ85GYQ/
	NsrgqluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Oho-00000000Tv8-3avl;
	Tue, 05 Nov 2024 18:55:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Og3-00000000TYw-3edk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:53:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C0185C4D33;
	Tue,  5 Nov 2024 18:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4656C4CECF;
	Tue,  5 Nov 2024 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730832798;
	bh=ehmuV0mGF+56Q7DGeN7/B0OGtD8FDHl8tJhMc+L5J7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ci6r5DV2VqvCag1s6EuF1aRwGbPKGH/tDqYybfvWC09acB+ugQ+GjwdbjAN+mH/zy
	 9wUzO9DRDwMJO7FtUVQzTMYgujVqO3KDgHY6kXbZXUUv/ACutVQBpo4uUAU1A/dmrA
	 0KPfpjx8ruV3QgyNqLAhbXp661aM0b5hHIqO6Q2jXxAeyAXVw/K/s/nkR+0nALKWUP
	 k02jNQE3NdHiPOnuxzyXcaNHbBKmTI5cdXXbf4xnd5JEjzX8tA8vLQma1VRzkDEE3c
	 J1e2RY1kEInd06J27owPH5EGn3nsxBG2etos92r1tCCT23IH726/PaZyDU2W8/1lel
	 4nKNe9OV3BcCQ==
Date: Tue, 5 Nov 2024 18:53:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>, jdelvare@suse.com,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, sylv@sylv.io,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux@roeck-us.net, Joel Stanley <joel@jms.id.au>,
	conor+dt@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Message-ID: <20241105-regroup-busily-adbb9b342abc@spud>
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
 <173072771091.3690717.11563964377469449295.robh@kernel.org>
 <20241104-saturate-device-d020a0d7321f@spud>
 <f468a5c0a0112cee35815fb6c7b7f9933934adc2.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R4RpYoaHCnWgW7y6"
Content-Disposition: inline
In-Reply-To: <f468a5c0a0112cee35815fb6c7b7f9933934adc2.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_105320_274363_E28CCB4B 
X-CRM114-Status: GOOD (  33.99  )
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


--R4RpYoaHCnWgW7y6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 10:39:34AM +1030, Andrew Jeffery wrote:
> Hi Conor,
>=20
> On Mon, 2024-11-04 at 18:49 +0000, Conor Dooley wrote:
> > On Mon, Nov 04, 2024 at 08:39:21AM -0600, Rob Herring (Arm) wrote:
> > >=20
> > > On Mon, 04 Nov 2024 14:52:14 +0530, Naresh Solanki wrote:
> > > > Document the new compatibles used on IBM SBP1.
> > > >=20
> > > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > > Changes in V4:
> > > > - Retain Acked-by from v2.
> > > > - Fix alphabetic order
> > > > ---
> > > > =A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > > > =A01 file changed, 1 insertion(+)
> > > >=20
> > >=20
> > >=20
> > > My bot found new DTB warnings on the .dts files added or changed in
> > > this
> > > series.
> > >=20
> > > Some warnings may be from an existing SoC .dtsi. Or perhaps the
> > > warnings
> > > are fixed by another series. Ultimately, it is up to the platform
> > > maintainer whether these warnings are acceptable or not. No need to
> > > reply
> > > unless the platform maintainer has comments.
> > >=20
> > > If you already ran DT checks and didn't see these error(s), then
> > > make sure dt-schema is up to date:
> > >=20
> > > =A0 pip3 install dtschema --upgrade
> > >=20
> > >=20
> > > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-
> > > sbp1.dtb' for
> > > 20241104092220.2268805-1-naresh.solanki@9elements.com:
> >=20
> > Really? This many warnings on a v6?
> >=20
>=20
> I understand that it's surprising and disappointing, however these
> warnings are from the Aspeed DTSIs and not directly from the proposed
> DTS. Many are an artefact of history, and I'm (slowly) working to clean
> them up. Recently I haven't had any time to dedicate to that effort,
> and as I'm somewhat responsible for the state of things, I'm not
> prepared to block other people's patches and push my own
> responsibilities onto them.

Ah, you see that's where I would say "no new warnings" and get the
submitter to fix them ;) And were I the submitter, I'd want to resolve
the warnings rather than run into issues down the road when things get
"fixed"/documented. But I guess that's why I have the schmucks task of
reviewing bindings innit..

> I've been replying to those proposing new Aspeed-based devicetrees to
> separate the warnings they're introducing from the warnings that
> already exist, and requiring them to fix the issues they're responsible
> for. I hope that I'll have time to continue to improve the situation,
> as this is obviously a tedious task for me too.=20

Well, it is your platform and if you're confident that these nodes are
correct despite the warnings, who am I to stop you!

--R4RpYoaHCnWgW7y6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyppmQAKCRB4tDGHoIJi
0gl3AQDYMKKpv+VRW+O5chJQqZbIqtD3TSwbPLzL+iwv7LwutgD/SjKnZdTS+eIj
kcZPtile9/G6QpMnUwj4wo/u+c6FAwU=
=6O1S
-----END PGP SIGNATURE-----

--R4RpYoaHCnWgW7y6--

