Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5067E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GVNmLZmi;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkKpHdH4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KcbdWJ2Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IN1cRYMXslaLOWD/XJso7X64D5iaGsH1cQZ8xvAIkjM=; b=GVNmLZmiH/IwSAjQAQDJeSbz3X
	cv6ufOZYU1DQ8sBu2PERYmUT9aqZRGX9JqzeMPyLZ0wDEq4dj3Y95WCp/qj2Tv9PhRxbqa9lt4t7j
	fSV7XrFU4yLJWJa6FWgf8EsdEdoaVv3xRRy/htWIfEIDP16ql8ZhMCpnXca/oHu+No+JqqP6Tzs79
	4Do4ex7HbPMsLwWSXWdFyQ4eqVI47xgs+qN6ILx8Uqz528njLMcbuE9g8tLQRNiInV32RUPw1xMX4
	L3cZsQvU4CLqGdYyTHj5D2DV6wZj2Za8yZ+gXjOU4K775TXIpqUGBIlghTwKqciDMmy0LtsJiq2h2
	FGAWfRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiT2-0000000BBh3-00t8;
	Fri, 30 Oct 2026 09:00:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiSy-0000000BBfk-2xyw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:00:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FIMA2733217
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IN1cRYMXslaLOWD/XJso7X64
	D5iaGsH1cQZ8xvAIkjM=; b=mkKpHdH4u0B8ifdJbKFswSaIYOB6XARZRJDv/Y/s
	4gptz9U2oiITBuMCa5m16soNJ+5Bd6qKHBN8mnU+iRLdXqEe5k9DH75c5ogGMuqW
	knz92NDRhvVWyUrX+7fNXCvaMoBDeZaWJUxxTyKdXi4f4rw2q78ouXaEI464cfzT
	cB8TqwBHvXl6dcdLycYmnEGUEAkVLlE68y2g4cSRF5V+3dks6b+bWEecCvv0Euld
	i2FgcvrzuDhw8MOQAMynb99WYTJEwqwKCNIKK+ODZlrxC0n5A626nkXmQzU0Ew+R
	XJVPT2wDz1GSWjjOVc4zabM61Ldwe7Mgq++Spqzvl7s4oA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj405-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:59:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so114342485a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793350791; x=1793955591; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IN1cRYMXslaLOWD/XJso7X64D5iaGsH1cQZ8xvAIkjM=;
        b=KcbdWJ2QaxhIfOQaNoTIn5RPYE1Yp5i2LGhBrBbWv7VQKGFDP41HUCfz+tehjmBIvG
         bwEvfIdn7Ubh8l6dUJYaJGUAot159xQOzWiecUD1VyErMl7XDCsn0uvMmlC7J0vpuLNR
         k79n71R5i2mjO3DrdAnCLzYIrn6Mn6ks6T5nliw7m72+jcslTfXoKnzumSdgRIRKNFEV
         tnJsm9P3saJKureEJb6eTCHW0DeZjO7gvWtSwzX3qSDE22BZ9XCG/Zd+fPNAylUZI4Ol
         KLn3DQsXw7/0jjsDizjnyYJ9eysnzWVW3HeELsQ1eUbnSVsRfVynbYudIyXiB7RVkcH8
         xBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350791; x=1793955591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IN1cRYMXslaLOWD/XJso7X64D5iaGsH1cQZ8xvAIkjM=;
        b=om5oKOC+66n/nnwaeBy6OPz1cme9bZomCD0QrAZ93YP/fG1eC4zWnEbQE1OjQ6RKoi
         wRYnqi+1kyPEZrvJAiHixN20nknJPcYxs7vTEtYVq0Pt0kFRLS0KzGnU29tEOlsIsbWV
         Zkxs+nlRHQK3HscJkIPrM/1bO91NbuZN+Iy98jVdJMDz8Pfd9GSsHwIQ5PxvBNE4R01L
         r1t6jgvGetS0g8TOMA7RwvxylehO8c2RZnNiSwzfPRK5sDWr67A0UG9yGu6/254wgZ5D
         U/HEiYlsrwL/jBWycETSOj0hWjmlKSN105pSHOsLHxFajzA99pKewcxjU4zo9ZjtjxNA
         DfvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoxy73N3wycZH3r6yGeJdTCY2HOiWlstP4TR/Nb031vi0ihMJQhG9cPsOgKK7splcQoLMQj5puKXT9XKYAoaUC@lists.infradead.org
X-Gm-Message-State: AFq9FYIz6bC/sxbiGpWLs6XfDnfVa5KAENsHvJPQTJD5j/ctEU42A8yz
	QVug7v0GkgpvTErWOxzVJT/hGhIi8VHoelsW6srywxq+0ViN8NsK9wh8ytMoF0HlPI/8o9gmk9v
	HH/WEYF+NSxM9GgLiTouhZ9yfEnO8wDhMWK8+n+XApGIqqUjKMb3HYRk0nG1ri82Q4jb+AnBEAO
	LkuQ==
X-Gm-Gg: AYBFou3bM4bT2FirbU/jWNi6+zMKhymZTRYE7ZIKX1C/ghPFe56+WIRk++xDzhDY5XB
	PUSB9uTNaJPeR7XERE0Q07OKmK9BerSL2H7BFLrjWaYOlrqzi7ngtn5vKidG5fUXZ1Y0R2TiJv3
	KdUBBmiA/hdOq8XhYcubR1gjteM4ViyPKVI0LyN2+Q+nlChvUKyeual7g6Sc+emQ8f2CUDc1vZu
	qQz1O4YspW338dLtwarzVlXE3Oa57QciUKzqT0GAV4bjWHsTROD3W3+gkk8UC6t2e7pR8mHg3Q+
	ySIbvdTEfKPO+2c11770Cz6wdUBQC7nKVZ8k0RVuB+uqpr21UzpgwPWVxL5tuFCEuPaIrsQN86E
	d2/G9C5lBE9hQtdcbUiHQNO3GhRA8RIzyiASiaZb36rzcdhXBSewseLcl/XpvDHKH0Qfh/whoen
	iuaGIzw43O+cHAFXgVHQAVcQ==
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr286031085a.60.1793350791021;
        Fri, 30 Oct 2026 01:59:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr286028585a.60.1793350790377;
        Fri, 30 Oct 2026 01:59:50 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2226954f8f.6.2026.10.30.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:59:49 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:59:48 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, o.rempel@pengutronix.de,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH net v2 5/6] net: stmmac: fix VLAN tag stripping on short
 and non-linear RX frames
Message-ID: <auRchAkgHoxo5QRW@lore-desk>
References: <20261027-stmmac-xdp-fixes-v2-5-10eae8a093a8@oss.qualcomm.com>
 <179334662692.3134.6357778981334990835@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZmHyaRVMzZDh8qZ6"
Content-Disposition: inline
In-Reply-To: <179334662692.3134.6357778981334990835@kernel.org>
X-Proofpoint-GUID: sZIpskS48Mw3H-ZuX9mhf5VgXJ20Q8Ao
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNSBTYWx0ZWRfXxnoQwn1Q/Zkn
 Jjv3U97z+v1fpiZOi+/YjzMAqkL+FEsuQMGLK+frNtZPgzYBHthIz+JOJ3DxiRzuefJZit5UWZT
 LVZv6UpBqi2ffilVZXNOFHS+/9fvK0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNSBTYWx0ZWRfX3OfzfWYw3RGD
 NPH1NhcOSF3TelAEvngj9Md9luXqa4BGpIoa8fz6P2CWIvL/3+AZRf3J1aYzvWS4cTDbBsI4lk+
 vJEE20EYXs70n70t203Nmdsl1lISCURZQgEmzW+D74l1/Q9v6gxIMKdIptyVp6eDXi2lTge4pxS
 L2yg9pwcMRLNaCt2xCKVJqYmyMtaeHmHym6mmBnqijFR8SaFbR+RZTB704ACPFoHxx4d93cRUQB
 HMd7VZbTb3f+NRa3EJ7FxRWT9jFL1b5DSA+a9kifNjEzHhjupMwdMvvLB3EAwCMm9p6qY/vPq9T
 Uu8m1iOxrA4AdPJ58eMcLQI2QybuVaT62Em/pUO/eDBell+MvM2H/im+FWqpsFm/OGQNF6wtokq
 cR53rsd3aOnheqvD4VKWsvokv70POXzqmHj62dIUh3tc6xZjbNyOMgDSEewhqaVsZz/2fYCZTra
 JWsDhsrEFkyju04q+rQ==
X-Proofpoint-ORIG-GUID: sZIpskS48Mw3H-ZuX9mhf5VgXJ20Q8Ao
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae45c88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=UbPfPrF9B-iEU43lY8AA:9 a=QEXdDO2ut3YA:10
 a=BEuUwkNlH8wHWiov8BMA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_020004_983863_B92F9C04 
X-CRM114-Status: GOOD (  44.71  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--ZmHyaRVMzZDh8qZ6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0 (1)
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The commit message says the VLAN-pop code now moves the XDP
>   metadata written with bpf_xdp_adjust_meta() along with the MAC header,=
=E2=80=A6
>=20
> Pre-existing issues:
> - [Low] priv->xstats.rx_dropped is a single device-wide unsigned long
>   (struct stmmac_extra_stats, common.h:240).
>=20
> --
>=20
> net: stmmac: fix VLAN tag stripping on short and non-linear RX frames
>=20
> stmmac_rx_vlan() now pulls ETH_HLEN, and then VLAN_ETH_HLEN, into the
> linear area before it reads the VLAN header. It returns an error so that
> stmmac_rx() and stmmac_dispatch_skb_zc() drop malformed frames. When the
> tag is popped, it also moves any XDP metadata together with the MAC
> addresses.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index d9fc2464a160a..fb3b7174599e0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5102,22 +5102,35 @@ static netdev_features_t stmmac_features_check(=
struct sk_buff *skb,
>=20
> [ ... ]
>=20
> > +		__be16 vlan_proto =3D veth->h_vlan_proto;
> > +		u8 meta_len =3D skb_metadata_len(skb);
> > +		u16 vlanid;
> > +
> >  		/* pop the vlan tag */
> > +		if (!pskb_may_pull(skb, VLAN_ETH_HLEN))
> > +			return -EINVAL;
> > +
> > +		veth =3D skb_vlan_eth_hdr(skb);
> >  		vlanid =3D ntohs(veth->h_vlan_TCI);
> > -		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
> > +		memmove(skb->data - meta_len + VLAN_HLEN,
> > +			skb->data - meta_len, meta_len + ETH_ALEN * 2);
>=20
> [Severity: Medium]
> The commit message says:
>=20
>   Also move the XDP metadata written with bpf_xdp_adjust_meta() together
>   with the MAC header when the tag is popped, so data_meta still points at
>   the metadata after eth_type_trans() anchors mac_header
>=20
> Does that hold for frames coming from stmmac_rx(), or only for the AF_XDP
> zero-copy path?
>=20
> On the page_pool path, the XDP buffer is set up with meta_valid set to
> true. However, the XDP_PASS skb is built without calling
> skb_metadata_set():
>=20
> stmmac_rx() {
>     ...
> 	xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
> 			 buf->page_offset, buf1_len, true);
>     ...
> 	head_pad_len =3D ctx.xdp.data - ctx.xdp.data_hard_start;
> 	skb_reserve(skb, head_pad_len);
> 	skb_put(skb, buf1_len);
> 	skb_mark_for_recycle(skb);
>     ...
> }
>=20
> napi_build_skb() clears skb_shared_info up to dataref, and meta_len sits
> before dataref. So skb_metadata_len(skb) is always 0 here.
>=20
> On that path, this memmove() does the same MAC-address-only move as
> before. The metadata written by the XDP program stays where it was, and
> TC/BPF sees an empty data_meta range.
>=20
> The only skb_metadata_set() call in the driver appears to be in
> stmmac_construct_skb_zc():
>=20
> 	if (metasize)
> 		skb_metadata_set(skb, metasize);
>=20
> The last patch of the series does not seem to add another one either.
>=20
> The missing skb_metadata_set() in stmmac_rx() predates this patch. Still,
> the Fixes: tag points at 5fabb01207a2 ("net: stmmac: Add initial XDP
> support"), which is the page_pool path.
>=20
> Would it make sense to add something like
> skb_metadata_set(skb, ctx.xdp.data - ctx.xdp.data_meta) in stmmac_rx()?
> Alternatively, the commit message could say that the metadata handling
> only applies to the zero-copy path.

I agree this is real issue and it needs to be fixed, but it has not been
introduced by this patch and it needs to be fixed with a dedicated patch.

>=20
> >  		skb_pull(skb, VLAN_HLEN);
> >  		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
> >  	}
>=20
> [ ... ]
>=20
> > @@ -5546,12 +5559,15 @@ static void stmmac_dispatch_skb_zc(struct stmma=
c_priv *priv, u32 queue,
> >  	}
> > =20
> >  	stmmac_get_rx_hwtstamp(priv, p, np, skb);
> > -	if (priv->hw->hw_vlan_en)
> > +	if (priv->hw->hw_vlan_en) {
> >  		/* MAC level stripping. */
> >  		stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
> > -	else
> > -		/* Driver level stripping. */
> > -		stmmac_rx_vlan(priv->dev, skb);
> > +	} else if (stmmac_rx_vlan(priv->dev, skb)) {
> > +		dev_kfree_skb_any(skb);
> > +		priv->xstats.rx_dropped++;
>=20
> [Severity: Low]
> This is a pre-existing issue, not one introduced by this patch. Can
> updates to priv->xstats.rx_dropped get lost here?

This issue has not been introduced by this patch and it needs to be fixed i=
n a
dedicated patch.

Regards,
Lorenzo

>=20
> The counter is a single unsigned long in struct stmmac_extra_stats, shared
> by all queues. Several per-queue NAPI contexts update it with a plain
> read-modify-write:
>=20
> stmmac_dispatch_skb_zc():
> 	priv->xstats.rx_dropped++;
>=20
> stmmac_rx_zc():
> 	priv->xstats.rx_dropped +=3D rx_dropped;
>=20
> stmmac_rx():
> 	priv->xstats.rx_dropped +=3D rx_dropped;
>=20
> With per-channel MSI or threaded NAPI, polls for different queues can run
> on different CPUs at the same time. stmmac_get_stats64() then reads the
> counter without any locking, so the reported rx_dropped value can be too
> low.
>=20
> This patch adds another writer that follows the existing pattern, and the
> new VLAN drops in stmmac_rx() go through the same shared update.
>=20
> > +		return;
> > +	}
> > +
> >  	skb->protocol =3D eth_type_trans(skb, priv->dev);
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8%40oss.qualcomm.com

--ZmHyaRVMzZDh8qZ6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauRchAAKCRA6cBh0uS2t
rPDtAQCRZC6vex/rA1vhvQbGMOSOvwcL944N6j99hYdaCYyoUwEA65DD+bU0TMnF
Rv9O/xkuroJZ6GZrRz7N5RNV8mY2JQE=
=ynt4
-----END PGP SIGNATURE-----

--ZmHyaRVMzZDh8qZ6--

