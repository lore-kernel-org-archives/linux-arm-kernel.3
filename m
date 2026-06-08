Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A36CD8CA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOAG6RO9IE4nsTI/RS9XCESeKjsw9dzfXz32mptaQog=; b=W9rk619Z+nNAt9En3MQQajQR+f
	mgy6LwreAhGITIsoZMRbWz/ww7vvVzilqvqYovJ+wneC7EkauuApBOt28/tk4t8ghWzjTp0vDYiL0
	0/x5HGN55rXxF2ScGTTkLIvGlMjDOECRVqxpjww9azSxqcd/YcZva9rrqGNzE3U3clNOdwuhfxI8Z
	bL6Sy27Anhcd9aPljFXtqn7+OE6TNRFb+Q7AYLRGQXSX05iVyApdTOuWO30AKOAVldmkqi06y3lcO
	Ay3kR1bauABz7D27ivfbs0YF0PgVBA0QTmErtTSiX5p5Gurj/K8CpXih9GfV8EAq2PMlnC+Bh4BZW
	zGU8nYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWID-00000003BLW-2hjl;
	Mon, 08 Jun 2026 09:29:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWIC-00000003BLN-432R;
	Mon, 08 Jun 2026 09:29:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4ABDE6001D;
	Mon,  8 Jun 2026 09:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CB01F00893;
	Mon,  8 Jun 2026 09:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780910952;
	bh=fOAG6RO9IE4nsTI/RS9XCESeKjsw9dzfXz32mptaQog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j51Qiku0GklR6YKD+8NSuaIOjXBwv8dB96gffFhJ19vSdtctstN0LUdBBn1ovJzj8
	 rI/KOmk9Wz5Zdl0Nn1RA0KbKwXe2Sw5GqX8gikRsYI/01PYmdhFqAygt0u895iZRCA
	 hzqWFdCTbLAHUTsP/mpt5wUoqZJAhZ94j/BfmDZgnzOg1seKGA1CZe75bDxDLnhdqO
	 2lVPpCJ0zaNrEuUTlJZX9kSMLWBhRCrisiaqpc0mxv1BFIMM3EEVvb/gEBP+jK0Fnh
	 M2qILM6BArN0gG5obghgg0qdho1D+p3VX7T4Sk3SAxtc1BZa6eV0weNcc7Q2MM0AUl
	 s4JfELEaQy2cA==
Date: Mon, 8 Jun 2026 11:29:09 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Use int instead of atomic_t for
 qdma users counter
Message-ID: <aiaLZVvfsbj3zTgr@lore-desk>
References: <20260606-airoha_qdma_users-no-atomic-v1-1-86e2d6a1bfaf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m6PvL9voaHHuHzEe"
Content-Disposition: inline
In-Reply-To: <20260606-airoha_qdma_users-no-atomic-v1-1-86e2d6a1bfaf@kernel.org>
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


--m6PvL9voaHHuHzEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> QDMA users counter is always accessed holding RTNL lock so we do not
> require atomic_t for it.

Please drop this patch since I need to modify it to address Andrew's request
about LAN/WAN configuration.

Regards,
Lorenzo

>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
>  drivers/net/ethernet/airoha/airoha_eth.h | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 5a8e84fa9918..a5fe08864fa3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1809,7 +1809,7 @@ static int airoha_dev_open(struct net_device *netde=
v)
>  	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
>  			GLOBAL_CFG_TX_DMA_EN_MASK |
>  			GLOBAL_CFG_RX_DMA_EN_MASK);
> -	atomic_inc(&qdma->users);
> +	qdma->users++;
> =20
>  	if (!airoha_is_lan_gdm_dev(dev) &&
>  	    airoha_ppe_is_enabled(qdma->eth, 1))
> @@ -1863,7 +1863,7 @@ static int airoha_dev_stop(struct net_device *netde=
v)
>  					    REG_GDM_FWD_CFG(port->id),
>  					    FE_PSE_PORT_DROP);
> =20
> -	if (atomic_dec_and_test(&qdma->users)) {
> +	if (!--qdma->users) {
>  		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
>  				  GLOBAL_CFG_TX_DMA_EN_MASK |
>  				  GLOBAL_CFG_RX_DMA_EN_MASK);
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 8f42973f9cf5..e89c2dff411f 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -525,8 +525,7 @@ struct airoha_irq_bank {
>  struct airoha_qdma {
>  	struct airoha_eth *eth;
>  	void __iomem *regs;
> -
> -	atomic_t users;
> +	int users;
> =20
>  	struct airoha_irq_bank irq_banks[AIROHA_MAX_NUM_IRQ_BANKS];
> =20
>=20
> ---
> base-commit: 903db046d5579bef0ea699eae4b279dd6455fc9f
> change-id: 20260606-airoha_qdma_users-no-atomic-0750cc2b42f1
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--m6PvL9voaHHuHzEe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiaLZQAKCRA6cBh0uS2t
rO+6APwLDYmZI/JomfAanIi6AplM1iKDlhcwYtTDEJr1cs8BdgD/eLsP003LFzDw
Bpn+4cLIONPJvzfc5X7KJC8GwM94vQc=
=VKAi
-----END PGP SIGNATURE-----

--m6PvL9voaHHuHzEe--

