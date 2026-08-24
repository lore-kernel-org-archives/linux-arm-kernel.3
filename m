Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA1AC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hU/sAaDPsIpBC9ELNG+LmYrzgz9drI9Eq5U9BN9RNqg=; b=DtXpX2uOtrdrqT+a6H2gO57YEI
	Sg7WOEFQy8O1+j0cHQxT3myF8YH90xXEdnqoLG+MCYvUxolUyuOVllKMFF/qRo/FIV7gbb6dIMyeO
	s4aFzfsH/8S/3BpESYX1USv3s4gzkaYvbFO+O7fgFgn/E28XeTPPcKDRgDooxpUTa7JPfWQGxjvod
	Vnr1MhkTSGcR7xBIMWz1kpSvAtup5y44vk2Uoyjx4ONYGgaFIHFonI/CKhZsFWlEB/0t7wqPism4y
	51BXvugd7O/XGFnjexJwKUK0XHB8XVLrmcUisMi3fObCjzryCPzdjEL9TA6KI9sOkhbWkVrxyEiAG
	KMFBdx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXgl-0000000H411-0m28;
	Mon, 24 Aug 2026 16:38:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXgj-0000000H40a-46Ve;
	Mon, 24 Aug 2026 16:38:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7888F43D7C;
	Mon, 24 Aug 2026 16:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671411F000E9;
	Mon, 24 Aug 2026 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787589501;
	bh=hU/sAaDPsIpBC9ELNG+LmYrzgz9drI9Eq5U9BN9RNqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EsM4YdpljELnLq4M3bqm+LzeHXGbZfpBbcJSUgKgKT5Uuoqd/05qECBNXX7y7tXxj
	 FDN6HAIuv5Gc7uamPFnW+ScrHewsrKs1BgfP0XtSXgTwloCjz1eiibxkls4hi+dp7h
	 uekuqZ4LCprijk2CLdIAXP9udp+pE0diu4nhksdbVjOwwMx5Yd2EkeqVN4epYU+d8G
	 0IccpOD4/tdj1urrQg72J3ww/hy+INz8Wbm7PUIY1aQaVS2ak1wIU+QIBbHMOhlK/j
	 KfRabMlem8zOFuFx0Ct+5weRG/5Z0lbJSnzzZF/j2CaqEmlz3pA7SrO/CLmJ3SgN1y
	 IeQjNf/dMd2rw==
Date: Mon, 24 Aug 2026 17:38:16 +0100
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
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: iio: adc: rockchip-saradc: Fix
 RV1106 compatible
Message-ID: <20260824-scorer-propose-d216e0a8833b@spud>
References: <20260823122039.20831-1-vlad@zlab.su>
 <20260823122039.20831-4-vlad@zlab.su>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AgFl4ZJM4/qIhC3X"
Content-Disposition: inline
In-Reply-To: <20260823122039.20831-4-vlad@zlab.su>
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

--AgFl4ZJM4/qIhC3X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--AgFl4ZJM4/qIhC3X
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxzeAAKCRB4tDGHoIJi
0ka9AP4+tXIZZ5tZdpAPr7WKI6H6HKkBxPFC6eIG4WKmPx86pgEAydAX9weYsZg7
V7OR8TKYqLBSjTQX3a///yGD62FMAw4=
=1r9h
-----END PGP SIGNATURE-----

--AgFl4ZJM4/qIhC3X--

