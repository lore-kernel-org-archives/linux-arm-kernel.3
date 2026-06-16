Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0D7CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3dXwzlMy2LgBGgHPYpIPiVb7RGZwJ8RI/pxEwwkH4U=; b=xed6CB/xTVDStw2r7Awit5yJ6k
	IudlhPItxp5puDEr7XckyJ7vcj1K8NOEUkWxGNgi3gaRageJ44XfgNUiotGdzd6o6Epu+S5OLox4n
	+qN0mnMPBK3Ej0ZxLjeoPIxzjtqMHTnEoPDtVaWr/p5OVO6kBRfWAGsoYEeWo1eYQQA62Dq80Tgsr
	Dff/bm4h9Xeq/aRRfPqZooIH41osxdIqcVxu8hGbOkH6Pf83d4hX97umIcDASWJifvJcD7GQM50T2
	ttVI9Iz6ftZCgRt4+F69pyfD9AcEDnhpUHuzK6aixe1DdhtSjKzrAYvkYZfvF8SwmJblywjdbDFIt
	2vK9qkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVua-0000000G1wW-2Qf1;
	Tue, 16 Jun 2026 15:41:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVuY-0000000G1wD-49mf;
	Tue, 16 Jun 2026 15:41:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EDAF460120;
	Tue, 16 Jun 2026 15:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5AC1F000E9;
	Tue, 16 Jun 2026 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781624469;
	bh=L3dXwzlMy2LgBGgHPYpIPiVb7RGZwJ8RI/pxEwwkH4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYtsO2T1puU8FIBLqMZDYx136bEz74sMUPsCSdtwYZfLx27httDPb57rqWuEjQrB0
	 awcH64am4nvuq0EpMtu5uXb4SsRG1urvcLsgduPphC7JPXfXTHIoHwtidtKwbCkDca
	 uLwPIs0Zm821D0QeNHpwqABhzOvVurKir4WdbmogUXHlSvCyOmNQg9G2d2qlMNLpPj
	 SDP2C5ejCl12UyaApKLq8JZ0POgPYVMhv15skAcSjqTwfyQV/ZoxJ4KgBWxC2NOhL6
	 pbrgKguj4HgOpW7H0dTozcp6eKNZk+xMK5yageGAZO5uf6J+FOvm7B1CQVcjQ8DsHr
	 EoEJQHBRwOu6w==
Date: Tue, 16 Jun 2026 16:41:04 +0100
From: Conor Dooley <conor@kernel.org>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v3 1/4] dt-bindings: iio: adc: mediatek,mt6359-auxadc:
 add mt6323 PMIC AUXADC
Message-ID: <20260616-patronage-swapping-197a674f9df6@spud>
References: <20260616-mt6323-adc-v3-0-1c27c588185d@protonmail.com>
 <20260616-mt6323-adc-v3-1-1c27c588185d@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XgkNMFzBNJmMg/9j"
Content-Disposition: inline
In-Reply-To: <20260616-mt6323-adc-v3-1-1c27c588185d@protonmail.com>
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


--XgkNMFzBNJmMg/9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 05:15:39PM +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
>=20
> The MediaTek mt6323 PMIC includes an AUXADC used for battery voltage,
> temperature, and other internal measurements. The IP block is not
> register-compatible with mt6359

Cut this sentence here, whether or not it uses the same driver may
differ per OS.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable


>=20
> Add the devicetree binding documentation and the associated header file
> defining the ADC channel constants.
>=20
> Also change the description to 'MT6350 series and similar' because
> the binding already includes more than mt635x series PMICs.
>=20
> Finally, add the MAINTAINERS entry for the header with ADC constants.
>=20
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

--XgkNMFzBNJmMg/9j
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFukAAKCRB4tDGHoIJi
0lkWAP42gL/N6EHSOWxFx7azXHM1KwgVvjuVTAYMl28Ow9l25AEA+dsRSJmfseNN
zXxN+zYbLqyqdUDOdc8JzjNArYl4qwA=
=JWkz
-----END PGP SIGNATURE-----

--XgkNMFzBNJmMg/9j--

