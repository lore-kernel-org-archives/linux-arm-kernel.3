Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B42C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqwRY2t2GG/HXlNPtzthyAZCQ4zDXDfIWhWR0nQ8CGc=; b=QwGi5XO98T197t7UrJwwEJ3yT+
	jIw5B6HTPV4RqapySlawrlW/vr17zOLXjG1L8p2nGsccCSJz5/cqzqAuG8fesbq1UDj8K4C21XquW
	bzGcCZNqCsqz1ZYsD4tk3b7jKm9OIGlMv3xjOt49PVxbcBr/bbkLHcbP7gHIg0MziNHP1fQajJkjb
	7YtFuiAg6zIAxPaj+Z2Vwm8CwcyQMoMH4UfQOxr09/bc4UCeNp3WRGX3v85I40fJeRr3vLcI4JrPy
	stUHeH5rqJd3b2RQaJw0BJvcxJdX0EnSieWmpwO7eQ/Ran3Hc51dNTYWS5Wp2mNyoEHogOeG0yoYU
	gNzTyDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXhJ-0000000H49N-1x36;
	Mon, 24 Aug 2026 16:38:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXhF-0000000H48q-2LmE;
	Mon, 24 Aug 2026 16:38:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D1F7404C7;
	Mon, 24 Aug 2026 16:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC75A1F00A3A;
	Mon, 24 Aug 2026 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787589533;
	bh=sqwRY2t2GG/HXlNPtzthyAZCQ4zDXDfIWhWR0nQ8CGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cVEbCejIw7fUoGqozdRq73PJRbL3ssn1jeYvkLhnCatNT1/nLXOBgLQ0ikTR9NMsu
	 NBODwqN999Q+Sfi76XYduxvKn0AAEiskHomhO1Sat/xdyZ6hZntbxWUJBdYrGxtKrw
	 RQUYn26RLEfs90HTNXB+bav6T3XW1MDqs+GjfLEb5xCc6gbM2i7wqEj7+GwhFq0kWs
	 8ULReDc38D/6z1L4PxbQJYQioPaLjTrJFmYEefBJ1EU2v+sv4Bd+3iPHpaarZ8Zyir
	 mOYxC6gwSQizZ+jU9m5xRvdMC4kiyHF7LCfN2Y9QEWPgoq9X1+zE6Gi/I4VkmI5h0Y
	 p7gMNMt4hHWaQ==
Date: Mon, 24 Aug 2026 17:38:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Simon Glass <sjg@chromium.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: rockchip-saradc: Group
 single-entries into an enum list
Message-ID: <20260824-stiffly-caress-91a7d95592bf@spud>
References: <20260823122039.20831-1-vlad@zlab.su>
 <20260823122039.20831-3-vlad@zlab.su>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwYF2VLTXBcJVgoO"
Content-Disposition: inline
In-Reply-To: <20260823122039.20831-3-vlad@zlab.su>
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

--mwYF2VLTXBcJVgoO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--mwYF2VLTXBcJVgoO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxzlwAKCRB4tDGHoIJi
0kGXAQDe6WT4X2xsTPjTCUY9zPGU5BTZNXdzwhP0cgJ3PUZFxAEA39XrZeoLINvt
WuD3NSdPjZe+7irgZTXSUyIpuds1TQs=
=yfyJ
-----END PGP SIGNATURE-----

--mwYF2VLTXBcJVgoO--

