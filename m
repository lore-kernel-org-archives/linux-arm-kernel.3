Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88212CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGv7wzz6dSlgfk0zNA/9NELYefYWEvx5y5COyaIu+P4=; b=iAlmq75thnfFtDnwYGH9XY//Xx
	OWfey5tZ8L8QxszZ8RNvl7vhqbcpgVdoQ1TSLhqLqBZxoOEpW7bhrI2A0toGS+undq6Ujk5+rYGNS
	pCHfm1t64joXEMFJBecdT3H0nQv0FBd6iQ1IMRV0OGdNwKi5gTjEOApFtk0nFlaLcXYOa2xzn1vPv
	UQRsuDkc08aNpdn0vlZE73h65y2xEh2AOI/WTMxDdhwA/A10YrNbI8CpmelBtL6SsuswzCOYGg1Qd
	TdFD8xZ94EOfwz0DlZcV+D7KW/QElVqG60V8s1Y5ahEBC5EdWJuDBQxzES4yCYkg+EazFstRVBt+q
	2NksdazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLDE-0000000BJOZ-3UIl;
	Mon, 12 Oct 2026 18:57:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLDC-0000000BJO3-3Cuo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:57:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3756B60142;
	Mon, 12 Oct 2026 18:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702621F0089B;
	Mon, 12 Oct 2026 18:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831445;
	bh=aGv7wzz6dSlgfk0zNA/9NELYefYWEvx5y5COyaIu+P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aPBeZDYrJ/i+B8WrCeaXrBd3+XUWJhZo2r1ihQEkQVznr703fBmMw3UCjeXC6EQ9L
	 etAhg6dkaTZGSkAlaiYGxENtFPCh1fnnuS3hUO9HKKKKzSzfXSsI+MWeTdHg8dC5yf
	 +FYmfmXeK0sOgA96u3jjofHSE2lf0VcwQINa7xuCT0ZeK69C2max3q6yaBcMuMjdYX
	 f/55s+EpA0X5sa4i3v+dsP4DnwLYFY9q6/ZA29WEHh0iamOuy0vKj09ANu3PwhVThZ
	 UyfbNN+0sdiHvATHJq9DV7mUHL+aGneePT0CdMksnHxH2h89m+rpmIPNSN95tuITo3
	 q0m2akVOCy7Rg==
Date: Mon, 12 Oct 2026 19:57:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: i2c: apple,i2c: Add t8140-i2c compatible
Message-ID: <20261012-crudeness-able-6f5f7dc1e7cc@spud>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
 <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-3-6c757966a99e@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="muLY+G8FkQlRJbj0"
Content-Disposition: inline
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-3-6c757966a99e@cyberchaos.dev>
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

--muLY+G8FkQlRJbj0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--muLY+G8FkQlRJbj0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0tkQAKCRB4tDGHoIJi
0vTFAP9A0KLlFBmkMU0KWr4iNtgNej/Za1EjmTmVElTOA1WMhgD/eWeOIHdfVIDr
9YivZwI7/s5C8lmOWzAtJOQouTexAAw=
=AfRS
-----END PGP SIGNATURE-----

--muLY+G8FkQlRJbj0--

