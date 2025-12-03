Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52902D1BDD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 19:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAkj6K0gVabCNPiuB01shyGUTNgq3thUreXPN9qk+wA=; b=L0NNk+jFP3s/skoEmiXNf3Szas
	WJBuLRNVy7sDdGASyVfVPClXMA3orTxgl5IzIm5m/Ta693NWV1vV7p+dcid8cxdBemfOKrG6BkWB/
	Xt+G1zE0pXQNn8+fzyZ2U/z9W6YOawxK+NfqPNIHlpeFRT9sbUxDsNJ354hsDUuRs4sEe4OcMNfXO
	LGR4TyLMvaD0oGVl4DCsRZNh+6s1Mm+OOyPZMZhXcyLfu1DFIriPzzqUVPpFhIaZDRcDOxeQbo9lF
	1Wil10N9c7ygNlXbYp2a97mFSXhkCKo6WGmUiU2FXsO2YsYyWEYpjXuy+IjcMLKgL2ndp9L1sZwNi
	0ehTvOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQsR2-00000006yyJ-1gM4;
	Wed, 03 Dec 2025 19:22:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQsQz-00000006yxW-2iDo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 19:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32DCD4377B;
	Wed,  3 Dec 2025 19:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4B1C4CEF5;
	Wed,  3 Dec 2025 19:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764789761;
	bh=WkqCGLI3whoa9doVwjsZqIAqwqaUeZG5Ox8nsycbuMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0SgB89euj89qgZhucbSoprGcTBlzjyQjzEq+e5HaU4B4ow/8pqfkziM5CBkQCysy
	 SsEvFYJPS8JKNtP80C2jkFTsSi0WnEtpCiywGrI12PsrUGEy0bfc1pCgEl/rPfpTJD
	 qNsMImVo2MsiHQgAMu5nJC7qVqrkOh8ph52sDQU3GdjidI79cDcZsqvNKHyjIs2Wba
	 0WGFrYhc7vO7LlevbyFV0M1TP5LmnQSEZaXjO0MapA/NDihpJm3s674FH9Qrg2waQi
	 HZUVJ0zsgjFLiL5bxTbRwrrlY6BGbdQAV5N4OR9ukYchqg6VCR83RCJX063sznVgb4
	 B+hDFHjMxvYrA==
Date: Wed, 3 Dec 2025 19:22:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 3/4] include: dt-bindings: add LAN969x clock bindings
Message-ID: <20251203-flatten-spotty-69f16d3460f0@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdqp/vLO78ga2zHb"
Content-Disposition: inline
In-Reply-To: <20251203122313.1287950-3-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_112241_705965_0C86B102 
X-CRM114-Status: GOOD (  14.86  )
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


--kdqp/vLO78ga2zHb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 01:21:31PM +0100, Robert Marko wrote:
> Add the required LAN969x clock bindings.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  include/dt-bindings/clock/microchip,lan969x.h | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/clock/microchip,lan969x.h

Same thing here, this should be specific. Probably 9691, because that's
what you're using the compatible of in your dts.

pw-bot: changes-requested

>=20
> diff --git a/include/dt-bindings/clock/microchip,lan969x.h b/include/dt-b=
indings/clock/microchip,lan969x.h
> new file mode 100644
> index 000000000000..5a9c8bf7824a
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,lan969x.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_CLK_LAN969X_H
> +#define _DT_BINDINGS_CLK_LAN969X_H
> +
> +#define GCK_ID_QSPI0		0
> +#define GCK_ID_QSPI2		1
> +#define GCK_ID_SDMMC0		2
> +#define GCK_ID_SDMMC1		3
> +#define GCK_ID_MCAN0		4
> +#define GCK_ID_MCAN1		5
> +#define GCK_ID_FLEXCOM0		6
> +#define GCK_ID_FLEXCOM1		7
> +#define GCK_ID_FLEXCOM2		8
> +#define GCK_ID_FLEXCOM3		9
> +#define GCK_ID_TIMER		10
> +#define GCK_ID_USB_REFCLK	11
> +
> +/* Gate clocks */
> +#define GCK_GATE_USB_DRD	12
> +#define GCK_GATE_MCRAMC		13
> +#define GCK_GATE_HMATRIX	14
> +
> +#endif
> --=20
> 2.52.0
>=20

--kdqp/vLO78ga2zHb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTCN+wAKCRB4tDGHoIJi
0o53AQCDZtek8NKV0Xw9fXMT0+zQW1HLixWl5IaUrtwLtVkOmgEA8CT3i0Rp/7MV
1UDq9stZ0CrzfrbDdsDdOOPWU/2PUQg=
=9aIN
-----END PGP SIGNATURE-----

--kdqp/vLO78ga2zHb--

