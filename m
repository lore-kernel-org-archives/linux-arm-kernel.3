Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74131C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDCkiWTSUutPpidL4yxIxvrpNX9oGUvaRD1iiumCPrA=; b=RbEtqVpkF4dYrUnK7lPlTDmH9A
	jFrr4axj9HF81wNOUSzoxdmJK5KchUXpWrIL0X2GahZbpOLUiUCQdHdRikPtc2Njvkivz+DA+2W34
	0nQACh7GKtwQm13p4drjgG7d4dRRBRZ9pn6+OE9obWEHGXpmFg/QNTtZbt8CDAcvAZCQ07dRr4lYO
	lohvyn3rUnnoFjg32+2qZdKcKyParSBHNTBakQEG1NChMXUmLZAv1+Y1KQFuZSeEgOhGRUm1yAtsI
	in+zoQZl0Uk3K5M7IU63sXrERNSMsWYN5JyQGd0R17P8Hx2SXWdVXlYhizHk3ovteKfHV4YarxnDX
	pImmigRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHLq-0000000DJF9-1c8u;
	Wed, 28 May 2025 14:01:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKH0U-0000000DGUL-1cad
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93F965C55AE;
	Wed, 28 May 2025 13:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C48C4CEE7;
	Wed, 28 May 2025 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439585;
	bh=ZDCkiWTSUutPpidL4yxIxvrpNX9oGUvaRD1iiumCPrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IhgsVX/VgZv4mWKaIDhGq6Sy6mSnktVxPrbhwjX02DgsKX8s2yF6syckTB/0CYKZB
	 L3fwJ81DTGtaHSvdmzeXNEfxapzoddam2d1YuhPC1fkKX4tT5XoY3MbiShhzzhN2At
	 QT24NHe9A2T3A+ag5RRG4uef7m2cPbg83mMCJcq66IXft15D4+Rxe+M7hrogLlfTEo
	 o9LJ0fawVDictOX7WVHoIeHeIRGJqUj44RnxedcsPjjpcmqc4W5eIBsqM3LlCEe410
	 PGgUd1o9b/L3ELyMpPz8CtS1x54zijcL1yS+w/5+YqjVWX/Um0+mofy0ZwQ1ArElJ7
	 vscuhtbAGfH1g==
Date: Wed, 28 May 2025 14:39:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: convert mxs-lradc bindings to
 json-schema
Message-ID: <20250528-kitchen-snowy-e9a97843419f@spud>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hItL2TUlX6LkKJfG"
Content-Disposition: inline
In-Reply-To: <20250528121306.1464830-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_063946_470311_437BD001 
X-CRM114-Status: GOOD (  11.29  )
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


--hItL2TUlX6LkKJfG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 02:11:38PM +0200, Dario Binacchi wrote:
> Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
> binding documentation to json-schema.
>=20
> The clocks and #io-channel-cells properties have also been added; They
> are present in the respective SoC DTSI files but were missing from the
> old mxs-lradc.txt file.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--hItL2TUlX6LkKJfG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcSGwAKCRB4tDGHoIJi
0soAAP9SfwHOSL1Ms8FpK7wxpbph1w25Kea+OlBcRLmP/UiQRAEAsqbLvfI5diEw
y90b4EL9sNqb/XkTmdiiZmLczzii1gU=
=5qe/
-----END PGP SIGNATURE-----

--hItL2TUlX6LkKJfG--

