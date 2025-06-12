Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE876C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOKJjcfsSsNThKcLqemyKzz1ZnHRFo+n9OT/7ofuqcI=; b=AXMFVDqQlAjzPIk3+fODsXNrOK
	QBIacAcY4aRprsXvWYVyWIK1iUVGEit845il7EU0SulI4mdIkQTkRL0KRLIyHT5U13TJ8WCqSROda
	nz1sHdcMalPA76UGUITC0yKuPjB9A2CYdflFgxw6jT4E4TC9XIB4+xl7m0srZA9J/DVF0intTRg64
	8NYfBCIhPdzi3Y5ZFA7QGpqWVtu9reTWlqVdGaZVMTgtEfpfqDAu1jionyyrPvAifpI4saH0uCzyT
	/xdSofCWzCm8akSpO2OI1WDWsSqHunWxRK8wsSOw+iWSAovIYXL97W3iWlkp4Cn0hpusU+m7FiE0R
	etCiZDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPp6P-0000000EcHk-2bsM;
	Thu, 12 Jun 2025 21:04:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPp4F-0000000Ec3U-2yGm;
	Thu, 12 Jun 2025 21:02:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1565A62A12;
	Thu, 12 Jun 2025 21:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCFAC4CEED;
	Thu, 12 Jun 2025 21:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762154;
	bh=iM6BZQQJgZKEbKntENWh02GdDa6BeA3Rk/HIeclWu4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UyG4M7IKfyuY1vGOCTJ35Eh/uzrXm5jbPS4/MNGAKwJKUhdHIriMznC/dl3cEQPG0
	 +Q3BSi+TNZzYl96Iug6RnmWrUm0DwrFv0KjbyOQ3zVwnSo+NAe2WVrLFgBb3ThYoF4
	 euNbam8IN/YVcuzn6rG/n2HCCLVc5bFMYYdy9A9oSbHgxheidJDqa5jZyefvTqwjsS
	 oJL9VJsStkDLqvAljjIJu1AyZoi5/764x44DYq+lyAALoRG5A5pXBRLU4/cAmqfNVT
	 Qhk9hhJG/HaTy/NWKCh8wzmMMOWxBV6yy2NL+qXnzWQg2Dqxwr50gxeW0MmkF/DQr5
	 XLAZdqQunH3lQ==
Date: Thu, 12 Jun 2025 23:02:30 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <aEtAZq8Th7nOdakk@lore-rh-laptop>
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
 <CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
 <aEg1lvstEFgiZST1@lore-rh-laptop>
 <20250611173626.54f2cf58@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GWlYu+qUx6A6DKw3"
Content-Disposition: inline
In-Reply-To: <20250611173626.54f2cf58@kernel.org>
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


--GWlYu+qUx6A6DKw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 10 Jun 2025 15:39:34 +0200 Lorenzo Bianconi wrote:
> > > Tell us more... It seems small LRO packets will consume a lot of
> > > space, incurring a small skb->len/skb->truesize ratio, and bad TCP WAN
> > > performance. =20
> >=20
> > I think the main idea is forward to hw LRO queues (queues 24-31 in this
> > case) just specific protocols with mostly big packets but I completely
> > agree we have an issue for small packets. One possible approach would be
> > to define a threshold (e.g. 256B) and allocate a buffer or page from the
> > page allocator for small packets (something similar to what mt7601u dri=
ver
> > is doing[0]).  What do you think?
>=20
> I'm not Eric but FWIW 256B is not going to help much. It's best to keep
> the len / truesize ratio above 50%, so with 32k buffers we're talking
> about copying multiple frames.

Hi Jakub,

what I mean here is reallocate the skb if the true size is small (e.g. below
256B) in order to avoid consuming the high order page from the page_pool. M=
aybe
we can avoid it if reducing the page order to 2 for LRO queues provide
comparable results.

>=20
> > > And order-5 pages are unlikely to be available in the long run anyway=
=2E =20
> >=20
> > I agree. I guess we can reduce the order to ~ 2 (something similar to
> > mtk_eth_soc hw LRO implementation [1]).
>=20
> Would be good to test. SW GRO can "re-GRO" the partially coalesced
> packets, so it's going to be diminishing returns.

ack, I will do.

>=20
> > > LRO support would only make sense if the NIC is able to use multiple
> > > order-0 pages to store the payload. =20
> >=20
> > The hw supports splitting big packets over multiple order-0 pages if we
> > increase the MTU over one page size, but according to my understanding
> > hw LRO requires contiguous memory to work.
>=20
> Hm, you're already passing buffers smaller than normal TSO so
> presumably having a smaller buffers will break the sessions more=20
> often but still work?

I will test it.

>=20
> You mean want to steal some of the code from:
> https://lore.kernel.org/all/20250421222827.283737-1-kuba@kernel.org/

ack, I will take a look.

> and make the buffer size user-configurable. But not a requirement.
> Let's at least get some understanding of the perf benefit of=20
> 32k vs 16k or 8k

ack, I will do.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--GWlYu+qUx6A6DKw3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaEtAYwAKCRA6cBh0uS2t
rMGGAQD8IPe8MoY4V366zinNUIPPKyB070wrYzfX9tsT+tHyoQD/T1CmJhx+pqlk
cSGShFOwx4/ZNLd0ZWvClZvmVC7ptwA=
=Ir7x
-----END PGP SIGNATURE-----

--GWlYu+qUx6A6DKw3--

