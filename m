Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D6BFC5903
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3oU91SteUGDG1RwnBFzJRPau585EoLlyXZ6sKVEo1g=; b=Rxa4zHJP+zAeFKhDBQYG/GoF3j
	M2nbI3nQgAuntz42NtgTI+t/wKuuKSxlHsSU78YnkCClOkQ3otFiOG9MAl9kdll/bzETWr0/2ICAi
	mvw2cSEJURkavulQvWA6XkQHEmupD/7a9QPo1bOIbSdoHklxdLmKbfLvixM66s5qi5slGfnUzc7I1
	MlfTpC90vVk70V8LBULPN2wi5bBYpJ3ZkKrMWmZjfIlyLTWC9KadWLPWau05q0azqxwKvHV8dxrbP
	NU0iWPgtFbmTaN42tBEfWGl7d3rZZwvCV8sRubKrJQTnNWad9jZwjqxh/paDXIsZ8w1uCJH7OvBuj
	zVc0ZB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVxM-00000005aQK-27Fo;
	Thu, 26 Feb 2026 07:38:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVxL-00000005aQB-2tUB;
	Thu, 26 Feb 2026 07:38:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE25160054;
	Thu, 26 Feb 2026 07:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0698DC19424;
	Thu, 26 Feb 2026 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772091522;
	bh=Wrc4xAun5CwndqcKF0a9rvejO9WBiD5pCK7g3zIJna4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MuUKU8HaopIuxCmBB3FBoI5xYavpPuRdntHOycIA4tf/iyw0mu44c+PlbVfX5HlI8
	 tKNN3qDS+T2o39hlVjIkJFbLFbbidazicsEVmV0EE7rPRF9nWpLNeuL083/z5vLWCi
	 GhEUWa679c8MByObex9yLlneYIZWL/GMfxJj8bJaKIzKsq6b87YEw6K/LMMzPwXnm8
	 wzXB/6gsTdbZMMi23oQpbE0hEQRuqkYro/rWrJR0htwTugrgCVOa7YbtnZEFjpDWzD
	 wN7YBYghNls8CUdgkBfzjmiZoMDitC1Hc6ZEYLzi2E6T+LK3GjgVYkUseG430trA95
	 6O4pY3UPxw2lA==
Date: Thu, 26 Feb 2026 08:38:39 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Zhengping Zhang <aquapinn@qq.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, zhengping.zhang@airoha.com,
	upstream@airoha.com, Simon Horman <horms@kernel.org>
Subject: Re: [RESEND PATCH net-next] net: airoha: fix typo in function name
Message-ID: <aZ_4f5LrAlKpG6cZ@lore-desk>
References: <tencent_E4FD5D6BC0131E617D848896F5F9FCED6E0A@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywZFAiZulEAzxkCv"
Content-Disposition: inline
In-Reply-To: <tencent_E4FD5D6BC0131E617D848896F5F9FCED6E0A@qq.com>
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


--ywZFAiZulEAzxkCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Corrected the typo in the function name from
>  `airhoa_is_lan_gdm_port` to `airoha_is_lan_gdm_port`. This change ensures
>  consistency in the API naming convention.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Signed-off-by: Zhengping Zhang <aquapinn@qq.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
>  drivers/net/ethernet/airoha/airoha_ppe.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 62bcbbbe2a95..3779f93b47bc 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -76,7 +76,7 @@ static void airoha_set_macaddr(struct airoha_gdm_port *=
port, const u8 *addr)
>  	struct airoha_eth *eth =3D port->qdma->eth;
>  	u32 val, reg;
> =20
> -	reg =3D airhoa_is_lan_gdm_port(port) ? REG_FE_LAN_MAC_H
> +	reg =3D airoha_is_lan_gdm_port(port) ? REG_FE_LAN_MAC_H
>  					   : REG_FE_WAN_MAC_H;
>  	val =3D (addr[0] << 16) | (addr[1] << 8) | addr[2];
>  	airoha_fe_wr(eth, reg, val);
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 20e602d61e61..59ed7569f7c3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -626,7 +626,7 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 ma=
sk, u32 val);
>  #define airoha_qdma_clear(qdma, offset, val)			\
>  	airoha_rmw((qdma)->regs, (offset), (val), 0)
> =20
> -static inline bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
> +static inline bool airoha_is_lan_gdm_port(struct airoha_gdm_port *port)
>  {
>  	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
>  	 * GDM{2,3,4} can be used as wan port connected to an external
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 2221bafaf7c9..9e07b4653af1 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -321,7 +321,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha=
_eth *eth,
>  			/* For downlink traffic consume SRAM memory for hw
>  			 * forwarding descriptors queue.
>  			 */
> -			if (airhoa_is_lan_gdm_port(port))
> +			if (airoha_is_lan_gdm_port(port))
>  				val |=3D AIROHA_FOE_IB2_FAST_PATH;
>  			if (dsa_port >=3D 0)
>  				val |=3D FIELD_PREP(AIROHA_FOE_IB2_NBQ,
> --=20
> 2.43.0
>=20

--ywZFAiZulEAzxkCv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaZ/4fwAKCRA6cBh0uS2t
rFNxAQC51ZWEWtupLqf0J9rgQp3GNeH/exHXOYErWxwPix1qdAEAh4brjMkl6Kj7
jXa2inBVSXHqhZ8HLhfMmH1E28YqxQ8=
=YVf+
-----END PGP SIGNATURE-----

--ywZFAiZulEAzxkCv--

