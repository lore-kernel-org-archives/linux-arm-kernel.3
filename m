Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F856CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj8TnVP8wPWGT2UvO9eiDZL3aqksBHrM83YzLn2wHRI=; b=Zcdlw7u2lvQf3Uia+CSNk18/JU
	/Gt9Si814DkJ9GeBkq1yZcWNuD5gi19JtO1ZK/fn5cejsEgyBd0js3izb8Qj2IwDsbkikNiVQpb6X
	del8LgiaiGpDy5nWfHsYXg4FIfRcJb/t6DReRlhqUluLHptIDPCh7uoZ4RtD8llOm+nTN7Nu8ZtfB
	FBQM2bS+onnr6i1QPKnqHCU5ogPwsBX6PKLQWNxPWcnCTdh0LzKmUT+XtTzjhR0DjD5oqxawmcFU+
	eTSgiPfm1VT8n4m0af0k3EZ4H9MPq+GXyq9mXoufv/5RnOdDc1j1fSr99819fz+xG4qe6yuwB7Iz8
	RU5pmwgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtjK-0000000EUvD-3hZc;
	Mon, 20 Oct 2025 17:31:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtjH-0000000EUuR-377u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:31:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D68EB419C8;
	Mon, 20 Oct 2025 17:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDDFC4CEF9;
	Mon, 20 Oct 2025 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981490;
	bh=Rj8TnVP8wPWGT2UvO9eiDZL3aqksBHrM83YzLn2wHRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVf/5gWInfOxWLr9UCSHl+uXjgtqZ+92BuMAJPEsB+6mbaoMKbY5mks735Na5ATlB
	 yZMr3d96jcLPL9mbv9/p5XtJTtpHaRDaow9e0Tl+uKnZljkNc0QoBvBztpcJPaJ4nt
	 fWaRGHiruJAl3HCL18abEJHPCgSdeJclmLzacOHSqDo6JW2LmQ4HfIADjEBJmvUg2o
	 wXR1e5GfNtWKdIIQTsjY5l185wyD4rJPThNJM2RRHYYv0ut+SC/7JGRhILjbKxYirJ
	 qrKNxzMHBjDmmg512MlFcrlRXZVrV3EIBGDha8dKCAeIP0+v5P9uJoIgdnVhMLaL6Z
	 z+5BGuKDHz3hA==
Date: Mon, 20 Oct 2025 18:31:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <Frank.Binns@imgtec.com>,
	Alessio Belle <Alessio.Belle@imgtec.com>,
	Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless
 power domains items
Message-ID: <20251020-freebee-asleep-702062240cbd@spud>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pg9U5fLbI3MpnTw5"
Content-Disposition: inline
In-Reply-To: <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_103131_798497_D3780A2A 
X-CRM114-Status: GOOD (  12.60  )
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


--Pg9U5fLbI3MpnTw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 03:15:14PM +0000, Matt Coster wrote:
> Hi Marek,
>=20
> On 18/10/2025 14:00, Marek Vasut wrote:
> > The power-domains items: list is not very informative, replace it
> > with plain minItems/maxItems instead.
> >=20
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> I would R-b this, but I want to wait for feedback from a dt maintainer
> to make sure this is an approach they're happy with. In the meantime:

I mean, yeah - they literally provide zero value over the names.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Pg9U5fLbI3MpnTw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZx7AAKCRB4tDGHoIJi
0skAAQDWz7xM6sOMHi+9ICDux0to/OJRLITPWezXMx6MAzC0wgD9EGjMakpX6pVN
XvM7QU3Rz7z4I2zFS+awmJOC0RKSOAE=
=btcv
-----END PGP SIGNATURE-----

--Pg9U5fLbI3MpnTw5--

