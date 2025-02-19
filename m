Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1636EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0yM8D8GlST+Tdl75alSwhhZtN6ikqQO6h2gowhLs/s=; b=FQQnRlzZtvEg32dYLUeGAgTk/D
	BOPEq6hxBT8od9gA60rIT+JfPRh56J8phJi3gV+GL6tYmAV/y8jNPLb203+hK5Kud/sqrpS29j5yp
	qu4zFbKY3PkP/tkuBi4cZVZKtdFKvru7PHpQ9aOeUxwGIdffHaFrwk8o8VIaB/2LZRttCiN/jdkf4
	tJOAM6BlzPWrNFV2qGHbdoFfQPxWkxryCeC/ZhyZOqAOVHlTc7I6ZY3yGfbwih5flJk63vhAshDdZ
	bquuS2o28HAam96D7VlSNDxZWsmmqV1PaHbD9jd9qNgxdra5yEJjqw1i+ZRi6EPp06LTT+XvB8G1m
	R+vtjP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkl4N-0000000DI1O-2XHS;
	Wed, 19 Feb 2025 14:28:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkl2s-0000000DHd3-1kPU;
	Wed, 19 Feb 2025 14:27:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D3BD5C5A17;
	Wed, 19 Feb 2025 14:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9266C4CED1;
	Wed, 19 Feb 2025 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739975245;
	bh=BQOMI1FyOuS4DlKWkS+K/U5NSss8ae/7nZI8hbei1tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otuE2GmSKcq5MR7H6sWYiaCG7LRXKYfvCQpqvJ4gqlYTNKo058XIrJHzuJ9xO2iPI
	 OtCA2XX7c89kXfYFAOchbnaMyve2Giu2CxMmkZ1B05xWpYNDvbA+6ujETq7qmJrGcR
	 VZtGUq9H3KN3ArBhG4EfdriIPx+SHLHf34dssx4Wd28nMHijOcKLvtpX6HOxIhtopG
	 fTr+ISSfUpPk5hDwrqr38J7X1xRjgVgld5khu+jEgZdsyqrOxjFf+Ut+I2Kk/shK+C
	 qvv06HUG6SLBkCEgGJ6vH9x0T0mpPXLTg+BVeICG/g+DyDO1PV6PuepUpt6BqcBRvM
	 p0lJavWqqQ6bA==
Date: Wed, 19 Feb 2025 14:27:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>, Liao Chen <liaochen4@huawei.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
Message-ID: <Z7XqSVfhPGI5J63B@finisterre.sirena.org.uk>
References: <20250219102750.38519-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RyX3R1pbLNLkRqpZ"
Content-Disposition: inline
In-Reply-To: <20250219102750.38519-1-brgl@bgdev.pl>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_062726_508043_27B59FFF 
X-CRM114-Status: GOOD (  15.92  )
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


--RyX3R1pbLNLkRqpZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 11:27:50AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Since commit 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()") we check the return value of the
> get_direction() callback as per its API contract. This driver returns
> -EINVAL if the pin in question is set to one of the alternative
> (non-GPIO) functions. This isn't really an error that should be
> communicated to GPIOLIB so default to returning the "safe" value of
> INPUT in this case. The GPIO subsystem does not have the notion of
> "unknown" direction.

I see this was already tested for these specific boards.  I've also
found that Avenger96 is failing with bisect pointing to the same commit
this is fixing:

    https://lava.sirena.org.uk/scheduler/job/1126314

as is the Libretech Potato:

    https://lava.sirena.org.uk/scheduler/job/1126285

neither of which produce any output before dying, they'll not be fixed
by this change.  Seems like an audit of the drivers might be in order?

--RyX3R1pbLNLkRqpZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme16kYACgkQJNaLcl1U
h9C7CAf7BdxIloZPelOduxqgYD8I4gVrpuOlA8WSR6iZSEOfanhyMYI1/Ew7Wlai
HtTQO/wDRJceUaqLiBCURcEyp6QAmioChr9noTiwqzeNlZxRBPk0EDKWbHECSe/T
GDKwPAsfsA9hF0zHv8evz+nHpuU65NBM/pQVlzWHtMt9gbcgvU4DZUXU66Nze+xf
lKPtYCJWITisEbCSHxBKawuEkBDR3KZOf1q6/mVfKxIPE9TUGzJ/cbHCWIWw+kD3
qryvmLxCt/2+okVSLADypTowxCEdFYaZ+cWUsMfKloxBKIv+fRkiE+leCA3xrTuE
Zz6mQIP51m80nser/HulYq2kiI2mlg==
=WyAO
-----END PGP SIGNATURE-----

--RyX3R1pbLNLkRqpZ--

