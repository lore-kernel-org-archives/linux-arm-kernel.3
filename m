Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03A9CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hFyVOX9Qmybv7o9zWJHJ1lJ4C6SjaRoYYblpegTOC4=; b=bN9IG2XuJBizM0Vw6nOQO1CuHC
	XMSb6+ZkJ7dIKJh7CF3j6nxpA9VttftAPxkZXDizD4nBY3MfJGnoBeDiEiCt5aPBehQAmb09y0W4n
	vQYONerpnxR89b/A+FUGw/MqkB9TQANLjjR/bswUDsBfecT47tDalP/CYzrCTX8G3fNLa/TVH51US
	wGyCizIgJCSE19OXqasz+nZoHm0DM0a8RWA7OQlMivUsV7y0O5QXv4XxqjctTf1muuXv22PLw+BnA
	ffsskW6IEWHSxFHM1wMhGHAx6roZssW6LTIrmTd0t8asljJ9lW3pvU4bnm027IpKvkcDIwV6zlAOy
	HlsFOGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4yM-0000000BIb2-3CdV;
	Fri, 12 Jun 2026 16:43:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4yL-0000000BIar-3v53;
	Fri, 12 Jun 2026 16:43:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FDD240227;
	Fri, 12 Jun 2026 16:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D5B1F000E9;
	Fri, 12 Jun 2026 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781282589;
	bh=2hFyVOX9Qmybv7o9zWJHJ1lJ4C6SjaRoYYblpegTOC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YiGkM6CC07SFtI9wZ0wjQa/gXrGWyQ+xZpvGN+3va/PktFSC1lkT4ca964e7445x3
	 6EmLTGld75Hj/5ci4q4mo3Zl0Bx34ghY265Kew/PZ/jbc+HqHxFFnbemRyN5MfaMCz
	 7NJGzqq5fj3wxOZHlCA/MTrh0peW1JEb/zbiX+tad+/qGkleQ0VSEkDJT9I+TDmPJH
	 VR3IOL4mkxGtm1t+fizrTHD1AYpjeVqyupkdSGg1Sw8Ixy0l7XU1U0sYcq/r2RpoxT
	 oA7AB0qx2H59oO4kBQuqJTjKx4GTTgpTF+QGRZ7+x3zss/D/t2np+Uk+8KVYON0BoL
	 qd3Udmhnqh3WQ==
Date: Fri, 12 Jun 2026 17:43:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Ugreen Group
 Limited
Message-ID: <20260612-chirping-catacomb-acb53680c4c4@spud>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
 <20260612-dh2300-mcu-v1-1-ab8db1617bc0@flipper.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LCPj24h9H5nR0ZzC"
Content-Disposition: inline
In-Reply-To: <20260612-dh2300-mcu-v1-1-ab8db1617bc0@flipper.net>
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


--LCPj24h9H5nR0ZzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--LCPj24h9H5nR0ZzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiw3GAAKCRB4tDGHoIJi
0g1HAQCHsYPbaaUh4VsV+wWpDkVCfINVcMH7yGed6ikRWQWSCAD/fAcDGvCEesZH
Fede79+bUvv0bfmFqBdw3x7lVOY3FQg=
=XgWn
-----END PGP SIGNATURE-----

--LCPj24h9H5nR0ZzC--

