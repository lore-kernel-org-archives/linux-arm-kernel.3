Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4D8C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+qg1+SkJ5kUMIfZgliJNgwmCYY4xioDyWF9SZ86Sdo=; b=nF1HfYs0EJ0E8dDNSK792R58bE
	Aw8eB3yWOxWNXXgNqfmFT9YXXXg0eblrsQZw7gkY2zoSDi8hbf7do9D3Av9XSSPiAcIkKeiIp/Cb2
	X0Df5at+Y77EhDP0McQwi9iQ+mryEOo1MNtQtANKpSgPV5m5Jy6P85yAwJz0G0dkGPQuJNGSuVnJx
	0r5m7Dql35mC5DAAAd/ytD4re8faRQ0HiF7UgEq9QLtuM6kJQI42IKnXB+0ZJ5EEGJS5SgdOe+Xuc
	1q7w7NU2tPmCZVIqIt0m/eWGoVtvjP2wsikUjYULcSt/MwJiY3uKuo+GkxmDG9QMX0UGfkTuAyN9F
	0M5fYP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1j5-00000007RxE-3vaY;
	Tue, 10 Jun 2025 16:21:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzCW-000000070Wj-42vM;
	Tue, 10 Jun 2025 13:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8F0A5C0429;
	Tue, 10 Jun 2025 13:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98201C4CEED;
	Tue, 10 Jun 2025 13:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749562779;
	bh=5avbO0Ao+zxHI6T3ghbReJ8vJ24StY6YPNICgLkqxcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMwjgDNqWfSZV7W/JGiCqq0dEE/Ye+1kfAkZ4XV203t6F946jc0EF3npK/Q0wEoBc
	 HL3ts1Xs+3/PBc9SYwPFCnM2z+MUvlnvqBO1CV6oc8asYfAFiUzYoTylPqc7H7yohn
	 OzIYm+Tg5rTndx68BhsYHcdrKJ4seqHsBT6KkrgKQK6qpM8Lhv+lVrFkAL3iJu/r10
	 yqq+/QgT1qixROOTMkGFuHsEN6XhDY3/mIBul+to91IbppkSLTQLOBNFgRGGwEedBA
	 6RyXf6IeA24zeCsEByscH8ScHnys5UR72nWZesf6nZSo2pGx7we8ieg/YloSN2QFu4
	 BqHGpXGyuC9jw==
Date: Tue, 10 Jun 2025 15:39:34 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <aEg1lvstEFgiZST1@lore-rh-laptop>
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
 <CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I0VjOkFHRgh8EgMY"
Content-Disposition: inline
In-Reply-To: <CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_063941_041954_6CB6EEEC 
X-CRM114-Status: GOOD (  17.17  )
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


--I0VjOkFHRgh8EgMY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 10, Eric Dumazet wrote:
> On Tue, Jun 10, 2025 at 2:12=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:
> >
[...]
> > @@ -767,7 +887,7 @@ static int airoha_qdma_init_rx_queue(struct airoha_=
queue *q,
> >         int qid =3D q - &qdma->q_rx[0], thr;
> >         dma_addr_t dma_addr;
> >
> > -       q->buf_size =3D PAGE_SIZE / 2;
> > +       q->buf_size =3D pp_params.max_len / (2 * (1 + lro_queue));
>=20
> Tell us more... It seems small LRO packets will consume a lot of
> space, incurring a small skb->len/skb->truesize ratio, and bad TCP WAN
> performance.

I think the main idea is forward to hw LRO queues (queues 24-31 in this
case) just specific protocols with mostly big packets but I completely
agree we have an issue for small packets. One possible approach would be
to define a threshold (e.g. 256B) and allocate a buffer or page from the
page allocator for small packets (something similar to what mt7601u driver
is doing[0]).  What do you think?

>=20
> And order-5 pages are unlikely to be available in the long run anyway.

I agree. I guess we can reduce the order to ~ 2 (something similar to
mtk_eth_soc hw LRO implementation [1]).

>=20
> LRO support would only make sense if the NIC is able to use multiple
> order-0 pages to store the payload.

The hw supports splitting big packets over multiple order-0 pages if we
increase the MTU over one page size, but according to my understanding
hw LRO requires contiguous memory to work.

Regards,
Lorenzo

[0] https://github.com/torvalds/linux/blob/master/drivers/net/wireless/medi=
atek/mt7601u/dma.c#L146
[1] https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/medi=
atek/mtk_eth_soc.c#L2258

--I0VjOkFHRgh8EgMY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaEg1kwAKCRA6cBh0uS2t
rAYMAQD0nBIhigRn4PPAvOPLw/L0LoFZ4JC7kFUvDHjLuDo7PAD+IXfceq+l1hbh
YjnyMxgeMGT9Hs0OOZbSoMd5kNU/Lwg=
=z/fk
-----END PGP SIGNATURE-----

--I0VjOkFHRgh8EgMY--

