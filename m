Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A46606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SX/wg03x;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aUPH3eH+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S2BZ/dQl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gQa5DpLs14qhLqK4W9xlR5hZAyauWHs/0OTG6Dba/a0=; b=SX/wg03xorfVswQSFU2c8OgJFc
	K9d2QX0S3+U5DF4FmWfGsVbSYGFpPHfxq/esm1hTSRgpsqyZSEXE/qWHli9MFhuYuKUtpG8IrLDKZ
	voxuLIwKku/dxu7gkeQlBiPej7acEr2CESQVP93J88RD9f7JPKsJt1m/iOQrbCIhsMuw4Io9d9nwO
	KF9aENFqD7UxPyRzTTQnbDzNFdoT+JI4xez3NfDQfQ0oOnnXn0VjF+QSsn5NQ8kVRUN7Jwiz1KOYS
	jir9rFdxM8CSpTBPWUSOni90VlmMezog8wWcWLo0jWtWgoKCSOG3xXupUG4V4PjqwJ0XRqqVjOd8S
	ZfasgHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWxB-00000004pb6-3A0A;
	Wed, 04 Nov 2026 09:06:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWx9-00000004paU-1TPH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 09:06:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Kg5W175251
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Nov 2026 09:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gQa5DpLs14qhLqK4W9xlR5hZ
	AyauWHs/0OTG6Dba/a0=; b=aUPH3eH+W2Rx/McL8mFEKQtohjYWBhIjjM4jN0V3
	lyzDJthwnyBW+z5luReBNvb+k11Vl5fHrUIkQrfSds5qig2LF6mqSztI6vLyf278
	uBnaLbNu2qPW44M2nAz7rR9c/ILi/7JpWxD43G0UXC61H3clDbvRwuOcFAqdYhrS
	hWB7HXPXiWJ+7CpM8lo58KIBIAfqwQCPss72x9cJWE6MOwsd9e2lo1++u9WanaFI
	XPvJiAN80P2o43AW08gbzrzQbUM2gxcB0RodB1EpZnIcG/w/zC3OEyWaXr2OMRVE
	8xgw9LqeB1TjBWM/qUS1ZVrl6+f6TYqN0jUMsGfYKAjujQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbu6ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 09:06:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so122768785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 01:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783202; x=1794388002; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gQa5DpLs14qhLqK4W9xlR5hZAyauWHs/0OTG6Dba/a0=;
        b=S2BZ/dQlhrmvi9JdnOdc6+oFv64/jeaIDth5ChDo/OTTp/RQbiDpv4pSzJOy+9Z6jb
         bYHaV+eklU5gbMxjBs9UOrZJAdJDK6iE9IAIzxuEvAafM9+iYl2bPAoiPjClUdoxRuLD
         KI+hIjnfkRr3W3oGKJg2MxkyJB3cBJtDVT8OBp5dVcBwEWWBTGuMX2pVqw4FMn9iSiUV
         upT4kLObXv4YIU6dKWUKAekmSqXFFKziAopjATH80U4I4Go7u3EbL47kC5L6+iurWcqJ
         Bz8+bBF6soY9892O9/j/VDUjS+2ABf0T9d1xBfWcxf7CVw71sRF5XM8eaYRRylNfIqmu
         jm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783202; x=1794388002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQa5DpLs14qhLqK4W9xlR5hZAyauWHs/0OTG6Dba/a0=;
        b=IbENY/YnajiNy3GGLwSZtGNaHrtKQymdg8E7zuwyJyBHTQ3NDoR2JjViK0EYEWuOS5
         wOxvcUYHvOVBJfwuW/4ahqLwX6b7e7XLgLII0BQnrd8rr0me8EX0TTGytAzue3RIWfsG
         evAmZMO+RsWMIopfpcuqBS1OClqr2JnyeJaDlmp5ndOIPfVT5fgXTzXnc4cJNoAJJdCo
         JG59S/IvYNhrGFGbJjbLiLwkNW+6siOsSgxztchZh2duajEMuch8cfxI57ZQBc96pHLT
         6kBMW7efBpqbneWZyeJollG1GzFfNwua/34vHyiZYKo4fzZ5QYsetVTEBuJY4epnCGGS
         mEpg==
X-Forwarded-Encrypted: i=1; AKwUvBzVFRv29DtZvtJrTDEjs8Lqk2b/B75VKB28bXLVsDkmCpCu06bM9gFPZ5FSD1AYLiDiQMHUGljbptUS+mfQiupi@lists.infradead.org
X-Gm-Message-State: APuU4Z+Ggkc43tHFMg4Rk1RYHxGrGj4Og6wyuNSFmN+d+e3OreImwKGp
	Z4WqOfrgY7m9aqVUh11j9EFAjF/EZfUnTuqaveOnCoBuYWa7ustoFvIk7gnsGQde41xl9K/2iHR
	b9pFfiMjKIzY/tT/SSRFMypvWLhbDhAEZC+Y9vlDY3WbJ6Spx2T1ScSGyVIbwb4HC32BZlnoXOu
	tNQg==
X-Gm-Gg: AYBFou2Fn/hMrkSYNsDSl+MBknpR63WvGgYtUJq4oCWXwtW6ioa5YpGd8mpRNKCtUvb
	2rfydNQtZ57l6Mme/vAnxkN+ipIEaQnKLLGed8j8nrJ4uWTUwtyeYyN2dGHqqB2nxshNgyn9aOK
	3+Ym7llqMAh10r+Bj6fkx5XuAdPO5TyB0NtE0m57vh6aRUHsudE8SI4KosY0gkwFCt3w2q6xmVx
	2dKlNmqbvZtshknv+vxyntRd3uo3iNJpcFqew1uQIwCdw/uj4CyzfcM8BNQ+daEJjj4f5ruU/Sw
	ztn1X1NVDuh/4N0WizsHL+7rGtfg7l7kOIAVRdfSFQlrTy+Bm3kQ2KQcG9XMdvWeo2pbKF3DXcJ
	tOd6U43JJ8MLvKYNVmdJHERF/qdcHlxHag63YTca76XzvgdeGr/upD8nt2OvLmQ==
X-Received: by 2002:a05:620a:2605:b0:93f:2d52:613a with SMTP id af79cd13be357-9442171be85mr2685786685a.29.1793783201285;
        Wed, 04 Nov 2026 01:06:41 -0800 (PST)
X-Received: by 2002:a05:620a:2605:b0:93f:2d52:613a with SMTP id af79cd13be357-9442171be85mr2685783685a.29.1793783200670;
        Wed, 04 Nov 2026 01:06:40 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm53083945e9.12.2026.11.04.01.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:06:39 -0800 (PST)
Date: Wed, 4 Nov 2026 10:06:38 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: James Clark <jjc@jclark.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2
 ioctl
Message-ID: <aur1nsTkMRiws3ff@lore-desk>
References: <20261104052504.1886335-1-jjc@jclark.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SZJ/srcPBu4OL5we"
Content-Disposition: inline
In-Reply-To: <20261104052504.1886335-1-jjc@jclark.com>
X-Proofpoint-GUID: 4kFRvqf8oPUz1W5PMy79AGSgEbbXTy9P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX5BXzxaX2nKnV
 cdojTXjJciBap+30Fxck8sD8pW1RU+0Jwwfj0GXwrklWJWCLDWDFaqGyqX/gne6BRgI71M8Un5U
 1LBEPe7cmayrrxlcnOTJFLqRphuUj5p7zVm8BXHu3KaTxPqRJYXeiMgAEJxbtyZuqsPVh+n7GZv
 fBKA7xEceoTmyLrWYG8eV5xy27cMFTYSbWCmw178Z8vmnYAzxyu9QQxUYIRFingLauUUkn3j9p1
 Ds/5NEKpmRKNZkkB2MQpeAnWR0sDYi4zjZK4O3nZa3vIHQNxzw4SafsPLo/tkEQ+6dhQljET1v1
 6Kd5nreqZiBoo8JDo1Rjzv4O1QWviouZNJnPxkGkNa+gbrM3IOEDYTn4XJt3jJZRlh93AlsKNLt
 MxBd1N6HNNaj3AXRdjV1PBJ8nhnk8OZVJUM1ujoKVjfmtpFnroymhi58G+ZnWdj3z0Zsyii+MSj
 xZNzZWiwPbdDYR2bnKQ==
X-Proofpoint-ORIG-GUID: 4kFRvqf8oPUz1W5PMy79AGSgEbbXTy9P
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeaf5a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=idZxcIp9AAAA:8 a=EUspDBNiAAAA:8 a=IsTqagV5zfN5wvrX9F4A:9 a=CjuIK1q_8ugA:10
 a=lgwzRCrlNXK7KLFCy_wA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=NzLqzEvlDKEySyxblcRP:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXx5dnb6ewToAL
 KUY0InrSpmT7AeAdxcRCUvOH3nr5TBP9VRkoIxj7XaH272kX3fK25h+o0lNuNMVIyDJoWLvt23T
 E09oSKpDPQbg4d+H15ICbNk8slqFgiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_010643_507345_D804DCFD 
X-CRM114-Status: GOOD (  25.24  )
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

--SZJ/srcPBu4OL5we
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to
> ptp_clock_info") modified the PTP core to validate the supported flags
> of external timestamp requests, rather than relying on each driver to
> check them.
>=20
> stmmac_enable() and dwmac1000_ptp_enable() ignore the flags, and
> neither stmmac_ptp_clock_ops nor dwmac1000_ptp_clock_ops was given any
> .supported_extts_flags. Since PTP_EXTTS_REQUEST2 always implies
> PTP_STRICT_FLAGS, the core now rejects every PTP_EXTTS_REQUEST2 for
> this driver with -EOPNOTSUPP, where before that commit the same
> requests succeeded. Only the PTP_EXTTS_REQUEST ioctl still works.
>=20
> Tests on an NXP i.MX 8M Plus (FRDM-IMX8MPLUS, GMAC 5.10a) show that the
> auxiliary snapshot inputs timestamp just the rising edge. The reference
> manuals for the STM32MP13 (GMAC 4.20a) and the Cyclone V HPS (GMAC
> 3.70a, which uses dwmac1000_ptp_clock_ops) say the same.
>=20
> Encode this in .supported_extts_flags. A PTP_EXTTS_REQUEST2 for the
> rising edge then succeeds, and one for the falling edge or for both
> edges fails with -EOPNOTSUPP.
>=20
> Fixes: 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to ptp_c=
lock_info")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Clark <jjc@jclark.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> I used an LLM coding assistant to help prepare this patch.
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/n=
et/ethernet/stmicro/stmmac/stmmac_ptp.c
> index a37405534beb..31a66e855d6b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -277,6 +277,7 @@ const struct ptp_clock_info stmmac_ptp_clock_ops =3D {
>  	.n_per_out =3D 0, /* will be overwritten in stmmac_ptp_register */
>  	.n_pins =3D 0,
>  	.pps =3D 0,
> +	.supported_extts_flags =3D PTP_RISING_EDGE | PTP_STRICT_FLAGS,
>  	.adjfine =3D stmmac_adjust_freq,
>  	.adjtime =3D stmmac_adjust_time,
>  	.gettimex64 =3D stmmac_get_timex,
> @@ -294,6 +295,7 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops =
=3D {
>  	.n_per_out =3D 0,
>  	.n_pins =3D 0,
>  	.pps =3D 0,
> +	.supported_extts_flags =3D PTP_RISING_EDGE | PTP_STRICT_FLAGS,
>  	.adjfine =3D stmmac_adjust_freq,
>  	.adjtime =3D stmmac_adjust_time,
>  	.gettimex64 =3D stmmac_get_timex,
> --=20
> 2.56.0
>=20
>=20

--SZJ/srcPBu4OL5we
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaur1ngAKCRA6cBh0uS2t
rF0OAQCBQ4Jznbj+YmV/bTgLSjoDCUuZ+PomAAi2n95oMB8GFgEAu1dSRv/ORtKN
Qbwi4a7nP3qZRg0fNZrxJwojDXqy9wk=
=YZZD
-----END PGP SIGNATURE-----

--SZJ/srcPBu4OL5we--

