Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D581D44C4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUSfP7xCM0mAjnQ3CNjW4jnheqauyTen+d41l6lWHTE=; b=yClvRBba1+inqFCNuKcNpPDImG
	F/KM3clKiMGiJhB3LN0pI/6uHzvF3FFvbC5sn9PFhpa4jiyLVX4r9K8IfAstSdSgFcSPdA9sqlE2h
	8SQ6itOBVmQ/dejRH3wmSzg752ZmB/78LQyEuvMkkF7T/yPU7Hy0tjqnaunfrnDC9zNdf9NPQuk/4
	FbvOsNjowsG4bULzwAhSGBaq7ds9X5eJwHtlEBhu6Q9ALPHLymTQe/i65nR4qIbv6CuDtaHYlc4vQ
	nKVt6M3hXJQdfqpiEBV6ZTUqA3iawLiDXBW3AGWaAT0DvOt2KRyeRtmcqAc1ar/3vDTjCccE8Pw4u
	RdTe18mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNa4-0000000CQts-0BwT;
	Thu, 15 Jan 2026 13:40:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNa2-0000000CQti-46ci;
	Thu, 15 Jan 2026 13:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E33B601B6;
	Thu, 15 Jan 2026 13:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4277C116D0;
	Thu, 15 Jan 2026 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768484406;
	bh=grQ06VHH5Zs834d5HBWaZvaELX00Hkf34g6d4HrTUww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7NYU10pwWmpzRf6cbU5f4xRtJXcgYUsYcqXeTPotviIVG3JHjElfxN8yO55+1qvk
	 1LJg46ESHuhVS9QY1FcaPDfwq+eKvizqalbyZ7YI5YzFCD/Y+YI65rZD2GrJoH/UN5
	 GXxErAArRg80HHv70Lf+rRXUfDBgQiKpJEjoF1IMWkpPqRwcwU4Lylh1V8JZqVQ/tV
	 lVtQklJQnTEYjbfWDVqq2OOssEdR6V91m7kOw+C1cRp3WuissUgUEzBFjS8L0+qLCp
	 7hNaMlHWR+70+tt8ld1w1tkmu19f+at0diFhljYG7/p7ixqx5eSppsugmknSXx5Tf3
	 I8Pcr0R9/Yvig==
Date: Thu, 15 Jan 2026 14:40:03 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sayantan Nandy <sayantann11@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	sayantan.nandy@airoha.com, bread.hsu@airoha.com,
	kuldeep.malik@airoha.com, aniket.negi@airoha.com,
	rajeev.kumar@airoha.com
Subject: Re: [PATCH] net: airoha_eth: increase max mtu to 9220 for DSA jumbo
 frames
Message-ID: <aWjuM3Ov0e45QyW4@lore-desk>
References: <20260115084837.52307-1-sayantann11@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hTVUY/fjLDiK9ZZK"
Content-Disposition: inline
In-Reply-To: <20260115084837.52307-1-sayantann11@gmail.com>
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


--hTVUY/fjLDiK9ZZK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The Industry standard for jumbo frame MTU is 9216 bytes. When using DSA
> sub-system, an extra 4 byte tag is added to each frame. To allow users
> to set the standard 9216-byte MTU via ifconfig,increase AIROHA_MAX_MTU
> to 9220 bytes (9216+4).
>=20
> Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>

I think the patch is fine, but here you are missing to specify this is v2
and this patch targets net-next. Moreover, please wait 24h before reposting
a new version of the same patch.

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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

--hTVUY/fjLDiK9ZZK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWjuMwAKCRA6cBh0uS2t
rOa3AQC1RGQZqnY6BrNow/ISe6gGIq5sjzdfYKLQ0jWqs1VGxgD+JmqagFtjSGtr
U3SpJX78mwpooaSRhsohFIT1z+4WSwQ=
=OpV3
-----END PGP SIGNATURE-----

--hTVUY/fjLDiK9ZZK--

