Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20103C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjwQpODvobkfiZASFrGVqsRrnXdcuv2VPJLKEtXc4oU=; b=NHJutjl/R+ZqlSQJ7/wDrUB/fl
	OMaD9mWNrBlVld9WVxdlcd2q5Pwv+oqo3VWxftxXsCe7dDh5Lx6IZ9oBOjdJDpiBmeWcCk5Yynjm9
	r/fuIl3cmi9eaGG49Q7Ppzbm/oPZMZ1IT18c+fp7ZwW9h5ePxCCC97WOQNAzkLw/iBgFaGar4y9Io
	VJvfzBmloAT5+RRp0OSDRYVDDTD1d9McqsYMoQDRJ6hb25MmL3aKzcHsveAo+xBanIAhs4womq7oQ
	wMTaer4F2OfyHLmRuzvlTsoq5rpAMpPEKOEpB/egJNXO4ZgBVmWPVwijWlQ7Vk2HtJWTSGuy0VxWK
	uT8NoPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpu5-00000000vcV-3JbR;
	Fri, 17 Jan 2025 17:13:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpkr-00000000teT-1JOB;
	Fri, 17 Jan 2025 17:03:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E738A4327D;
	Fri, 17 Jan 2025 17:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAE4C4CEDD;
	Fri, 17 Jan 2025 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737133411;
	bh=7+7jqSST9DXKAARHg+D99JW6DXAhw6kqu5zZwJaCdA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJJbfjFa60XiZ4VAGecLla1hbgUb65SMy6TIOGVyF5tJSyQeauVWNKrNjy/T7bYyy
	 K1T0nkgFCn2ErUYFkyx3JrEa4tdOCLmK13CZa/I0/PXk1J+CyYAur6WoFHk0UTYt/f
	 1U0V+ZHS7IGMxcJ4gihPHVLalHEfcFxXgXQhkusdT8PDouxUODx6ZLt//DFWtalmBw
	 Uw+eMw1BtR8ARe8h+qKukUYKcT5E1vKa1NtRn2sVlcOJphox5oqcDiZ8mdirLpvt5p
	 wfjJ9u6gztvti5Q4ZiMqw9/BszLDYvBlDA7flt4qmqsXBbzhZkixdu1REnmtGqniPE
	 9mgu4A/E2zLxg==
Date: Fri, 17 Jan 2025 18:03:28 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [net PATCH] net: airoha: Fix wrong GDM4 register definition
Message-ID: <Z4qNYBWBFn-Adbli@lore-desk>
References: <20250117155257.19263-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dDHGaHO6hPydbGRy"
Content-Disposition: inline
In-Reply-To: <20250117155257.19263-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_090333_485022_CC08A6AE 
X-CRM114-Status: GOOD (  18.17  )
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


--dDHGaHO6hPydbGRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17, Christian Marangi wrote:
> Fix wrong GDM4 register definition, in Airoha SDK GDM4 is defined at
> offset 0x2400 but this doesn't make sense as it does conflict with the
> CDM4 that is in the same location.
>=20
> Following the pattern where each GDM base is at the FWD_CFG, currently
> GDM4 base offset is set to 0x2500. This is correct but REG_GDM4_FWD_CFG
> and REG_GDM4_SRC_PORT_SET are still using the SDK reference with the
> 0x2400 offset. Fix these 2 define by subtracting 0x100 to each register
> to reflect the real address location.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/ethernet/mediatek/airoha_regs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/airoha_regs.h b/drivers/net/et=
hernet/mediatek/airoha_regs.h
> index e448b66b5334..30c96f679735 100644
> --- a/drivers/net/ethernet/mediatek/airoha_regs.h
> +++ b/drivers/net/ethernet/mediatek/airoha_regs.h
> @@ -249,11 +249,11 @@
>  #define REG_GDM3_FWD_CFG		GDM3_BASE
>  #define GDM3_PAD_EN_MASK		BIT(28)
> =20
> -#define REG_GDM4_FWD_CFG		(GDM4_BASE + 0x100)
> +#define REG_GDM4_FWD_CFG		GDM4_BASE
>  #define GDM4_PAD_EN_MASK		BIT(28)
>  #define GDM4_SPORT_OFFSET0_MASK		GENMASK(11, 8)
> =20
> -#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x33c)
> +#define REG_GDM4_SRC_PORT_SET		(GDM4_BASE + 0x23c)
>  #define GDM4_SPORT_OFF2_MASK		GENMASK(19, 16)
>  #define GDM4_SPORT_OFF1_MASK		GENMASK(15, 12)
>  #define GDM4_SPORT_OFF0_MASK		GENMASK(11, 8)
> --=20
> 2.47.1
>=20

--dDHGaHO6hPydbGRy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ4qNYAAKCRA6cBh0uS2t
rKM9AP9qxIC+KDo4D2c6L+3TtapTrfantCgjpRZKdGBE3AW47QEAxqhGFldb4QF/
WgB/p4rDxSN9ukHVhmmzMDKo0ICFTAY=
=QQSQ
-----END PGP SIGNATURE-----

--dDHGaHO6hPydbGRy--

