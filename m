Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA327F531F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 06:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bBNMufzYVqr5UxXwJVKvzP0MCL1gV7PFUCF2Nv07i8=; b=w4uIfkDTkZdg29pKkiYd54Svr1
	GPbXWLCTpPoAslMWLPANRiWOjfKH2rUA7EC8D0A6vsIyS9zR63r3Ef4uY/mHWIpp5J3tRVZPySB51
	iBDhwof7wYWRgeJbTjYg9oTkXYZ9V2EojHO/O0axjjga4/oD9JkFPSKIruHxnyCLojIHNqSEkAgjk
	ODbd+L406bo4ssX2ZyO9bpQSzj346nUIhCtJ8xANGly7L7ocB1A2E5mjrSqsPmpFHNJgI1dehvUHF
	KhacCDKoZmvJHp1IyJ8rxnM8e0U+hEgyUv6UzWDUXN+9wZj3XQBdDW7EoCQbdlImRH54ap+ifMb0s
	d8M8w8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXbo-0000000GrhJ-0Mo3;
	Tue, 14 Apr 2026 06:50:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXbm-0000000Grh3-37Wu;
	Tue, 14 Apr 2026 06:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BCE5C60018;
	Tue, 14 Apr 2026 06:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24650C2BCB3;
	Tue, 14 Apr 2026 06:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776149449;
	bh=J7urA2Y9K/1/xQ3Pfm3NoRFKtOG7BaAW7PeZ+LWeRww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IqQWRIgcFqS9gj2NS9UOweLrccR9X2jgkZLSsKnCmEcOJLaqLGn9CGumfKg566s2n
	 OjxP/eTIUItS8CU91+kQqk3UEd8Pdg4yyltgwMScyBmbjBrhbnVn0sv050l5dscXNL
	 sGkuTazS5AVl1h0B1JOyNqOPt4HPNP699JuCfV/CGA6bClHzl3+exbejRR18DohI6C
	 meJqnUWqZj0fOkXx6ns05iqqL4xmmHSga/foSEQRtJedmXIbdwKeni4HbHeGk0B2Id
	 C9mZ4++TZQEN2YaYezwUm2oXczqTEVraedNwjERslf2cEO+HG5AxJv14Lwql323k+p
	 ItIRi7V6Bt/6Q==
Date: Tue, 14 Apr 2026 08:50:47 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
Message-ID: <ad3jxzIN8UqTnsa2@lore-desk>
References: <20260410-airoha_qdma_cleanup_tx_queue-fix-net-v1-1-b7171c8f1e78@kernel.org>
 <20260413225709.3648413-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W0h9puXbvySZQQQC"
Content-Disposition: inline
In-Reply-To: <20260413225709.3648413-1-kuba@kernel.org>
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


--W0h9puXbvySZQQQC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: airoha: Add missing bits in airoha_qdma_cleanup_tx_queue()
>=20
> This commit resets DMA TX descriptors in airoha_qdma_cleanup_tx_queue
> and synchronizes TX_DMA_IDX to TX_CPU_IDX to notify the hardware that
> the ring is empty.
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 9285a68f435fe..963ab7b8d166b 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1044,13 +1044,17 @@ static int airoha_qdma_init_tx(struct airoha_qd=
ma *qdma)
> [ ... ]
> >  	spin_lock_bh(&q->lock);
> >  	for (i =3D 0; i < q->ndesc; i++) {
> > -		struct airoha_queue_entry *e =3D &q->entry[i];
> > +		struct airoha_qdma_desc *desc =3D &q->desc[i];
> > =20
> > +		e =3D &q->entry[i];
>=20
> Can this result in a NULL pointer dereference?
>=20
> If airoha_qdma_init_tx_queue() sets q->ndesc before allocating q->entry a=
nd
> q->desc, and devm_kzalloc() fails, the error path jumps to
> airoha_hw_cleanup().
>=20
> Because q->ndesc > 0, this cleanup loop would execute and dereference
> q->entry[i] and q->desc[i], which may not have been allocated.

ack, I will fix it in v2.

>=20
> [ ... ]
> > +		/* Reset DMA descriptor */
> > +		WRITE_ONCE(desc->ctrl, 0);
> > +		WRITE_ONCE(desc->addr, 0);
> > +		WRITE_ONCE(desc->data, 0);
> > +		WRITE_ONCE(desc->msg0, 0);
> > +		WRITE_ONCE(desc->msg1, 0);
> > +		WRITE_ONCE(desc->msg2, 0);
>=20
> Is it safe to modify these DMA descriptors and reset the ring indices bel=
ow
> without waiting for the hardware DMA engine to become idle?
>=20
> In airoha_dev_stop(), the driver clears GLOBAL_CFG_TX_DMA_EN_MASK to requ=
est
> the hardware DMA engine to stop, but it does not appear to poll
> GLOBAL_CFG_TX_DMA_BUSY_MASK to ensure it has actually stopped.
>=20
> Modifying the DMA descriptors and internal ring indices while the hardware
> is still actively processing in-flight descriptors could potentially lead
> to corrupted DMA fetches or IOMMU faults.

This is already fixed here:
https://lore.kernel.org/netdev/20260411-airoha-fix-ndo_stop-v1-1-caddaa1817=
39@kernel.org/

>=20
> >  		q->queued--;
> >  	}
> > +
> > +	e =3D list_first_entry(&q->tx_list, struct airoha_queue_entry,
> > +			     list);
> > +	index =3D e - q->entry;
> > +	/* Set TX_DMA_IDX to TX_CPU_IDX to notify the hw the QDMA TX ring is
> > +	 * empty.
> > +	 */
> > +	airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid), TX_RING_CPU_IDX_MASK,
> > +			FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
> > +	airoha_qdma_rmw(qdma, REG_TX_DMA_IDX(qid), TX_RING_DMA_IDX_MASK,
> > +			FIELD_PREP(TX_RING_DMA_IDX_MASK, index));
>=20
> Could list_first_entry() be called on an empty list here?
>=20
> If q->tx_list is empty (for example, if allocation failed in
> airoha_qdma_init_tx_queue or if no entries had a valid dma_addr), calling
> list_first_entry() returns an invalid pointer.
>=20
> The subsequent pointer arithmetic would produce a garbage index value,
> which is then written to the REG_TX_CPU_IDX and REG_TX_DMA_IDX registers.

ack, I will fix it in v2.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--W0h9puXbvySZQQQC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCad3jxwAKCRA6cBh0uS2t
rFjtAQDyhrwFh+QugKLUMHuIU38dxPrvgRB5D8rTrcU3XsBnLwD+OGPN6+RIDOmR
LGc8ZXJFrgJs1j1ZTN/W9OLa44BQFww=
=b+XE
-----END PGP SIGNATURE-----

--W0h9puXbvySZQQQC--

