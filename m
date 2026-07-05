Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F8EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/n0iZgwvMMvJYTgHg3uWx8SFFqUQFjH+kTb7bwf1+qc=; b=YGtemjIaKhjwI0V2NvL1n843e6
	MPUfyZAbGJzXvMCZMN2ZSpB2QYdDnaixqJe7XYzMfWvqANVwqmX2WqnoskhdGJp3JEuqF8kElejG4
	GrGZy5pnR7a7fcflwj2Wkfvwle9ruI0edPaRSQ8Upjka/SPJBIIF9rqz9Ibnu0XGI0CiBHP+u2UiJ
	GIOqF6U3ZEfybHgBOSsZ7jJwg2LTbvHVLXKEp/nmp2u3yFI3x/ROeS+OwrUi/8fFUlahOtsnrs0+T
	gglmXkyQfmpOcQ7uDzX+cnjSNA9k6XyHmvqV4nehgFJLrQgEXe7GEhP3wamDT8/diXzfmggcdhvzd
	kxhmy13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNxx-00000009OZ9-3paq;
	Sun, 05 Jul 2026 14:37:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNxw-00000009OYv-31po;
	Sun, 05 Jul 2026 14:37:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D297438F8;
	Sun,  5 Jul 2026 14:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540751F000E9;
	Sun,  5 Jul 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783262224;
	bh=/n0iZgwvMMvJYTgHg3uWx8SFFqUQFjH+kTb7bwf1+qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BiPzLdKZdJXaFjMd/36b3CWSju9jrDzw2wqDyd7EQTIcrUQ1RERX6qqXuQawag3rQ
	 ad0g73LJ4qDEr+6J93JZOFMwt0Zv2P3YXtg2A5y6xmraOt47k1DId76W/jSIYVXttV
	 9lPUWu2MquyCygal4omyKZuT3LJy1IwJIt9xVGn2lzSS8AOBTKyaJt9pCO2+nPvRhF
	 2brMWYxCKwsdRCHCXnnQMQou+9eBcrcvw9f6uqs234CAmyudfWUMCcQD9F+GoeJkjz
	 WQ3wB/n6JT8J7cj8gy1o8Z82/I8j8H/jzQk4j64Hyt1l4mLJwaL8UqYRrrNrqgFQZC
	 AUMca7FskURAA==
Date: Sun, 5 Jul 2026 15:37:00 +0100
From: Conor Dooley <conor@kernel.org>
To: LemonFan-maker <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4
 board
Message-ID: <20260705-palatable-hardening-48f73a84244c@spud>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ti5bnEJPwTc9Dbk"
Content-Disposition: inline
In-Reply-To: <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>
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

--/ti5bnEJPwTc9Dbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/ti5bnEJPwTc9Dbk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakpsDAAKCRB4tDGHoIJi
0iGqAQCvtfivGWBaOn7wqk13VTJq5xxA6BvfZpSk2fXTfVhU9AEA5DnRo276nhA4
0gqQQTjPt/J3WwLd0nQ8fm3so2a0hQI=
=51pf
-----END PGP SIGNATURE-----

--/ti5bnEJPwTc9Dbk--

