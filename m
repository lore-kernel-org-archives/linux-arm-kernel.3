Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B62FFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 19:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+537DeOzdoa8NSn6MBJfjhR1eh4h4m+gHKWGpVaQUA=; b=hb/InzC+0EYlijK4DC44Xy19sg
	ZeA6QwRJ/3PlcSacQVTWqIWzeJs8FgxQGa+ao37TDrg+YrI3ZqISUJdboz3AwfQSnZW00yM6uvdkv
	aQep6q/ARk8zTs+p9P4j7o8OcFSnhV6fzIH/dc2mznfukDDirSxQGeuA5THQ+WWr6YyQcnmUARROw
	3R8eEVHk+nBEE+4UGoFRZbLjcUYomCwX6VjfhPJwU/1HqkD4neHYYKbdJ46EK63Zwx8r3wuZTMEU5
	TRBU+Yv4JDUuu3Fuvz3d2eZgAyUAtBk/0cANYzzi+gOLiysNm1xjqhDAmzEDP74k/sRJZRFBSnxyC
	RGmk/IYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRLE-00000000248-1ERQ;
	Mon, 27 Apr 2026 19:10:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRLC-0000000023r-3STd;
	Mon, 27 Apr 2026 19:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82D3960141;
	Mon, 27 Apr 2026 19:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB534C19425;
	Mon, 27 Apr 2026 19:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777316997;
	bh=S2QFyYO98/VeGN/skPl8gjEfWZ0lmpn91ZH1v5evmfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oy1TTQzabSaSuoEPs9nMY1DcOZHjLDMVdinWJwVSlLiubHWfCdGTVDrBoiffUnV42
	 4lR3iRcdRoRm6WmErZB7xmwE+o0aok1TZr1gwQZZcMF/yREI/KReJwtBaDBanAXqWX
	 TfhlFacma5zyeE/lMesNtd8p1bGd0mlgCuYcBVgQKiBOZuO5gLxEp2OxhkJ8/ui9We
	 1EHCy0xQa2AOpklCXJB1L/n/Ayy5PTYKEtFKHBzU4E8+TgcW9+pFZ4yNaV0pCoERhj
	 XNq7M8lMiRHMiGR0gSTnuKUyaqDXJruookoppjFCDKseviChNfSmsd40xnEbV7T3hs
	 /TvYi7Y59+Oqw==
Date: Mon, 27 Apr 2026 20:09:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
Message-ID: <20260427-hug-baboon-d60bb8fdfa51@spud>
References: <20260427034427.881389-1-rosenp@gmail.com>
 <20260427034427.881389-4-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h8E0ijeg3Rf1YQAF"
Content-Disposition: inline
In-Reply-To: <20260427034427.881389-4-rosenp@gmail.com>
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


--h8E0ijeg3Rf1YQAF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 08:44:27PM -0700, Rosen Penev wrote:
> mt76_get_of_data_from_mtd has been replaced by
> mt76_get_of_data_from_nvmem in all usages.

All users in the kernel, but what about other sources of devicetrees?
Those built into firmware etc? Are there none of those too?

Conor.

>=20
> Remove it to prevent people from using the deprecated
> mediatek,mtd-eeprom binding.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
>  .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
>  3 files changed, 92 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wi=
reless/mediatek/mt76/eeprom.c
> index afdb73661866..092804323d81 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -35,89 +35,6 @@ static int mt76_get_of_eeprom_data(struct mt76_dev *de=
v, void *eep, int len)
>  	return 0;
>  }
> =20
> -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offse=
t, int len)
> -{
> -#ifdef CONFIG_MTD
> -	struct device_node *np =3D dev->dev->of_node;
> -	struct mtd_info *mtd;
> -	const __be32 *list;
> -	const char *part;
> -	phandle phandle;
> -	size_t retlen;
> -	int size;
> -	int ret;
> -
> -	list =3D of_get_property(np, "mediatek,mtd-eeprom", &size);
> -	if (!list)
> -		return -ENOENT;
> -
> -	phandle =3D be32_to_cpup(list++);
> -	if (!phandle)
> -		return -ENOENT;
> -
> -	np =3D of_find_node_by_phandle(phandle);
> -	if (!np)
> -		return -EINVAL;
> -
> -	part =3D of_get_property(np, "label", NULL);
> -	if (!part)
> -		part =3D np->name;
> -
> -	mtd =3D get_mtd_device_nm(part);
> -	if (IS_ERR(mtd)) {
> -		ret =3D  PTR_ERR(mtd);
> -		goto out_put_node;
> -	}
> -
> -	if (size <=3D sizeof(*list)) {
> -		ret =3D -EINVAL;
> -		goto out_put_node;
> -	}
> -
> -	offset +=3D be32_to_cpup(list);
> -	ret =3D mtd_read(mtd, offset, len, &retlen, eep);
> -	put_mtd_device(mtd);
> -	if (mtd_is_bitflip(ret))
> -		ret =3D 0;
> -	if (ret) {
> -		dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\n",
> -			part, ret);
> -		goto out_put_node;
> -	}
> -
> -	if (retlen < len) {
> -		ret =3D -EINVAL;
> -		goto out_put_node;
> -	}
> -
> -	if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
> -		u8 *data =3D (u8 *)eep;
> -		int i;
> -
> -		/* convert eeprom data in Little Endian */
> -		for (i =3D 0; i < round_down(len, 2); i +=3D 2)
> -			put_unaligned_le16(get_unaligned_be16(&data[i]),
> -					   &data[i]);
> -	}
> -
> -#ifdef CONFIG_NL80211_TESTMODE
> -	dev->test_mtd.name =3D devm_kstrdup(dev->dev, part, GFP_KERNEL);
> -	if (!dev->test_mtd.name) {
> -		ret =3D -ENOMEM;
> -		goto out_put_node;
> -	}
> -	dev->test_mtd.offset =3D offset;
> -#endif
> -
> -out_put_node:
> -	of_node_put(np);
> -	return ret;
> -#else
> -	return -ENOENT;
> -#endif
> -}
> -EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
> -
>  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
>  				const char *cell_name, int len)
>  {
> @@ -163,10 +80,6 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev, v=
oid *eep, int len)
>  	if (!ret)
>  		return 0;
> =20
> -	ret =3D mt76_get_of_data_from_mtd(dev, eep, 0, len);
> -	if (!ret)
> -		return 0;
> -
>  	return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
>  }
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 527bef97e122..f447ecac664d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -1339,7 +1339,6 @@ void mt76_seq_puts_array(struct seq_file *file, con=
st char *str,
> =20
>  int mt76_eeprom_init(struct mt76_dev *dev, int len);
>  int mt76_eeprom_override(struct mt76_phy *phy);
> -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offse=
t, int len);
>  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
>  				const char *cell_name, int len);
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers=
/net/wireless/mediatek/mt76/mt7915/eeprom.c
> index eb92cbf1a284..c24e1276700b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> @@ -29,10 +29,6 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev=
 *dev)
> =20
>  	offs =3D is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
> =20
> -	ret =3D mt76_get_of_data_from_mtd(mdev, dev->cal, offs, size);
> -	if (!ret)
> -		return ret;
> -
>  	ret =3D mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", size);
>  	if (!ret)
>  		return ret;
> --=20
> 2.54.0
>=20

--h8E0ijeg3Rf1YQAF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae+0fwAKCRB4tDGHoIJi
0p6UAQCh7xiqZv6vZTQVkekaR1PoBZs8cZSa9cGLXxrA5TBPXAD+NdxdB4FFY1+K
5yFpUApYxWTCs8eeSKv6+VAqqrq7lAE=
=hLdb
-----END PGP SIGNATURE-----

--h8E0ijeg3Rf1YQAF--

