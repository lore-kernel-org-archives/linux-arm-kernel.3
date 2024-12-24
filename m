Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C04E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EC2aOyKAHM/NGAvJumdbaihXbX/U643UmpylBh9+8+8=; b=p7fDksOfB56IBIWH5tyXssQXiH
	0i9K9PEMGNxTg+7DaMuo2+0ohqnhXG/biokh5fEYDsL4ywjx9wuWu49RUscnU7RwwI0cqnp2AsB9t
	mOSVT6z51dYCT9OMObXBnFXHHrYHRKdReorxZigFevHi/Ds+kKJePUHk3HjkzQHcKoj5FGgBoKeHk
	AN4l0wBRuMlJJSw2i90pQmjW6gNo+jXfjBvjtNGCSptzcg/JRgG3NWEsM1KqwCtrxJGW7Vi/sJjup
	qvG4EtIvjtgeUErNP34IAvd36L6qx6m6IfPdPGrnTZV7IPFR16uvKPfT2MFMX5dLb/3C5kO/xU57F
	1nmCcgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQBSP-0000000CkpJ-0zE3;
	Tue, 24 Dec 2024 20:24:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQBRD-0000000Ckhq-1Cg9;
	Tue, 24 Dec 2024 20:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 718A85C5952;
	Tue, 24 Dec 2024 20:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04B2C4CED0;
	Tue, 24 Dec 2024 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735071809;
	bh=EC2aOyKAHM/NGAvJumdbaihXbX/U643UmpylBh9+8+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzEUXpNFWPsyDZeZT1chG9IH76S8CVzGfAxVvKCap7L3wA9viL9qVEl0LgoF+HdG2
	 mJrXB6U67m/glazwOrOeVgWbl73DronV/I1ej/7Tj703WIMxwJGu8BvtiaRDS2UrbY
	 YQfiY2mSs01D+/0xpTDvlg6/0M4FFAD2ey//9+k28l/WFuLpcLqohxmwiiiiH7XpvD
	 c1VIKTIEuZTr9VwAIw5UcYCRlEczFUWdF66xkP4NihhPXxrlTHmsW8KDldNOVmbj6R
	 8RyI/z3xdOCn/cOOVLGA7j2BfjLuYk3XS5U+CD+C1cWzZNGFPph5v7g7IpCJY6VLfH
	 DpCP+D2YTNLCA==
Date: Tue, 24 Dec 2024 20:23:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: Drop MT8192 Chromebook
 variants that never shipped
Message-ID: <20241224-darkness-lecturer-e61cc4cc65e1@spud>
References: <20241223101434.2170166-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kM8DONBKrAlpha1E"
Content-Disposition: inline
In-Reply-To: <20241223101434.2170166-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_122331_376935_8D4902CF 
X-CRM114-Status: UNSURE (   9.70  )
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


--kM8DONBKrAlpha1E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 06:14:31PM +0800, Chen-Yu Tsai wrote:
> The Hayato rev5 sku2 and Spherion rev4 variants were designed in
> anticipation of shortages of the headphone codec. This never happened.
> As far as our records show: the variants were never produced or
> shipped, and no such devices were deployed to any lab.
>=20
> Drop them.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kM8DONBKrAlpha1E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2sYPQAKCRB4tDGHoIJi
0h7wAQDuZqhHgxKCjeoyKOA8jPzvU0D+UZF+MTUn612O+Tq5SwD/ebZTuMVlsTwc
gHHtgJeNdCYB/wr/ICsI4IphJ0olgwo=
=FITb
-----END PGP SIGNATURE-----

--kM8DONBKrAlpha1E--

