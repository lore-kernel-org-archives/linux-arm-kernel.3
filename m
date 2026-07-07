Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C21C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qS/G2jnbuz6aDr3pHhkWT5dB/EtkmjXHCvwPoXLiFZA=; b=DfFJzWEnb107+OLpdgsvZqint5
	FGw1sBq0Sw4v+eqgOu45vtmXjrGE2zUZHvJo1MlmxM2AwXNSYF1AOpdX6zrcd1PEFnZiEa/xzzsYs
	lApH+eBlhnwAww/8dYxvXyrZ4lqTm6j2Rj2nFlJyBpqWSRN7SNS7s71jTHHXpivqMp6jNH8zr5W8W
	AODv8xKYYCX8u0+WL5PVtz1dcGUFWleC4DXDMmUSA3GW28ZPkDl+O8XN4Tmd3uP0B3/l6cqHm6ZoC
	GKm5P5cptBren0+yADbVAfpEqyh+c7QpnNq1+ZFXwGAxMLtApwniy9LDLggH7jb6Ay8WlI6mxdgst
	961igeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8Fs-0000000FPrQ-1ncG;
	Tue, 07 Jul 2026 16:02:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8Fr-0000000FPrC-49yo;
	Tue, 07 Jul 2026 16:02:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 672B143215;
	Tue,  7 Jul 2026 16:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803721F000E9;
	Tue,  7 Jul 2026 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440159;
	bh=qS/G2jnbuz6aDr3pHhkWT5dB/EtkmjXHCvwPoXLiFZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eG3WVHPPhvwUbO4WsW0YMnKc/lqQF/VHbOm5mgnU3GfuIPW6CppfW7CsmpuXWDbie
	 jmdC1TC0XkIDGAQNgV13b1DxYmtvOoBUY412GbEJ/W34Na1mii5JMHXzF91tRtcIc2
	 zoChLBqsCtsAlCLB0YwdBgvKpCjPtsLog/NOP/7E0BuSuUdTC7DLOgDh6v+g04pcif
	 mO0AwmcEC27eypILST4D5b5guaqkwUdb2vzujbrN28Xc352VjDZu4I8zrQfRJQ5+pa
	 4DIsXalQHHPXk/q3TcpoLZBObOB9HNQGTKoPwHk/xmkYw2BDvZiBhHV16j6XhmDuUj
	 IsljfQRFRYnBw==
Date: Tue, 7 Jul 2026 17:02:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4
 board
Message-ID: <20260707-extinct-hedging-ed99e6ad296d@spud>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>
 <20260705-palatable-hardening-48f73a84244c@spud>
 <20260705-matriarch-epic-37add5cb97b8@spud>
 <tencent_3C137FCC795067C558C9C8BD86C03C180006@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lk3aXiOGRUZx46ct"
Content-Disposition: inline
In-Reply-To: <tencent_3C137FCC795067C558C9C8BD86C03C180006@qq.com>
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

--lk3aXiOGRUZx46ct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026 at 05:24:28AM +0800, Pufan Jin wrote:
> On Sun, Jul 05, 2026 at 03:38:00PM +0100, Conor Dooley wrote:
> > On Sun, Jul 05, 2026 at 03:37:00PM +0100, Conor Dooley wrote:
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > pw-bot: not-applicable
> >
> > Actually no, I just noticed you're not using your real name/a known
> > identity. un-acked until you sort that out.
>=20
> Apologies for the confusion. My real name is Jin Pufan.
> In v2 I will change the author identity to:
>=20
>     From: Pufan Jin <2254650260@qq.com>
>     Signed-off-by: Pufan Jin <2254650260@qq.com>
>=20
> (family name Jin, given name Pufan; using given-name-first Latin
> order as is customary on the list.) The Copyright line in the

> DTS will be updated to match.
>=20
> Thanks for the review, and sorry for the noise.

No worries, you can retain my ack with these changes.

Thanks,
Conor.

--lk3aXiOGRUZx46ct
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0jGwAKCRB4tDGHoIJi
0g/LAP4kuu9HfHTz4b2qBWOQcAxJHN0H8xq6/CHpk20mHbQfSAD+Kz5WgR2WyhuA
Gx1j08VZtnRmq5XiFsTHznuzkRH4ewo=
=ZnFp
-----END PGP SIGNATURE-----

--lk3aXiOGRUZx46ct--

