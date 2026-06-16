Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3579CCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17RgpFCBH4m8pJlxhHaaqvMX7DlUgffBsaUwblhbOrk=; b=KldpdL1Fl+G36km02JxRfN/sZ7
	Zv2s6esGzTzImbOVRRhzer5G8/bkSy2wfx6J90qpmGJVXcekEjcUnhxysi7C40u3JW0+vZmyKWMLy
	m+/4sX00SHKwbvOtMNjuHO+DYuY266Ltvf/pzCkVHQHJeQ3roDn3XxCYf9quNQtvDUzqtcOYHs5ob
	hufhyuJhpHwLyUyZnfwsZdOQHFGCyy2oRwN84w8r3STilW0x0bR0TQxU78+DTCvqeAp6c4IrBpwsS
	c05rSrYQ9C7dZWbgqM/tdQVwOKJs/JyqMlnoDct9lt6XQRQwHeeqQKXF0hjcMWYBLw2xuRQyodtiU
	BSnoDctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT0d-0000000FlZ0-15iC;
	Tue, 16 Jun 2026 12:35:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT0a-0000000FlYg-396l;
	Tue, 16 Jun 2026 12:35:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA35960132;
	Tue, 16 Jun 2026 12:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64041F000E9;
	Tue, 16 Jun 2026 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781613311;
	bh=17RgpFCBH4m8pJlxhHaaqvMX7DlUgffBsaUwblhbOrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BRZ60BWeV+DWL3afFYfSit+P84pepfep1y0QrI79qYne7dzlGesvYs8bcCBcNBlCQ
	 XQ6tw0vCVxm25BFd9qdSagQCsVfeGEoyVFgczmuPelnLFRg+xk8bmKytUI3EOsJsSG
	 2LvYTL4xE1WTSRravroMwuy2mngWV7PHghZZySPHrpo1N0Os0dv/gUC5Qo3AJj0OO4
	 WwK7c30EW+wqXbdEyMPhKjHxeZv3zDH/xErVUBuHbxQpvLv2vDbyRgFRsL8dAKq/V6
	 qGZtFEEbqqxf64k0d0idku3qvQp6gIQkkKZ8xjln7g8VUpYTARr/QPB1bdWLz/4PqF
	 +H08D0KyfSa3Q==
Date: Tue, 16 Jun 2026 14:35:09 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] [net] net: airoha: Fix QoS counter configuration for
 Tx-fwd channels
Message-ID: <ajFC_W0RT3Nzlpjb@lore-desk>
References: <178161132384.2164449.18407700117859190327@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KXA7XktxuGW70IKZ"
Content-Disposition: inline
In-Reply-To: <178161132384.2164449.18407700117859190327@gmail.com>
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


--KXA7XktxuGW70IKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_qdma_init_qos_stats(), the Tx-fwd counter was incorrectly
> using register index (i << 1) instead of ((i << 1) + 1). This caused
> the Tx-fwd configuration to overwrite the Tx-cpu configuration for
> each QoS channel, resulting in incorrect QoS statistics.
>=20
> Fix by using the correct register index ((i << 1) + 1) for Tx-fwd
> counter configuration.
>=20
> Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
> Signed-off-by: Wayen Yan <win847@gmail.com>

Is this a patch you already sent? IIRC I have acked it.

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11cd7..329988a840 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1256,7 +1256,7 @@ static void airoha_qdma_init_qos_stats(struct airoh=
a_qdma *qdma)
>  			       FIELD_PREP(CNTR_CHAN_MASK, i));
>  		/* Tx-fwd transferred count */
>  		airoha_qdma_wr(qdma, REG_CNTR_VAL((i << 1) + 1), 0);
> -		airoha_qdma_wr(qdma, REG_CNTR_CFG(i << 1),
> +		airoha_qdma_wr(qdma, REG_CNTR_CFG((i << 1) + 1),
>  			       CNTR_EN_MASK | CNTR_ALL_QUEUE_EN_MASK |
>  			       CNTR_ALL_DSCP_RING_EN_MASK |
>  			       FIELD_PREP(CNTR_SRC_MASK, 1) |
> --=20
> 2.51.0
>=20
>=20

--KXA7XktxuGW70IKZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajFC/QAKCRA6cBh0uS2t
rP97AQDtEwdCs3IEnZIgHzLnaLEcSm4lg1hkzIvKxmjeodohIQEAtMfzpjcqFQ7O
vwSeteUqDl0KbX22ioTCherCWeKZPAA=
=1Wk4
-----END PGP SIGNATURE-----

--KXA7XktxuGW70IKZ--

