Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303E5CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 08:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BsbZwfZNV4qPPi4CXgdcpJbR4FJNEYIPAmx8W44Sls=; b=P5IuVliXNhzm0VKNKUImS0dF+v
	sjkVCFZ6JxDDElXVbvsq534Xs2y8fjfTLGQhOb/HX0XXbfizUVapvb8p3xW6TpNlafpXpJjpNV3fj
	SJ9ir6zL7wKdchWjMEdTHoHN7uCrkZnNgNNYgR5RYXJguozLxl9yzx3kCyw4I8HMEdLP3eRF7N6Ur
	XgNcVn7aUuDMB8AtP2ezLPw3hwDNx3idzvw+OmTP7Jqo0fJmcQAOJkk9DM8M4+rtYKG0Qjbk30hpj
	m2dFaHm5YUREbi3S6YoA/ivAsdJrvwUxttrcVXFliHET59Jzt4NC6zDvmW3zRzq313nKavyf2JwIC
	L0bxqbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYfum-0000000Cobg-1wxl;
	Sun, 14 Jun 2026 08:09:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYfuk-0000000CobX-34e8;
	Sun, 14 Jun 2026 08:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D75D43405;
	Sun, 14 Jun 2026 08:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53971F000E9;
	Sun, 14 Jun 2026 08:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781424591;
	bh=6BsbZwfZNV4qPPi4CXgdcpJbR4FJNEYIPAmx8W44Sls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PI+XcZBdThtyTLGvfKqWZH3YEgYuEwXy5bZ9WLjLhJx8chGn+7JmYa/JEpCnu6J8c
	 lR6gcaG4DCAMGf0JF5RcZv2juqNo5CR79HD2fdcf7OtA42j774Kxy2WzAqqmh2PvdQ
	 3LfwVsv954g/IWlsOT8ssC/6ReBy/wNb/jIGrxK9hE+lxyMldJ1FsQNFq4iQQ9SDzh
	 SutyimnvvXWeuks69R1W9wPZexFuTofaU2BOYusGMr0896BmVcrRBcOJr+v+98CEaO
	 t2ki9j6OC0PZU5Ca9bdvEwadD0yahF5EXsEj0MFpZYaHj3lu9oXWLf0NhsA16AV5tx
	 HGdGGUhUtZ8jQ==
Date: Sun, 14 Jun 2026 10:09:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix skb->priority underflow in
 airoha_dev_select_queue()
Message-ID: <ai5hzG8knT0xVEu6@lore-desk>
References: <6a2de8c5.2c570c9e.53b1a.0e1b@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gewW9LJ9Yc0z9m/c"
Content-Disposition: inline
In-Reply-To: <6a2de8c5.2c570c9e.53b1a.0e1b@mx.google.com>
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


--gewW9LJ9Yc0z9m/c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_dev_select_queue(), the expression:
>=20
>   queue =3D (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;
>=20
> implicitly converts to unsigned arithmetic: when skb->priority is 0
> (the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
> and UINT_MAX % 8 =3D 7, routing default best-effort packets to the
> highest-priority QoS queue. This causes QoS inversion where the
> majority of traffic on a PON gateway starves actual high-priority
> flows (VoIP, gaming, etc.).
>=20
> Fix by guarding the subtraction: when priority is 0, map to queue 0
> (lowest priority), otherwise apply the original (priority - 1) % 8
> mapping.
>=20
> Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
> Signed-off-by: Wayen <win847@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11cd7..d476ef83c3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1933,7 +1933,7 @@ static u16 airoha_dev_select_queue(struct net_devic=
e *dev, struct sk_buff *skb,
>  	 */
>  	channel =3D netdev_uses_dsa(dev) ? skb_get_queue_mapping(skb) : port->i=
d;
>  	channel =3D channel % AIROHA_NUM_QOS_CHANNELS;
> -	queue =3D (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
> +	queue =3D skb->priority ? (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES :=
 0;
>  	queue =3D channel * AIROHA_NUM_QOS_QUEUES + queue;
> =20
>  	return queue < dev->num_tx_queues ? queue : 0;
> --=20
> 2.51.0
>=20
>=20

--gewW9LJ9Yc0z9m/c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCai5hzAAKCRA6cBh0uS2t
rEW4AQDgDl+fmWFCDiFdPQD/bxbm1gZCWL62t9HyYgsUbdaSngD8Cbcyxxum1E3r
ttz6ZZwzymUojIGQfi+SAmQN2pIR1QA=
=7neh
-----END PGP SIGNATURE-----

--gewW9LJ9Yc0z9m/c--

