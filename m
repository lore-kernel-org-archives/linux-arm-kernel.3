Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB6ECA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98GrAJno92DtCQZEPAy9W7Uzdr9pTw990Q22kkCJlRY=; b=LmaPEpZqhrD21VPi1jTKzq8I/6
	uQgFoqVeAtPeNmcsZfWm9YXx1ThuOGswoIYhNhXe7jpDt4gd3qCbDQLEyFsycL8KURvDcnN4YlJgI
	kGQOqLfrdMVjaHw3/4r/JE9FmF8wg2RamGdAOyWH1qL9wc5KXkr4V+8h3RtAXDi+6dwIuy5s+KQZ+
	bMbPQ/iPX9D/ZKgG2pwI5La6RKmE2sNrWGKiq88Dre6akQ+aHhBYFLzz9c15XPD6R44hdIY4CJo2H
	ZPJp5PVDMN5aAiI2eKZDqo/LH2rTqAjWyvKGymaatIwzeYVRkmLr5eqnfq6I5edCfz8PJiQkDPn9O
	oAgT37Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQIF-0000000HNMP-0cA6;
	Tue, 02 Sep 2025 12:39:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utOsd-0000000GqAE-1ZSW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAB0E601D3;
	Tue,  2 Sep 2025 11:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A47C4CEED;
	Tue,  2 Sep 2025 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756811330;
	bh=98GrAJno92DtCQZEPAy9W7Uzdr9pTw990Q22kkCJlRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifW05R+LdY8B6zwqefFGGNa0leX7MA7g+cKDdAinoLxOYupDZyZ5sfVUSeKWcL9pu
	 gukM8j7ssOnOgcLwnq9iJnzi3WAYlRr5dMNN0QaS5+Z3tudL2qVFQoquzc0+aq/dmO
	 /BseaJiu3B4HxSSFcdbU/nOg4d5OvcI9B+zqb6P0pHjvHG5XR85yil2QtjXMOpj5wP
	 HY3t4yPsbH3ZFct7V/3M5agxgx7pHpU4JK5y9Hi9jwbS0TvyPqavtwVJBT5pCnrR+k
	 FqZZdHkeHtF0mNPB0U0m4Ng3us4+AGg1bAbjIDM5bNMUs319Oag0n1co/6JCzjIt0U
	 DPjz+vFpwuQqA==
Date: Tue, 2 Sep 2025 12:08:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: Re: [PATCH 0/5] Add QSPI support for sam9x7 and sama7d65 SoCs
Message-ID: <33770201-9c62-44ea-be9c-6d84e783a5a7@sirena.org.uk>
References: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WoEm1YhYkZYnPu1J"
Content-Disposition: inline
In-Reply-To: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
X-Cookie: Vote anarchist.
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


--WoEm1YhYkZYnPu1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 02, 2025 at 11:22:17AM +0530, Dharma Balasubiramani wrote:
> This patch series adds support for SAM9X7 and sama7d65 QSPI controller
> along with the SoC-specific capabilities.

The driver bits of this all look OK to me.

--WoEm1YhYkZYnPu1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi20DwACgkQJNaLcl1U
h9D5Qgf/f5J1ANHIWLWnMtWR1RwnzOz1QDrcwcMjPKsHh84tpstX1jmhmDnCv2/R
QuXbIgk8AUZ3ykObhqQgbpb4CHoYEBN3ah0L3li/UFZykiWaMAs9GWpTrSuEsbiA
zuINXKaiDfkcZQqElk963QLLpf+MPV51YycUFbLqtQysqDzvkcTGieXb6QkXLTnM
riguC9rm303m3kWZ0RMREjAyVtclyy50hjF0TQHtxjrhiFftMvLPyQoSVvshRdyS
7pxIhaPFRreFvdpTbKfoo4q6LwIWjizDHzWK0i2TZPMcJBrKk0zkChR5QX0wGMvd
UA+StqccRScoVssTI0w9wVa2Fhw5Nw==
=kwiz
-----END PGP SIGNATURE-----

--WoEm1YhYkZYnPu1J--

