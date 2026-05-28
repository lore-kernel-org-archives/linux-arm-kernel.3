Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D24ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CV93Gs2E+7eZBdUXfjVjpaPPMzba/gMgpOXeOIaQgWY=; b=d4Ozn8TJSfv5siy/eNEcmVQHsq
	2ohKxml/n15G/Fjlm4Eb6jUbXvBqz6hEv8xpN2r3HX4z2msSM3a6DJFg863C9f8oEHgWHifVzcFsL
	BM+h7cL9j00/Z9WZsG5DNFodgjc2SxoBJDxKVlaE2xRWQ2QOxMQESP9U+GZ4wAvp8fQKNRc5cwk4h
	3L+/Sk72zV+3j2LsXyU8STClu4XfqGmGfRVlKDRwAzFpODYwUHGp33K1nctb/Nm/sEISrQkjnPlBH
	kFGuVGRkTb5PWqJ5YVfDhn9vKAD0Pu1BZ65vuUbakNnoHOaem+LsnY+MxhDGvNVFi2p0jWn/wA27p
	ChihU4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSe3p-000000063jA-3VoV;
	Thu, 28 May 2026 16:58:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSe3n-000000063in-1xwQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:58:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0476437CC;
	Thu, 28 May 2026 16:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E051F000E9;
	Thu, 28 May 2026 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779987497;
	bh=CV93Gs2E+7eZBdUXfjVjpaPPMzba/gMgpOXeOIaQgWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iu5qWQfCq8RVzoag/agzz6AaZ1ZM+KV0qvqExW8JUegyT4lL2Mm/gMZMDrXfxh4nI
	 SgroGxpyHGslplr0SIoFCVZmpjRmUR20R/6VTu6gqJaktunb0R15UescY1y4vJGfLS
	 GkODt4oyIBYhJb12s/iqvpm5wp93AzRCqghBI1u802bKmFb+jE+W15AXh9uDCLbLoi
	 igI1+5CSJJu1pX5W0tBXZe9nLQNTCLtnTt2VnIfwU+SlqikIcLaslaEN+Fye32Q/SO
	 AQL5/PcmwJkLj04EMESXRxOg3Jsz/QTVndHK4m/clVJbYSLPz4N5t+cxQmMxqSIaCA
	 6VUFmya5Vnw7A==
Date: Thu, 28 May 2026 17:58:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add Axiado AX3000/AX3005
 SARADC
Message-ID: <20260528-skirt-mahogany-426302fd462f@spud>
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
 <20260528-axiado-ax3000-ax3005-saradc-v1-1-345dd5f6608a@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="glY1jcPOWoMvQi2Z"
Content-Disposition: inline
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-1-345dd5f6608a@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_095819_592570_212338F0 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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


--glY1jcPOWoMvQi2Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 01:10:23AM -0700, Petar Stepanovic wrote:
> The Axiado AX3000 and AX3005 SoCs include a 10-bit SAR ADC controller.
> AX3000 supports 16 input channels, while AX3005 supports 8 input
> channels.
>=20
> Document the compatible strings, register region, clock, reference
> voltage supply, and IIO channel cells.
>=20
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

With Jonathan's correction:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: changes-requested


--glY1jcPOWoMvQi2Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahh0JAAKCRB4tDGHoIJi
0rtoAQCZC2aiWxZMTWZ3jWNXeFb7Fiudf+Cu7MtTU9w+jxaBMgD/SChuRYlmFBa5
mP+H04la6HHMbSF+9EdYltYwv7m/LAI=
=Ve2X
-----END PGP SIGNATURE-----

--glY1jcPOWoMvQi2Z--

