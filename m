Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E60D6CFA6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AI0a28chxVEEQopVrXOmdnOgWlD0191W9HAFktZkeeU=; b=rGInY0BzsoC2rJ1WPrceh65OHf
	FvPuAO8dTGe97Ul1lJeWZnaCiovOQBqPLvkGOJlAoe5hOD3LWQT3yYLZBbc7kkuWb7H2JRowiTjf/
	3nefNDIWHvhNKqlFBBPBCOOMvWZJr8IW16w3U/i6faxURdnn3Rxnb4pePRy0IEefLEZjZPztRzfHI
	VkSjTFhDPdR1eOAhInp4bW3y2ZRp/LA6XCtF9EquYA6mZ7SpR55amYBPFUwfJy1gA5FillCXpL9OG
	IpNOrdjpiN1+zxARH98wK9Nq6WxF1NipWVD0VZMiq0I3wkxZSyx7eQPL2yr3Q0+VWOnrm2L5IJ1D3
	JH4vjZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2hY-00000007pEx-0X54;
	Thu, 22 Jan 2026 21:58:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2hX-00000007pEo-1jCx;
	Thu, 22 Jan 2026 21:58:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7292C601EA;
	Thu, 22 Jan 2026 21:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91A2C116C6;
	Thu, 22 Jan 2026 21:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769119130;
	bh=Mfr7mIDtrzBzLCBXMkoZgIUe7cfiZ3c8E1WWNlDsMMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlSTMKvgK4NcWm0tAwyXT1wlKt6TiF9g91K8yfQhJbI3P/YJaKzWRRYXG0IicIB2w
	 r92M8GtL9dH1tEXH5MANaXQ2e0f27q/0LzBNcAeOcZZXE0YOG+L5maCDRSryLB7c74
	 e9CijWX3zDp6kC/54V2X+LPqLNodeaKIt5W8WyM9PnzyuxkX95Y/rAcas5+P5Ktp2n
	 S/ccB0imNTp4BL8bBNLj4vWxS3N+Bui+YiYmEAwiV62eqF8p+1qK7cgD2VrWRMpCwU
	 bzP6fhzxnslfzu67hx1fGMO/UOv9MhaeuWq2OCsKyySTWSk6ysAHEtMZgUSIf318Gi
	 AEISUhwRi4Hvw==
Date: Thu, 22 Jan 2026 22:58:47 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Use u64_stats_t with
 u64_stats_sync properly
Message-ID: <aXKdl8N7YPTbEtFZ@lore-desk>
References: <20260122185255.2761568-1-mmyangfl@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ONLtqPOzoLLC9PQz"
Content-Disposition: inline
In-Reply-To: <20260122185255.2761568-1-mmyangfl@gmail.com>
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


--ONLtqPOzoLLC9PQz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 64bit arches, struct u64_stats_sync is empty and provides no help
> against load/store tearing. Convert to u64_stats_t to ensure atomic
> operations.

I guess we need a Fixes tag here.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 136 +++++++++++------------
>  drivers/net/ethernet/airoha/airoha_eth.h |  34 +++---
>  2 files changed, 85 insertions(+), 85 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 62bcbbbe2a95..6ed220e5a094 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1472,131 +1472,131 @@ static void airoha_update_hw_stats(struct airoh=
a_gdm_port *port)
> =20
>  	/* TX */
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> -	port->stats.tx_ok_pkts +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_ok_pkts, (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> -	port->stats.tx_ok_pkts +=3D val;
> +	u64_stats_add(&port->stats.tx_ok_pkts, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
> -	port->stats.tx_ok_bytes +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_ok_bytes, (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
> -	port->stats.tx_ok_bytes +=3D val;
> +	u64_stats_add(&port->stats.tx_ok_bytes, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
> -	port->stats.tx_drops +=3D val;
> +	u64_stats_add(&port->stats.tx_drops, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_BC_CNT(port->id));
> -	port->stats.tx_broadcast +=3D val;
> +	u64_stats_add(&port->stats.tx_broadcast, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_MC_CNT(port->id));
> -	port->stats.tx_multicast +=3D val;
> +	u64_stats_add(&port->stats.tx_multicast, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
> -	port->stats.tx_len[i] +=3D val;
> +	u64_stats_add(&port->stats.tx_len[i], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
> -	port->stats.tx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
> -	port->stats.tx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.tx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_H(port->id));
> -	port->stats.tx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
> -	port->stats.tx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.tx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_H(port->id));
> -	port->stats.tx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
> -	port->stats.tx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.tx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_H(port->id));
> -	port->stats.tx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
> -	port->stats.tx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.tx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_H(port->id));
> -	port->stats.tx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
> -	port->stats.tx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.tx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_H(port->id));
> -	port->stats.tx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
> -	port->stats.tx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.tx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_LONG_CNT(port->id));
> -	port->stats.tx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.tx_len[i++], val);
> =20
>  	/* RX */
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_H(port->id));
> -	port->stats.rx_ok_pkts +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.rx_ok_pkts, (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
> -	port->stats.rx_ok_pkts +=3D val;
> +	u64_stats_add(&port->stats.rx_ok_pkts, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_H(port->id));
> -	port->stats.rx_ok_bytes +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.rx_ok_bytes, (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
> -	port->stats.rx_ok_bytes +=3D val;
> +	u64_stats_add(&port->stats.rx_ok_bytes, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_DROP_CNT(port->id));
> -	port->stats.rx_drops +=3D val;
> +	u64_stats_add(&port->stats.rx_drops, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_BC_CNT(port->id));
> -	port->stats.rx_broadcast +=3D val;
> +	u64_stats_add(&port->stats.rx_broadcast, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_MC_CNT(port->id));
> -	port->stats.rx_multicast +=3D val;
> +	u64_stats_add(&port->stats.rx_multicast, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ERROR_DROP_CNT(port->id));
> -	port->stats.rx_errors +=3D val;
> +	u64_stats_add(&port->stats.rx_errors, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_CRC_ERR_CNT(port->id));
> -	port->stats.rx_crc_error +=3D val;
> +	u64_stats_add(&port->stats.rx_crc_error, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_OVERFLOW_DROP_CNT(port->id));
> -	port->stats.rx_over_errors +=3D val;
> +	u64_stats_add(&port->stats.rx_over_errors, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_FRAG_CNT(port->id));
> -	port->stats.rx_fragment +=3D val;
> +	u64_stats_add(&port->stats.rx_fragment, val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_JABBER_CNT(port->id));
> -	port->stats.rx_jabber +=3D val;
> +	u64_stats_add(&port->stats.rx_jabber, val);
> =20
>  	i =3D 0;
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
> -	port->stats.rx_len[i] +=3D val;
> +	u64_stats_add(&port->stats.rx_len[i], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
> -	port->stats.rx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
> -	port->stats.rx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.rx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_H(port->id));
> -	port->stats.rx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
> -	port->stats.rx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.rx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_H(port->id));
> -	port->stats.rx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
> -	port->stats.rx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.rx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_H(port->id));
> -	port->stats.rx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
> -	port->stats.rx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.rx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_H(port->id));
> -	port->stats.rx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
> -	port->stats.rx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.rx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_H(port->id));
> -	port->stats.rx_len[i] +=3D ((u64)val << 32);
> +	u64_stats_add(&port->stats.rx_len[i], (u64)val << 32);
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
> -	port->stats.rx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.rx_len[i++], val);
> =20
>  	val =3D airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_LONG_CNT(port->id));
> -	port->stats.rx_len[i++] +=3D val;
> +	u64_stats_add(&port->stats.rx_len[i++], val);
> =20
>  	/* reset mib counters */
>  	airoha_fe_set(eth, REG_FE_GDM_MIB_CLEAR(port->id),
> @@ -1795,16 +1795,16 @@ static void airoha_dev_get_stats64(struct net_dev=
ice *dev,
>  	airoha_update_hw_stats(port);
>  	do {
>  		start =3D u64_stats_fetch_begin(&port->stats.syncp);
> -		storage->rx_packets =3D port->stats.rx_ok_pkts;
> -		storage->tx_packets =3D port->stats.tx_ok_pkts;
> -		storage->rx_bytes =3D port->stats.rx_ok_bytes;
> -		storage->tx_bytes =3D port->stats.tx_ok_bytes;
> -		storage->multicast =3D port->stats.rx_multicast;
> -		storage->rx_errors =3D port->stats.rx_errors;
> -		storage->rx_dropped =3D port->stats.rx_drops;
> -		storage->tx_dropped =3D port->stats.tx_drops;
> -		storage->rx_crc_errors =3D port->stats.rx_crc_error;
> -		storage->rx_over_errors =3D port->stats.rx_over_errors;
> +		storage->rx_packets =3D u64_stats_read(&port->stats.rx_ok_pkts);
> +		storage->tx_packets =3D u64_stats_read(&port->stats.tx_ok_pkts);
> +		storage->rx_bytes =3D u64_stats_read(&port->stats.rx_ok_bytes);
> +		storage->tx_bytes =3D u64_stats_read(&port->stats.tx_ok_bytes);
> +		storage->multicast =3D u64_stats_read(&port->stats.rx_multicast);
> +		storage->rx_errors =3D u64_stats_read(&port->stats.rx_errors);
> +		storage->rx_dropped =3D u64_stats_read(&port->stats.rx_drops);
> +		storage->tx_dropped =3D u64_stats_read(&port->stats.tx_drops);
> +		storage->rx_crc_errors =3D u64_stats_read(&port->stats.rx_crc_error);
> +		storage->rx_over_errors =3D u64_stats_read(&port->stats.rx_over_errors=
);
>  	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
>  }
> =20
> @@ -2057,13 +2057,13 @@ static void airoha_ethtool_get_mac_stats(struct n=
et_device *dev,
>  	airoha_update_hw_stats(port);
>  	do {
>  		start =3D u64_stats_fetch_begin(&port->stats.syncp);
> -		stats->FramesTransmittedOK =3D port->stats.tx_ok_pkts;
> -		stats->OctetsTransmittedOK =3D port->stats.tx_ok_bytes;
> -		stats->MulticastFramesXmittedOK =3D port->stats.tx_multicast;
> -		stats->BroadcastFramesXmittedOK =3D port->stats.tx_broadcast;
> -		stats->FramesReceivedOK =3D port->stats.rx_ok_pkts;
> -		stats->OctetsReceivedOK =3D port->stats.rx_ok_bytes;
> -		stats->BroadcastFramesReceivedOK =3D port->stats.rx_broadcast;
> +		stats->FramesTransmittedOK =3D u64_stats_read(&port->stats.tx_ok_pkts);
> +		stats->OctetsTransmittedOK =3D u64_stats_read(&port->stats.tx_ok_bytes=
);
> +		stats->MulticastFramesXmittedOK =3D u64_stats_read(&port->stats.tx_mul=
ticast);
> +		stats->BroadcastFramesXmittedOK =3D u64_stats_read(&port->stats.tx_bro=
adcast);
> +		stats->FramesReceivedOK =3D u64_stats_read(&port->stats.rx_ok_pkts);
> +		stats->OctetsReceivedOK =3D u64_stats_read(&port->stats.rx_ok_bytes);
> +		stats->BroadcastFramesReceivedOK =3D u64_stats_read(&port->stats.rx_br=
oadcast);
>  	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
>  }
> =20
> @@ -2098,12 +2098,12 @@ airoha_ethtool_get_rmon_stats(struct net_device *=
dev,
>  		int i;
> =20
>  		start =3D u64_stats_fetch_begin(&port->stats.syncp);
> -		stats->fragments =3D hw_stats->rx_fragment;
> -		stats->jabbers =3D hw_stats->rx_jabber;
> +		stats->fragments =3D u64_stats_read(&hw_stats->rx_fragment);
> +		stats->jabbers =3D u64_stats_read(&hw_stats->rx_jabber);
>  		for (i =3D 0; i < ARRAY_SIZE(airoha_ethtool_rmon_ranges) - 1;
>  		     i++) {
> -			stats->hist[i] =3D hw_stats->rx_len[i];
> -			stats->hist_tx[i] =3D hw_stats->tx_len[i];
> +			stats->hist[i] =3D u64_stats_read(&hw_stats->rx_len[i]);
> +			stats->hist_tx[i] =3D u64_stats_read(&hw_stats->tx_len[i]);
>  		}
>  	} while (u64_stats_fetch_retry(&port->stats.syncp, start));
>  }
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 20e602d61e61..b2e9bd849f8b 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -215,24 +215,24 @@ struct airoha_hw_stats {
>  	struct u64_stats_sync syncp;
> =20
>  	/* get_stats64 */
> -	u64 rx_ok_pkts;
> -	u64 tx_ok_pkts;
> -	u64 rx_ok_bytes;
> -	u64 tx_ok_bytes;
> -	u64 rx_multicast;
> -	u64 rx_errors;
> -	u64 rx_drops;
> -	u64 tx_drops;
> -	u64 rx_crc_error;
> -	u64 rx_over_errors;
> +	u64_stats_t rx_ok_pkts;
> +	u64_stats_t tx_ok_pkts;
> +	u64_stats_t rx_ok_bytes;
> +	u64_stats_t tx_ok_bytes;
> +	u64_stats_t rx_multicast;
> +	u64_stats_t rx_errors;
> +	u64_stats_t rx_drops;
> +	u64_stats_t tx_drops;
> +	u64_stats_t rx_crc_error;
> +	u64_stats_t rx_over_errors;
>  	/* ethtool stats */
> -	u64 tx_broadcast;
> -	u64 tx_multicast;
> -	u64 tx_len[7];
> -	u64 rx_broadcast;
> -	u64 rx_fragment;
> -	u64 rx_jabber;
> -	u64 rx_len[7];
> +	u64_stats_t tx_broadcast;
> +	u64_stats_t tx_multicast;
> +	u64_stats_t tx_len[7];
> +	u64_stats_t rx_broadcast;
> +	u64_stats_t rx_fragment;
> +	u64_stats_t rx_jabber;
> +	u64_stats_t rx_len[7];
>  };
> =20
>  enum {
> --=20
> 2.51.0
>=20

--ONLtqPOzoLLC9PQz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaXKdlwAKCRA6cBh0uS2t
rB8qAP4i+/X9hpN9af9mEBX687u+dKpPq5MD8M5X4FtRR0VKXQEAnJujR6H52o/e
jpplETvS44lswKpFqQalJXJ1RTisqQY=
=slEj
-----END PGP SIGNATURE-----

--ONLtqPOzoLLC9PQz--

