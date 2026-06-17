Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83CBCD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmQvydvRCSP9YajH5ld+F3Yc26Xe0HLF5RsZ7TVJd7E=; b=j9VFPQZOjf8/e+U3qT+zjFZSrv
	zlNF0meFfOyXlsxhp233ieAuDIRLFdMW0BHgEG7V8EBaSi/ueLKkmyl6kzf3kBgd5ckjHFCJNxFno
	BIpb/DLlrtGXpFN0LcSBsXKHIvY3alC7OXu7us2T8Vf7qQy0SoguD8FtZkZpe0dcQZv9/4i3flagg
	bOyqNTomGV4Jo8STZwM+N+TKvAwcMS0LlIkJ7fkUhx8Cx2wblhgyJQ8vYfRGljCyEZu68APnMmAdy
	H5PYYbqvblUhSOrxuaVFQJoQRk/2SIwhTIDIaAZrSuyNIPSV+i2ZkL1tHQRMFIbpRKheeaWOHE93A
	guvRCnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkPk-0000000Gmxi-3TxS;
	Wed, 17 Jun 2026 07:10:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkPj-0000000GmxU-4Avw;
	Wed, 17 Jun 2026 07:10:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18A2860128;
	Wed, 17 Jun 2026 07:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B251F000E9;
	Wed, 17 Jun 2026 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781680218;
	bh=pmQvydvRCSP9YajH5ld+F3Yc26Xe0HLF5RsZ7TVJd7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EwqGOfRWtC6kstEhI2fb+S8YM5jN7vXrtjG5NwDLQijHjwA1pi+y9cSljQFwmOWfC
	 VZS86mHf2++UW9WJAgcOEN+KFaodqzputN9g8XhR1jOCQDN3xpPEvtLLGCvfVtiFPl
	 0a4TPuBO4WH6WRBg1UvYpYXzTQ/yVTDd3/Houc4qH+m/hIYAb8ayrd+f2pTzRXQxLd
	 Egm9zqq100jqaxeUOIxmzScvYHMPWi+KE38MI3ZajURWnZ/SLAffMF/hzijf2HCEgR
	 JEP2Icqa3HqAOXwWk/G+deywp3Vyed6p4PNaWSCSQaY2VUe0ooIB+JuaueJJOzEF0J
	 XrLTlnfOGZrKQ==
Date: Wed, 17 Jun 2026 09:10:16 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: Fix TX scheduler queue mask loop upper
 bound
Message-ID: <ajJIWMs4dVbfkHZ5@lore-desk>
References: <178166704952.2212140.11002626760717132754@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3atRIyxmMYcc7hV5"
Content-Disposition: inline
In-Reply-To: <178166704952.2212140.11002626760717132754@gmail.com>
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


--3atRIyxmMYcc7hV5
Content-Type: text/plain; charset=us-ascii
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
> Fix by using AIROHA_NUM_QOS_QUEUES (8) as the loop upper bound.
>=20
> Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Wayen Yan <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11cd7..a1eda13400 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2217,7 +2217,7 @@ static int airoha_qdma_set_chan_tx_sched(struct net=
_device *dev,
>  	struct airoha_gdm_port *port =3D netdev_priv(dev);
>  	int i;
> =20
> -	for (i =3D 0; i < AIROHA_NUM_TX_RING; i++)
> +	for (i =3D 0; i < AIROHA_NUM_QOS_QUEUES; i++)
>  		airoha_qdma_clear(port->qdma, REG_QUEUE_CLOSE_CFG(channel),
>  				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));

Even if the current codebase supports just AIROHA_NUM_QOS_CHANNEL (4), the =
hw
exposes 32 hw QoS channels (AIROHA_NUM_TX_RING). Here we are just clearing =
the
configuration, so I guess the current implementation is correct.

Regards,
Lorenzo

> =20
> --=20
> 2.51.0
>=20
>=20

--3atRIyxmMYcc7hV5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajJIWAAKCRA6cBh0uS2t
rCpKAP4rBsCxkrXvSIxF8WbcxiMTBXD2SHgLLgWwzs8jVDSfDwEAqMrHpdsQRrOv
LR2RcnPVRhLpqq9eX47Slb8U4831bgE=
=uJkH
-----END PGP SIGNATURE-----

--3atRIyxmMYcc7hV5--

