Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADABCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGIlWd88BAgOVnBl8Y24/CjXs50BlRCUxmuF5epEu0U=; b=Al+nUnQzmlEmvahGJ7B8XuCZk3
	4tARpSrortCmtvksJYajfkuq9pzLoT77ASJvtR2SOfhloIywPzoE7H1/ZSFhCGj6b7KUPwkv+5RG7
	xs9wjPRiP7Zmyl8Suq2j9KmjRgVx74u5uy6Lt53aQmlvNVtCGG/ptizXevU/eqBxbtoN1DTQYut2q
	BRtZ4GLTdFYC3Vhx4YCPOKDNf7saC3PeRESESbcT0/fKKSI6eFY2Qo1nOhkyWyFTvjRJlvFs5tPg3
	8XFC6Z+XOECspTq8atv8LmCs9rAc5XHEKgJzfDc+5ElzfJTbjya6UZhSWi0sxPqt6+uea+UlJhSkA
	zFAlsBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIIJ-00000003y75-1b5v;
	Sun, 21 Jun 2026 13:33:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIIH-00000003y6w-2J9l;
	Sun, 21 Jun 2026 13:33:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0539600AF;
	Sun, 21 Jun 2026 13:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF03D1F000E9;
	Sun, 21 Jun 2026 13:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782048780;
	bh=fGIlWd88BAgOVnBl8Y24/CjXs50BlRCUxmuF5epEu0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ll+xIAjHQA+1NdqglbgoF+aTz1pps/7dD2CGfiWWnDOq8WaL2JIDFnT5DmRoQWjxa
	 Q0mz3UsiAXsfHE8JA6XzJAvTWOAd4X/WEujKuWc2JO+4D3xWZ0Egl5U0WhXT2OdV/Z
	 xjk+N0Z48GiMebsOYShr5bDYUT5jslukVnRXQnfvYOFNrzuIJgO4gPKS8OauKfXwel
	 HgmDFh3kPqHXKSK+DmL47TIZP36ff2JD8ypDvMpCtcHHAMAM8nt7itscqeesiDtYih
	 2NZ5aOJozBm9Xfhj08eWhr/ekiszM1Tq3ES6QZFLsr2z0XIZkhcjJJCNQD6Gw4DRoT
	 FEX5o4RFDWyFw==
Date: Sun, 21 Jun 2026 15:32:57 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7915: guard HE capability lookups
Message-ID: <ajfoCXu94i-_4LOA@lore-desk>
References: <20260620155332.81120-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QQHHFuPkC+H7QMe1"
Content-Disposition: inline
In-Reply-To: <20260620155332.81120-1-ruoyuw560@gmail.com>
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


--QQHHFuPkC+H7QMe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt7915_mcu_bss_he_tlv() and mt7915_mcu_sta_bfer_tlv() both run after
> checking HE support, then dereference the HE PHY capability returned by
> mt76_connac_get_he_phy_cap(). That helper can return NULL when no
> capability entry matches the vif type.
>=20
> Fetch the capability before appending the TLV and skip the HE-specific
> setup when no matching capability is available.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: e6d557a78b60 ("mt76: mt7915: rely on mt76_connac_get_phy utilities=
")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c    | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index 318c38149463..391c91675130 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -595,6 +595,8 @@ mt7915_mcu_bss_he_tlv(struct sk_buff *skb, struct iee=
e80211_vif *vif,
>  	struct tlv *tlv;
> =20
>  	cap =3D mt76_connac_get_he_phy_cap(phy->mt76, vif);
> +	if (!cap)
> +		return;
> =20
>  	tlv =3D mt76_connac_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, sizeof(*he));
> =20
> @@ -1177,13 +1179,12 @@ mt7915_mcu_sta_bfer_vht(struct ieee80211_sta *sta=
, struct mt7915_phy *phy,
>  }
> =20
>  static void
> -mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *=
vif,
> -		       struct mt7915_phy *phy, struct sta_rec_bf *bf)
> +mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta,
> +		       const struct ieee80211_sta_he_cap *vc,
> +		       struct sta_rec_bf *bf)
>  {
>  	struct ieee80211_sta_he_cap *pc =3D &sta->deflink.he_cap;
>  	struct ieee80211_he_cap_elem *pe =3D &pc->he_cap_elem;
> -	const struct ieee80211_sta_he_cap *vc =3D
> -		mt76_connac_get_he_phy_cap(phy->mt76, vif);
>  	const struct ieee80211_he_cap_elem *ve =3D &vc->he_cap_elem;
>  	u16 mcs_map =3D le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_80);
>  	u8 nss_mcs =3D mt7915_mcu_get_sta_nss(mcs_map);
> @@ -1242,6 +1243,7 @@ mt7915_mcu_sta_bfer_tlv(struct mt7915_dev *dev, str=
uct sk_buff *skb,
>  {
>  	struct mt7915_vif *mvif =3D (struct mt7915_vif *)vif->drv_priv;
>  	struct mt7915_phy *phy =3D mvif->phy;
> +	const struct ieee80211_sta_he_cap *vc =3D NULL;
>  	int tx_ant =3D hweight8(phy->mt76->chainmask) - 1;
>  	struct sta_rec_bf *bf;
>  	struct tlv *tlv;
> @@ -1260,6 +1262,12 @@ mt7915_mcu_sta_bfer_tlv(struct mt7915_dev *dev, st=
ruct sk_buff *skb,
>  	if (!ebf && !dev->ibf)
>  		return;
> =20
> +	if (sta->deflink.he_cap.has_he && ebf) {
> +		vc =3D mt76_connac_get_he_phy_cap(phy->mt76, vif);
> +		if (!vc)
> +			return;
> +	}
> +
>  	tlv =3D mt76_connac_mcu_add_tlv(skb, STA_REC_BF, sizeof(*bf));
>  	bf =3D (struct sta_rec_bf *)tlv;
> =20
> @@ -1268,7 +1276,7 @@ mt7915_mcu_sta_bfer_tlv(struct mt7915_dev *dev, str=
uct sk_buff *skb,
>  	 * ht: iBF only, since mac80211 lacks of eBF support
>  	 */
>  	if (sta->deflink.he_cap.has_he && ebf)
> -		mt7915_mcu_sta_bfer_he(sta, vif, phy, bf);
> +		mt7915_mcu_sta_bfer_he(sta, vc, bf);
>  	else if (sta->deflink.vht_cap.vht_supported)
>  		mt7915_mcu_sta_bfer_vht(sta, phy, bf, ebf);
>  	else if (sta->deflink.ht_cap.ht_supported)

--QQHHFuPkC+H7QMe1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajfoCQAKCRA6cBh0uS2t
rP2dAQCCcm2BPjD0c1XzPXbhGdoVYFq+ietAOfW9Qkj7OjOtYwEApeG4XvEHCMwJ
Bv8nmWLaNHLR1z3GDHDMTb8/YiUnPA4=
=xV3H
-----END PGP SIGNATURE-----

--QQHHFuPkC+H7QMe1--

