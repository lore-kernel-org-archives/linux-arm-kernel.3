Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88367C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZuU2nwPdOwLla8Is6fZKgR8o6flmQzOs610sHlRGF8=; b=d2HBdsRQZiVV74w9zLPe21nF8H
	ViSfW00mLysmAifj3rGUcEksUoWn4qRli4KvWqUjxKdX2+Yw5IbtwTosLLjgu7cKwA9k6tw94Ag7C
	YUtz8YB6GiX0zRQP5yz+sFqQa2wKqBZNyZok8Pr9YCqJQih8S8xmQEKnisrCS+tLrcinObzvj+V3H
	cE7fkgZ7NVMZWo+YrBa9928pgQAFfHNxQd5cXZXG6044TQiI2lQdTMLGdVeSc2OXAldthmEmyKe6J
	xsMRfPm/uT6eRxh03765qxH9k5ICDj97tw7JtWSxRx0RqqGLU7RbbW9vTi1sx8PCqq8J25b5OpqGc
	7N+GM1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJOw-00000009wee-43EN;
	Mon, 13 Jul 2026 16:21:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJOv-00000009wdl-1zyM;
	Mon, 13 Jul 2026 16:21:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D19140B1C;
	Mon, 13 Jul 2026 16:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9C31F000E9;
	Mon, 13 Jul 2026 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959661;
	bh=CZuU2nwPdOwLla8Is6fZKgR8o6flmQzOs610sHlRGF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gAnf3T54MOWerL4i9c1iRvBwGDSvRE1i0ux34P91ZULsdzmT7e7OG58wv8C0zhOXY
	 5I7KbPIQWuEftzmgDRCE6rSNfvGlyfaOUl1lKGf4vxXcXj1/uFcVwhksV/eouFg+VM
	 3BQazf+Rbubnx8pwRltBBmYCPasGtaC1BUP74cQ86tQYY7vlw/NwbVpzQvdcHqQ592
	 OSg5Cei1gEqM6vEbEjGJz6EtaUzEj8K4vEEH7d38zLTSh72slTaD4yHKTHSkeVEA+M
	 hmpSdbrCY0fbjfabDIObpE6762QYzc/vvYU/lzobV1AYdmR6iJBcyDvXjSehsp/pol
	 mv2BtQjgpv+Tg==
Date: Mon, 13 Jul 2026 17:20:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Message-ID: <20260713-chevron-buggy-fdb7812657f9@spud>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53fdQdUunGakAevX"
Content-Disposition: inline
In-Reply-To: <20260711192842.845048-3-samuel@sholland.org>
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

--53fdQdUunGakAevX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--53fdQdUunGakAevX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUQaAAKCRB4tDGHoIJi
0u8FAQDxnQgyP0pTRW9IemWBr9emhVbwxDD1qhepCwJraKJ1iAD/XIKwhwY2gXeY
9N4VkrL6k8eUsvVgTlf0rewh3twpIgE=
=U5O4
-----END PGP SIGNATURE-----

--53fdQdUunGakAevX--

