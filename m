Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356BECD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJ0eBPoOv/JpwRjPZ38KgLzK58Xw2bMW0W/NSctuIjg=; b=3AvwxrtKL6ozi0YynmeCmpHtVF
	eMUkcXjtuSUvvCLZslX69yZH8R/9tCbK2pSHVuk6SaR4hhN0DU4rpVdyYrEShNMRr3opCN2BnOneE
	WY91J1I8WKpkRcjRmwPdCxC96kbberbjnL5nxQ3NY7zPQ5/HT7X9EytWSEWmMfBiyvYLa3Sfv5IDa
	5RFTHxXKjpLJYg2CespcRn3Mgct1q/eX5cQSwiunDOYuCwDXQ8vG973QWUF3azudmvhIXpi4Lghq4
	+s8JhK3p/RPNVMXP2tpVTCp/0ghoOstlOnhzjd3D8Ca8ryxWL503JaQOZfP6XZ3cW1XefaGNzkp+c
	oEm8uiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfj7-0000000ERHx-0Uzd;
	Wed, 03 Jun 2026 07:09:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfj4-0000000ERHW-3xWv;
	Wed, 03 Jun 2026 07:09:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3170F4192D;
	Wed,  3 Jun 2026 07:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA591F00893;
	Wed,  3 Jun 2026 07:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470558;
	bh=tJ0eBPoOv/JpwRjPZ38KgLzK58Xw2bMW0W/NSctuIjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hOsWvKuy+Pbscbm5sqjTueOn2Sn2balOIPVRPQpnUdQMgo6bHIGvnk/cchDYYHdao
	 E7zBrv8PZDLP+kCGfL0Pq8iGphuCFasANddvCOdZj1dww6Y3PNPzE33VhAieqHBMQE
	 fK3nWPy5Ue67WXtig0zQV6P/OMhMzqY9ElRC4VnKfqgCxHTMr56CGZOBi9PDehhW1M
	 tXNM6iczVV4xY7fxD9GfvMWmnh1SDXTxkxaU4dPIoAuuHSC183so4961vd2qiNXPwS
	 lg+4Da1NBF7wVe/5Ri6jgRCPQlPg3Laf5xBQiR7vZy77gE6BI3CqqzcQabGFbMzNDQ
	 pQgk0Jceoxm9Q==
Date: Wed, 3 Jun 2026 09:09:15 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dylan Eskew <dylan.eskew@candelatech.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7996: Fix possible token leak in
 mt7996_tx_prepare_skb()
Message-ID: <ah_TG4bkzitM4AER@lore-desk>
References: <20260531-mt7996_tx_prepare_skb-token-leack-v1-1-2b9c9f59ceb1@kernel.org>
 <80ff2108-dce3-4060-a8d0-59740979a99a@candelatech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdJq5GVxual618Pk"
Content-Disposition: inline
In-Reply-To: <80ff2108-dce3-4060-a8d0-59740979a99a@candelatech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_000919_026790_168581FB 
X-CRM114-Status: GOOD (  22.51  )
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


--bdJq5GVxual618Pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lore,

Hi Dylan,

>=20
> We have been seeing the token memory leak in our custom kernel. After
> pulling your patch in, we are still getting the leak (validated with
> kmemleak). How did you figure out where this potential leak was? I want to
> determine if we are leaking because of our changes or if there's more are=
as
> for token leakage.

Can you please try to run kmemleak on Felix's tree to check if there are any
leftover leaks not fixed yet?

Regards,
Lorenzo

>=20
> -- Dylan
>=20
> On 5/31/26 2:10 AM, Lorenzo Bianconi wrote:
> > If link_conf or link_sta lookup fails in mt7996_tx_prepare_skb routine,
> > mt7996 driver leaks an already allocated tx token. Fix the issue
> > releasing the token in case of error.
> >=20
> > Fixes: 7ef0c7ad735b0 ("wifi: mt76: mt7996: Implement MLD address transl=
ation for EAPOL")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 8 ++++++--
> >   drivers/net/wireless/mediatek/mt76/tx.c         | 2 +-
> >   2 files changed, 7 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/=
net/wireless/mediatek/mt76/mt7996/mac.c
> > index c98446057282..8c56344d211b 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > @@ -1067,11 +1067,11 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev=
, void *txwi_ptr,
> >   		link_conf =3D rcu_dereference(vif->link_conf[wcid->link_id]);
> >   		if (!link_conf)
> > -			return -EINVAL;
> > +			goto error_relase_token;
> >   		link_sta =3D rcu_dereference(sta->link[wcid->link_id]);
> >   		if (!link_sta)
> > -			return -EINVAL;
> > +			goto error_relase_token;
> >   		dma_sync_single_for_cpu(mdev->dma_dev, tx_info->buf[1].addr,
> >   					tx_info->buf[1].len, DMA_TO_DEVICE);
> > @@ -1176,6 +1176,10 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev,=
 void *txwi_ptr,
> >   	tx_info->nbuf =3D MT_CT_DMA_BUF_NUM;
> >   	return 0;
> > +
> > +error_relase_token:
> > +	mt76_token_release(mdev, id, NULL);
> > +	return -EINVAL;
> >   }
> >   u32 mt7996_wed_init_buf(void *ptr, dma_addr_t phys, int token_id)
> > diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wire=
less/mediatek/mt76/tx.c
> > index 22f9690634c9..f96d9c471853 100644
> > --- a/drivers/net/wireless/mediatek/mt76/tx.c
> > +++ b/drivers/net/wireless/mediatek/mt76/tx.c
> > @@ -933,7 +933,7 @@ mt76_token_release(struct mt76_dev *dev, int token,=
 bool *wake)
> >   #endif
> >   	}
> > -	if (dev->token_count < dev->token_size - MT76_TOKEN_FREE_THR &&
> > +	if (wake && dev->token_count < dev->token_size - MT76_TOKEN_FREE_THR =
&&
> >   	    dev->phy.q_tx[0]->blocked)
> >   		*wake =3D true;
> >=20
> > ---
> > base-commit: 4913f44167cf35a9536e9eec7352e15b2de0c573
> > change-id: 20260531-mt7996_tx_prepare_skb-token-leack-82e240d8c66f
> >=20
> > Best regards,
>=20

--bdJq5GVxual618Pk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCah/TGwAKCRA6cBh0uS2t
rNbDAPwPu5r9lorwMXt2ieCx4e8ZOixDsiJeTJLhBI1PCwhZHgD/TD9Hgb+5876Y
J8R/PRU26mzWgUpnb1+WZKRZmUYovQY=
=BrEn
-----END PGP SIGNATURE-----

--bdJq5GVxual618Pk--

