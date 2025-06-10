Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF300C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6RS+C7zhMB25iOBQZc/9f89PNf4OlYGhPMsZzpqjfM=; b=g69xgpHCABmneqNujHHol5BFy2
	OC8Z9LyKVnl9UWyZJN6DO0qJxgztfNaD/Rv6j8s1hWeK5RGwg2vpHh3gRQ3/n8qPZpQy4T6DPwCtC
	/H02Xio6gcrOzUZGcWyQ23BMHs3wnblEeNEYq3lKTsutl8pEABcZomsFKcnBkMviCYFHbvY3yEzF8
	KKpv6Qop2mrNHuFVlun9p3tTd3n5u2kHft5JwXQojsGlzdLxjH/M0U/t205RRew6eHqTz4LZJFtWD
	dyFV+eH3eo+k1FLHjS45X91Xh1Dk/4ULP5gOr1qMLJ3EB05HtDCxHphKpTS1+lb/1e4TdiFL6gGjQ
	1Z2dbhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP44F-00000007qpL-3Ki2;
	Tue, 10 Jun 2025 18:51:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0yD-00000007KKw-2AEB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92899629F9;
	Tue, 10 Jun 2025 15:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F51DC4CEED;
	Tue, 10 Jun 2025 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569578;
	bh=q6RS+C7zhMB25iOBQZc/9f89PNf4OlYGhPMsZzpqjfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0Hco7bmWY8LdPkZ4LFbstckfrj0sRITV0hyXuN5O7BQY4TLrMq+JMw2Kuj2oBXgp
	 iPlfxpnVgHKKz6fqdO7lOBBMjkLR8XIB5nyrT2mscI2c7iQpMwS8qVByuB5RgR0Qpn
	 fq3qY4T//LWNkv11StE8oq2CZWrtXVbvD9s+XCTkmhzZQiIoi7FophCSbF2nwsNbaD
	 rGpIfk2DlQ4+HS31zvpqB1JuvY09EdQl4qnp+tp6tZvyHbsh5PF4HF5C0cg0IpDasc
	 vjhngrsOw6vIsVBGc2yEbScLHPVHlI6bZhEXhapJsFHgBVqWCuuV9NIhqRiG1Sdxwi
	 6eLaP2uDlKV8A==
Date: Tue, 10 Jun 2025 16:32:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple
 A7-A11, T2 compatibles
Message-ID: <20250610-connector-agility-f2d75a8ab825@spud>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
 <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x4dHHzQr44MfMq5x"
Content-Disposition: inline
In-Reply-To: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
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


--x4dHHzQr44MfMq5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 09:45:20PM +0800, Nick Chan wrote:
> The I2C controllers found on Apple A7-A11, T2 SoCs are compatible with
> the existing driver so add their per-SoC compatibles.
>=20
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--x4dHHzQr44MfMq5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhQJQAKCRB4tDGHoIJi
0iShAP0aNRWibVunJQxPKvAgQLEjADb3xVu5IbW7ACnrlSyizwD/SBjcrfNCx6LI
j/CfImGYmkxvjKvzuDmkDe88dmljGQU=
=fLjK
-----END PGP SIGNATURE-----

--x4dHHzQr44MfMq5x--

