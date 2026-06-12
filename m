Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD8ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DbMPyfGQptbnn4NS0NgGBkAEXlR+GQ+W97O4Gk+1bE=; b=xl1WW62EEfYEUXnZIrdmpu88aA
	btf1q73Me29WeoxmNXnIfC8h92G8WLgKIxLR9ABfU5h0Z43CYncbxhoUqK4Vxx+z+ikK6NYFYNGLk
	Z4/6IUfIG+UBcmoBnQEI2l+WWK2Z7pKLCTZq37ZCTLL1S/lyzK4OEeY6pi+zCPO7BvbNffjDr8cy8
	MqXEey7MvEPvjyiD/6HJNKhJIlBZc9cPq2JwiYuwCBvd7FVRICtTGtKfYuUb5RD9dd+mNeJXRg+/c
	p/HCC0ZqmUkMbEbvUfBeTPeLDabkCb9B5DwqMmgqTfWvmO+6NQqqSv1DIPnExACU/vwU7jtt0YQyq
	81VhZqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2Gk-0000000B0iE-0uwn;
	Fri, 12 Jun 2026 13:49:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2Gj-0000000B0i5-1oHO;
	Fri, 12 Jun 2026 13:49:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE45340A50;
	Fri, 12 Jun 2026 13:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D331F000E9;
	Fri, 12 Jun 2026 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781272196;
	bh=9DbMPyfGQptbnn4NS0NgGBkAEXlR+GQ+W97O4Gk+1bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ogEk2fdb51OCj+6rD0T12zRE8mTqTrPsoUKBtWJpxqCiNbLPrByO32mujD+njvIz5
	 Lbn6maIM9jQuTD1QBWXM/upHjt7lL+SVecWgYD92AjGfSLSPhrvNmpG6aADTAko/Gq
	 WEMm/iUKl8NYLEZuAROmB+DOYUOf/m5+5PltvwVOENvomkg9r3Q32xZ/85lC5zcMuJ
	 wcbs+hm9tat4Hd3r9ZI9F+ZzYL0NMlpCqeqta55o21Z39Awj1jUn9LEcXRR30M3nwk
	 RQ/tACXzIeqivFFEa07NBPZ5tim/lLRB7bcwPdc2vDybyLg41eyZvbaH/RCadMv5cO
	 JPkVZxORFVJKg==
Date: Fri, 12 Jun 2026 15:49:54 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Rex Lu <rex.lu@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: fix airoha_npu dependency tracking
Message-ID: <aiwOgoB6JeU7J3Ze@lore-desk>
References: <20260611125912.3387021-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sS2E1xGPDq87P0hY"
Content-Disposition: inline
In-Reply-To: <20260611125912.3387021-1-arnd@kernel.org>
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


--sS2E1xGPDq87P0hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> There is a new build failure with MT7996E=3Dm MT76_CORE=3Dy and NET_AIROH=
A_NPU=3Dm:
>=20
> ld.lld: error: undefined symbol: airoha_npu_get
> ld.lld: error: undefined symbol: airoha_npu_put
> >>> referenced by npu.c
> >>>               drivers/net/wireless/mediatek/mt76/npu.o:(mt76_npu_init=
) in archive vmlinux.a
>=20
> Fix this by reworking the dependency for the MT7996_NPU to only
> allow enabling that when mt76_core can link against the npu driver.
>=20
> To make sure this gets caught more easily in the future when additional
> mt76 variants need the same dependency, also turn CONFIG_MT76_NPU into
> a tristate symbol that has the same dependency.
>=20
> Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/Kconfig        | 4 ++--
>  drivers/net/wireless/mediatek/mt76/Makefile       | 6 +++++-
>  drivers/net/wireless/mediatek/mt76/mt76.h         | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7996/Kconfig | 2 +-
>  4 files changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wir=
eless/mediatek/mt76/Kconfig
> index 502303622a53..d941e67a222d 100644
> --- a/drivers/net/wireless/mediatek/mt76/Kconfig
> +++ b/drivers/net/wireless/mediatek/mt76/Kconfig
> @@ -38,8 +38,8 @@ config MT792x_USB
>  	select MT76_USB
> =20
>  config MT76_NPU
> -	bool
> -	depends on MT76_CORE
> +	tristate
> +	depends on NET_AIROHA_NPU=3Dy || MT76=3DNET_AIROHA_NPU
> =20
>  source "drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig"
>  source "drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig"
> diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wi=
reless/mediatek/mt76/Makefile
> index 1d42adfe8030..cacdd2b13d05 100644
> --- a/drivers/net/wireless/mediatek/mt76/Makefile
> +++ b/drivers/net/wireless/mediatek/mt76/Makefile
> @@ -12,7 +12,11 @@ mt76-y :=3D \
>  	mmio.o util.o trace.o dma.o mac80211.o debugfs.o eeprom.o \
>  	tx.o agg-rx.o mcu.o wed.o scan.o channel.o
> =20
> -mt76-$(CONFIG_MT76_NPU) +=3D npu.o
> +ifdef CONFIG_MT76_NPU
> +# CONFIG_MT76_NPU is tristate to simplify dependency tracking,
> +# but it behaves as a bool symbol here.
> +mt76-y +=3D npu.o
> +endif
>  mt76-$(CONFIG_PCI) +=3D pci.o
>  mt76-$(CONFIG_NL80211_TESTMODE) +=3D testmode.o
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 07955555f84d..60bd155cc7d5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -1647,7 +1647,7 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, str=
uct sk_buff *skb,
>  int mt76_testmode_set_state(struct mt76_phy *phy, enum mt76_testmode_sta=
te state);
>  int mt76_testmode_alloc_skb(struct mt76_phy *phy, u32 len);
> =20
> -#ifdef CONFIG_MT76_NPU
> +#if IS_ENABLED(CONFIG_MT76_NPU)
>  void mt76_npu_check_ppe(struct mt76_dev *dev, struct sk_buff *skb,
>  			u32 info);
>  int mt76_npu_dma_add_buf(struct mt76_phy *phy, struct mt76_queue *q,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig b/drivers/=
net/wireless/mediatek/mt76/mt7996/Kconfig
> index 5503d03bf62c..5742bce12fbb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
> @@ -16,6 +16,6 @@ config MT7996E
>  config MT7996_NPU
>  	bool "MT7996 (PCIe) NPU support"
>  	depends on MT7996E
> -	depends on NET_AIROHA_NPU=3Dy || MT7996E=3DNET_AIROHA_NPU
> +	depends on NET_AIROHA_NPU=3Dy || MT76_CORE=3DNET_AIROHA_NPU
>  	select MT76_NPU
>  	default n
> --=20
> 2.39.5
>=20

--sS2E1xGPDq87P0hY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiwOggAKCRA6cBh0uS2t
rOcGAP4vYhqXmOO6OnGyAZ+VgBxQr869XtZPMQvmGyA2x1t0HAEA0JOUwPG7oIMd
pfgu4dsSeBoe8+sMbvkRs3cQDaHUVAQ=
=dFd3
-----END PGP SIGNATURE-----

--sS2E1xGPDq87P0hY--

