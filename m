Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A1CCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1MmOOCahg4e+YZf4G5N/altgnKA5qXFQq8wazzr6ds=; b=hyBImwlDDpRMbV0JwlL2ZWCle4
	kxuv2kFXh/hNG31fntOhImvHg+tvUOfQ7bgTnUKUoEqgwm6hbaImWue8Uc24H3P3uGXordUuy55zR
	J3eKw0vAQfH02jFYqP1IgefLKpAXWMr+8Id1rRnUffZUfWOwixbo4b9A5RERyQe+ERNqsjbJwyfad
	h7juiIFwMw6/PjVHfYJvoav4QWSJ1e8MlY1ytMjCCoF3YoL2vCWBgsAd3MRefTWtyXxgkarmtl3u3
	+AdvPuWpukf+z/e3VPn0mGm4cTY3BFnVFjd+v9RLDRsp8rlJ2XmcDPr8CePnOiFjgc6baUna6iBzP
	IBAu+UrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMKv-0000000A4LB-2V2k;
	Thu, 01 Oct 2026 19:20:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMKu-0000000A4L4-1gJv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:20:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8F2C444F7;
	Thu,  1 Oct 2026 19:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898EC1F000FF;
	Thu,  1 Oct 2026 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790882455;
	bh=x1MmOOCahg4e+YZf4G5N/altgnKA5qXFQq8wazzr6ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jU1zxpq67EckGkyWPOprssSe5IBihl380Q9+To2nP7Bm5LiheBHEOvjKwjCZ3+2G7
	 +O1SUjgIVFzEkeFddecxCtm0+KeEe+ao88XzdQOg9nurUhZhVh2mmjIZc/M+vnwR4w
	 TmPLxoZmp+sJgdf2o7zNoIk+I0oeHWAH3UbSfPCORHxsrU4n/wa27l1KNrzBoDEgxC
	 Rg7G3QuT9q/eMg4NFkd8z/fqAG7uAxMzJR3Lt7qwlrZEMgHVFlQ3VOtXeTYm0AAiLT
	 tyX5i7Q3E0Y4e/QmfQJLtOshsyzsuLD8732oasRUK8IzarCaiTnEkPIVu3bAM7UNzg
	 attYGZfDQ1o3g==
Date: Thu, 1 Oct 2026 20:20:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: samsung,exynos: Add Exynos850
 compatible
Message-ID: <20261001-ramrod-excess-af03490d5240@spud>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
 <20261001-exynos850_adc-v1-1-791b3516bb9d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BadlZsUMoxOv+uPT"
Content-Disposition: inline
In-Reply-To: <20261001-exynos850_adc-v1-1-791b3516bb9d@linaro.org>
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

--BadlZsUMoxOv+uPT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--BadlZsUMoxOv+uPT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar6ykgAKCRB4tDGHoIJi
0pcNAPkBIiypEFaEr9cRqf0+A/gpebZXEk4kvlJS5mOUfO3o4gEAsWasR8lY3yxW
sflI+kUdUrN+nCczr4eOpUsogkPVdA8=
=rh9C
-----END PGP SIGNATURE-----

--BadlZsUMoxOv+uPT--

