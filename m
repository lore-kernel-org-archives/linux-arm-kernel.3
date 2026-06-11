Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82D7CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcHCZxJjnd2NbJe+vF8vVoiVeFGscr8raKdpJQPi65M=; b=UGIJ7kCR2HYaASL9cEdTYxbZl9
	V5fKCSdk/o4pUWsb4VP+1Sy/c0ep0NDDIjh6ZhR+0PMwXcG7wN4m0DSe/cq/psqhbs0L1wGdp7UU/
	fLzV9CG0wEwA7rk2dHHMQe+lPGP2D380ZPNL8gRe7ZGw8EnfJVBsr+tIY5r0aHGsIDZ7Y+tOwGIpj
	uFIMVZVXf/afUYV4Il3jr0iMWVXXvPTcESjNP9PfVFjyel5CrAJLShOJB9OCEaDOCqrBwrWkp5Ju4
	tQwX64CbYTcwP9Jxbd+3i77zv6cfUe1Jvp4EvFgRbMcBeurir+/SUYosuyzN0jFjPFZ0hYFzW3d9c
	o/6MHu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcEH-00000009BSw-09UH;
	Thu, 11 Jun 2026 10:01:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcEF-00000009BSI-1sZK;
	Thu, 11 Jun 2026 10:01:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1A4043AB4;
	Thu, 11 Jun 2026 10:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018351F00898;
	Thu, 11 Jun 2026 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781172098;
	bh=gcHCZxJjnd2NbJe+vF8vVoiVeFGscr8raKdpJQPi65M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UjRz1M0qJTomOYzXKVoiKZpGS9MtDg+JTdxRbI7OSGggZlawjkxiPNaYgSRLH9uej
	 /EFORBduBvm/tIxZxbEy3VZQYyB3qYYlFWBdq2p6EtO7SGNMJjNZ0eynsrFSR/RAi5
	 FaMbcNHuRd3MbNISJrWYTKOF8RjqXFmuTO6spgu+irR0vZS2jztReOCY8Xlkxl19z8
	 mlbKVN61TdcveB4j+yZH7xFaZ4NiY5X8TsJov6woaEbutqkSYb+Wq9qGSEklL6PAcw
	 AkuYVDx0uoB0l+PXarBoe9ivvReSp32ee3NRfXsE50ny/42Xb2A+Aau+SJo3UdCVqj
	 snTxA7cyw+eZQ==
Date: Thu, 11 Jun 2026 12:01:36 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Brown Huang <brown.huang@airoha.com>,
	Leto Liu <Leto.Liu@airoha.com>
Subject: Re: [PATCH net] net: airoha: Add retry mechanism to
 airoha_qdma_set_trtcm_param()
Message-ID: <aiqHgJ6FiAMu5gmF@lore-desk>
References: <20260608-airoha_qdma_set_trtcm_param-retry-fix-v1-1-f07704f0d8c5@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EQw5C5lY17IuMX0g"
Content-Disposition: inline
In-Reply-To: <20260608-airoha_qdma_set_trtcm_param-retry-fix-v1-1-f07704f0d8c5@kernel.org>
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


--EQw5C5lY17IuMX0g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Brown Huang <brown.huang@airoha.com>
>=20
> CPU accesses QDMA via the bus. When multiple modules are using the bus
> simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
> resulting in QDMA configuration failures and potentially causing packet
> transmission issues. In order to mitigate the issue, introduce a retry
> mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
> configuration is correctly applied to the hardware.
>=20
> Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Brown Huang <brown.huang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index eab6a98d62b9..aaf7d8c8ccd3 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2493,14 +2493,23 @@ static int airoha_qdma_set_trtcm_param(struct air=
oha_qdma *qdma, int channel,
>  		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
>  		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
>  		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
> +	int i;
> =20
> -	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
> -	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
> +	for (i =3D 0; i < 100; i++) {
> +		u32 data;
> =20
> -	return read_poll_timeout(airoha_qdma_rr, val,
> -				 val & TRTCM_PARAM_RW_DONE_MASK,
> -				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
> -				 qdma, REG_TRTCM_CFG_PARAM(addr));
> +		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
> +		wmb();
> +		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
> +		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
> +						mode, &data, NULL))
> +			continue;
> +
> +		if (data =3D=3D val)
> +			break;
> +	}
> +
> +	return i =3D=3D 100 ? -EBUSY : 0;
>  }
> =20
>  static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int ch=
annel,
>=20
> ---
> base-commit: 4aacf509e537a711fa71bca9f234e5eb6968850e
> change-id: 20260605-airoha_qdma_set_trtcm_param-retry-fix-a9d2956b9b2f
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>

I think the issue reported by sashiko in [0] is valid and it needs to be
addressed in v2, but since I am not the original author of the patch, I will
let Brown or Leto comment on it.

Regards,
Lorenzo

[0] https://sashiko.dev/#/patchset/20260608-airoha_qdma_set_trtcm_param-ret=
ry-fix-v1-1-f07704f0d8c5%40kernel.org

>=20

--EQw5C5lY17IuMX0g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiqHgAAKCRA6cBh0uS2t
rF+rAQC5+Y/anvlgMyJQaTiGnt7sLIX58e6BVmfSU1Wj1RY8EgEAsHsD6b/QSjTQ
w5el1GDLGvLDhPi7PhOKD4bBFqIUjgA=
=HrEl
-----END PGP SIGNATURE-----

--EQw5C5lY17IuMX0g--

