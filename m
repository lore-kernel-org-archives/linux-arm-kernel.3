Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52B2C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8QH/9LVe3MmbHWlOj063nhwVhTp3uZCqQntnbYL1uY=; b=R+TxH6bSPeNAocYmfig0eOQ+xF
	C7PFggCDFR9Nk5ztQ85pE4U0ioYbIKSMiA7CBV2Afsb7PAc0FXrWHtpZVPZefvhCqLu32EU6vK1di
	li2cInEu1lSzUYQf1chRwGDCO+rL7pOTI43df8kdkTEDKdVBz+76rgTGVJmwH0VN5xeNl99DAh/fb
	LJ2KSJ4eURBKbVrQgzMXqVlkjC68Yl+JQ6HGpBQ7ssbx/M3+6xECf9wjttTDxsW2VOa5p2b84sHCM
	UvYbACHcPxiZYy9mEccvqDEQ0gT1jBKA0+528dzixecUsdQ6fvZflKbZsyJRwJRrhxkQ4pjyMC6Vy
	29itbKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3nu-00000009t73-0Q3X;
	Mon, 19 May 2025 16:57:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH37H-00000009l4p-01Nx;
	Mon, 19 May 2025 16:13:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4263E5C5482;
	Mon, 19 May 2025 16:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D255C4CEEF;
	Mon, 19 May 2025 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747671206;
	bh=Y8QH/9LVe3MmbHWlOj063nhwVhTp3uZCqQntnbYL1uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFm9Y2BMK0pI8ND6m4ateyB1xw/cY4e6wk1fsrwURzShlnB96HUOA/CJfZwPJHk/h
	 SFdv1zaTZH/QPv1ukEJDR/mh1GpqTLmqCUSK0EhituJdfZ7Q+17XUG8t4toMOoa2ch
	 fnI9O2VrbgMiDHTpQFwn8VQ3ucskEBA0x/W1jdACyYmLSbj4VvZrbjteRmkzuDa7Y4
	 JqTXRhHe0fm6KYy2c/uR7kccbZiPTMFdsNvmsgkiHIMch1qZ4uoK9oWSQnGDzXCcSG
	 og3A2EMnsNSLX15ldhXtpwypx6caxq8/oLoGWcUF/e9Ob+YAyGKBiMBJQuB2zkT9hc
	 3f0oKHkRmkMyQ==
Date: Mon, 19 May 2025 17:13:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>, Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: power: rockchip: Add support for RK3528
Message-ID: <20250519-outmost-carving-54f2a03fbf4f@spud>
References: <20250518220707.669515-1-jonas@kwiboo.se>
 <20250518220707.669515-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g+A+7+z+9ImO7h3U"
Content-Disposition: inline
In-Reply-To: <20250518220707.669515-2-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_091327_082631_CDF26A11 
X-CRM114-Status: GOOD (  10.46  )
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


--g+A+7+z+9ImO7h3U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 10:06:48PM +0000, Jonas Karlman wrote:
> Add the compatible string and power domains for RK3528 SoC.
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--g+A+7+z+9ImO7h3U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtYoQAKCRB4tDGHoIJi
0uOOAP0Xv7AajQHtPvRmMN/HO2YRdDgNFtBlbcgkBdB3XHiCJwD/c9JjYp9l9fGH
eMrCbnVSV5zQIFlnmFNCL0CBXf2x6QE=
=+jD7
-----END PGP SIGNATURE-----

--g+A+7+z+9ImO7h3U--

