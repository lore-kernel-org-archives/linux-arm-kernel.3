Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBCBF327DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pl85IAnrQseJfLFRlOpZTSe7f+dazp7t2YSQ3NNqg/k=; b=sN+UCS+f7P6uT5DUAPHzWduLr2
	tjWvchkOlzZk+lc9By+Rl5PEha6bb6rcar3LJy1CAOSHXV1SFeL6nsrJakpcya4umL77WZjihaDI5
	gmGCe4mwTgtvD271VjOFZNAR2N4z3uMGk5Pkyl7bDCo6rWbj3ikL6A9Ubg3fAwTGZ/qPctYPmIN+j
	pZ6yAMJH954kNw6MKiGCuniLi+S37pKGqym69x/ghyX1doSR4ux9qtks8vWkpPNIa5gmrAZiSALSr
	VX/p97QaxtT+1rOYEsYkyJk6iBuW03hpwSN7fQpXUF0+Dd2U60VkZ20N5IyGkPmDa+uJE1h1GkRES
	XiVmxa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9V7-00000008X1B-0acc;
	Tue, 21 Apr 2026 11:42:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9V5-00000008X0i-02zj;
	Tue, 21 Apr 2026 11:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E20044027C;
	Tue, 21 Apr 2026 11:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41949C2BCB0;
	Tue, 21 Apr 2026 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776771761;
	bh=9UhTW9xT7PdHQrQSt9P+asq3NpsjAt8tMVdcCDFl78I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LeCEUSmkVB7uDQbwNH6WRxnJreyKKHzxK/ZZmuB6Q5UziA7vQCDoWWZ9i+jnMGkdq
	 9F+W3EKsO+r8UBoKx/C+YTOY2fT+5KlChTL2EZz965qH6ardSN8LV0Pjg6VFnnEdzq
	 FyjSWLiztf3GRR2pLP4eL5Bk/+dCYSCuex+lfg9HkBhIfnQAn3Yf5fw4n2NmntGpLf
	 URmBj3TABIIgCgA4nFPh1IzXz+mJr6WmnMgHZb5jnViTsH5Me1PRlDY96hcq6SLAbr
	 q8C5S815mprEyJYWuMMwyL4lkVhiMLg6+B3bfPXOnidS5tLhwXFFx6nM0s14DGSyFQ
	 tqDfew4Ilc86Q==
Date: Tue, 21 Apr 2026 13:42:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v4 2/2] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
Message-ID: <aedir5VqgERpKiQo@lore-desk>
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
 <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-2-e04bcc2c9642@kernel.org>
 <210f5d0b-6232-4c0f-adff-3a97d54159b3@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WAIgI6lpLNOsZ8Vj"
Content-Disposition: inline
In-Reply-To: <210f5d0b-6232-4c0f-adff-3a97d54159b3@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_044243_070423_6BF9B3E0 
X-CRM114-Status: GOOD (  17.57  )
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


--WAIgI6lpLNOsZ8Vj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 21, Paolo Abeni wrote:
> On 4/17/26 8:36 AM, Lorenzo Bianconi wrote:
> > @@ -1055,8 +1058,33 @@ static void airoha_qdma_cleanup_tx_queue(struct =
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
>=20
> Sashiko has some complains on this patch that look legit to me.

Hi Paolo,

I looked at the issue reported by Sashiko for patch 2/2 and I will send
a dedicated patch to address it but I guess this problem is not strictly
related to this patch since we already have the reported issue upstream
even without this patch (please consider dma_unmap_single() in
airoha_qdma_cleanup_tx_queue()).
Moreover, in this patch I want to just add missing bits in
airoha_qdma_cleanup_tx_queue().

>=20
> Also the pre-existing issues mentioned WRT patch 1/2 makes such patch
> IMHO almost ineffective, I think you should address them in the same seri=
es.

The issue reported by Sashiko for patch 1/2 are already addressed in the
following upstream series:
https://patchwork.kernel.org/project/netdevbpf/cover/20260420-airoha_qdma_i=
nit_rx_queue-fix-v2-0-d99347e5c18d@kernel.org/

>=20
> Note that you should have commented on sashiko review on the ML, it
> would have saved a significant amount of time on us.

I guess the main issue here is Sashiko is not currently sending the feedbac=
ks
on the ML, right?

Regards,
Lorenzo

>=20
> /P
>=20

--WAIgI6lpLNOsZ8Vj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaedirwAKCRA6cBh0uS2t
rKm2AQCJX5EFjUoZOgA0dMAtp47WwtsT6OLTasYJncph2WOH2gEAxwIuV7Vj/njE
4ErUezlEWo5xp4HVolf/2sJQ1K6Xzw8=
=DOYM
-----END PGP SIGNATURE-----

--WAIgI6lpLNOsZ8Vj--

