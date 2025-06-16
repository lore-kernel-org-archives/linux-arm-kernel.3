Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE44C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXVcftLBzL0VE22s0E173pGv668LrsMf8ycBcz8A5/U=; b=xRp3XwP3ldotE0abfVBgcsoFRC
	gUmjuB2dDF5hQIeOnI6lO1/98U/0nNnmqLvoEsn95Fu790GtgV92uaZVZXkwyEFHJxvBjWSgl+5v6
	09kXa6t2WH3ohrdEu4eFMJzyDU5PlFUFu1itSCQdd8PjVr8a5GHY8d5fADvPBvFO6hDAG40M7Cqlf
	/i5sN4UfprlaSL80xqUY3GGZ4VMCcHMSRb0U4paSzNN4SFWAOMtm0JnQ63H5QenU+Peqd0gsezUdb
	bwxKt8/810bMNhKb422hhqmbQoDD9WGqdmRWYhaGif2H9Hj2qAVCy4OKKAz8El/YM+RPt8gFacysc
	Qc1kGVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLj-000000055Qr-39Ov;
	Mon, 16 Jun 2025 17:10:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBHr-00000004mAt-3aet
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05B60A4EF13;
	Mon, 16 Jun 2025 14:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F580C4CEEA;
	Mon, 16 Jun 2025 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750085894;
	bh=FXVcftLBzL0VE22s0E173pGv668LrsMf8ycBcz8A5/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhdBe2A8FCIO3U1UH6P1Jg8RbOENgnvRjwXnJKBA6EurzujsdvPYBTcPijXefLHEg
	 MFUmQfBraBxGxJdXZ6QZ9GitvQvCMtHGNtM28xQQyVdDkrQy9GPbFfPimWacpVe97k
	 LQopjACsD+oIVG73E5lXFXxk66Ee213j2dIj+TAl4Hw2rexbie9XYsof0IBdwEVl6d
	 QEDOs4nYWcYXcF8Elqxq9HHm8MZTRQEuWqR914mpKLyVOq857hIDDvgxZN2EA4NjJE
	 aWbWKgsBtqkaiIb1egZ/B4X+XrBsDpXttdpWU/PV9qA9lDd9TPFo9o7EPt+EmyJtOr
	 /Boz3CBB9wYWA==
Date: Mon, 16 Jun 2025 15:58:09 +0100
From: Conor Dooley <conor@kernel.org>
To: yassine.ouaissa@allegrodvt.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: media: allegro: Add al300 decoder IPs
Message-ID: <20250616-unopposed-overgrown-00a1a7a423b1@spud>
References: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
 <20250616-allegro_dvt_al300_dec_driver-v3-2-7d746cb9e5f9@allegrodvt.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a6CGOvP6rpx/UjSC"
Content-Disposition: inline
In-Reply-To: <20250616-allegro_dvt_al300_dec_driver-v3-2-7d746cb9e5f9@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_075815_969203_0EC3C555 
X-CRM114-Status: UNSURE (   9.10  )
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


--a6CGOvP6rpx/UjSC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 01:12:13PM +0000, Yassine Ouaissa via B4 Relay wrot=
e:
> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>=20
> Add a schema for the allegro gen3 video decoder.
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--a6CGOvP6rpx/UjSC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFAxAQAKCRB4tDGHoIJi
0tK2AP9ymTqmYzuxA/6f0/Fe15cY09M/yEBJYFxP8DZ8hyX30QD/b9wjHeVFQuTs
ZGS35plIvS3a1A1W+mvRVpW6R94FKQQ=
=MWub
-----END PGP SIGNATURE-----

--a6CGOvP6rpx/UjSC--

