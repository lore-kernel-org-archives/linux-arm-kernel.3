Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD2BCD4F28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 07:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Qg2QVHThW3X+Uk9q9cbkaKJfTzK0QTxisU1xZ/OPtw=; b=AX18rUeOW2gAXQIWVhNaMViOz1
	SX5Jw+MpxXI0JAFmFhltvYSXiuU36/lP/GR0AN8yELM0B4GB6X4+pPb1SElRwJ1pXymXXc9guuiUU
	QstSLKn+R+PX+AN6nDt2ZKzk5kCjbfA1GR1cFtOni1FiOO+jBFDpEdLel+us0uUQicMnG7Ak/at25
	Viiwfw8u9A3cb1hL+oUZhFeiTat6Z1hw7JSHjwk2uK2J3KE0Qb4NouLNIBIc9Hc5QL9SD3SPA5dCa
	VpyU60Yv1ioKKm/g9ghEOgyspmj6wd7rJrUOpJ0A49G40FsCubhGYIwYEqIAeVSgZ9AXGnmry2gaL
	tjP9b72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJRZz-00000009zBy-2fjC;
	Thu, 13 Nov 2025 07:17:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJRZx-00000009zBa-3WzO;
	Thu, 13 Nov 2025 07:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56D2643F33;
	Thu, 13 Nov 2025 07:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55ACC4CEF5;
	Thu, 13 Nov 2025 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763018232;
	bh=AVBlLnGckxjKwnnOnUXaDm2zDGvoig0seanX4A70Bw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUM+ik+p6IFzpN7zZLzxa9AwLB2kyODzK7ekmsbMAzKaxleQyyuFSMVBZxXQwZCZI
	 0bj1d6pAcTkjALLuJycRZ5zkxzTOvAheE0Zdw134wk7tK5zPXv4xyDuz7GuXOTxQxP
	 qh3HvKC3YA6tn5LQEBBHadkmBBHJWKIkl/AhstES9j3lZgUvOCFjjvbC3Kxuajbr+J
	 ctw46CNizo0oqX/WPj+KZYouyD/R2SKrVl0Gzs5nTZkOtynOVORmaIUcddX97cEDwP
	 rxm6+DIXuZCKMfd7NmxjvrNnEyT1Tt6ROX8VReskblxiBMy0KpOhzBmTxaM0T5ItjQ
	 o96jkxwVdSqPA==
Date: Thu, 13 Nov 2025 08:17:09 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: nbd@nbd.name, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, jianhao.xu@seu.edu.cn
Subject: Re: [PATCH net] mt76: mt7615: Fix memory leak in
 mt7615_mcu_wtbl_sta_add()
Message-ID: <aRWF9QJuwGaDlUvT@lore-desk>
References: <20251113062415.103611-1-zilin@seu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aZWRFATKm1FfpMf2"
Content-Disposition: inline
In-Reply-To: <20251113062415.103611-1-zilin@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_231713_919927_9CCE6B80 
X-CRM114-Status: GOOD (  18.14  )
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


--aZWRFATKm1FfpMf2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In mt7615_mcu_wtbl_sta_add(), an skb sskb is allocated. If the
> subsequent call to mt76_connac_mcu_alloc_wtbl_req() fails, the function
> returns an error without freeing sskb, leading to a memory leak.
>=20
> Fix this by calling dev_kfree_skb() on sskb in the error handling path
> to ensure it is properly released.
>=20
> Fixes: 99c457d902cf9 ("mt76: mt7615: move mt7615_mcu_set_bmc to mt7615_mc=
u_ops")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index 4064e193d4de..08ee2e861c4e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -874,8 +874,10 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, stru=
ct ieee80211_vif *vif,
>  	wtbl_hdr =3D mt76_connac_mcu_alloc_wtbl_req(&dev->mt76, &msta->wcid,
>  						  WTBL_RESET_AND_SET, NULL,
>  						  &wskb);
> -	if (IS_ERR(wtbl_hdr))
> +	if (IS_ERR(wtbl_hdr)) {
> +		dev_kfree_skb(sskb);

Hi Zilin,

I can't see how this is useful since if mt76_connac_mcu_alloc_wtbl_req retu=
rns
an error, wskb will not be allocated.

Regards,
Lorenzo

>  		return PTR_ERR(wtbl_hdr);
> +	}
> =20
>  	if (enable) {
>  		mt76_connac_mcu_wtbl_generic_tlv(&dev->mt76, wskb, vif, sta,
> --=20
> 2.34.1
>=20

--aZWRFATKm1FfpMf2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaRWF9QAKCRA6cBh0uS2t
rCxgAQCW+qnvlH5fPUCxWkj4AlWKqGylBMeUcC1chjZl+uY/UwEAhUhsrUJk7tn7
QaT4KvLwkDqdr6peuN/QcQvG50qs6wM=
=uKrq
-----END PGP SIGNATURE-----

--aZWRFATKm1FfpMf2--

