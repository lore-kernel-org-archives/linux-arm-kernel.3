Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802F0CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7hx2doDWAY1iWzUZLQCnOGf9ISlINrxqo4MG3aJP0U=; b=k3MNWOHWgZny1gU1hpI5rgWhqf
	khceOtvspUkRX0EPDwy+VGUxva4B10lxKrRQUPWJ+xqR1Wia7Bbdsxnth5zwZDX8l7qXIdn1rxMwr
	7UtAJLQmT73SpEyZDd9LIxco+siw0ivsd/TXYVCOMyChlz1fpVkfRDwj6W18kt9iOvGIocqc+Y6W6
	GFjJ4Ihk3gsZ4IPEXB9bt4HnK5AxpstRNMz4qqA1ivHnDGXn3htomrbWtFjOi4qZfijye5vbNsCCZ
	NqXhC6dcnQgDFL9rpmcY5cW1y6lFe10Hr/CW4CYXYHiEWz8VMBQHxF9nQcGlmDZ+WvSX6xiykTgAT
	P7GE9QDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdRz-000000049O0-3y39;
	Mon, 08 Jun 2026 17:07:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdRz-000000049Nk-0z47
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 17:07:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6D1E42AFF;
	Mon,  8 Jun 2026 17:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2151F00893;
	Mon,  8 Jun 2026 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780938466;
	bh=C7hx2doDWAY1iWzUZLQCnOGf9ISlINrxqo4MG3aJP0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZmpugfYmpCFnw75A3b3VgjxPivYQx2DrjYVU2ZVVMuJCs6H89wZnYF1hk+dUKCtVL
	 Bh9Jax5D1E5t99E3Ay5ct1ymEYeWiB4P0vZ2/uOT7u+WaoeS6P/Lcqj/9xvs+W7+XA
	 jlbWCs3FcHDTO46ufiVTMuAjkYHeKDomoLTbMzPTWOlIzxb7RmGY3QkHYq48IYAHoi
	 ht1gY3QloKTlB1/ZxicCyeYu34MH6NpIA+lvc7Z5s/flFGrlO55gOaA3BSajosGlv8
	 uhJiC3GXfhuuDzlz0B7URgU1Qb03rUG0EV+txmDIJMjm3UtdnWuJdOqLlMz2zM1ilS
	 F1qAU5aNnNL4A==
Date: Mon, 8 Jun 2026 18:07:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M
 PLUS Boards
Message-ID: <20260608-drove-surfacing-2464cbd7a3a1@spud>
References: <cover.1780912513.git.stefano.r@variscite.com>
 <c65129896fc6ce80044ee1d89e12dcdff34945be.1780912513.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ym6O7jMXSrjk7SMB"
Content-Disposition: inline
In-Reply-To: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780912513.git.stefano.r@variscite.com>
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


--ym6O7jMXSrjk7SMB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ym6O7jMXSrjk7SMB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib23AAKCRB4tDGHoIJi
0sxUAQCrXXXe9qXqlNWTyoVvqN/TVTZrDplkAr4WeF+ipcSHXAD/T7eYEtsd5OXr
44pUA95istVRYx/h9iS3NYFr1c/Kggk=
=xGWi
-----END PGP SIGNATURE-----

--ym6O7jMXSrjk7SMB--

