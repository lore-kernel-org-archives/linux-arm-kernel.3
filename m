Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137F2CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv8zQAQLpnE9vfoEon182ebZEDEElTVzasDUDqEY4gw=; b=WztO+sG0xIBImGWfEQ2z2SQJNF
	h0CxuDt3dUSkNZM71M+QMObhkS69kxDH6opNBSCTl/6hXurduyiKLDrPtmwD7ILAuKoKSC14U8u8H
	i64k5uWY6YAhCuMu5A+i50cBGFqGrpj5SVugH9z+9k1FLiFdE8VMFuLKJF+XLSNFa07B3Gi0MyzCt
	tCZSHrsngTfHC7+RkSL75UjV0Gf55GJQ1X9/baCBtB4xIQarYFJodAQxY42TiJnlV73GDhB9S8znt
	/7IqjkgMWjXgreebZY03PrcOyGMk2Mt3bTJjEJsHOxBF4f7CQAMgIdnxLJ1tgbFFYjk4cq1ZLVtVr
	TBsyn4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvAe-00000006Kyv-0Tc6;
	Thu, 23 Oct 2025 13:16:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvAb-00000006Kxo-2Cu8;
	Thu, 23 Oct 2025 13:15:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E031064024;
	Thu, 23 Oct 2025 13:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FFAC4CEE7;
	Thu, 23 Oct 2025 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761225356;
	bh=bpK6IFKSlWyr361lsyY7cF41HPTMFf1xoUoSL8UMu8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdpJCNYP49fX4xrvkRrTI6NYAIb2XjSMLFn4GRWD1qwY0y/P1swND08sCsrfKCZy/
	 U/QN5Fg1s3jCbQG4YTMkN4g+dAtvNf3hW+TDkL7ZmWwBtVOE/jU8l2Xudjd8Vw8w7r
	 84K8i4KH5zAKsrLxlTUqVvfG7ATeuYc6eAK4TtOUUdT1eamY0jzyFS0ZPmdxo1w1kT
	 hwuZcdtC6g4LyBtap5kiwW7hymyz4bfNCaeRbKMmuTQdnGcd2QtY+MeHpopHhuso0R
	 gdb0q8P2jdHtO+fS8WvXd1fHOTBBDjDnPZzQEaxtzTaA6kbjqevt5b7iMI5/N8PBee
	 idrwh4k7baoxw==
Date: Thu, 23 Oct 2025 15:15:54 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex Lu <rex.lu@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, david.hunter.linux@gmail.com,
	khalid@kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] wifi: mt76: mt7996: remove redundant NULL check in
 mt7996_msdu_page_get_from_cache()
Message-ID: <aPoqiioo6kUZ0kbY@lore-desk>
References: <20251023-mt7996_mac_c-v1-1-580a3cbb2678@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n7nsxP8XhLbUIH3S"
Content-Disposition: inline
In-Reply-To: <20251023-mt7996_mac_c-v1-1-580a3cbb2678@gmail.com>
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


--n7nsxP8XhLbUIH3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Smatch reported a warning that the NULL check on `p` in
> `mt7996_msdu_page_get_from_cache()` is redundant:
>=20
>   drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651
>   mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?
>=20
> The function first checks `list_empty(&dev->wed_rro.page_cache)` before
> calling `list_first_entry()`. When the list is not empty,
> `list_first_entry()` always returns a valid pointer and can never be NULL.
>=20
> Hence, the `if (p)` condition is unnecessary. Removing it cleans up the
> code.

Hi Rakuram,

this issue has been already fixed here:
https://patchwork.kernel.org/project/linux-wireless/patch/20251014-mt7996_m=
sdu_page_get_from_cache-remove-null-ptr-check-v1-1-fbeb7881e192@kernel.org/

Regards,
Lorenzo

>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202510100155.MS0IXhzm-lkp@intel.com/
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index 9501def3e0e3e20132fdbcfe0b1f489694afdc5f..284f2eea71e5bf0a34c7fe840=
84d998164a31a05 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -1681,8 +1681,7 @@ mt7996_msdu_page_get_from_cache(struct mt7996_dev *=
dev)
>  	if (!list_empty(&dev->wed_rro.page_cache)) {
>  		p =3D list_first_entry(&dev->wed_rro.page_cache,
>  				     struct mt7996_msdu_page, list);
> -		if (p)
> -			list_del(&p->list);
> +		list_del(&p->list);
>  	}
> =20
>  	spin_unlock(&dev->wed_rro.lock);
>=20
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251022-mt7996_mac_c-e10894b8bbb4
>=20
> Best regards,
> --=20
> Rakuram Eswaran <rakuram.e96@gmail.com>
>=20

--n7nsxP8XhLbUIH3S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaPoqigAKCRA6cBh0uS2t
rD8eAPwLI8YuldWd9SqIobkdRoUsWzOX3OJ2ZueswhJHmsaS9AD/S8i//U2NX4+E
xxZI8D6MmUYKGxiHF1XutDoE/AEFhgo=
=fPpm
-----END PGP SIGNATURE-----

--n7nsxP8XhLbUIH3S--

