Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D480FFF8877
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2oBWOs7qNeQtQs9uajzTb/RFlJL08+41eY7WV4/q3E=; b=y5qvdJ6G8pb8/ZqnadPffDdOAX
	L2eX/kmOPsCk4qWLsqPuEWNWyTm3sj0RWAth5rX1hZ2OtOZ/QDAQSJl/9xvsjDd/ilDvYCM2lYd5y
	j/ME5dmjoC32Hr/rEsv622NzRYCI2xLxDOfUIXxVKB7mM2dBohlCk8s9dcWtByCLdQ0WU0e//GO0A
	d686Eb/eVg02eIuJ+lkHb83uHRY6H9/9OoVF9ybkwgmcxyegiY4z5+7lqB40stmmX/3Knule2VVsR
	cZbHJvX4q3EUYVfK//lor7mW49S9jMra1wbChpo6QAilEOXIC9KNg/z9C83qznj4LpvM8kmpg/DXo
	NMr1bvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjPl-00000001eeJ-2TzT;
	Tue, 28 Apr 2026 14:27:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjPk-00000001eeA-163r;
	Tue, 28 Apr 2026 14:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F0BB60008;
	Tue, 28 Apr 2026 14:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952C8C2BCAF;
	Tue, 28 Apr 2026 14:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777386470;
	bh=qR6Y7sdK6qSuJkg49zUGOwPy3lhyzMqz+waaO0XxmjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njqDm8qPiV1Sh5NASc3Ec4k9OZRbZkbS2KnG8XY16zmgjZSrECOHanUuqoiSmZ8YH
	 5jro2WLsL4BJ3xcbZDlkuRJjfNdoTRtbqn35ZV14xgt0NY+E2ycji9zChkEfr1WWOM
	 Ittoh1oFA0YwlhbGlxhYG2YeBE19Bb6WsPwd4SpqCPBgpyVcdYxMkv5kaom6ewIE00
	 7TMHy7b6KiOp/5IIMWh+zIONW7kDD3el/ola0XlWW3XkapuYbe2jvlfxnCHDzqyqEU
	 RLdpPRUzdDuVv3dury1x5D0eSGL5OrHwsA/Aw8jQKzrDaUHrKJqWLn2sXLiFn3FNzf
	 FeDh36qmGtD9A==
Date: Tue, 28 Apr 2026 16:27:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Move entries to queue head in case of
 DMA mapping failure in airoha_dev_xmit()
Message-ID: <afDD5EJtYUx6sgRb@lore-desk>
References: <20260428-airoha-xmit-unmap-error-path-v1-1-aec44c6765c1@kernel.org>
 <679ebe0a-5889-4a84-afd6-3da50a07bced@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usYxARcXN3Cq7GA5"
Content-Disposition: inline
In-Reply-To: <679ebe0a-5889-4a84-afd6-3da50a07bced@redhat.com>
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


--usYxARcXN3Cq7GA5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 4/28/26 10:44 AM, Lorenzo Bianconi wrote:
> > In order to respect the original descriptor order and avoid any
> > potential IOMMU fault or memory corruption, move pending queue entries
> > to the head of hw queue tx_list if the DMA mapping of current inflight
> > packet fails in airoha_dev_xmit routine.
> >=20
> > Fixes: 3f47e67dff1f7 ("net: airoha: Add the capability to consume out-o=
f-order DMA tx descriptors")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 5effb4a4ae84..82018a085e46 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -2123,14 +2123,14 @@ static netdev_tx_t airoha_dev_xmit(struct sk_bu=
ff *skb,
> >  	return NETDEV_TX_OK;
> > =20
> >  error_unmap:
> > -	while (!list_empty(&tx_list)) {
> > +	list_for_each_entry(e, &tx_list, list) {
> >  		e =3D list_first_entry(&tx_list, struct airoha_queue_entry,
> >  				     list);
>=20
> Coccinelle says:
>=20
> +/srv/nipa-builds-contest/testing/wt-cocci/drivers/net/ethernet/airoha/ai=
roha_eth.c:2123:1-20:
> iterator with update on line 2124
>=20
> I guess you should additionally drop the statement above.

ack, sorry. I will fix it in v2.

Regards,
Lorenzo

>=20
> /P
>=20

--usYxARcXN3Cq7GA5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCafDD5AAKCRA6cBh0uS2t
rEryAP93+3om9/MyBd5xMoBvLsJPmTDWfbzGmYwYQDzdPQw5VQEAorMCm2iUQpMc
97tysFlJONWC+zZF/0tdEL4Ufh+aJQ8=
=RFuK
-----END PGP SIGNATURE-----

--usYxARcXN3Cq7GA5--

