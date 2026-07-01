Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E309C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 22:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmf0yIErl+HxkobvYAzz7ozHbW2IIVmNhGXMLcFGe94=; b=x8z4BE+Mwl8li2BFGJ09TyItL5
	vzgzuJnCN38fPXk6L9YsNgE+NG+7+eFOMzRhw7oXFUmcaDYM65XnVEj5dZR4KSafaSkyR7sxxgMQz
	USsyMu9ys9TIXsAkK3O0lWvwKOQtzgZAVJAgv/kQwVegjYUHmzSJEXPtWpqdPcGgUMA/wViivbdlD
	aaUrsQx3kkTCqHUPOKGywqQfunruUWgnMQB4ki4mHtjNpY4zF7u4/rMe+efmDvYvsZZmLCi5/1uMl
	nIsYutGDr7z3zyTdVeDXECj6r3ug86j10/+nWj6cLd11JCNxbzpy39JaXgtPAUisa/uEtcrZtOq3A
	coeuPnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3eX-000000037KZ-3ygr;
	Wed, 01 Jul 2026 22:43:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3eW-000000037KM-3Jjx;
	Wed, 01 Jul 2026 22:43:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CB0143485;
	Wed,  1 Jul 2026 22:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916711F000E9;
	Wed,  1 Jul 2026 22:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782945812;
	bh=wmf0yIErl+HxkobvYAzz7ozHbW2IIVmNhGXMLcFGe94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S6eGCbfuLq7coiGwPOBQ+CoM9l4p0roRt3RBFZsFi5yWHPyH7XIBstSio2/ezP/Dg
	 xatrM1i1Pt8E2FIKnnpzmS1Cz61vVqyTV946KGDKf7KXucgTOzcXW0Ny2+b1i7wWTm
	 yJxHG/12eRqWCWX0jUtsfmrDS5GxhZJPNoYrwL0bDdYR506pFmUSRZAUhiCM7k9n1L
	 iqGAyAAF0VGq8s44xDS06NIr+ezeXifRE7VDF9lcoV57hHjRr2jeYFphIry6bsXlc+
	 BOlwxHWOGOTDr0IuSHdD8P5svvWkq5Eh24/9RCsNx1xezychxYsBBnVWOxZVM9mIiU
	 CCn/+8jhsDAAQ==
Date: Thu, 2 Jul 2026 00:43:29 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Aniket Negi <aniket.negi03@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: fix MIB stats collection to be
 lossless
Message-ID: <akWYEf5wusTq9_ol@lore-desk>
References: <20260630111834.233643-1-aniket.negi03@gmail.com>
 <20260701173941.314795-1-aniket.negi03@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GwVceFzz02rhH5Cx"
Content-Disposition: inline
In-Reply-To: <20260701173941.314795-1-aniket.negi03@gmail.com>
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


--GwVceFzz02rhH5Cx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The current driver resets hardware MIB counters after every read via
> REG_FE_GDM_MIB_CLEAR. This creates a race window: packets arriving
> between the read and the clear are silently lost from statistics.
>=20
> Fix this by removing the MIB clear and switching to a delta-based
> software tracking approach:
>=20
> - 64-bit H+L registers (tx/rx ok pkts, ok bytes, E64..L1023):
>   read the absolute hardware total directly each poll.
>=20
> - 32-bit registers (drops, bc, mc, errors, runt, long, ...):
>   store the previous raw register value in mib_prev and accumulate
>   (u32)(curr - prev) into a 64-bit software counter. Unsigned
>   subtraction handles wrap-around transparently.
>=20
> - tx_len[0]/rx_len[0] ({0,64} RMON bucket) combines RUNT_CNT
>   (32-bit, delta-tracked via mib_prev.tx_runt_cnt) and E64_CNT
>   (64-bit, absolute). A u64 accumulator tx_runt_accum64 holds the
>   running RUNT delta sum so that each poll sets:
>     tx_len[0] =3D tx_runt_accum64 + E64_abs
>   without double-counting the E64 value.
>=20
> Merge airoha_dev_get_hw_stats() into airoha_update_hw_stats(),
> moving the port spin_lock inside so callers do not need a separate
> wrapper.
>=20
> Signed-off-by: Aniket Negi <aniket.negi03@gmail.com>

Hi Aniket,

just few nits inline. Fixing them:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>=20
> Changes in v2:
>   - Store _CNT_L register reads in val before adding to stats, improving
>     readability (suggested by Lorenzo Bianconi)
>   - Fix double-counting bug in the RUNT+E64 combined bucket: previously
>     "+=3D" for E64 re-added the full absolute counter each poll; now a
>     dedicated tx_runt_accum64/rx_runt_accum64 accumulator holds the
>     running RUNT delta, and tx_len[0] is assigned (not accumulated) each
>     poll as runt_accum64 + E64_abs
>   - Replace 7-element tx_len[]/rx_len[] shadow arrays in mib_prev with
>     focused tx_runt_cnt/tx_long_cnt and rx_runt_cnt/rx_long_cnt fields;
>     only RUNT and LONG are 32-bit and need wrap-around tracking
>   - Rename inner struct hw_prev_stats to mib_prev; rename accumulator
>     fields to tx_runt_accum64/rx_runt_accum64 for clarity
>   - Fix comment alignment in mib_prev struct block
>   - Rename airoha_dev_get_hw_stats() to airoha_update_hw_stats() and
>     move the port spin_lock inside, removing the separate wrapper
>=20
>  drivers/net/ethernet/airoha/airoha_eth.c | 115 +++++++++++++----------
>  drivers/net/ethernet/airoha/airoha_eth.h |  27 ++++++
>  2 files changed, 92 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 59001fd4b6f7..4b7c547de165 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1686,12 +1686,14 @@ static void airoha_qdma_stop_napi(struct airoha_q=
dma *qdma)
>  	}
>  }
> =20
> -static void airoha_dev_get_hw_stats(struct airoha_gdm_dev *dev)
> +static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
>  {
>  	struct airoha_gdm_port *port =3D dev->port;
>  	struct airoha_eth *eth =3D dev->eth;
>  	u32 val, i =3D 0;
> =20
> +	spin_lock(&port->stats_lock);
> +
>  	/* Read relevant MIB for GDM with multiple port attached */
>  	if (port->id =3D=3D AIROHA_GDM3_IDX || port->id =3D=3D AIROHA_GDM4_IDX)
>  		airoha_fe_rmw(eth, REG_FE_GDM_MIB_CFG(port->id),
> @@ -1701,152 +1703,165 @@ static void airoha_dev_get_hw_stats(struct airo=
ha_gdm_dev *dev)
> =20
>  	u64_stats_update_begin(&dev->stats.syncp);
> =20
> -	/* TX */
> +	/* TX - 64-bit H+L registers: hw accumulates the total, read directly. =
*/
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> -	dev->stats.tx_ok_pkts +=3D ((u64)val << 32);
> +	dev->stats.tx_ok_pkts =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
>  	dev->stats.tx_ok_pkts +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
> -	dev->stats.tx_ok_bytes +=3D ((u64)val << 32);
> +	dev->stats.tx_ok_bytes =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
>  	dev->stats.tx_ok_bytes +=3D val;
> =20
> +	/* TX - 32-bit registers: accumulate delta to handle wrap-around. */
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
> -	dev->stats.tx_drops +=3D val;
> +	dev->stats.tx_drops +=3D (u32)(val - dev->stats.mib_prev.tx_drops);
> +	dev->stats.mib_prev.tx_drops =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_BC_CNT(port->id));
> -	dev->stats.tx_broadcast +=3D val;
> +	dev->stats.tx_broadcast +=3D (u32)(val - dev->stats.mib_prev.tx_broadca=
st);
> +	dev->stats.mib_prev.tx_broadcast =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_MC_CNT(port->id));
> -	dev->stats.tx_multicast +=3D val;
> +	dev->stats.tx_multicast +=3D (u32)(val - dev->stats.mib_prev.tx_multica=
st);
> +	dev->stats.mib_prev.tx_multicast =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
> -	dev->stats.tx_len[i] +=3D val;
> +	dev->stats.mib_prev.tx_runt_accum64 +=3D

I guess dev->stats.mib_prev.tx_runt64

> +		(u32)(val - dev->stats.mib_prev.tx_runt_cnt);

	dev->stats.mib_prev.tx_runt64 +=3D (u32)(val -
					       dev->stats.mib_prev.tx_runt);

> +	dev->stats.mib_prev.tx_runt_cnt =3D val;
> +
> +	/* tx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute) =E2=86=92 {=
0, 64} bucket.
> +	 * Accumulate RUNT delta in tx_runt_accum64, then assign tx_len[0] as
> +	 * accum + E64_abs so each call gives the correct combined total.
> +	 */

no new-line here.

> +
> +	dev->stats.tx_len[i] =3D dev->stats.mib_prev.tx_runt_accum64;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
> -	dev->stats.tx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.tx_len[i] +=3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
>  	dev->stats.tx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_H(port->id));
> -	dev->stats.tx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.tx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
>  	dev->stats.tx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_H(port->id));
> -	dev->stats.tx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.tx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
>  	dev->stats.tx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_H(port->id));
> -	dev->stats.tx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.tx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
>  	dev->stats.tx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_H(port->id));
> -	dev->stats.tx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.tx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
>  	dev->stats.tx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_H(port->id));
> -	dev->stats.tx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.tx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
>  	dev->stats.tx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_LONG_CNT(port->id));
> -	dev->stats.tx_len[i++] +=3D val;
> +	dev->stats.tx_len[i++] +=3D (u32)(val - dev->stats.mib_prev.tx_long_cnt=
);
> +	dev->stats.mib_prev.tx_long_cnt =3D val;
> =20
>  	/* RX */
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_H(port->id));
> -	dev->stats.rx_ok_pkts +=3D ((u64)val << 32);
> +	dev->stats.rx_ok_pkts =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
>  	dev->stats.rx_ok_pkts +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_H(port->id));
> -	dev->stats.rx_ok_bytes +=3D ((u64)val << 32);
> +	dev->stats.rx_ok_bytes =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
>  	dev->stats.rx_ok_bytes +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_DROP_CNT(port->id));
> -	dev->stats.rx_drops +=3D val;
> +	dev->stats.rx_drops +=3D (u32)(val - dev->stats.mib_prev.rx_drops);
> +	dev->stats.mib_prev.rx_drops =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_BC_CNT(port->id));
> -	dev->stats.rx_broadcast +=3D val;
> +	dev->stats.rx_broadcast +=3D (u32)(val - dev->stats.mib_prev.rx_broadca=
st);
> +	dev->stats.mib_prev.rx_broadcast =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_MC_CNT(port->id));
> -	dev->stats.rx_multicast +=3D val;
> +	dev->stats.rx_multicast +=3D (u32)(val - dev->stats.mib_prev.rx_multica=
st);
> +	dev->stats.mib_prev.rx_multicast =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ERROR_DROP_CNT(port->id));
> -	dev->stats.rx_errors +=3D val;
> +	dev->stats.rx_errors +=3D (u32)(val - dev->stats.mib_prev.rx_errors);
> +	dev->stats.mib_prev.rx_errors =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_CRC_ERR_CNT(port->id));
> -	dev->stats.rx_crc_error +=3D val;
> +	dev->stats.rx_crc_error +=3D (u32)(val - dev->stats.mib_prev.rx_crc_err=
or);
> +	dev->stats.mib_prev.rx_crc_error =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OVERFLOW_DROP_CNT(port->id));
> -	dev->stats.rx_over_errors +=3D val;
> +	dev->stats.rx_over_errors +=3D (u32)(val - dev->stats.mib_prev.rx_over_=
errors);
> +	dev->stats.mib_prev.rx_over_errors =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_FRAG_CNT(port->id));
> -	dev->stats.rx_fragment +=3D val;
> +	dev->stats.rx_fragment +=3D (u32)(val - dev->stats.mib_prev.rx_fragment=
);
> +	dev->stats.mib_prev.rx_fragment =3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_JABBER_CNT(port->id));
> -	dev->stats.rx_jabber +=3D val;
> +	dev->stats.rx_jabber +=3D (u32)(val - dev->stats.mib_prev.rx_jabber);
> +	dev->stats.mib_prev.rx_jabber =3D val;
> =20
>  	i =3D 0;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
> -	dev->stats.rx_len[i] +=3D val;
> +	dev->stats.mib_prev.rx_runt_accum64 +=3D
> +		(u32)(val - dev->stats.mib_prev.rx_runt_cnt);

ditto.

> +	dev->stats.mib_prev.rx_runt_cnt =3D val;
> +
> +	/* rx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute) =E2=86=92 {=
0, 64} bucket.
> +	 * then assign rx_len[0] =3D rx_runt_accum64 + E64_abs.
> +	 */
> =20
ditto.

> +	dev->stats.rx_len[i] =3D dev->stats.mib_prev.rx_runt_accum64;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
> -	dev->stats.rx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.rx_len[i] +=3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
>  	dev->stats.rx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_H(port->id));
> -	dev->stats.rx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.rx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
>  	dev->stats.rx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_H(port->id));
> -	dev->stats.rx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.rx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
>  	dev->stats.rx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_H(port->id));
> -	dev->stats.rx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.rx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
>  	dev->stats.rx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_H(port->id));
> -	dev->stats.rx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.rx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
>  	dev->stats.rx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_H(port->id));
> -	dev->stats.rx_len[i] +=3D ((u64)val << 32);
> +	dev->stats.rx_len[i] =3D (u64)val << 32;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
>  	dev->stats.rx_len[i++] +=3D val;
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_LONG_CNT(port->id));
> -	dev->stats.rx_len[i++] +=3D val;
> +	dev->stats.rx_len[i] +=3D (u32)(val - dev->stats.mib_prev.rx_long_cnt);
> +	dev->stats.mib_prev.rx_long_cnt =3D val;
> =20
>  	u64_stats_update_end(&dev->stats.syncp);
> -}
> -
> -static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
> -{
> -	struct airoha_gdm_port *port =3D dev->port;
> -	int i;
> -
> -	spin_lock(&port->stats_lock);
> -
> -	for (i =3D 0; i < ARRAY_SIZE(port->devs); i++) {
> -		if (port->devs[i])
> -			airoha_dev_get_hw_stats(port->devs[i]);
> -	}
> -
> -	/* Reset MIB counters */
> -	airoha_fe_set(dev->eth, REG_FE_GDM_MIB_CLEAR(port->id),
> -		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
> =20
>  	spin_unlock(&port->stats_lock);
>  }
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index f6d01a8e8da1..3af1c49dd62d 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -245,6 +245,33 @@ struct airoha_hw_stats {
>  	u64 rx_fragment;
>  	u64 rx_jabber;
>  	u64 rx_len[7];
> +
> +	struct {
> +		/* Previous HW register values for 32-bit counter delta
> +		 * tracking. Storing the last seen value and accumulating
> +		 * (u32)(curr - prev) into the 64-bit software counter
> +		 * handles wrap-around transparently via unsigned arithmetic.
> +		 * tx_runt_accum64/rx_runt_accum64 hold the running sum of
> +		 * runt deltas. These fields are never reported to userspace.
> +		 */
> +		u32 tx_drops;
> +		u32 tx_broadcast;
> +		u32 tx_multicast;
> +		u32 tx_runt_cnt;

		u32 tx_runt;

> +		u32 tx_long_cnt;

		u32 tx_long;

> +		u64 tx_runt_accum64;

		64 tx_runt64;

> +		u32 rx_drops;
> +		u32 rx_broadcast;
> +		u32 rx_multicast;
> +		u32 rx_errors;
> +		u32 rx_crc_error;
> +		u32 rx_over_errors;
> +		u32 rx_fragment;
> +		u32 rx_jabber;
> +		u32 rx_runt_cnt;

		u32 rx_runt;

> +		u32 rx_long_cnt;

		u32 rx_long;

> +		u64 rx_runt_accum64;

		u64 rx_runt64;

> +	} mib_prev;
>  };
> =20
>  enum {
>=20
> base-commit: a225f8c20712713406ae47024b8df42deacddd4a
> --=20
> 2.43.0
>=20

--GwVceFzz02rhH5Cx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCakWYEQAKCRA6cBh0uS2t
rI/KAQDj7HnMgKz2CDJF2bsStuvQ8Yx1Lkss7GR1FTF+TdsnqgD+OrfAJNP8iTFH
XOEipPlOOiEnjr1+U91ZWspbMkK5PQM=
=+eVZ
-----END PGP SIGNATURE-----

--GwVceFzz02rhH5Cx--

