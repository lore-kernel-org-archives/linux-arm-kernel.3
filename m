Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFB5CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpXWct/ksH4wphVNWjqFdoJ25adS8L/TJ0QkPKa90Ek=; b=2jk+kASMvcgxpk9e8GybYF1Lxx
	P1uifStqLqPSJPu8rb+QK65aF4lnXRx2Pm8sjgxaloclOyjo5eVSfSergtQfhwFHnmA03KEWCkRNl
	qd57XROK/u+S8PJuDH68e6g7lypbOb4r36OrLI93efZtwz4DoqHM4ryiXC20A7xXKBVk35mAfICHg
	h+ng2/BVFaeKSCflIK7BWmwWmtJfZt9wfDgeNQNo7uJHMXK5o+M8ZLPEoAVRzDbZQ1AaS0qrCZ+ne
	MuWLEl7ikQjpO9Ixp7gF/ExAW5W7wtGkx12m12rIffmYmLqcJMr4mi2hpPClP3TI8pqqsTNxSPRCT
	VRqq5DXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXYw-00000002Lge-21Yz;
	Fri, 19 Jun 2026 11:39:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXYv-00000002LgV-1aLq;
	Fri, 19 Jun 2026 11:39:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18D31417B8;
	Fri, 19 Jun 2026 11:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714621F000E9;
	Fri, 19 Jun 2026 11:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781869145;
	bh=kpXWct/ksH4wphVNWjqFdoJ25adS8L/TJ0QkPKa90Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VVri5rZca1NYzdVF7Jk2qeqaI4yYUI0BXeAeXmut2STe8wqQJFkRnpLEf/EFNGJSm
	 LrgMwA0gJfyKyWzXk/12Xbfd9gQUOBNd/TxjUgJiWhIdkvVheTKEzTLe7eXFnjx8Zp
	 LmXli67akG+9oNCDvDyfJuay1MKL1Zy5xSQEagGa9c/sAjp3kCabCj7YqAgHZxb+jc
	 3nLKwiQtgmbYX8OdmAhjdqzhZ2RC3KSYcCp5hMhwBrOQquEMVB7wVOgtvoOumfeBXf
	 X9wsz+6xWKfvHgTEmw1v1/f/iREfnC1r+pWXxNlmgI7EYn6St5e1mwWnQmkPB7IKbT
	 euLgifYEyXk6A==
Date: Fri, 19 Jun 2026 13:39:02 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2] net: airoha: Fix TX scheduler queue mask loop
 upper bound
Message-ID: <ajUqVknmRq-4GHkJ@lore-desk>
References: <178185574223.2378148.13454900445528174929@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wHUdDSUz+JkqUMMA"
Content-Disposition: inline
In-Reply-To: <178185574223.2378148.13454900445528174929@gmail.com>
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


--wHUdDSUz+JkqUMMA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_qdma_set_chan_tx_sched(), the loop clearing queue mask was
> using AIROHA_NUM_TX_RING (32) instead of AIROHA_NUM_QOS_QUEUES (8).
>=20
> Each channel has 8 queues, and TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i)
> computes BIT(i + (channel * 8)). With i ranging 0..31, this causes:
> - channel 0: clears bit 0..31 (all 4 channels) instead of 0..7
> - channel 1: clears bit 8..31 (channels 1-3) instead of 8..15
> - channel 2: clears bit 16..31 (channels 2-3) instead of 16..23
> - channel 3: clears bit 24..31 (channel 3 only) - correct by accident
>=20
> While BIT(32+) on arm64 produces 64-bit values truncated to 0 in u32
> mask parameter, the loop still incorrectly clears queues within the
> same channel beyond queue 7.
>=20
> Even though this is functionally harmless (the register resets to 0
> and is only ever cleared, never set =E2=80=94 so clearing extra bits is a
> no-op), the loop bound is semantically wrong and should be fixed for
> correctness and clarity.
>=20
> Fix by using AIROHA_NUM_QOS_QUEUES (8) as the loop upper bound.
>=20
> Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Wayen Yan <win847@gmail.com>
> ---
> Changes in v2:
> - Add Lorenzo's Acked-by tag.
> - Clarify in commit message that this is semantically wrong but
>   functionally harmless (register resets to 0, only cleared), as
>   Lorenzo pointed out in review.
> - Rebase on current net tree.
>=20
> Link: https://lore.kernel.org/netdev/ajJIWMs4dVbfkHZ5@lore-desk/
> Link: https://lore.kernel.org/netdev/CAL_ptrs6J3Ryw_4mVTq5VgzkB4RreF5S0hu=
HyLvd9YwWr1m6jAA@mail.gmail.com/
>=20
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index d0c0c0ec8a..ca77747b44 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2212,7 +2212,7 @@ static int airoha_qdma_set_chan_tx_sched(struct net=
_device *dev,
>  	struct airoha_gdm_port *port =3D netdev_priv(dev);

it seems you have not rebased on top of net tree.

Regards,
Lorenzo

>  	int i;
> =20
> -	for (i =3D 0; i < AIROHA_NUM_TX_RING; i++)
> +	for (i =3D 0; i < AIROHA_NUM_QOS_QUEUES; i++)
>  		airoha_qdma_clear(port->qdma, REG_QUEUE_CLOSE_CFG(channel),
>  				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));
> =20
> --=20
> 2.51.0
>=20

--wHUdDSUz+JkqUMMA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajUqVgAKCRA6cBh0uS2t
rP/SAPoDG+CtUOFublyI3uoCmooVJ0WP3YmpXBkAY+jo5hzPLgEAh9y8M9BQpUwj
MfPZagIteB1QEb+rf7nFp8POMPVnEAc=
=Abaq
-----END PGP SIGNATURE-----

--wHUdDSUz+JkqUMMA--

