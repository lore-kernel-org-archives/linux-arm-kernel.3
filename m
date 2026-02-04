Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB81E83F05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 18:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D53HBMSb8J3Sayv18SrM/DE9F0UmWk5h0fESWtISmGk=; b=D7vUD0MU5Pg5UZoE8IP7Q6kz+y
	TtjqOevFcyF5ku9M5CTffgt8hGDzluJzEjwLZl9ovTse6pUl/iZfU8hayfukLYMCf3zOJjf9Jk3ev
	KBq7AHujPLlLI6fCG7bgKfULwG090PcwuNpNBJ7aBXNLTNKwTvZKErpKShnFGnb4iQ4ZcmOQw82/J
	hGfxOdDzUt4EXCk9iQnoSFkLEP90yjGwcGQX7G1XXObXKqAhs2avvMnc02MOw8TpbyYXSiIXX6M93
	drZJxAXesGYdmiPSabxm/Ov2m0ps/G8xTfC43RLpccC3DxsBoK32B7Sc4x/aYslT4c5/FoHgZ/zwm
	6vbKxZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhFx-00000008uBo-1Wc6;
	Wed, 04 Feb 2026 18:05:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhFt-00000008uAt-1D6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 18:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD5BF44351;
	Wed,  4 Feb 2026 18:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEA5C4CEF7;
	Wed,  4 Feb 2026 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228332;
	bh=D53HBMSb8J3Sayv18SrM/DE9F0UmWk5h0fESWtISmGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOQQAbpbHHN5f/fj4I01Akhm1tnXd7hZcHsy+xPUcBhQqM9gyqJno5/f+Vhk2gQMj
	 hkrzVva5m7ye/mH8zCnMexlu3qedsbvICbo2Mt80cZPJfwE3F3K0HQjqoQTrfe6Lt2
	 iUuCctyQrJrcA0D8jpOe0qil8snJgwmCTHPTwcXfXZLupK4wzGvRnkTF70aLdUuwqe
	 kMrPR9X9H7XWn1h4YqPBSnrEwKvcaOzZazS0D3fjBo9FdqRq3BeNw8+djTogiDDobK
	 W0sBcL4I4R6Wo75++wYUT4ZyjbjAaaBaUC0LDEvm8qsCGsA0L5cjypWpFgmb7IH/fh
	 DG8vULMHH+5KQ==
Date: Wed, 4 Feb 2026 18:05:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91
 Boards
Message-ID: <20260204-brute-daydream-871c0be53454@spud>
References: <20260204170356.35169-1-stefano.r@variscite.com>
 <20260204170356.35169-2-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0sR0klTatUnpUM59"
Content-Disposition: inline
In-Reply-To: <20260204170356.35169-2-stefano.r@variscite.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_100535_027890_A8EFED14 
X-CRM114-Status: UNSURE (   6.44  )
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


--0sR0klTatUnpUM59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--0sR0klTatUnpUM59
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOKZgAKCRB4tDGHoIJi
0qetAQCq2VcboFqXT/rCNQlQcHVzPO2WoYqZa/iOZzp1ZmH/MQD/XUYg+z8frbj7
i+WGA6DX7wrdlLaJ7mRO90s8yYiYeAY=
=RrWE
-----END PGP SIGNATURE-----

--0sR0klTatUnpUM59--

