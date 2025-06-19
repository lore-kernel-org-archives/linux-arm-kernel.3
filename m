Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E70C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1DwgAqZmnxOplufHqA6i8WfeSgxDtSaWAIcQaiVles=; b=R2LCSuNXfimDwWYcnu4RGjPwox
	p6QXW6R2WFXWy4ToKmNX7R1D7zyqCXbZO2cDla3OVAG8N9KP27u2VOkYu5WeDReiQp2UQjORB+Zre
	U8ykmze/Hs6X50NIjvVTUOCIrVea5tySY3TjWYTKhis05hlLOho/nqP0wj3Fg9dE0ipd4jQQ184eN
	LS/v+nFEL9GOYXZTFX/abrsRAis6GFl+oED6CXbANxNDtem76RYPaV9f2YF6SvlBcBdz2EA8Ahx+k
	3dQL/GxOQ6Gi88ytv8mF19gvUHgvPcpaKB21O5iKPuZzI4ZZBkcA3EAvWudCgnwNkfOHF5N2se8Pg
	YKHolX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSA3z-0000000CM5a-12rL;
	Thu, 19 Jun 2025 07:51:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9US-0000000CGvr-2Qad;
	Thu, 19 Jun 2025 07:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09DD061148;
	Thu, 19 Jun 2025 07:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAF0C4CEEA;
	Thu, 19 Jun 2025 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750317315;
	bh=D1DwgAqZmnxOplufHqA6i8WfeSgxDtSaWAIcQaiVles=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ibtu6rhxGmbpSKWTPfUH1/XbY7GRdQ8rxiUGWd+Gb57xX02+lP4VOAJsEJogF29KJ
	 rphv8a2wTnI6ORq/z//tcv2ttd7t4KShzvjIsM2a7IepYvVX0eiZQGwnIv6rTHmTiv
	 1JqreC7OBVInMWSYef7FhhBd9Qr6T6Api9V3rf6S4HYvQNF5VQQJaRxP1/jAaOGYfJ
	 U2YEfC6cgHqPmJ6dmsag1rjh1YcgrEEIXBqtOOailFKctgWkVS10YvkWoohsURT1Of
	 TgvMxoaBt3RarnJIOJtNGqcJyYBJ+7a2j7cPb+QVnvmVanypfsbxTnXWR5s4q6S8XJ
	 m9fbgVAmNczGw==
Date: Thu, 19 Jun 2025 09:15:13 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] net: airoha: Differentiate hwfd buffer size
 for QDMA0 and QDMA1
Message-ID: <aFO5Afg_s7ClEBfd@lore-desk>
References: <20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org>
 <20250618-airoha-hw-num-desc-v3-2-18a6487cd75e@kernel.org>
 <20250618163529.GS1699@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7RPTkHoZWeVpev3"
Content-Disposition: inline
In-Reply-To: <20250618163529.GS1699@horms.kernel.org>
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


--c7RPTkHoZWeVpev3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 18, Simon Horman wrote:
> On Wed, Jun 18, 2025 at 09:48:05AM +0200, Lorenzo Bianconi wrote:
> > In oreder to reduce the required hwfd buffers queue size for QDMA1,
>=20
> nit: order
>=20
> > differentiate hwfd buffer size for QDMA0 and QDMA1 and use 2KB for QDMA0
> > and 1KB for QDMA1.
>=20
> I think this patch description could benefit from explaining the why.

ack, I will fix it in v4.

Regards,
Lorenzo

>=20
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Code changes look good to me.
>=20
> ...

--c7RPTkHoZWeVpev3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaFO5AQAKCRA6cBh0uS2t
rIwBAP0RZ9PNUgbLCSYPqx4FhrZV1dpCiWEV5Lr9YWjupvgdswD9Fmkbo1+DKV4J
ctX+IDWkc3i4+9GPSn2QfWAqtbFJ4gQ=
=N1tC
-----END PGP SIGNATURE-----

--c7RPTkHoZWeVpev3--

