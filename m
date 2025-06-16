Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17558C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 14:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=np1h4zJ5vXfQTar5Dx3KmNyhdbcnNiAHewzhEqh18oU=; b=cXwpex5ddtDBz59NRDqbJH8/ho
	UmOtV4a6j2i2gqUYro1gptaZnGgqPmPDISQWkkpibWHbT8JAfoB8wuNQprQz9CydDa18jwDbIKqa7
	C/bNxQySPGFRKcw1satf+/jhhRPodUg2m1duomVe0YEL+SQgaR3nIgqNQD1QPf/e0HTqME8Q5XoYc
	rAJZSJ18GYC/EQ2jp1W/yHmMhYup+Jw3T2aHZ4hgjPFMFryhlMLJUHfgc7m0uB9QRcgyNRHc96YUZ
	1LkLS9EO0JVOYSSk4oREO7DeJ4BIExtg/ojMP+i83ADvisNwXgK70cD5Fr/MxTq4YbFVVRPdcFg+E
	y0K5Dn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAYN-00000004f58-2tl7;
	Mon, 16 Jun 2025 14:11:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9JT-00000004R5g-1ekG;
	Mon, 16 Jun 2025 12:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BF725C5E76;
	Mon, 16 Jun 2025 12:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52777C4CEEA;
	Mon, 16 Jun 2025 12:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750078306;
	bh=np1h4zJ5vXfQTar5Dx3KmNyhdbcnNiAHewzhEqh18oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjAUlyTtBOGRAMwHP5h3X24rmszmA6db1aspcZNSHbYZ6qZEqmJjdwJPjYsssyLxS
	 Bch3rD0SseU04z/ZD9PcI1s26szSeFoKpA4sHN/s+Ph0djr1nSIaC2OlzDx6ifwEla
	 Xku1wY3S+3z9hL6h4lUvVCvT/CdqNgMPxp1JwmUPPKQ5AYRygcIFtNcDt6YCFLG1+U
	 39/LvzPFDQH8o9stOpc6qdFXumTW+iQB51r9zW0Dx1SD8TyYIz1pntGeN9/+3h5snO
	 IYz2OzNZEUMmUr4QHPwgiaFlJ0g3OOyrUjUpD4dIfRrd1AfHrUvIOT2IvynENs3Q0N
	 gSzh+4t+4hXDA==
Date: Mon, 16 Jun 2025 14:51:44 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <aFATYATliil63D5R@lore-desk>
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
 <CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
 <aEg1lvstEFgiZST1@lore-rh-laptop>
 <20250611173626.54f2cf58@kernel.org>
 <aEtAZq8Th7nOdakk@lore-rh-laptop>
 <20250612155721.4bb76ab1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W+ocVnvdJxRF6oLW"
Content-Disposition: inline
In-Reply-To: <20250612155721.4bb76ab1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_055147_474975_AEFF190A 
X-CRM114-Status: GOOD (  18.62  )
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


--W+ocVnvdJxRF6oLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 12 Jun 2025 23:02:30 +0200 Lorenzo Bianconi wrote:
> > > I'm not Eric but FWIW 256B is not going to help much. It's best to ke=
ep
> > > the len / truesize ratio above 50%, so with 32k buffers we're talking
> > > about copying multiple frames. =20
> >=20
> > what I mean here is reallocate the skb if the true size is small (e.g. =
below
> > 256B) in order to avoid consuming the high order page from the page_poo=
l. Maybe
> > we can avoid it if reducing the page order to 2 for LRO queues provide
> > comparable results.
>=20
> Hm, truesize is the buffer size, right? If the driver allocated n bytes
> of memory for packets it sent up the stack, the truesizes of the skbs
> it generated must add up to approximately n bytes.

With 'truesize' I am referring to the real data size contained in the x-ord=
er
page returned by the hw. If this size is small, I was thinking to just allo=
cate
a skb for it, copy the data from the x-order page into it and re-insert the
x-order page into the page_pool running page_pool_put_full_page().
Let me do some tests with order-2 page to see if the GRO can compensate the
reduced page size.

Regards,
Lorenzo

>=20
> So if the HW places one aggregation session per buffer, and the buffer
> is 32kB -- to avoid mem use ratio < 25% you'd need to copy all sessions
> smaller than 8kB?
>=20
> If I'm not making sense - just ignore, I haven't looked at the rest of
> the driver :)
>=20

--W+ocVnvdJxRF6oLW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaFATYAAKCRA6cBh0uS2t
rBWaAQDOyU+4+eHsLnA3e8ZOON1SFtM4mDYagCpnTCvcmbG07QEAkgJ0dm5XXjOS
2MFXXDc12/UzCLmREkx436FYDzH0Mwk=
=oAr6
-----END PGP SIGNATURE-----

--W+ocVnvdJxRF6oLW--

