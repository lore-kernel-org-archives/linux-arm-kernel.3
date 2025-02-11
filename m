Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9415C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9OiVq4lA3y1Ju2JdD3nDT1kWhrKFhscMSwrUVrrf7s=; b=4JCFFX+Tj8SUu4trCtLc1G24A1
	Cu7vXRVrHQ+UdCJ5ruw1rC91CnCY6ucIlTgIajidVJhbu1vEtDgXOYg8a67r//wBUIt7iyGGHGrER
	fGOjQT5FitcKH7yS8BxWJyIqP/6lkT77GPIW2NgxXcjPic4F/FSzJwVVB2GRf1N5yiNI7n5iyMyzc
	42xr7p3W8M/6YLGqcGVIBA4q2Ka6z4Jll7wPYLhvnlN7D3IDqG5+eXHDvOOfIMUJDfrpgptYQJKeb
	O87FZu5ew5AEOEYkI/QeRGIvEtWnr2etZKJnso1Pk4Qzo6CAtT4nYpbm6siTJY+ewNnJzS4ajkLNX
	bgNSzYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuXk-00000004mHG-3j7L;
	Tue, 11 Feb 2025 17:59:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuUj-00000004lpv-3sI0;
	Tue, 11 Feb 2025 17:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9C02EA40B9B;
	Tue, 11 Feb 2025 17:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5928DC4CEDD;
	Tue, 11 Feb 2025 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739296584;
	bh=N9OiVq4lA3y1Ju2JdD3nDT1kWhrKFhscMSwrUVrrf7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwdj3RK2bdWxTm2v9oFP02HODkeYrya7V5OzHTSLUNab2QJiADsQxpSkj8DLZfdeT
	 Lyn7Wqgqu+84u4FO44yZysLQhrNO+Duk12k+9prs2N4ZGb5MMJpKqyY9eGHIuQpiW5
	 TK4v2VR3CN38WVQzxjX6H3aPV+pTwAyNC2EqnxyX3BQa1eX3KU1WhE8f7IodQaGaDc
	 hueuv0Bezgbe1jOAwOcEoZwmE2k4kk3IpgSIHMOj8SEuIIAw9oie200aKIzsKdnJxK
	 xO8QtW8xJsfBcASUxu9f9emGW5I7NUemIkwwY+sHq5Tgkil748cOC6ZBMqxmNFDTMp
	 b/jLO9dx9WoOw==
Date: Tue, 11 Feb 2025 17:56:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: srinivas.kandagatla@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RESEND v2 3/6] dt-bindings: nvmem: rockchip,otp: add
 missing limits for clock-names
Message-ID: <20250211-brownnose-pancake-ec8010226e71@spud>
References: <20250210224510.1194963-1-heiko@sntech.de>
 <20250210224510.1194963-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5lHI6jXJr/khkXOI"
Content-Disposition: inline
In-Reply-To: <20250210224510.1194963-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_095626_032306_0BA270F4 
X-CRM114-Status: UNSURE (   9.59  )
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


--5lHI6jXJr/khkXOI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:45:07PM +0100, Heiko Stuebner wrote:
> The clocks property correctly declares minItems and maxItems for its
> variants, but clock-names does not. Both properties are always used
> together, so should declare the same limits.
>=20
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--5lHI6jXJr/khkXOI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uPRAAKCRB4tDGHoIJi
0n4bAQCGaE+a3c4Ovuh/Je2FzH7HyaSdzuOzAQjfzUqy896TMQD/aS3ACMxHzh+R
1ApLMMa2YdgCgtVGxmRBzbOAD76khgs=
=T9CO
-----END PGP SIGNATURE-----

--5lHI6jXJr/khkXOI--

