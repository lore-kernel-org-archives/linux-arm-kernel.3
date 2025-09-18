Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35981CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTQzEFQiULsusrEoiFHrUIY5UVxjD6bMm0XeIsQK0Sg=; b=pJJifIcFWTCqN5Giy67y6nSaKV
	uJvxmccIk98bZhWheCIg0wyR1tH9bRtF5s8qOyIE4YkfPLAdKlN60LAfOYahSOB3GrsJfrhO8vkiU
	bSLgq7GEbTh4Mv1nB2dUL8S0f3aqrxrnL8gKGaDSLqJ2BgfVh0zmqW3PWZXnXcwN2OykUs46Rv+6Q
	6SypzcPNQ1IyOEio6YMw1eDPf5L4UQQSP/SHuk2pjQ+dDelNr0oUgNhEezRviD8MwcuV259eKG70l
	xYTHAK9WLCO67wbmfpJYhxnVeOZGw6rWH7g2U+W7izTdf98t8JQsB3Cd/vZ9SaROXueWgDQNzbobY
	5mXg/z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGJy-00000000Ijc-15cs;
	Thu, 18 Sep 2025 15:13:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGJx-00000000IiT-01a0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5814A60211;
	Thu, 18 Sep 2025 15:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DB5C4CEE7;
	Thu, 18 Sep 2025 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208396;
	bh=MTQzEFQiULsusrEoiFHrUIY5UVxjD6bMm0XeIsQK0Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOpCyvRDsW9Il8ySCZwzhVqD3CavFZiKMcDftrKXTocuE3EX+EulR0BgBXqiyUc86
	 tm8a5J1XPpdfPQbuxnadH3s+xsujaYWZSLq29TMQtBMQyOg+Zoc8fA+QHo4j8dH4Z8
	 jMcJ7h+NIry4rIQ7eqfM9FXlIdOdqcPQRTrG+pnv80g/G8q5hYVH8RcUC/H59+kgFB
	 Xv1umMMLMHXPCeBEg7J3N6bSICWq7+SgtzE8EV8yb6VicWQ5gqWAZnxHTXe3otSbJS
	 V16k9JQMtCC1H3BOQOyjtKE562+Mp7gAjqAOUin3tD6hdsG0GeaWbMR4k/ROEiu/kL
	 L1ZC6uY72K4dA==
Date: Thu, 18 Sep 2025 16:13:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
Message-ID: <20250918-unbalance-shrubbery-8038941c6797@spud>
References: <20250918-cpitchen-mainline_gfx2d-v2-0-6cfac9d56612@microchip.com>
 <20250918-cpitchen-mainline_gfx2d-v2-1-6cfac9d56612@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3/7+aMqJ6Ffw8WC"
Content-Disposition: inline
In-Reply-To: <20250918-cpitchen-mainline_gfx2d-v2-1-6cfac9d56612@microchip.com>
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


--h3/7+aMqJ6Ffw8WC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--h3/7+aMqJ6Ffw8WC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwhhgAKCRB4tDGHoIJi
0kTgAQD8JKUvi3YGAWpBtFlr+fWrmGnI2vCnimmP2oRKPXftkAEAjWLLhsT2G/h9
zhB4+qfto1vN11PxMJHIQRK+sDB5+Q4=
=0XOG
-----END PGP SIGNATURE-----

--h3/7+aMqJ6Ffw8WC--

