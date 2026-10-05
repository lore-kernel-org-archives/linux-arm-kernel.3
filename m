Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0B6CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHp1IwBXNu4k0HS2L7U3npvTY1+CW3Wkn5yoUJOYsuA=; b=DI34KmlnNjOi1oNZm6obT2D4FO
	RmgmPFPNwn1qGj4x+/lbgmPTJyAG6AU4Z8F34WiQvVsrzcUwPRiFGk43XWBpFq8hJku6GiXkg4Kym
	QSsmFRQZKZ8Fl508guFyvtQYqdT7Jr4vkfpYX0WOJMMNW+ddzBPto3QRMHThxhM0I7WDyaV5wceka
	yQ0mYxoaCKLJbYTzBBX5lajl8HPx5WQZz0jhCOQxi+thVfBQQa2VBwA1573ZjshfrJhLtuuWdNqCh
	b7eK4JsLu3u1yT7pHlvHyjYRTSqA0AHLeu9QVIPTkKFiqbOfBJMGI3bbvurnmd5dLZ+6gTTd4odjn
	e+YOohsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmDD-0000000GtRC-41qm;
	Mon, 05 Oct 2026 17:10:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmBw-0000000GtJH-15dx;
	Mon, 05 Oct 2026 17:10:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC00043939;
	Mon,  5 Oct 2026 17:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64ADE1F000FF;
	Mon,  5 Oct 2026 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220171;
	bh=aHp1IwBXNu4k0HS2L7U3npvTY1+CW3Wkn5yoUJOYsuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BZPXBoaR3tiQDmCQTXaxLXDI5OHnWaCqTZYnEBoUv2blrhAwqXC10QDNvxNBlydFU
	 n2+ZcJ0RxU2GdyuN67yut49U0UwWXcgOLlgY75rzLbsIzsPU+nOdKDa29RltG8U+xu
	 WBlz3cNtjzjcMCUHyyjZ/Do1LwpDNK1DpI8XUGDms/ByoRRPEh0FdxhS4/NQArZYm0
	 BwYwYq98upKB7VSjMnRvK2c8AHBBljDs2/TS8iaLnTHA093YWYQCC0qP1ZAf/C5I32
	 BaSZXUPrftwJpzlNz6U+9VuaWcYeGhstwGbdz3NgWbF8LnJu4AXMBD9UifIVtfafe3
	 4bfSF3LIrWh2Q==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id A229716EA206; Mon, 05 Oct 2026 18:09:27 +0100 (BST)
Date: Mon, 5 Oct 2026 19:09:27 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/8] regulator: core: Add "enable and wait" functions
Message-ID: <asPZxyprhyZtnPtc@sirena.org.uk>
References: <20260901074930.764550-1-wenst@chromium.org>
 <20260901074930.764550-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YrEJvP9azbYsig5Q"
Content-Disposition: inline
In-Reply-To: <20260901074930.764550-2-wenst@chromium.org>
X-Cookie: Use the Force, Luke.
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


--YrEJvP9azbYsig5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 01, 2026 at 03:49:19PM +0800, Chen-Yu Tsai wrote:
> In device power sequencing and initialization use cases, it is common
> for the driver to enable the regulator and then wait for a certain
> period of time to pass before continuing.

This breaks the build:

make --silent --keep-going --jobs=15 O=/build/stage/build-work ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_COMPAT=arm-linux-gnueabihf-
error[E0425]: cannot find function `regulator_enable` in crate `bindings`
      --> /build/stage/linux/rust/kernel/regulator.rs:288:38
       |
   288 |         to_result(unsafe { bindings::regulator_enable(self.inner) })
       |                                      ^^^^^^^^^^^^^^^^
       |
      ::: /build/stage/build-work/rust/bindings/bindings_generated.rs:129557:5
       |
129557 |     pub fn regulator_disable(regulator: *mut regulator) -> ffi::c_int;
       |     ------------------------------------------------------------------ similarly named function `regulator_disable` defined here
       |
help: a function with a similar name exists
       |
   288 -         to_result(unsafe { bindings::regulator_enable(self.inner) })
   288 +         to_result(unsafe { bindings::regulator_disable(self.inner) })
       |

error: aborting due to 1 previous error


--YrEJvP9azbYsig5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrD2cMACgkQJNaLcl1U
h9AfZQf+PsDxB00eDcNx08x42/Y8fiZnF71clFrO1HwZnCiLdc7yCTPXLLx4zDKy
ANBnVA3TnNa3XkujT86RslaDWHZ/xHJYKTYJk/8g3m4jlsT+zqnuczwjSSbw1/P2
qBRBVMVH/M/Z/QcEBFqUJFripURbPuBSgKCpFCIq3AMxLBlKRdzfyqT385RQDRG0
VOuQEn6cpSkP3ZhzyNJN210Ahh1lxoP0tekk7fBsgZJrgYiaFv5WFJUsNRx4NMtp
x9rrsIqG0LOba3RVAkgbQBNUaEXcHWzrOZlmWPbAA77QXS9CMUSWbehYaLg+fsX/
SnC0TnX4r3B6xm0zeLZoBD+3zij8dA==
=mSZA
-----END PGP SIGNATURE-----

--YrEJvP9azbYsig5Q--

