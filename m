Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED56F43858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ULHc/LOwewxp81/QQxfODHRb3cHHuL82pprhl3jFPg=; b=R797kCBRAlp8FveDONIzCvecqd
	fop0ZvNL06pmw5zEReGnmqgFGjgeopqyXCXUqentXXWYtT2bYnJpn/xScMOdQImkDT7vgaEWkeNU9
	0Y3CJ0W5Uhj6DcAdr5DRRcSD/kHOR6jmQ7/I0iuxcvG+5clswGLg5Ecu+Aqy6K1as7arQxjgjlkdu
	HDgSxbWs1/pOVg/lmOnKk/LGslNFYpORsY94XOhVZNJ8lxV07BW1zgoz90wBVFYh0Xnxzgv2Zay/M
	tNdMuc7qbYjBo8jvKlLXX0pTz+VJdyhqjSdSyOv/R22Wmn4t3505Y3tOceB+Sb633+F/FKot74JXZ
	mgmASIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3ZL-00000001Qc5-26Dt;
	Wed, 15 Apr 2026 16:58:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3ZK-00000001Qbw-1nJM;
	Wed, 15 Apr 2026 16:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 841A5600AD;
	Wed, 15 Apr 2026 16:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0563C19424;
	Wed, 15 Apr 2026 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776272305;
	bh=nN9jt/f9MAKzPkpWtbk/RLKLebk1/ZQ/W3GDIw3V3xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUuzGbdx4Xmi5fm1DcgkedJ0LuZIsUQlDJgY8mqpGuezOantYHh4qPtFzezyCNHPj
	 Rv0VWBREEU6H1aZSRpn2V2ECc0fyaFUf9qcH6MHaQJV2E5oRHbGT4WHnpvWPk0HV6M
	 ASSDsL8VdiIVUdqDnbPgdoUoNvSBwZUG54TOSgIg8eWLpsgDkR6xw3znGkz8C7GSu7
	 e1Pxf2OGOiXGEO2r1sTLuuGYukGOeNAyY66glA7WLmZ1fLmSqCWcDKHf6ez1tJLP09
	 2r/8lEUlIUj5E+cYlfnWSj88/WKbI9FJAdrCP6Fwf7Wx2/WSwyvhDrBqCvEy8Sizi8
	 6QA8jxPDmOXOQ==
Date: Wed, 15 Apr 2026 18:58:22 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
Message-ID: <ad_DrrC6duye_lR0@lore-desk>
References: <20260414-airoha_qdma_cleanup_tx_queue-fix-net-v2-1-875de57cc022@kernel.org>
 <20260415164643.GQ772670@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xQbSQq7qBSSZg18s"
Content-Disposition: inline
In-Reply-To: <20260415164643.GQ772670@horms.kernel.org>
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


--xQbSQq7qBSSZg18s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 15, Simon Horman wrote:
> On Tue, Apr 14, 2026 at 08:50:52AM +0200, Lorenzo Bianconi wrote:
> > Similar to airoha_qdma_cleanup_rx_queue(), reset DMA TX descriptors in
> > airoha_qdma_cleanup_tx_queue routine. Moreover, reset TX_DMA_IDX to
> > TX_CPU_IDX to notify the NIC the QDMA TX ring is empty.
> >=20
> > Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN75=
81 SoC")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> > Changes in v2:
> > - Move q->ndesc initialization at end of airoha_qdma_init_tx routine in
> >   order to avoid any possible NULL pointer dereference in
> >   airoha_qdma_cleanup_tx_queue()
>=20
> This seems to be a separate issue.
> If so, I think it should be split out into a separate patch.
>=20
> > - Check if q->tx_list is empty in airoha_qdma_cleanup_tx_queue()
> > - Link to v1: https://lore.kernel.org/r/20260410-airoha_qdma_cleanup_tx=
_queue-fix-net-v1-1-b7171c8f1e78@kernel.org
>=20
> I think it was covered in the review Jakub forwarded for v1.  But FTR,
> Sashiko has some feedback on this patch in the form of an existing bug
> (that should almost certainly be handled separately from this patch).

Hi Simon,

I took a look to the Sashiko's report [0] but this issue is not introduced =
by
this patch and, even if it would be a better approach, I guess the hw is
capable of managing out-of-order TX descriptors. So I guess this patch is f=
ine
in this way, agree?

[0] https://sashiko.dev/#/patchset/20260414-airoha_qdma_cleanup_tx_queue-fi=
x-net-v2-1-875de57cc022%40kernel.org

>=20
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 41 ++++++++++++++++++++++++=
++------
> >  1 file changed, 34 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 9e995094c32a..3c1a2bc68c42 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -966,27 +966,27 @@ static int airoha_qdma_init_tx_queue(struct airoh=
a_queue *q,
> >  	dma_addr_t dma_addr;
> > =20
> >  	spin_lock_init(&q->lock);
> > -	q->ndesc =3D size;
> >  	q->qdma =3D qdma;
> >  	q->free_thr =3D 1 + MAX_SKB_FRAGS;
> >  	INIT_LIST_HEAD(&q->tx_list);
> > =20
> > -	q->entry =3D devm_kzalloc(eth->dev, q->ndesc * sizeof(*q->entry),
> > +	q->entry =3D devm_kzalloc(eth->dev, size * sizeof(*q->entry),
> >  				GFP_KERNEL);
> >  	if (!q->entry)
> >  		return -ENOMEM;
> > =20
> > -	q->desc =3D dmam_alloc_coherent(eth->dev, q->ndesc * sizeof(*q->desc),
> > +	q->desc =3D dmam_alloc_coherent(eth->dev, size * sizeof(*q->desc),
> >  				      &dma_addr, GFP_KERNEL);
> >  	if (!q->desc)
> >  		return -ENOMEM;
> > =20
> > -	for (i =3D 0; i < q->ndesc; i++) {
> > +	for (i =3D 0; i < size; i++) {
> >  		u32 val =3D FIELD_PREP(QDMA_DESC_DONE_MASK, 1);
> > =20
> >  		list_add_tail(&q->entry[i].list, &q->tx_list);
> >  		WRITE_ONCE(q->desc[i].ctrl, cpu_to_le32(val));
> >  	}
> > +	q->ndesc =3D size;
> > =20
> >  	/* xmit ring drop default setting */
> >  	airoha_qdma_set(qdma, REG_TX_RING_BLOCKING(qid),
> > @@ -1051,13 +1051,17 @@ static int airoha_qdma_init_tx(struct airoha_qd=
ma *qdma)
> > =20
> >  static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
> >  {
> > -	struct airoha_eth *eth =3D q->qdma->eth;
> > -	int i;
> > +	struct airoha_qdma *qdma =3D q->qdma;
> > +	struct airoha_eth *eth =3D qdma->eth;
> > +	int i, qid =3D q - &qdma->q_tx[0];
> > +	struct airoha_queue_entry *e;
> > +	u16 index =3D 0;
> > =20
> >  	spin_lock_bh(&q->lock);
> >  	for (i =3D 0; i < q->ndesc; i++) {
> > -		struct airoha_queue_entry *e =3D &q->entry[i];
>=20
> super nit: In v2 e is always used within a block (here and in the hunk be=
low).
>            So I would lean towards declaring e in the blocks where it is
> 	   used.
>=20
> 	   No need to repost just for this!

I can fix it if I need to repost.

Regards,
Lorenzo

>=20
> > +		struct airoha_qdma_desc *desc =3D &q->desc[i];
> > =20
> > +		e =3D &q->entry[i];
> >  		if (!e->dma_addr)
> >  			continue;
> > =20
> > @@ -1067,8 +1071,31 @@ static void airoha_qdma_cleanup_tx_queue(struct =
airoha_queue *q)
> >  		e->dma_addr =3D 0;
> >  		e->skb =3D NULL;
> >  		list_add_tail(&e->list, &q->tx_list);
> > +
> > +		/* Reset DMA descriptor */
> > +		WRITE_ONCE(desc->ctrl, 0);
> > +		WRITE_ONCE(desc->addr, 0);
> > +		WRITE_ONCE(desc->data, 0);
> > +		WRITE_ONCE(desc->msg0, 0);
> > +		WRITE_ONCE(desc->msg1, 0);
> > +		WRITE_ONCE(desc->msg2, 0);
> > +
> >  		q->queued--;
> >  	}
> > +
> > +	if (!list_empty(&q->tx_list)) {
> > +		e =3D list_first_entry(&q->tx_list, struct airoha_queue_entry,
> > +				     list);
> > +		index =3D e - q->entry;
> > +	}
> > +	/* Set TX_DMA_IDX to TX_CPU_IDX to notify the hw the QDMA TX ring is
> > +	 * empty.
> > +	 */
> > +	airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid), TX_RING_CPU_IDX_MASK,
> > +			FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
> > +	airoha_qdma_rmw(qdma, REG_TX_DMA_IDX(qid), TX_RING_DMA_IDX_MASK,
> > +			FIELD_PREP(TX_RING_DMA_IDX_MASK, index));
> > +
> >  	spin_unlock_bh(&q->lock);
> >  }
> > =20
> >=20
> > ---
> > base-commit: 2cd7e6971fc2787408ceef17906ea152791448cf
> > change-id: 20260410-airoha_qdma_cleanup_tx_queue-fix-net-93375f5ee80f
> >=20
> > Best regards,
> > --=20
> > Lorenzo Bianconi <lorenzo@kernel.org>
> >=20

--xQbSQq7qBSSZg18s
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCad/DrgAKCRA6cBh0uS2t
rOFlAP4lp7hgAJ+lChgaBcM9KOHMTwJOo3gXhFRt80fPYSganQD/RXCUFDR3h4lW
XdUHa1RYpKN7PR9qzwaCoKsHGBk4fgw=
=bCGY
-----END PGP SIGNATURE-----

--xQbSQq7qBSSZg18s--

