Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A091099B2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ko2yr8EREI41gY4DKOmiWwlSx8gmD/iM6LkQEBVH6s=; b=BT7Mf5iw6OYFuI6nrUVp7tQ3OK
	5MdNtnUNM+233V1xZabwCB+lgwQ3u4oYMHsVqx5iv5+IcnJLd++BnCNC6a0IObUlhO8pEq1CZuCcs
	57CCRC4lDqOdR4nSUpFSrpdqs5PUlutopYAijLgudNqK0fGXL6w3e4J7+HCHjPbrSUNSahiOUWfmC
	mwGoMC9ioteAqrDsgDUqZsvGUGIV1xghBlkGlXqgYgC8yP/f+mm6XuVxVm39tIneRqRQP+zN57xfd
	qQcMs0xHdt4GH+J5T6K7/C9eiN8tTiTIyDi9a68Qv04MAQV7fy+8vZoxdh8JDaL5w/9CZpzZHZFAC
	3EsmbaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dfm-0000000DG40-2EAs;
	Fri, 20 Mar 2026 17:30:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dfl-0000000DG3W-1qO6;
	Fri, 20 Mar 2026 17:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9630160128;
	Fri, 20 Mar 2026 17:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EACC4CEF7;
	Fri, 20 Mar 2026 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027808;
	bh=2ko2yr8EREI41gY4DKOmiWwlSx8gmD/iM6LkQEBVH6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5Hyus7h1OdUrxx0x+UUtqbrgN8lkDQ8LWN/V+z41wiTXKEsaXd7szrUnj4RYzONF
	 XxCMegAu/K2xz3l/nMnJybtiTDZ0biEz8APXwMTzCqfrnsOzeehBUHkObXJTBybTUD
	 dsKA7G9uRscvqvNbT5smjEAGGaClM1ur80JyMLNTsz4GnM8efceBHXuuMHsCKqNKLa
	 cdc2xdC6fZUoJ99TnwFIzhVvdl2U6BACfVQKJQQBdhQk9BEkJlB55OpmgZmq7AbgMp
	 KLOpEeTbDgfbrKAuUoGyuW6g6ss7P696/kEpt8kWunU9dUMvrs5n/XYpIyToa5MHzB
	 OfpikkvrDSZkg==
Date: Fri, 20 Mar 2026 17:30:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 1/2] regulator: dt-bindings: cros-ec: Add regulator supply
Message-ID: <20260320-shrubbery-nimbly-17e3bacf4ad6@spud>
References: <20260320083135.2455444-1-wenst@chromium.org>
 <20260320083135.2455444-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nkY5dg21V/AsYkAX"
Content-Disposition: inline
In-Reply-To: <20260320083135.2455444-2-wenst@chromium.org>
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


--nkY5dg21V/AsYkAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 04:31:32PM +0800, Chen-Yu Tsai wrote:
> Even a regulator remotely controlled by the EC will have a power supply
> input.
>=20
> Add a property to describe the power supply input.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nkY5dg21V/AsYkAX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2EGwAKCRB4tDGHoIJi
0t/+AQCAYxcTf4VwNykpGFfXOFK8EdQ2eUwyX9fEG0agtHSxwQD+MHHOSLzzbZVU
ea5hroG7LS9S0Zp8Gm8G7Kd95VkBEQE=
=Y7MT
-----END PGP SIGNATURE-----

--nkY5dg21V/AsYkAX--

