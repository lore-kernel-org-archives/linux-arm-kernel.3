Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213FD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vSFhXgLV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CaT8QXJa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QJqrMCm4IHIw5UKCEBlnLwjUBlVqiEPTc5iWgvNluCw=; b=vSFhXgLVHDcvI2j/anv/TNUMOJ
	A7SvIdDKtNSzMgYiAz7ahEunuJjrFY4xGa04pk21gP45GTatmj07A7dw3GN9pK4oDHGKa0ZL9bMRW
	G+/+QnimI7e4+rCnqjW9ERjpsFPuBJ+ZVAV0ZPVyPb9tK25ejstnRFAX3GwYiHIHyHLmWND9rFk8v
	NKtT60LSrX129dVmPklai7Ioe0N0ASSMUoJ/ays5um2TKnQ3Lzn0iR79lfe2V6rmF3ld1qffp+D7l
	U/xOQqJ3VgKoy+mU/c8s8twgwErAj0JLD/PeQpX8coO2jZ+rW0Vow7SjvvcM5OUwdvdAhYfa5kylz
	HNZ2DTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxHy-0000000Egs7-2o4Y;
	Thu, 22 Oct 2026 18:13:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxHx-0000000Egs1-2jxT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:13:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED9D443F8E;
	Thu, 22 Oct 2026 18:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B571F01825;
	Thu, 22 Oct 2026 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792692796;
	bh=QJqrMCm4IHIw5UKCEBlnLwjUBlVqiEPTc5iWgvNluCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CaT8QXJas15GFkr8qxCUTT5gFSQqnHXVylSuM90EwHPuiOy0+czeo3jj5F6a0xlq2
	 HZMS0rHhRYbNZsdRD54g/04gGplZ/0BG5iL+BJ7qcBM0okM2I+7LF6A/urYcqmWili
	 NVxjLVp+5SwyKbc0X7d4TmAdJoPhQqZiv34tw0fDmWAbvKrmKcKrrJ14eEfH5iQd1d
	 cv4/Pz7GwlMnum9qUIYmiX+uFHI+T95e3kJhtKAgzkA9gCR7QxorKuzS2hFa7lW/Wd
	 R6Vm4wbzH0rrVy7noM+2vABDJwY3cJ+7/vYjc7ux+DZ/e+gEA3wFM6FKk9H8bxspIY
	 JSfEhSXOW2wbw==
Date: Thu, 22 Oct 2026 19:13:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <20261022-speculate-stagnate-6b7d98eb2b0d@spud>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NOfcy5AhWSHOJVoL"
Content-Disposition: inline
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--NOfcy5AhWSHOJVoL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 04:31:25PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>=20
> Toradex boards route the sideband signals of their 24-pin camera
> connectors to different GPIO controllers. Camera overlays which name
> those controllers directly must therefore be duplicated for each host
> board.
>=20
> Describe reset, power-down, detection and power-control as
> connector-local GPIO functions. This lets an accessory overlay remain
> independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> remain described separately because the GPIO nexus does not abstract
> them.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--NOfcy5AhWSHOJVoL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpSNwAKCRB4tDGHoIJi
0ixIAQDnbVkCkuKxskSVSF2V2FdiYpAO+LW5qhoKikflKhcH3QD8DUGoKIoRUdmG
q+MAmuPsmcB5sp+RPAHq2sdqCd+Odg4=
=VPLQ
-----END PGP SIGNATURE-----

--NOfcy5AhWSHOJVoL--

