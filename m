Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAC3CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccO/t/BtCHXvn4ZRBxoKZibXBq2KpTEqZXudSnpgJmE=; b=wenHkyf5jIUalgDkUA1ynIuXaG
	2+4U/HVsGCwjQWSn5F8xexoOvk8cok39QqLZ46oNgAPzxsdMLAwjXaUm3sr0xwxSjyByiaB4SztN6
	/SGywOMlKKoQmEWUbkbkNC8siKtjmJnjfZRhQoT0Hv9sk5A5VUdkb6KTrlLMGiNkL86bdojyhlJ2v
	M7/d7LmAKfB83uurjWI14EVvH3ZqfcHpeuNP0rsCpi0OpRwpK8OP2E3r2qOXp7HCoU34VH3i28mTL
	hAjJVfZT6xTtB5ZBje5WrnTjBghQBgaAY836oc45i2nj40y5WLDfAWPaPBIfXLpwYtJX/S6H8kIcL
	4CWuS+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd6L-00000003unQ-3Huo;
	Wed, 22 Oct 2025 17:58:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd6L-00000003un9-0qcO;
	Wed, 22 Oct 2025 17:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EAFE629A4;
	Wed, 22 Oct 2025 17:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F244C4CEE7;
	Wed, 22 Oct 2025 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155900;
	bh=ccO/t/BtCHXvn4ZRBxoKZibXBq2KpTEqZXudSnpgJmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qo7Q1I4FLhMu2+TeUtzSwzNw5nuaWtQU8vmBaH557lkvL193SZuZBA41zf8fivwgP
	 HtiGRgm1lRm77MTbmA/m9TgBTBwr0n+IP5XewxwuleX5L9rMasn2K6x9aw8OBQj0BL
	 b90d/KGeQ7iCAPniFm/FMSdDfypWNlmV6YvJYRLuveyMhMVXeeKAp8aCBl4vcaACjS
	 eD5tjJaMmPlTT9BOj2HIpNABtgi+COzAaivx7mGerScffl91NOlZ1PMPhgYzlQr3oi
	 XHRq/ksQHXW7/hG0NL/0/qJGxe2L0G/CnwO0ngC7eGtIU7mFD6B0HCyRcwCwEWR/Ut
	 VZfg6mljRc86g==
Date: Wed, 22 Oct 2025 18:58:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-rk3x: Add compatible string for
 RK3506
Message-ID: <20251022-cathedral-radiantly-eeb2b291e149@spud>
References: <20251021222853.193224-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GPMty0wyvpr3P0oy"
Content-Disposition: inline
In-Reply-To: <20251021222853.193224-1-heiko@sntech.de>
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


--GPMty0wyvpr3P0oy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:28:53AM +0200, Heiko Stuebner wrote:
> The i2c controller in the RK3506 is compatible to the variant first found
> in the RK3399 SoC, so add the RK3506 to that variant list.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--GPMty0wyvpr3P0oy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkbOAAKCRB4tDGHoIJi
0uRjAQCnlRdeNOobAiqzp5bycfsrdIiBO/pmTWkV+MPDBieUoQD7BBBSwxDDgdqt
BBIHWUU3mXYojkFeBziXRveyq9LJcAw=
=LC/v
-----END PGP SIGNATURE-----

--GPMty0wyvpr3P0oy--

