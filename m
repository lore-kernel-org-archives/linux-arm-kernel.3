Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3352EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 21:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrAWVkJS2h8Kywar1vm/lnpLYhioRTCMpGz9s0mgZnA=; b=OfHX2QcE58FE+QhkpqEXBFc7y8
	oNUnLDKSGJ7m/48kOq6cSyuafabklr8qn5PjcJkzSTRjE9LyywJryy8Tz8bmCuNC3FL3D7SuqP8Er
	xUiJWE6b1Ctp8LEVZNIctvwA88zJNojI9/cmXjxtq+kZHPdsdYGOMV6/tEFAvGt8ORXqdBnaaSCAn
	tvO/8z9aNdHtPfhUNpCjPknZbWs4Oh5RoyH5JmRNjUhQEX/0PyJuXBkLblp2ZsxZzf1xLjx2CanT0
	8aMVXRMD5I7tG2GlH3bKpyddLTPKXvgApCKRjlUhHYolQlWrl+Nld2N73TzGAj5waUwzFunvqYEwU
	xR/a3iIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAbjn-0000000HFGG-0fNW;
	Thu, 01 May 2025 21:46:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaaN-0000000GaN4-0F44;
	Thu, 01 May 2025 20:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B6775C47AE;
	Thu,  1 May 2025 20:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB9AC4CEE3;
	Thu,  1 May 2025 20:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746131566;
	bh=8zJ8ild3gKFpPMeXGplXewCsb2gBsGMSerLSHKUcxLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EuTBOE1p94jS3K4voWp/u8LKgDvQzAwt/KoN9qGvqv+FgkF/LPk5MUasGWjNy7DIp
	 R7iAkDsDpMESWTqg2sr64nM8NFSS01p2jRArIhV/cTSgrHhYsgC4PBvkbVb2a9viKl
	 at2aRfn+CJ6hBgJGFnibiWVMfPBgkeWgY3BaX99d1AKND/Yr8rbOaWVuIIvLRHc/CF
	 s9F9pA1tiXBdp37gnNMgMJkygiF4BLwSv9alvptY4PW+ygFBiYE0zhoy2LkXSP0Jne
	 tvi0XqQx5X1evu6brnRhf299xJRvvV20y7Zf7oP0Hdj0BROB0eETdE3P1snxu7rwpU
	 oMKk/7OtI4ekA==
Date: Fri, 2 May 2025 05:32:42 +0900
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Da Xue <da@lessconfused.com>, xianwei.zhao@amlogic.com,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sunny Luo <sunny.luo@amlogic.com>
Subject: Re: [PATCH v2] spi: meson-spicc: add DMA support
Message-ID: <aBPaaisRxH2gKOS9@finisterre.sirena.org.uk>
References: <20250414-spi-dma-v2-1-84bbd92fa469@amlogic.com>
 <CACdvmAhEXstEBdaiktU4n-R6M6mYiBnSx15ZJfb1FOKGD7Zfaw@mail.gmail.com>
 <b202538e-5520-48ce-a957-034c0ce7beb1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+W6B6Qy6EhxzLbXO"
Content-Disposition: inline
In-Reply-To: <b202538e-5520-48ce-a957-034c0ce7beb1@linaro.org>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_133247_139836_C0C2C191 
X-CRM114-Status: GOOD (  10.64  )
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


--+W6B6Qy6EhxzLbXO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 09:43:40AM +0200, Neil Armstrong wrote:
> On 30/04/2025 04:13, Da Xue wrote:
> > On Mon, Apr 14, 2025 at 2:30=E2=80=AFAM Xianwei Zhao via B4 Relay
> > <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> > >=20
> > > From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> > >=20

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--+W6B6Qy6EhxzLbXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgT2mMACgkQJNaLcl1U
h9DUIwf/VfGJ7nutKjpJfqk62ySD9m9GQfYpOoomW5kTWtiXmE+qp4dX5Xx9OHmt
WbYXA1R0yW6BUuw0QlCsGJLuWEs3Td3/NdgbFKgN9FbxJC4F9upjK9Iig8d5jAnt
2PifDxXGF1eNS9ZTA1fr3JACMxNQtC9/qHoc0AQT2LWBWzHrukmC/LBrOW68Gq0J
8GyvuFPro1RZtmYORCV1LwRThOv4h8xusCWOSJKxWXknTQW0j9r06y1aB8MGvEGs
FfIEDfwZ3oaCG3SL00zoAvHNe/tX4QlPS+gGBfRhkeZ4qp/bFF4ikj1+sAPD46cH
dE77lRcKIldzoUBKCH2XhhHmXA5Jhg==
=/r67
-----END PGP SIGNATURE-----

--+W6B6Qy6EhxzLbXO--

