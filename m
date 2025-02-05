Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C94C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NghvBE7ABv9eK4/grIgqAbvA6pFodr6ODz6eGUErMIU=; b=gIdLPXzbzOGpmhUHWjsP9YtgoS
	bA3+oxfdDrQjjUrPqWiEJLm7LTgXb8f7ve9qcwos0iUO6/9k4no0wEZU7AVcuU1Hf5Tg+aUnpRtN/
	nUvaV9je4fc1ptq5Qoc/a7haqZxsQu0P+1Cdr5oxVIQcMbjBqCMv5LJbFy77icoe8WqczkD82g1j5
	ZDk8a1kHOmTIQYPlAJBNSx5TK+PTVX9mpXz8P2yI8BdgmM16RkzU++BASWb/CQK8W3bckQ8Udqc1N
	P3y8kKpJun+0pCr1RdnCgTCHY8FcuFeQvUuCZgsHmjhR8mAdH/oZ3dlhM95FKqGgnneK6i9ggLBL5
	MxVIKNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfl1P-00000004Ovm-3nyx;
	Wed, 05 Feb 2025 19:25:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkpj-00000004MtY-2TRQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D81DA439C3;
	Wed,  5 Feb 2025 19:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C381C4CEE4;
	Wed,  5 Feb 2025 19:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738782790;
	bh=NghvBE7ABv9eK4/grIgqAbvA6pFodr6ODz6eGUErMIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWLFnhfpPK00FuS4Ef2ti+604RVGnQK2zoBDXvA9KVaXeszn2pEbzut6+GNGWMBLg
	 CiHCBpU6tcCb6aPEmZKjj+D5bEZR2LfB664ib9s7FK6EVhCOi+uzJnxDu0VcdBCZpp
	 /eFpTVUqYIIk/cLpLxi47weOO7/OHp4AKvNoDb3V5kJZtQ397tlOLD7PW4aQNYADSt
	 2CM2ySrVCilvzG7DoYJCc87401R4LlS9IsI56eC90s3dRzVezOUIjsr/Ap2zwZZexN
	 4LY3aBcMbFurEFAL1YRKHp26aOn2svcr0WUq/W+E6q0tRD+FD2FLuZi6iLQomEMwAf
	 fp+7MSRbngK+Q==
Date: Wed, 5 Feb 2025 19:13:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: pwm: marvell,pxa-pwm: Update to use
 #pwm-cells = <3>
Message-ID: <20250205-strut-atrocious-d7f9d3c42859@spud>
References: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
 <266765abb8251bd60796a3c4270e3809bfff952e.1738777221.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F9n+89XPUb+wErgK"
Content-Disposition: inline
In-Reply-To: <266765abb8251bd60796a3c4270e3809bfff952e.1738777221.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111311_693671_0135E3B3 
X-CRM114-Status: GOOD (  12.30  )
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


--F9n+89XPUb+wErgK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 06:54:01PM +0100, Uwe Kleine-K=F6nig wrote:
> The PXA PWM binding is the only one that doesn't pass the PWM line index
> as first parameter of the parameter cells. However this can be upgraded
> to the mandatory binding for all new PWM drivers without breaking
> compatibility for old device trees using #pwm-cells =3D <1>.
>=20
> So bump #pwm-cells to 3 with the (undocumented) promise to keep the old
> behaviour for #pwm-cells =3D <1>.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--F9n+89XPUb+wErgK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6O4QQAKCRB4tDGHoIJi
0msXAPwPsyQP1wjYdX5r8HKv6l4cxZt2BU7EGr18uD79cBCzxgEA+J0fhNFuqaU4
SUmQ6nOgErbv3Ag9MBuUlmq/njrGZA4=
=cJ6U
-----END PGP SIGNATURE-----

--F9n+89XPUb+wErgK--

