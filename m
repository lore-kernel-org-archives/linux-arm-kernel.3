Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83A5CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 11:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYc7Ac7XyGZOrltM8nT86fjG2nfQcBxaOu3f1ay9NMg=; b=NpzrGY/XcN7IwEdbFNMZgJwOpq
	tfXOqPZOsuvvB288X8r1ylYD3D2I39kQQPOFU1joFZXcbdQnLtP8yR5rY8wlhEcxUJ1pEhE+MI3CA
	amdpOd0T9Z7oGyrO2BnD3HPbHiDZUTrZnY6kxS7KfP+Nl34gsRn37dkt9f95aGfjC4m9cLkVJOGcq
	N416UUnDNAe39C+2T+8KyjkT0m4xFBRmUYIvmxJTUGXOLWTr6IkRmf/Qu/oOTeKZ/ry5eJBVqbNZK
	mgcmnNZ8wYsVjah/rAWCICB/+tNtsN8vjj3+m28oAwP8jmjKTMJADYXzMfX+pdZmE+D8eEui+PVKZ
	H3GFoFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5lP-0000000E7Jv-4Bal;
	Mon, 15 Jun 2026 11:46:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5lN-0000000E7JR-3Yho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 11:45:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 752486008A;
	Mon, 15 Jun 2026 11:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93A41F000E9;
	Mon, 15 Jun 2026 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781523956;
	bh=yYc7Ac7XyGZOrltM8nT86fjG2nfQcBxaOu3f1ay9NMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WdmLYTh64eVTybjTk3GEJHTtM7d4RyEgs/jevXYI7yIBtVR3csgpMBUogINM0TWyB
	 0MioJzKLo/8SoB8zL3lA41sAlXMFDeOy4nzgkFx7f8hPKStDr92ADsVGyS3p5G9ZUw
	 tCgaSHsyps1x+264hz44VABUfysEyXEtBvNJIAqJMCrBrevF14fOlCVPSqZNQ/md81
	 wW0uP5hBZEOjZHg7lysq16qYIfF/hodnviimN49WLOJddXld3iNBwf62uW1QSLmQ+8
	 q30TyNj1vjOzATtKWpW5iCQsnruzlqeLwyhImnjEAYiEkmGsJDII+9VAOPG4CU5xYs
	 GXI+glb/kAWqQ==
Date: Mon, 15 Jun 2026 12:45:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [RESEND PATCH v1] spi: uniphier: Fix completion initialization
 order before devm_request_irq()
Message-ID: <dffb3303-6371-4415-ac0e-488c421e2555@sirena.org.uk>
References: <20260615023415.190655-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E9udDncSR5MQRtcC"
Content-Disposition: inline
In-Reply-To: <20260615023415.190655-1-hayashi.kunihiko@socionext.com>
X-Cookie: To stay youthful, stay useful.
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


--E9udDncSR5MQRtcC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 11:34:15AM +0900, Kunihiko Hayashi wrote:
> The driver calls devm_request_irq() before initializing the completion
> used by the interrupt handler. Because the interrupt may occur immediately
> after devm_request_irq(), the handler may execute before init_completion(=
).
>=20
> This may result in calling complete() on an uninitialized completion,
> causing undefined behavior. This has been observed with KASAN.
>=20
> Fix this by initializing the completion before registering the IRQ.

I thought you were going to rebase this, why resend the same version?

--E9udDncSR5MQRtcC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmov5e8ACgkQJNaLcl1U
h9DnhQf/TqVWYIYObZkRlWHMCFZI/SOnruaxzdWNmtOVZzTD7hKF9YHekhf7UiOL
ZXQeSEV2jGTQLrYvirhQ4j2CowakasUTO7negD+eLEAIVPfJsK+ePBC+yHSQRolO
2luHKCSFSdZokVg0wZnka5QmVFC8ORsGxIJqTrjx332v+pe9UhZvkxwSfzfMsTgR
Wq3Gtpazv9WmhnDT0WLAaMEgMFWYdqW1CkGK/PDdkGUVUEC99rtP1X8xKPpv2l9W
Fj2v4Yz+yUhWe+MVqv61asoQumqckKGZm90BUZgCDamGYObdxZp26eDUHSjrfMzF
ZN6G1r8GaAHxPeTtC0V/vaqDuqe99g==
=PWvI
-----END PGP SIGNATURE-----

--E9udDncSR5MQRtcC--

