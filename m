Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20B2F99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mm/pakeAzupfO1i5sqZ0RGC2KTrwNYJUHugBC8VAOfk=; b=zFRhUqoimjGl+JRttHIYyfk2i5
	W8fOPT2wQoQSiNIcluQasBy3VNdm7/kPKNiJ9xa7ssiWQaTqn1J8oWcVSS6CBNLAS0PbWoP6rXUUP
	ENsEFh+P3y4sBNU9WVw2NOGa6BTNu6Ke5GP9BShZQIY/gz5IHOh9bWdYRyFN2MRN82Dd1O9r+mYuT
	eE4owoVwIy39fv1jupa0WMoXGt5D5fs6Rl6DczGVNbb3j/qFvs36mAt3BtajaPaQmeaZ4YtD/19YQ
	dCu7LOR/OVBnj17CGZF66OJwArzaVabV1WyIcQZvXAEWQBctEWoKfazSmXeESDRjjlSsbn01qKlIa
	IrrBAxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFoqa-0000000BBcO-2vAv;
	Thu, 23 Apr 2026 07:51:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFoqV-0000000BBba-3FBj;
	Thu, 23 Apr 2026 07:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECC484437F;
	Thu, 23 Apr 2026 07:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78698C2BCB2;
	Thu, 23 Apr 2026 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776930694;
	bh=rdiTke8XyX0S2GN9uBMDJp0R3HUEvjW7NtSpQ2rhGKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NiS3vX7FA0vFcZHdxMZ/EqcQFsnGykfFjh6Z+n41wUOhfrGEmXu1A8GOMpmxEcYS0
	 A+UD0jMdRL4gNUSrevsxzuPsQ0fKhQjzP/WBF5QGMBqpxRe2IZVcKDXLeF8hEKrazt
	 3VvCPzHUpF2F5M5KaGIVteQ8Z8R0QiL/V148XkTj5r+Olgy+jOWG4PnkClC47ecRIB
	 Ric0d45vDj/x7Ek6/Y3MNrNWggMgH7WM7dx3b20trZ7W9Zqn1qhc4Eo5UwZZCZyGQP
	 7d/tha8OVklBWmRoaA+TtwLM4frNnYNH1DwbFuZRv0C14KUOrTunxZOjMMCsI3SgXd
	 AVv9E8+NpsZ/A==
Date: Thu, 23 Apr 2026 09:51:32 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Do not wake all netdev TX queues in
 airoha_qdma_wake_netdev_txqs()
Message-ID: <aenPhDotJMJ1pxG-@lore-desk>
References: <20260421-airoha-wake_netdev_txqs-optmization-v1-1-e0be95115d53@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XIMRgkZKP4wfW4rh"
Content-Disposition: inline
In-Reply-To: <20260421-airoha-wake_netdev_txqs-optmization-v1-1-e0be95115d53@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_005135_852988_82AB392E 
X-CRM114-Status: GOOD (  22.09  )
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


--XIMRgkZKP4wfW4rh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Do not wake every netdev TX queue across all ports sharing the QDMA
> running netif_tx_wake_all_queues routine in airoha_qdma_wake_netdev_txqs()
> but only the ones that are mapped the specific QDMA stopped hw TX queue.
> This patch can potentially avoid waking already stopped netdev TX queues
> that are mapped to a different QDMA hw TX queue.
> Introduce airoha_qdma_get_txq utility routine.
>=20
> Fixes: b94769eb2f30 ("net: airoha: Fix possible TX queue stall in airoha_=
qdma_tx_napi_poll()")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 19 +++++++++++++++----
>  drivers/net/ethernet/airoha/airoha_eth.h |  5 +++++
>  2 files changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 19f67c7dd8e1..2ca569501045 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -847,13 +847,24 @@ static void airoha_qdma_wake_netdev_txqs(struct air=
oha_queue *q)
>  {
>  	struct airoha_qdma *qdma =3D q->qdma;
>  	struct airoha_eth *eth =3D qdma->eth;
> -	int i;
> +	int i, qid =3D q - &qdma->q_tx[0];
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
>  		struct airoha_gdm_port *port =3D eth->ports[i];
> +		int j;
> +
> +		if (!port)
> +			continue;
> =20
> -		if (port && port->qdma =3D=3D qdma)
> -			netif_tx_wake_all_queues(port->dev);
> +		if (port->qdma !=3D qdma)
> +			continue;
> +
> +		for (j =3D 0; j < port->dev->num_tx_queues; j++) {
> +			if (airoha_qdma_get_txq(qdma, j) !=3D qid)
> +				continue;
> +
> +			netif_wake_subqueue(port->dev, j);
> +		}
>  	}
>  	q->txq_stopped =3D false;
>  }
> @@ -1965,7 +1976,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  	u16 index;
>  	u8 fport;
> =20
> -	qid =3D skb_get_queue_mapping(skb) % ARRAY_SIZE(qdma->q_tx);
> +	qid =3D airoha_qdma_get_txq(qdma, skb_get_queue_mapping(skb));
>  	tag =3D airoha_get_dsa_tag(skb, dev);
> =20
>  	msg0 =3D FIELD_PREP(QDMA_ETH_TXMSG_CHAN_MASK,
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 87b328cfefb0..c3ea7aadbd82 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -631,6 +631,11 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 m=
ask, u32 val);
>  #define airoha_qdma_clear(qdma, offset, val)			\
>  	airoha_rmw((qdma)->regs, (offset), (val), 0)
> =20
> +static inline u16 airoha_qdma_get_txq(struct airoha_qdma *qdma, u16 qid)
> +{
> +	return qid % ARRAY_SIZE(qdma->q_tx);
> +}
> +
>  static inline bool airoha_is_lan_gdm_port(struct airoha_gdm_port *port)
>  {
>  	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
>=20
> ---
> base-commit: a663bac71a2f0b3ac6c373168ca57b2a6e6381aa
> change-id: 20260421-airoha-wake_netdev_txqs-optmization-65171ce4ebad
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

commenting on Sashiko retported issues:
https://sashiko.dev/#/patchset/20260421-airoha-wake_netdev_txqs-optmization=
-v1-1-e0be95115d53%40kernel.org

- Can this cause an infinite NETDEV_TX_BUSY livelock when a QDMA hardware q=
ueue is full?
  The issue is already fixed in the following patch:
  https://patchwork.kernel.org/project/netdevbpf/patch/20260421-airoha-fix-=
bql-v1-1-f135afe4275b@kernel.org/

Regards,
Lorenzo

--XIMRgkZKP4wfW4rh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaenPhAAKCRA6cBh0uS2t
rHJIAP0RzHPxXsooTEbHddLt9AmAIV7hyhy8/FTGlixGmdPCaAD8CiQD9SYwaFzL
ze4QoY9encRv73xcr4oY4lM9zMag5gc=
=Z0sJ
-----END PGP SIGNATURE-----

--XIMRgkZKP4wfW4rh--

