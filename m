Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62A606B255
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CoPr2aKj;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsvtV3m1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3fKuhhn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WtnaI/rE8dqZ2TDAvhFl2l1GKkkDIiG6JUx0pMWVYEM=; b=CoPr2aKj7jpaNWat0pbbdj/u7L
	PdDpgAkMy7ncCWiyoMoPwEgwfdMVcYWRAbLKcziobjGZ/BchncnXyMOyTIDzqy4J2yw7tAWZf8aUD
	DkvjU694SuPsUScIRQxOGr9XF5tasxv4HS8MEM/s+LlwxVdbqhpxjsLSbeYYP6THEIEudIX3wxD3C
	/SNmxFne13Y3ECGgEQgxHQyzbDTt9hza8LvqHkTSd8TmjosXc11QGVp8lQWyWTWj/4ZV6DeZgr5LE
	xNhSk+uitqwXeWJ4otdQO9NoWNKJM6QMrVejvj9CfId7pgQw9Z2A/uzHRLqXWGiYS1frzFWHWwu/9
	Y3h0FdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG8k-00000002rFZ-11zK;
	Tue, 03 Nov 2026 15:09:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG8f-00000002rDD-1WHh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:09:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA3qZ3048795
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 15:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WtnaI/rE8dqZ2TDAvhFl2l1G
	KkkDIiG6JUx0pMWVYEM=; b=VsvtV3m10nlkXZ186rhLO4fXxZ39IP3M8PkirN5C
	J539yVBBCInCy9QYSttMftMfkEaL6QsjEsnb9/RDBHV92d40CjDJz7ih50M4rz8o
	TK2naZkOM0fmNGNCiBnvZ3wRMdLSkzSmptMtt7GQt6dO/VxnuA9pUe6KgTrW7kzh
	R0d1lIJc1kdjdYm0Z9MTvTJI+WCuCG7Lu0i39aNLYcshkGP4zZOaSiofyfAU+ybR
	mqXdhY7DSz2hhRhMCNgSJaE1dxgY0LiHa3O5GAB1picCaLZawKfF18DSsV0305HE
	OV7cY0xmf588y2vhyX17iBh70D09IrgOB5m8maqWexiMSw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5k9h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 15:09:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc4149b885so3369500137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 07:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793718567; x=1794323367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WtnaI/rE8dqZ2TDAvhFl2l1GKkkDIiG6JUx0pMWVYEM=;
        b=e3fKuhhnOJOzzlXpayawx4vdv2vwX05r1fc4alOlcI5k7YDwcW5D+Yj5cYQA7e7gq9
         3fiS0LrRay5rQUdojmA2PdpcLDJOwEFPEpKy9yIguC61YcB2LT675RwhIujLdi818xQp
         NRO2hgPOCadad6FQPMc8VqAL+X3w6MSg7TBbnsMecvTT7PfWHDLNRAaTOfqxnuTyAJnh
         u6pW4tOSsoBXioneNFZwnTMEmpbmNAOHu5CyFT4Xm53zD5usgeuf/MOKGe4mY27QlUC4
         D7s03SUfegXbBs2FG1LXbIqC0bAzFP+OpCNvgn0bSVRutU4zbNCL9CEQlRLDD2qkLOks
         m9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718567; x=1794323367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtnaI/rE8dqZ2TDAvhFl2l1GKkkDIiG6JUx0pMWVYEM=;
        b=wWQcOv68tFWzFkTtOe+DYlYIXqa6Pyzoz6BjzPe7I24eNBpr1vjf5zvAoRdjwuO+nR
         u09QEAr4ukdybL3/DW+zsEGjRvSvKqGbcyBZ9F9xBLUdeZxAJWxZXXCMwHjYEBok7rZH
         0E9i1zfeXtkmgF7OnUkxZLMzn9/KBobakDgSu95SvdD31W9lhxWz+lfGUkGi3XxA8W/s
         q15UQale0UoYUAf/iEcY3njlRaG/D5LpeRgX7qT5OOkjDK8zeBn5AiUPfG9pzSM8q3qm
         h2ajoGAOKU3K4pGPSCZ7ja5Xtwxu04abLXzip8lwwC1OLKNEg//aM3AEnXd1db1Wzr3E
         AwHA==
X-Forwarded-Encrypted: i=1; AKwUvBzocmZrOwUjpLegnLHkcaO6YOJ62eTo58nXVWEWfZhtIPIQTKW7h4NzNvV06MIdSWaXBWGvI3uQNBPVb0Q3Vx0t@lists.infradead.org
X-Gm-Message-State: APuU4Z8rhQg+AAJds9gJzinjdVeYx5rQPdDDLApy9enYNipLk+EvqjeO
	oCUYe2kt2gg1M2MJn9khx283SMzExeAvyygED3HjDONnqJf3IHo5lMSyC1LDjblRSEooRDfbT9S
	P0sI+CZ8k4QyK/LI3dlBkGgm/KyRaZE+rF//JeQiTxDyWicC+FsEkHVvAtOeqRruUB3MzMZTHO4
	RJHg==
X-Gm-Gg: AYBFou1aOUbPGXkgEWf/Afbt4Gkqf9iZX5FDqNxU30OaGn5w/50RO/nMMUQbUnurggk
	32BNVS3Q3fne/ZH5/xANFJFSynR/TvrKkCZoCImS/kvLLJBosRH2ZaUVDpng3Tqq06uqc7JMnTa
	HA1VOufRQAPeSUzXQmVRL+O2+P8CY1/DnoqKYSbfuQIjL1ofWD4JNebqOf9mgzMQIVTBMeujdDX
	pWnofmrTW4O2peyii3twVnvyt7HLn9yV/bY0HvWz4lMv16VKW3XodeiMrt+9FJzMlCq/5kuru5N
	MWz0w4It/PMhly/uf5BiZ79C/NxakQj7YB5IKq+bQvDzEfL+a7pKadA2K1+2egduRDjPwJ3Yryr
	V9GkkFUbWG91tGnyMh+1kQCVqxJo3tT95+SOwyB6Z/kO4Rpc2jqUAFpvnCBwc8w==
X-Received: by 2002:a05:6102:f0e:b0:7cc:9d59:9b6e with SMTP id ada2fe7eead31-7d07261530emr5713657137.13.1793718567326;
        Tue, 03 Nov 2026 07:09:27 -0800 (PST)
X-Received: by 2002:a05:6102:f0e:b0:7cc:9d59:9b6e with SMTP id ada2fe7eead31-7d07261530emr5713641137.13.1793718566728;
        Tue, 03 Nov 2026 07:09:26 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm465070355e9.1.2026.11.03.07.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:09:24 -0800 (PST)
Date: Tue, 3 Nov 2026 16:09:22 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
        Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: selftests: Add missing endianness
 conversions
Message-ID: <aun5IpJsYPwrnBYB@lore-desk>
References: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IxJjiVHShnjx8PxM"
Content-Disposition: inline
In-Reply-To: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
X-Proofpoint-ORIG-GUID: gukenS4mq8BpOIfHS4GzOgcEuqiA0ypg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MCBTYWx0ZWRfX0GSRy/BfoZ+f
 ep76SCf4x3jY9oS5O//FSX4n1nK4mN2PZg9BdzCUyXFsA0kJi6ImOSigmdqMt/hvmM60+pI0tbA
 ujDdeD3m5+fWGRCQFiASCxXlU58sGy5czYtLkDT4ottOaI/6K7d+KlsFvB2cEUHHm24yDnw25S0
 8vfigPyETNW4GJHNrxRh7ut37dTasczy1YCF/uhJuRpqJpIvVa3hp6TvFK6x1LmBHtCLUmrKTu7
 7ydN4fJ6V83/LI8lrQFrb5FaHT1Ev9n47IZcjFWxGJevtN8UZaKjV4M3BeR4PljOLg31zJNBgjb
 afm/kpZPh+WySjFUtTKPsqSxGnVHWF8j8oKHzUngOklkxutysFbeb26xSKWQ/p76X/oirpNPs+m
 4MCBmWki3BTHr3prSeBimK+ipbb3UY+6o5cvPRyd0bvxMi/834jauYP35R9FEtlR4NjmCiTajLL
 ksPykWSiR7dzjqYeL1w==
X-Proofpoint-GUID: gukenS4mq8BpOIfHS4GzOgcEuqiA0ypg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MCBTYWx0ZWRfX4xB/vjDCNxG/
 JeFFRNStOZJCjcMR4xd7ssAQ05EgQXd0YbHtCKWb/EZRU87Y1AzNuFBXZgiYt3tlOdlPeerZbPp
 qRCkvfvjLwUUwLWwkUWyaTb0GCsuYCY=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9f928 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=HEzXNubd1cMG4gQdFsAA:9
 a=CjuIK1q_8ugA:10 a=HiAPeVrv790yWpiQFZ0A:9 a=ODZdjJIeia2B_SHc_B0f:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_070929_410141_A1932DA2 
X-CRM114-Status: GOOD (  24.18  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--IxJjiVHShnjx8PxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The kbuild bot found some endianness issues in the stmmac ethtool
> selftests [1] let's address these.
>=20
> In practice these missing conversions didn't cause any issue, as the
> masks / values on which the conversions were missing were either always
> 0 or ~0, so skipping the byte swaps lead to the same value being passed
> anyway.
>=20
> [1]: https://lore.kernel.org/oe-kbuild-all/202611010511.Mk620DTd-lkp@inte=
l.com/
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> This isn't worth sending to net, I've dropped the Fixes / Reported-by /
> Closes tags, let me know if I should add'em back.
>=20
> There are more of these endianness warnings in other places, but they
> require a bit more attention. This'll be addressed at a later point, I
> don't think we have many big-endian stmmac setups anyways.
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/dri=
vers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index 40811df8f2b7..df696e2c1528 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> @@ -1216,7 +1216,7 @@ static int stmmac_test_rxp(struct stmmac_priv *priv)
>  	sel->offshift =3D 0;
>  	sel->keys[0].off =3D 6;
>  	sel->keys[0].val =3D htonl(0xdeadbeef);
> -	sel->keys[0].mask =3D ~0x0;
> +	sel->keys[0].mask =3D htonl(~0x0);
> =20
>  	ret =3D stmmac_tc_setup_cls_u32(priv, priv, &cls_u32);
>  	if (ret)
> @@ -1463,8 +1463,8 @@ static int __stmmac_test_l3filt(struct stmmac_priv =
*priv, u32 dst, u32 src,
> =20
>  	key.src =3D htonl(src);
>  	key.dst =3D htonl(dst);
> -	mask.src =3D src_mask;
> -	mask.dst =3D dst_mask;
> +	mask.src =3D htonl(src_mask);
> +	mask.dst =3D htonl(dst_mask);
> =20
>  	cls->rule =3D rule;
> =20
> @@ -1594,8 +1594,8 @@ static int __stmmac_test_l4filt(struct stmmac_priv =
*priv, u32 dst, u32 src,
>  	keys.key.dst =3D htons(dst);
>  	/* Match the full IP proto field */
>  	masks.bmask.ip_proto =3D 0xff;
> -	masks.mask.src =3D src_mask;
> -	masks.mask.dst =3D dst_mask;
> +	masks.mask.src =3D htons(src_mask);
> +	masks.mask.dst =3D htons(dst_mask);
> =20
>  	cls->rule =3D rule;
> =20
> --=20
> 2.56.0
>=20
>=20

--IxJjiVHShnjx8PxM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaun5IgAKCRA6cBh0uS2t
rEreAP9RquFj7WKKDysqBVQoJ6e0dVIsW1UM/4cQsoIBq2aelwD/T9/Pdxsxz96+
bqDDg/n0YBnH3cZXcJCfxoB/tOAA1g0=
=hOaE
-----END PGP SIGNATURE-----

--IxJjiVHShnjx8PxM--

