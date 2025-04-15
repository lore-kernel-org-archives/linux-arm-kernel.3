Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E057BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWScL87oSbaROaqP0r2Mnx0JFl+WWSfAwu3JhjgVITA=; b=d0ZMHJwjuq7PgVAahwNIxxd+K6
	ywy4hZwIPrkbiw5DXPw20+bNs6fXWOhaYkCziTrb8kAfGgrD3WxvodQlP0DArZc1XC0MVuwx000BM
	UFJQafQeu70fJ5ln8TrMbXHo4Q7uHs2+EfeTj6ZcFiz1ENOZKryt0CkNmnTfcgoJPWcTwFAyAQE5Q
	ywbUov07Sa8ZCOfKOPVBW6qNZekGLhAveIfWJ88lhaA9oHbryfG63NpVOmofft6lPOR3dZ4re7GOD
	4TusQc7l+Xqg6TTEF4o9E/+/9XWA3WN2NhS7IIeA36Bwi2DhRSksbh1vM0tJ0rkD3e/3Bz5qFBT3G
	qZWajxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jHQ-00000006QxF-05Kn;
	Tue, 15 Apr 2025 16:37:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4irk-00000006MqW-3bXH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2775F6115F;
	Tue, 15 Apr 2025 16:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D85C4CEEB;
	Tue, 15 Apr 2025 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744733427;
	bh=DWScL87oSbaROaqP0r2Mnx0JFl+WWSfAwu3JhjgVITA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dDUO2OfM54X8t0zCgKesLTSab/rlpOm5RNER8WzgLP9wT3bmd7lizZoZjt8q7DJEe
	 r4nQKELgqWHziQ3JNKZYRE40PRLn3QfoOu/J47BzAeE24q5p0iSfIqgs6lVCanFUAY
	 nM87l4GZ7BSsTX2mTjrgtx6sTIpA8epdI+xTbTwgMCeRxNq+8qftDFe5tXRb5wb7ee
	 B2Uz484E9EkKSgFaC/wHHAvim77A86BPrJAr5wnzAhHlLkK3q8RQrv2i7Bzgr97+ox
	 6QSvqkPoUiAOexmcWlO5lwjgjooXM1h7aeMXhHqtAiyKR8nWuV5ZYnyBNNUl1eGTPC
	 3j4CCyoi95b/g==
Date: Tue, 15 Apr 2025 17:10:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: add MBa91xxCA Mainboard for
 TQMa93xxCA/LA SOM
Message-ID: <20250415-vacancy-magnesium-9a56984c4bdc@spud>
References: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HWWKzsLMAyfTe0PA"
Content-Disposition: inline
In-Reply-To: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
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


--HWWKzsLMAyfTe0PA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 02:59:44PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>=20
> Add MBa91xxCA starterkit base board for TQMa93xxCA/LA SOM for
> parallel display evaluation.
>=20
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--HWWKzsLMAyfTe0PA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/6E7gAKCRB4tDGHoIJi
0i83AQC96FoHk045P5XAidRz9D8+rNym2nWrxLT/TR+37l91gwD9E+cqusUmLC0k
SnMu8z0jL3L+no+u1iPagJkqfW17Fgo=
=7xr2
-----END PGP SIGNATURE-----

--HWWKzsLMAyfTe0PA--

