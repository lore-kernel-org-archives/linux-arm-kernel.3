Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C85D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLMCaEGCjPkN2Mm2sQaGKmatY08Aupz94K2K6BZWWzg=; b=YhYqX4urLpoUeIDi6Ycze+2e7t
	16lYG/jl0EFPKK8PHuBZEKxOzlN9bo3+8XaVPtvMbEddWm363zd0K2WTZj+qgJ7IuirlcKoWxYWGP
	tY4XsoGFrz9IVrC5dUnnhYYufoxwCMNroAhEDv2ryF+JYvI1v8Ewrr6f1kKuZdYGOloDebgUX1EdK
	eRR6vrWApCOyUppFfJKzQmEB9rXaDrnVZ/TGnGxsHYxUIkP87wXVL7djmZq9rw/SzFQEOtvzHDz+0
	JFMZCZWxIsm1QDwO4gQ+Hz/6kn/AwBBH9x9B7/qusC8RqmN268hTiZzURCg8Poh8jQIwYRym7lM7s
	Lza4vKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrts-00000002RBv-30T2;
	Mon, 19 Jan 2026 16:14:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrtn-00000002RBi-1CbQ;
	Mon, 19 Jan 2026 16:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49B2460055;
	Mon, 19 Jan 2026 16:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A157FC116C6;
	Mon, 19 Jan 2026 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839278;
	bh=lSfsVlCqyZvf6pA1XPog974EukldB/XYySTEmAm9AVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0qXyLKYlu8MTMpc+PeSAw5wrgSVGYKLiidFDfPtqfjHPKJ5owqrFpAQUytFgwaCx
	 Edof5E5tvwaMud5QVyJEgsRq4rAOpl01lKEJmFYfWW1c8GQNvd8hA80FkkmHSiPa5F
	 LOWX2t4UboNXW+DFSjaHME8VvT7MLmV8xuGW4dbpUY0wwv+FLf65blXLLtCkkjG3ex
	 pIsXuJPKVkKgpCx6gD8e70FCcuXRwG4bbJ+6fNrxeU/UtAQ8VH/vYAvwoLwyIr69RN
	 m6YciAeGPSU0wKIoIkhffEUIvRtouSRbBEmt9r9lcbTFkEgeIvri1io0PDDAWT8x5Y
	 G0BLP48bm4Kpg==
Date: Mon, 19 Jan 2026 17:14:35 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sayantan Nandy <sayantann11@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	sayantan.nandy@airoha.com, bread.hsu@airoha.com,
	kuldeep.malik@airoha.com, aniket.negi@airoha.com,
	brown.huang@airoha.com
Subject: Re: [PATCH net-next v3] net: airoha_eth: increase max MTU to 9220
 for DSA jumbo frames
Message-ID: <aW5Yay8rDupPfB-H@lore-desk>
References: <20260119073658.6216-1-sayantann11@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J2jysX/UvlOutc68"
Content-Disposition: inline
In-Reply-To: <20260119073658.6216-1-sayantann11@gmail.com>
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


--J2jysX/UvlOutc68
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> The industry standard jumbo frame MTU is 9216 bytes. When using the DSA
> subsystem, a 4-byte tag is added to each Ethernet frame.
>=20
> Increase AIROHA_MAX_MTU to 9220 bytes (9216 + 4) so that users can set a
> standard 9216-byte MTU on DSA ports.
>=20
> The underlying hardware supports significantly larger frame sizes
> (approximately 16K). However, the maximum MTU is limited to 9220 bytes
> for now, as this is sufficient to support standard jumbo frames and does
> not incur additional memory allocation overhead.
>=20
>=20
> Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> v3:
> - Document that hardware supports larger MTU (~16K), but limit to 9220 fo=
r now
> - Target net-next (netdev/main) as this is a feature enhancement
> - No functional changes
>=20
> v2:
> - Clarified commit message regarding DSA tag overhead
>=20
>  drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index fbbc58133364..20e602d61e61 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -21,7 +21,7 @@
>  #define AIROHA_MAX_NUM_IRQ_BANKS	4
>  #define AIROHA_MAX_DSA_PORTS		7
>  #define AIROHA_MAX_NUM_RSTS		3
> -#define AIROHA_MAX_MTU			9216
> +#define AIROHA_MAX_MTU			9220
>  #define AIROHA_MAX_PACKET_SIZE		2048
>  #define AIROHA_NUM_QOS_CHANNELS		4
>  #define AIROHA_NUM_QOS_QUEUES		8
> --=20
> 2.43.0
>=20

--J2jysX/UvlOutc68
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaW5YawAKCRA6cBh0uS2t
rBEmAQDHxUyhIPGHm22GhCpC1m40BZZI353lz/CrFQ+Y1qkV/wD+LNlBeyE/03VJ
edunfoIYQPT9G31c6f8yeJVTeuFmKg8=
=KIMb
-----END PGP SIGNATURE-----

--J2jysX/UvlOutc68--

