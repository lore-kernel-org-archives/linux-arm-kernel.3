Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D990C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTwA+1K2fXH71E3l+IMbOPL1xmKtfNCzEKk8E1QgUlY=; b=KnmKnIJ6UBeJnsntaaBoiLPeR3
	Pjv5BNDFa5pZHPGowK9D7UIZl/2dFQ1jUioNpNEhIP3fZKdpD7UCYnVyHlrJT7LY0zsv93rDCBKwu
	vScMYQkwxABX6AZcI/5KVdx/qWMuRZtUmE7dH0icq+tcaHXRAoeJFMehitQ6JfU+5QiUw1MDehpMF
	ls42lBNMpoOeSPjorfVaVaugDTrAhVMjWXb0cFeOvVBmQfu+4HGQfmPMQPKgSUdjCBycp2GV1bazh
	afURcq53ZK273DdFZoYcebsXYHPOP2Jzn9CGD7orukTx+aDvkU4QadoiSxi4CmVK2UaFZlsh6O2ip
	qtEwD3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvehT-0000000FNGK-1TmB;
	Fri, 21 Mar 2025 15:54:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvefo-0000000FMqZ-05ZB;
	Fri, 21 Mar 2025 15:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E86DD6113B;
	Fri, 21 Mar 2025 15:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45AEC4CEE3;
	Fri, 21 Mar 2025 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742572359;
	bh=aeT+zeWm5jrgZt8DkAFo7mZSthufAM7MHXrkbF6C8sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/MQddbmitNGpDQe4XEcNSY1zRtCllgV3IqfjF4T9B8KJj7J0xtemZkjDS8iVnuex
	 HWn1A6bUWJDVuQLcDtOFSz36KEZ98qOpkwhG283VT6NgKRs3XqPBnHP3p+dRgMOUNi
	 KBOxZJftX4vGpllF73+5ldrSO0sXLZQCzPMxRG0ATXYgnvBW0SVKTIJ1eaJoSbBKQU
	 ICAPo/lVWAYuNNzVgiwqa/ZJ0mI/uJRJPAHWeo17WzIk8vf7MBSdHdBazvfUHTYxNN
	 J+eLbuos/Ap6o5+lYkYbVBUkiZ0s2qKvxkk5w3dZPgn7NTnIChDFH3he9W7afjIBqo
	 Nkp+FkkBX6CKw==
Date: Fri, 21 Mar 2025 16:52:36 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7996: remove duplicate check in
 mt7996_mcu_sta_mld_setup_tlv()
Message-ID: <Z92LRBMxyz4pS7my@lore-desk>
References: <fde7246b-08a2-4c2f-b2dc-c3fd0e6b300b@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Her0ThDAq1KdRV1x"
Content-Disposition: inline
In-Reply-To: <fde7246b-08a2-4c2f-b2dc-c3fd0e6b300b@stanley.mountain>
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


--Her0ThDAq1KdRV1x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The "msta_link" pointer has two NULL checks.  Delete the second check.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index ddd555942c73..03539e20f5c5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -2242,9 +2242,6 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev=
, struct sk_buff *skb,
>  		if (!link)
>  			continue;
> =20
> -		if (!msta_link)
> -			continue;
> -
>  		mld_setup_link->wcid =3D cpu_to_le16(msta_link->wcid.idx);
>  		mld_setup_link->bss_idx =3D link->mt76.idx;
>  		mld_setup_link++;
> --=20
> 2.47.2
>=20

--Her0ThDAq1KdRV1x
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ92LRAAKCRA6cBh0uS2t
rAFkAQC83L5e/zLFrvnAgbWpDtlXGRVM8ylbCJX2fob5kYoqKAEA8J5Y+3FQYsGq
Hs5nRCUHXyiZQ44fs7zXOIdYRSjk1As=
=DzY1
-----END PGP SIGNATURE-----

--Her0ThDAq1KdRV1x--

