Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A98CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxljDGFDqYfeiWbiRnNiTvJclOiRcyMasXJvg0GivPY=; b=GxfY1NUr271CfBSRlAbebv9ip0
	VqJXkimr08yJIvGfSZQfo9x5iytXrFskis+TOJZNtZjP3clRwKoba5KqojEvkzecLaiCnyGwMTa/H
	dLIwCuYZqo03oPGtCBSvnOCkseNVjVvAmax7GpNXwLfMp9AVBpQSUYyOmvCY2Cs/C7XtulTmTfhi9
	6E9hgYOFVgzodZ4a6YAW2uTxz/tzNqMRYa1lz7jrKm1kVL7R4ooO+4lwxA6SnWcXn5rICoIkdJ+Ut
	BjLyDNa1xoklr5pJgu1witvLRxnX7JNcWWEfasByC0gzm18xXCKqNUi6fU8BHkg7wGFkx+ocdYbz5
	94KawIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ZkE-0000000ACel-1ycd;
	Sat, 11 Oct 2025 13:34:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ZkC-0000000ACea-42ah;
	Sat, 11 Oct 2025 13:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E9B06038D;
	Sat, 11 Oct 2025 13:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8027CC4CEFE;
	Sat, 11 Oct 2025 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760189683;
	bh=0eibqLwpXBrjUm2YGT1GLTK10uNsplZcqPI1+nozNhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbFI4omkz7RznMb6Vks53VvoAzqdHh5iq1prnThbZ1BNuh1cjrjkdwavfL6LpYQtE
	 2cZN+p24KPX9z2yZ6adKbUC+219MBH4Wrxl+sBwvba2eQZ9+pqP3g//sVZT46Ya2yZ
	 /SW3bxuEHaYhUvX8LoaVPkOg9+iAPaAxlmHA4cklQNlxM3QEnwzKRGzn8+p05oHOD/
	 v7e0/4vLLjTYW51kYuVJ7HswxVoSsfnKkXwv++a1PHrYwOyvztNnb0i6e/kcu99JlF
	 PvouCr3xiej7hfzkItlV5kluNwgICNAGg6IhFgI4GwVYK8+3JlzBHdHE8xhSqXn4OS
	 NhjGgiOGkFCkw==
Date: Sat, 11 Oct 2025 15:34:41 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Take into account out-of-order tx
 completions in airoha_dev_xmit()
Message-ID: <aOpc8d0dPGOnwfJE@lore-desk>
References: <20251010-airoha-tx-busy-queue-v1-1-9e1af5d06104@kernel.org>
 <aOo0woPiMxjABFv2@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nk5Dyb1DUQd53K2s"
Content-Disposition: inline
In-Reply-To: <aOo0woPiMxjABFv2@horms.kernel.org>
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


--nk5Dyb1DUQd53K2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Oct 10, 2025 at 07:21:43PM +0200, Lorenzo Bianconi wrote:
> > Completion napi can free out-of-order tx descriptors if hw QoS is
> > enabled and packets with different priority are queued to same DMA ring.
> > Take into account possible out-of-order reports checking if the tx queue
> > is full using circular buffer head/tail pointer instead of the number of
> > queued packets.
> >=20
> > Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN75=
81 SoC")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 833dd911980b3f698bd7e5f9fd9e2ce131dd5222..5e2ff52dba03a7323141fe9=
860fba52806279bd0 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1873,6 +1873,19 @@ static u32 airoha_get_dsa_tag(struct sk_buff *sk=
b, struct net_device *dev)
> >  #endif
> >  }
> > =20
> > +static bool airoha_dev_is_tx_busy(struct airoha_queue *q, u32 nr_frags)
> > +{
> > +	u16 index =3D (q->head + nr_frags) % q->ndesc;
> > +
> > +	/* completion napi can free out-of-order tx descriptors if hw QoS is
> > +	 * enabled and packets with different priorities are queued to the sa=
me
> > +	 * DMA ring. Take into account possible out-of-order reports checking
> > +	 * if the tx queue is full using circular buffer head/tail pointers
> > +	 * instead of the number of queued packets.
> > +	 */
> > +	return index >=3D q->tail && (q->head < q->tail || q->head > index);
>=20
> Hi Lorenzo,

Hi Simon,

thx for the review.

>=20
> I think there is a corner case here.
> Perhaps they can't occur, but here goes.
>=20
> Let us suppose that head is 1.
> And the ring is completely full, so tail is 2.
>=20
> Now, suppose nr_frags is ndesc - 1.
> In this case the function above will return false. But the ring is full.
>=20
> Ok, ndesc is actually 1024 and nfrags should never be close to that.
> But the problem is general. And a perhaps more realistic example is:
>=20
>   ndesc is 1024
>   head is 1008
>   The ring is full so tail is 1009
>   (Or head is any other value that leaves less than 16 slots free)
>   nr_frags is 16
>=20
> airoha_dev_is_tx_busy() returns false, even though the ring is full.

yes, you are right, this corner case is not properly managed by the proposed
algorithm, thx for pointing this out.

>=20
> Probably this has it's own problems. But if my reasoning above is correct
> (is it?) then the following seems to address it by flattening and extendi=
ng
> the ring. Because what we are about is the relative value of head, index
> and tail. Not the slots they occupy in the ring.
>=20
> N.B: I tetsed the algorirthm with a quick implementation in user-space.
> The following is, however, completely untested.
>=20
> static bool airoha_dev_is_tx_busy(struct airoha_queue *q, u32 nr_frags)
> {
> 	unsigned int tail =3D q->tail < q->head ? q->tail + q->ndesc : q->tail;
> 	unsigned int index =3D q->head + nr_frags;
>=20
> 	return index >=3D tail;
> }

I agree, the algorithm you proposed properly manages the 99% of the cases. =
The
only case where it fails is when the queue is empty (so tail =3D head =3D x,
e.g. x =3D 0). In this case we would have:

	- q->ndesc =3D 1024
	- q->tail =3D q->head =3D 0
	- tail =3D 0
	- index =3D n (e.g. n =3D 1)
	- index >=3D tail =3D=3D> 1 >=3D 0 =3D=3D> busy (but the queue is actually=
 empty).

I guess we should add a minor change in the tail definition:

	u32 tail =3D q->tail <=3D q->head ? q->tail + q->ndesc : q->tail;

so:
	- q->ndesc =3D 1024
	- q->tail =3D q->head =3D 0
	- tail =3D 1024
	- index =3D n (e.g. n =3D 1)
	- index >=3D tail =3D> 1 < 1024 =3D> OK

Can you spot any downside with this approach?
I tested the proposed approach and it seems to be working fine.

Regards,
Lorenzo

>=20
> ...

--nk5Dyb1DUQd53K2s
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaOpc8QAKCRA6cBh0uS2t
rIRpAQDSIsIVZ9Ty0Rkg1NUgdKBIwZ81yEMCdi/+UaKq4bLPLgEAj8DhwXBDnnv0
f4sdK7RnQFXPyXMgAKP1Sck+WfHt7QU=
=csea
-----END PGP SIGNATURE-----

--nk5Dyb1DUQd53K2s--

