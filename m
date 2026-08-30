Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF8C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 14:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqEbBnLXoNwaBEWPaO2q0zQzfK0jpS+p/vOgbxYYs/o=; b=IJ2kpZRs/paX9E7pCZdEcTVEXM
	09udlbiYlUhhDPG4i2tiarocOghMlYCz3uD2LZQ5g4XDa2IA0Hcn2xfpc6uV27zb0xp5GE9rJOx7j
	n9Bo7c0anwER5W9iL0NgTSAkT9UO+EY7G3jx4eVI/4i9cSJJbQtn6+l+QRuY8wPs1tB5EtF6g4txo
	we1hiaB5tgFPDqg4Pn21/3n3n4gsL1JIcUTziVTZPo17MNvvKGmAJgbK7mXTKF4H6nAeqNIjLWdPs
	ydpN69Pt+kUYvL8Ne9NAQsLBxDizBa/nIVVM1EYDmvI9c8tQQbPoJ96jrvFGmTe2ilp1vKebGDJQb
	I48SLxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gSp-00000007nmv-03wl;
	Sun, 30 Aug 2026 14:24:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gSo-00000007nmh-3A0n;
	Sun, 30 Aug 2026 14:24:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E2024328E;
	Sun, 30 Aug 2026 14:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CD81F000E9;
	Sun, 30 Aug 2026 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788099890;
	bh=mqEbBnLXoNwaBEWPaO2q0zQzfK0jpS+p/vOgbxYYs/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LLsulbk2oar40fID4XXO4xBcAP845FYaGiQG0dLtUea4yehFsWcVnAXCsJVYnbTaj
	 suacRwAR/OtcA7vrq71ZDagQPpZBhbvjlEFClPsZsq3eJFOMiWc3qhTF6Ni4YsEoij
	 lRGiZ1t1CKwss0ZunDyELGW9NEvoQTsDI/IKSWRnped/CRsxYGOw1TAdQ/WZdjMBO3
	 TvqfTTD+xTiCV6YlYNdLWkB1kIHYbw1Lh0auNGWTHkU3ObozLMvaZuqOXDpKxDO8N6
	 5AbgaMgdm0JZ4GkQO+TL1OlrquUomLwgEm50WNKIJtdPaoAcC3eqlFEKxUJ0caMySL
	 ZsMKrTeOx+sMQ==
Date: Sun, 30 Aug 2026 16:24:47 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/4] net: airoha: grow RX ring 4 to 128
 descriptors
Message-ID: <apQ9L3D3Kvj2b7T-@lore-desk>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
 <20260830095717.37218-5-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TFdZvCNJZ0cB9Z77"
Content-Disposition: inline
In-Reply-To: <20260830095717.37218-5-sochnev.v.74@gmail.com>
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

--TFdZvCNJZ0cB9Z77
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Ring 4 is the shared "force to CPU" ring for a wide set of protocols
> (BOOTP, PPPoE Discovery, PPP LCP/IPCP/CHAP/IPv6CP/PAP, ISAKMP, DHCPv6,
> SIP, LLDP, ...) and currently falls into the 16-descriptor default in
> RX_DSCP_NUM(), same as most other non-hashed rings. The hw completion
> race recovered by airoha_qdma_rx_check_stall()/rx_recover_work() in
> the previous commits appears strongly correlated with a ring going
> from idle to receiving its first frame(s) - exactly the access pattern
> this shared ring sees under protocol negotiation bursts. Give it the
> same 128-descriptor allowance already used for rings 2/11/15, matching
> the other rings that see bursty, non-hashed traffic, to reduce how
> often that condition is hit in the first place.
>=20
> Ring 4 and the VIP classification that forces these protocols onto it
> are shared driver-wide, with no DT/hardware property distinguishing
> one chip variant's ring 4 from another's, so this isn't scoped to
> AN7583 specifically even though that's where the race was found and
> reproduced. 24h+ stress runs forcing repeated PPPoE/DHCP renegotiation
> on an AN7581 board, both with and without the two preceding fixes,
> completed 570+ forced reconnect cycles each with no regressions from
> the larger ring.

If you set RX_DSCP_NUM to 128 on AN7583 for rx queue 4, are you able to
trigger the issue?

>=20
> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index d6591a779743..cd75c16d8d0c 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -41,6 +41,7 @@
>  #define TX_DSCP_NUM			1024
>  #define RX_DSCP_NUM(_n)			\
>  	((_n) =3D=3D  2 ? 128 :		\
> +	 (_n) =3D=3D  4 ? 128 :		\
>  	 (_n) =3D=3D 11 ? 128 :		\
>  	 (_n) =3D=3D 15 ? 128 :		\
>  	 (_n) =3D=3D  0 ? 1024 : 16)

Can you please change the default from 16 to 32? This is the default value =
used
in the vendor sdk.

Regards,
Lorenzo

> --=20
> 2.55.0
>=20

--TFdZvCNJZ0cB9Z77
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapQ9LwAKCRA6cBh0uS2t
rM13AP4wkYGuLzW+WVctf1OtsZrpVodXKZgBv2utkiyeq25FaQEA2SaUS/5l8UPs
HVO0eRtFu4TXJtmo25S219Df4cIi+gI=
=BFzh
-----END PGP SIGNATURE-----

--TFdZvCNJZ0cB9Z77--

