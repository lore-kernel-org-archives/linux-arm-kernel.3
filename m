Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A981606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0VNl5hY9;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YjpegIad;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7wObnsE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a4T8o8lcbxoyypTHmDp1YkCbVY4+5IakuPZVq/QfrgQ=; b=0VNl5hY9No+teE717+X2q01YaJ
	J5958nnaK/iaY3M6k6pI8HoQbjgcV+rXAhmQPjEbHOOYEISzrF+PD2n4mHZw8uFRIAKL9g6pSZLC9
	qH0LxDnGIeeDkpNUzGXNnfOQh4jFJ9hnP1dNudybXl3M6ni4fT9XjU/1/35baBq2toNj7774jYT9v
	OP6ZHMoUZ+K3EfrpSXS9VBbcEvrClor8Ip+NVeISlZAw0sfzvKNsEl56NN6TcUGUbQ5jTYgxkJq0r
	Bltoq/IKpHTlp6yGndLlY4HlOzgBmtTX8WH4dcfHZu9sSUw7RcIY8if5dXxC0HYiJQMlAY/4MXcKD
	ec9NnCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeLP-00000004IGU-3KFB;
	Tue, 27 Oct 2026 10:23:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeLN-00000004IFy-312S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 10:23:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fm2A1350043
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a4T8o8lcbxoyypTHmDp1YkCb
	VY4+5IakuPZVq/QfrgQ=; b=YjpegIadJSgRxIqFTcYLHmbCIlzlxa7FGhNLIyNj
	bQMz0SBO/BMYs9I5fxyO2UECFWWw7udcihltI0Nt1niz9ckrIt0meZeeNf41S6ln
	CmTshAsPcPYYapQQzgzmJ0stiQtlx7T4LTQNZx7FjtH+jSAtAv2BixrNMl2YkSmK
	051DPu/RM04hFt0HpkcOxpb3iI73SwzklYjkKCpezfjTWefDEcohU10jPnEbDgr9
	/6aZKZtK6nqpTezBOzV0fExJx5WQuXqztlof9f4YKbu8JO7QFEvNolIWsZmMmawF
	KhE71tlYvlM67kQmanHrnjtczoaBWjWhU1Mi/AaKiyn5Og==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rp9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:23:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so710367585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793096628; x=1793701428; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a4T8o8lcbxoyypTHmDp1YkCbVY4+5IakuPZVq/QfrgQ=;
        b=d7wObnsEwtHjFpspEHQRjXK1j20zCPAor2w/YHxhY/65ylbgcxYR0fr7IMaX/Il+IO
         JEPigD0NoDavhH1UEqJGQsU11TK7dYtQJsCNu8TcDHjywXlTKuV6uVQgZKaRFaHb9ZW9
         TBBhaGPdGH2HJTgR1tkrlSyR49n97tepmuRkn7g1gt3UORTrygkCljENdt9h6Rd8OS5c
         JRQuO1WSi268cjt10QihWc1274uXedZoOOVPdcg1dM0XzZquobDBGKj1028gEXFBcyLx
         Omqg3BhQHMG4D1jPxfR0w/upSvIS5U1ygXzTSUTNvfnn3ok4cqnX557eZVvt3Ybyb6ZS
         wVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096628; x=1793701428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4T8o8lcbxoyypTHmDp1YkCbVY4+5IakuPZVq/QfrgQ=;
        b=vWNlGaYRCbqnQsjZn7JG2eYQg0JwUbX1u+azEXgQBlosEom7Tuw+7BRrirY7x7Ds5V
         9xs9tp01OXYhAAkx2OmFZb0l4AzqL1ivfxf23ZOgajN97jXbHSwmNMdqwVN9Bf272pet
         ehLK6MSHhQeMBR1wgAVXBfAbU2FLh2HrOIq/1keABLeM4zFV2t22teGPnmfJPYhcohR6
         51zFYpbhQfBkeB0Cl7GhsaG/KnEBoJwd5+aFzRUnIvIWNDi4pjE/uqH4RiUwKISwtpBB
         1Ns6TXhOoKbUoR8Hy8NJpthhmLlAa4g2Y3/5NdXRfjJ3M2ZC0KLC0+4PAsrj+zkwb+Gc
         fIag==
X-Forwarded-Encrypted: i=1; AKwUvBxrgiuDILOodSpJnhE/uJ4CxbuQ688ijx0WPt1I9/RT3/V8UK42oEjHR8M8VG8lEsLxghDKfEMdAk/tdzreyey0@lists.infradead.org
X-Gm-Message-State: AFq9FYKGuca0gtwmZZ6HB+EsC2bR0uFacCjuuZlwkzDyXd4LiiiHMNoh
	SEP/2UoNzY4vNlmbU8Z34qRkH109G9xpiq8LqgEgin+aX9eV76R6NkLuTZenXF05N0KhHVdQ5jL
	Bqp4CiImzpYc+gz7DAPuuAx+KIhhRtsQBVujgEjTFp/hyeoaw9A2ydXoDd9udbiI7uPgeALbJGr
	SiYg==
X-Gm-Gg: AYBFou2AINxRmdNaK0IuZiuwkIYMdrzg/xYuqmsUlVwQ7uAWB7vyoUl4G/rQlBD4HJF
	duJ82mp+sBWzx6Ybb9KTzVr7Kp6UqOqJ2ZWOSauD/ehnQ/79qGEuY4PQRO3Gx/5XkyXFRzEfLAp
	IoTJ8xALcV3+L5dAkiJXVHEm/JQODFSfTKJzGes5Kh4qa31qK6lOoxcCuHFEuzPTer8jFcpMoTp
	448sYHoPAtV62S/eskYkHyKDSEbSDrlWxyeOvZjRSVRS/D3XKcHFh1xHH4yy5LGjsxMou9y8got
	36mOhFc8FT7PPRCGRmhyw61xqOMWb7gMPywdxp8z5JR/XIhDqAZmpOgfnstwauRQeX+papH1mLc
	HVHvUjFFHEvkPBEDSdAbOEHtfzeb3OFqPMNnUnOC6iYmBqx4g
X-Received: by 2002:a05:620a:4592:b0:93f:38c7:70f9 with SMTP id af79cd13be357-940ef901c2emr1592815585a.14.1793096627491;
        Tue, 27 Oct 2026 03:23:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:93f:38c7:70f9 with SMTP id af79cd13be357-940ef901c2emr1592811785a.14.1793096626877;
        Tue, 27 Oct 2026 03:23:46 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm22130417f8f.34.2026.10.27.03.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:23:45 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:23:45 +0100
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
Subject: Re: [PATCH net 3/6] net: stmmac: drop multi-buffer frames in XDP mode
Message-ID: <auB7sd5hmULjDdHW@lore-desk>
References: <20261023-stmmac-xdp-fixes-v1-3-efb37e19f5bd@oss.qualcomm.com>
 <179309225404.3134.13890305235467768199@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6H5iQYhV4nbLml5a"
Content-Disposition: inline
In-Reply-To: <179309225404.3134.13890305235467768199@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MSBTYWx0ZWRfX+dPzcVOv/4WX
 07Hu+SXPylM8ViCI+m/Zj+ff0yqOWq8F/4wSIxsCysqEKC8uKRRj0fcLHu2smkxlm4AQOKkg/7a
 vIjdhAZt2+TPASh1Y4nLOyKstlNOfec=
X-Proofpoint-ORIG-GUID: -dQEIUg4s6FOcUmhAiNUQtOxyubFyn1F
X-Proofpoint-GUID: -dQEIUg4s6FOcUmhAiNUQtOxyubFyn1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MSBTYWx0ZWRfX+/cYrNKPg9l/
 DKthHX7ZmW4FohRv+EXaijGMS/jJqIYAc3qjdYyoJVhjudl5e11/gK0n06lrI9K4OYNNSFe+cId
 FmYSU4XbbeItVRmRZHXKUWINCU1tBtYff/teQ/1kda8PQdvnBPexb82c6m4dYhNyj8zJkJgb9lY
 60cO+9RU/juzi5hjLn3lKyzOiJoB5kA0zRDQsPUshS6fOG+Ve33TNtHVqM2ewUFwRrEC+krlzWj
 iUtKbyZIOj9VNCJD6mf0GpT0Hx1KrfXHX4Xixc49GCITpf00VqExZ08yYvIMcRlQ2bI6GDH4mmO
 3DaT021JAY9MRU5s/DFiH+AJU+dokzWl8ymESwKYw5cNd2xph//FXWaUt5i2aWp72J7is8s369A
 0I8vlKWNDbukNxUofOGZGjquKSlvCZM5Qpr3DPOlI8YKz/uqQ5ub9LyAoOQPVnMtu5Lq9PPvWz/
 WDNCWv2gpy8w9CHoLXQ==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae07bb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=S0Y5g3arb0KNKT7adY0A:9 a=QEXdDO2ut3YA:10
 a=b300ueoQ1PtkQ76yJf0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_032349_901096_8A57FB41 
X-CRM114-Status: GOOD (  47.10  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--6H5iQYhV4nbLml5a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 27, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>=20
> Low priority / nit picks for your consideration:
>=20
> - [Low] The patch cites only `Fixes: 5fabb01207a2` ("net: stmmac: Add
>   initial XDP support").
>=20
> Pre-existing issues:
> - [High] Without an XDP program, stmmac_rx() still re-parses the rest of
>   a frame as a new frame when napi_build_skb() fails on a non-last=E2=80=
=A6
> - [Medium] stmmac_rx() adds its per-poll local counters to the device-
>   wide `priv->xstats.rx_dropped` and `priv->xstats.rx_errors` (plain=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: drop multi-buffer frames in XDP mode
>=20
> This patch makes stmmac_rx() drop frames that span more than one
> descriptor, or that use the second buffer of a descriptor, while an XDP
> program is attached. Discarded buffers are no longer returned to the page
> pool, so stmmac_rx_refill() can reuse them in place. The re-parse of the
> remaining descriptors after an XDP_CONSUMED verdict is also removed.
>=20
> > Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")
>=20
> [Severity: Low]
> Should this also carry a Fixes tag for 88095728511e ("net: stmmac: fix rx
> Scatter-Gather support")? Two of the failures described in the commit
> message seem to come from that commit, not from the initial XDP support.
>=20
> First, the buf1_len underflow. Before 88095728511e, stmmac_rx_buf1_len()
> returned min_t(unsigned int, dma_buf_sz, plen) for the last descriptor. A
> tail re-parsed after XDP_CONSUMED therefore got dma_buf_sz bytes.
>=20
> 88095728511e changed the return to:
>=20
> 	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen - len);
>=20
> It also moved the XDP-mode FCS strip into the if (!skb) block:
>=20
> 	if (stmmac_xdp_is_enabled(priv) && !buf2_len) {
> 		buf1_len -=3D ETH_FCS_LEN;
>=20
> Together, these two changes let a 0-3 byte buf1_len underflow.
>=20
> Second, the second-buffer case. Before 88095728511e, stmmac_rx_buf2_len()
> started with:
>=20
> 	if (!priv->sph_active)
> 		return 0;
>=20
> stmmac_xdp_set_prog() clears sph_active while XDP is enabled, so buf2_len
> was always 0 in XDP mode. That check is now:
>=20
> 	if (!stmmac_rx_check_buf2_cap(priv))
> 		return 0;
>=20
> So "GMAC4/XGMAC always provide a second data buffer per descriptor" has
> only been true since 88095728511e. The new buf2_len drop fixes a condition
> that commit introduced.
>=20
> The last patch in this series ("net: stmmac: fix XDP RX buffer DMA sync
> length") already carries Fixes: 88095728511e.

ack, I will fix the commit message in v2

>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 3fa2c15222d88..30a2774d722b7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5903,18 +5903,23 @@ static int stmmac_rx(struct stmmac_priv *priv, =
int limit, u32 queue)
>=20
> [ ... ]
>=20
> > -		if (unlikely(error && (status & rx_not_ls)))
> > -			goto read_again;
> > +		/* We do not support SG in XDP mode */
> > +		if (unlikely(!error && (status & rx_not_ls) &&
> > +			     stmmac_xdp_is_enabled(priv))) {
> > +			rx_dropped++;
> > +			error =3D 1;
> > +		}
> > =20
> >  		if (unlikely(error)) {
> > +			if (status & rx_not_ls)
> > +				goto read_again;
> > +
> >  			dev_kfree_skb(skb);
> >  			goto next;
> >  		}
>=20
> [Severity: High]
> This is a pre-existing issue, and this patch did not introduce it. The new
> error-and-drain handling only runs when stmmac_xdp_is_enabled() is true.
> Without an XDP program, can the same re-parse still happen when
> napi_build_skb() fails on a non-last descriptor?

This issue has not been introduced in this patch and it needs to be fixed w=
ith
a dedicated patch.

>=20
> The failure branch in stmmac_rx() leaves skb =3D=3D NULL and error =3D=3D=
 0:
>=20
> 	skb =3D napi_build_skb(page_address(buf->page),
> 			     rx_q->napi_skb_frag_size);
> 	if (!skb) {
> 		page_pool_recycle_direct(rx_q->page_pool,
> 					 buf->page);
> 		buf->page =3D NULL;
> 		rx_dropped++;
> 		count++;
> 		goto drain_data;
> 	}
> 	...
> drain_data:
> 	if (likely(status & rx_not_ls))
> 		goto read_again;
>=20
> The next descriptor of the same hardware frame then passes the error check
> and is handled as the start of a new frame.
>=20
> SPH is active by default on SPH-capable GMAC4/XGMAC when no XDP program is
> attached. In that case stmmac_rx_buf1_len() returns 0 for this descriptor:
>=20
> 	if (priv->sph_active && len)
> 		return 0;
>=20
> napi_build_skb() then builds an skb with an empty linear area, and the
> payload is only in a buf2 frag. pskb_trim(skb, len) does nothing, because
> the stale len is larger than skb->len.
>=20
> With the default hw_vlan_en, nothing pulls the header into the linear area
> before this call chain:
>=20
> 	eth_type_trans()
> 	  eth_skb_pull_mac()
> 	    skb_pull_inline(skb, ETH_HLEN)
> 	      __skb_pull()
> 	        BUG()
>=20
> Under memory pressure, could an on-link peer panic the machine this way by
> sending a frame larger than one buffer? GMAC_CONFIG_JE is set in
> GMAC_CORE_INIT, so such frames are accepted even at MTU 1500.
>=20
> Without SPH, the stack instead gets a frame whose Ethernet header comes
> from the middle of the peer's payload.
>=20
> This path is still unchanged at the end of the series. The VLAN rework in
> "net: stmmac: fix VLAN tag stripping on short and non-linear RX frames"
> adds pskb_may_pull() only to the software stmmac_rx_vlan() path.
>=20
> Would it drain the frame correctly to set error =3D 1 in the
> napi_build_skb() failure branch, as this patch does for XDP mode?
>=20
> > @@ -5926,6 +5931,14 @@ static int stmmac_rx(struct stmmac_priv *priv, i=
nt limit, u32 queue)
> >  		buf2_len =3D stmmac_rx_buf2_len(priv, p, status, len);
> >  		len +=3D buf2_len;
> > =20
> > +		/* Drop the packet if it is split over buf1 and buf2 on a
> > +		 * single descriptor if the interface is running in XDP mode.
> > +		 */
> > +		if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
> > +			rx_dropped++;
> > +			goto next;
> > +		}
>=20
> [Severity: Medium]
> This isn't a bug introduced by this patch. The new drop paths add to
> rx_dropped, which stmmac_rx() folds into a device-wide counter at the end:
>=20
> 	priv->xstats.rx_dropped +=3D rx_dropped;
> 	priv->xstats.rx_errors +=3D rx_errors;

This issue has not been introduced in this patch and it needs to be fixed w=
ith
a dedicated patch.

Regards,
Lorenzo

>=20
> These are plain unsigned long fields in struct stmmac_extra_stats. They
> are updated with a non-atomic read-modify-write, and no shared lock is
> held.
>=20
> Each RX queue has its own NAPI instance. Can two queues polled on
> different CPUs lose each other's increments here? The napi_syncp section
> just before this only protects the per-queue rxq_stats.
>=20
> The race goes back to 133466c3bbe171 ("net: stmmac: use per-queue 64 bit
> statistics where necessary").
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd%40oss.qualcomm.com

--6H5iQYhV4nbLml5a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauB7sQAKCRA6cBh0uS2t
rONnAQCDfR2LW22R0qwMYN7+KVy2cajIhy1x0rDeASn9b7lyKQD8DSfJFgaqLr/z
OtdSrJLjuXxDVOlLq4nSLiv2yabsSw4=
=FdEM
-----END PGP SIGNATURE-----

--6H5iQYhV4nbLml5a--

