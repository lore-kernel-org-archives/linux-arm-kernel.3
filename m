Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865EECCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c0prikoys8gQYM33hHVWH3BuymSsNMlFOjdBsYGdsw=; b=Q6bZDUa4ai9SQNFTeCk9y66xkP
	raBHVQXjhJ/Tx1nCIj62r+JXK5v1JO/yahUJEzsUMKBl+qUOEZjaFNInXMwvgjZqHTeC50BGUisZC
	eyCXILBTQ+u+YpVrbCrEQLBsVJrrTI41zhP8CCkYS0GJXG8UZqqsvrejCqRkbjXfEeoV0yRX+1Sv1
	K+NUCjoMm08CnDO0OGLI6KYetMq2td/HlFZi/u4TjrAeJWayr5s/78bDeZTCJhkT4wUE5vq+ZNaGa
	qr2CjyVypTGR0Z7nTcMsJ10JdA69mhwcLZRlEkBF3E6RptnhJuzFRhlt7IwcuwOMx04XK/w5dBZMi
	5rpdyBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkiG-00000005g0y-2sUq;
	Fri, 31 Oct 2025 08:42:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkiB-00000005g08-2G7b;
	Fri, 31 Oct 2025 08:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 930746038E;
	Fri, 31 Oct 2025 08:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E006DC4CEE7;
	Fri, 31 Oct 2025 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761900138;
	bh=iebUdKZzmfa2jg23LRJHVuu3kza1F82z99YH30rDyb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGbQVSCmaZgm3pK/emkYuL6wOZwS2Ej0PMgWnCExnZ0K9MYE54merAH4WuUUE0ZQt
	 SwIDl8uvXsAERGNcizhrF5fJfAS7YKUYgvRiq1V0FPLxVDr4UnkN6M0YPYV8IUV84N
	 8gghXnFh2Id96xfTYBDy6BoxN7QuQrxv39X3nsOkxHdDMgusRbtBTR4G3joG3Ebf9p
	 3fD6y4dB8bUgqPvU97RgNbSxZ8yW2drZLvfR9HWC2dsw38ZpFgIObIXgWBMBMt6Pfi
	 oMptgDFxJxVxBnZ2J0JV17QiE/dpiSL3/2Fnc3XvNEWD7szMNXBRoOQvPpSVjtNK22
	 JSfPHcUehH18A==
Date: Fri, 31 Oct 2025 09:42:15 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <aQR2Z51Q45Zl99m_@lore-desk>
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
 <CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
 <aEg1lvstEFgiZST1@lore-rh-laptop>
 <20250611173626.54f2cf58@kernel.org>
 <aEtAZq8Th7nOdakk@lore-rh-laptop>
 <20250612155721.4bb76ab1@kernel.org>
 <aFATYATliil63D5R@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="preRBihCmKgtL7Vn"
Content-Disposition: inline
In-Reply-To: <aFATYATliil63D5R@lore-desk>
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


--preRBihCmKgtL7Vn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > On Thu, 12 Jun 2025 23:02:30 +0200 Lorenzo Bianconi wrote:
> > > > I'm not Eric but FWIW 256B is not going to help much. It's best to =
keep
> > > > the len / truesize ratio above 50%, so with 32k buffers we're talki=
ng
> > > > about copying multiple frames. =20
> > >=20
> > > what I mean here is reallocate the skb if the true size is small (e.g=
=2E below
> > > 256B) in order to avoid consuming the high order page from the page_p=
ool. Maybe
> > > we can avoid it if reducing the page order to 2 for LRO queues provide
> > > comparable results.
> >=20
> > Hm, truesize is the buffer size, right? If the driver allocated n bytes
> > of memory for packets it sent up the stack, the truesizes of the skbs
> > it generated must add up to approximately n bytes.
>=20
> With 'truesize' I am referring to the real data size contained in the x-o=
rder
> page returned by the hw. If this size is small, I was thinking to just al=
locate
> a skb for it, copy the data from the x-order page into it and re-insert t=
he
> x-order page into the page_pool running page_pool_put_full_page().
> Let me do some tests with order-2 page to see if the GRO can compensate t=
he
> reduced page size.

Sorry for the late reply about this item.
I carried out some comparison tests between GRO-only and GRO+LRO with order=
-2
pages [0]. The system is using a 2.5Gbps link. The device is receiving a si=
ngle TCP
stream. MTU is set to 1500B.

- GRO only:			~1.6Gbps
- GRO+LRO (order-2 pages):	~2.1Gbps

In both cases we can't reach the line-rate. Do you think the difference can=
 justify
the hw LRO support? Thanks in advance.

Regards,
Lorenzo

[0] the hw LRO requires contiguous memory pages to work. I reduced the size=
 to
order-2 from order-5 (original implementation).

>=20
> Regards,
> Lorenzo
>=20
> >=20
> > So if the HW places one aggregation session per buffer, and the buffer
> > is 32kB -- to avoid mem use ratio < 25% you'd need to copy all sessions
> > smaller than 8kB?
> >=20
> > If I'm not making sense - just ignore, I haven't looked at the rest of
> > the driver :)
> >=20



--preRBihCmKgtL7Vn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQR2ZwAKCRA6cBh0uS2t
rNydAQChGxrsUEw7j8qWnmWp3WjRruhrQe2yexdNUpd+gRWnVAD+JiRBjf4A5lOw
QGVPdyJFfYlLM98zy6KQEHHtDr90cQw=
=DjeM
-----END PGP SIGNATURE-----

--preRBihCmKgtL7Vn--

