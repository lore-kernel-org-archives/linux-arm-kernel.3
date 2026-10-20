Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB83E606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AdOB2u8i;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=epr/s/Cd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NnpzcBZJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rYgdYA07tDFKT0QV8zsUnpaX9mBg/UUlKx4RXntknU=; b=AdOB2u8iENjv5yoBPS/UZatRm2
	++Dz6pujpf9se1rnVImLqp5m5B6aDzw03osgsk6qCTPVd9mkdF9RQQV5B3EYeX4fuucrNh3h5y11p
	PCF/toaFPcttUm++eGQABW0IkMy2G05SqTBNu6YmiDNS4Xa4e+iEKqE8qN/tTqW1PGIFlyty7KpB1
	Tqp3eC0KPztNKsoS5otwrWhzH1ZamMGwSZNGpy/CeKJzZ9a4cg+wr8oed4pImIuXUs4HUdX4ubqRB
	h4t0ni5twC5ZnIbJGeu5cMjWWls0c0lJb2hE4/B5kvdctjaJlaBwBRmtfKm4dyvQXTEI0u6iHS7iw
	gODgesww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9xJ-00000009nnh-0ZHc;
	Tue, 20 Oct 2026 13:32:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9xH-00000009nnI-08Wx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:32:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDABCS702631
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9rYgdYA07tDFKT0QV8zsUnpa
	X9mBg/UUlKx4RXntknU=; b=epr/s/Cds/ILc886vHtBe9bGm2yyAq3CisHeyjlZ
	4/7HMFkuDOzCYcNT4+Vdww5koRjHpJT/s+JVT0SVVt5vCEbAqn7+/OHucr/hCCol
	DgXv5te+YS94PBEOC/w4ggu+zubdYXw0VwJNj46uZkpDs7RLqsQAKcg6JctOBviC
	zrBER8zadEEV8oR71XHTdF33g0UM7Q2ZfFjO+kn5NN3AKE7GA/gpDY84/+h0fswZ
	jZgbFmJOuqmK4yIOX5WZE/wN+xhxYHaNl5UrJXeshZUN2JT94cWmc68GmWz56ErB
	f8Vt0BgjPm9E+3abBPkuNwzi6KTD+9BQluvYdyIcCEQLEw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stmf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:32:37 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98c70917433so2784457241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503157; x=1793107957; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9rYgdYA07tDFKT0QV8zsUnpaX9mBg/UUlKx4RXntknU=;
        b=NnpzcBZJdDv/UCdFnEehATbu145dfRuKCiCcezheOsC3ZorBuQpQN7YX5DsoJeayT3
         lZEQxktkCeMiWvxNCe5gGrAZGXgMKZnp/eWQqrOPhijFv5OJswVP6By5iwbbzvohpG3s
         IAn9YS4xG8xX08dNEJhodEC1+jSE06zcF4jyApW4n6FplZNn7xRtTfYNWcWt7x/xZWne
         M1kmYlIglKzh/6gub6KNARRTd/NAkAeU5v4XymqSQKh+rI71YY1dhi+LDnuVK49d98g9
         5bjd6K6WVPCgEJWydQl9ohgPZFUZYc6kM3cCi2EgQK++Y1pz8b8w3ND707q+YTXgNbs5
         PjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503157; x=1793107957;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rYgdYA07tDFKT0QV8zsUnpaX9mBg/UUlKx4RXntknU=;
        b=kuyht+QBHEi6yjonpNfZzUP47i52M5fB6BTlgLpcA8lOe+b5ar4ZUkT9mVNBH9BZee
         UMOa6ZY04QczUVQiuVyZ58ON2Jcq0R2YoCI0vU0er29J4OuHSt5MH/zsI8SOH0LLvO7g
         tXcE4sPRJUJecYvYB5J4/qau4CMi/4rjTxhvbmN+TmMeDQw+PKd7MADDwgJPlbb505gm
         u0pngu2niXfyLW2qOXDzX8OzQHz9GMS5u1zAu/IsoKNZlzUwacBneBwth4HlDG02vIWI
         C2DY6ECZtYgWqMuec9BkEymsYhOG52eWK2XriqiZYqv2vuKz2MtRX7rdwYsGn2a8OXYr
         qXdg==
X-Forwarded-Encrypted: i=1; AKwUvBwmf/a0opSDteJeDur/BYmED7NcBLJ6shyzIp+MV3/knG+jHZVq1V+2BT/tJ8A9ZKjwRbwoironSkhV45TOo4eb@lists.infradead.org
X-Gm-Message-State: AFq9FYKz2CJ5Imhh0dhF6hgkIHnK0yNS6iHZBEg2V8E85y7aQ2YTEITE
	6Agd970DbJ9qDzSbaGtkPoXej6VO04Uigxd1y05IfeYMRdu+dSJIZ3cctUJLKuY39a04YQjDwtp
	ZM1Tmj+C8b+07VPv+GRs0O3jL9Rl5GMi7ah54vtdJtEA7bWOxH2qm97h1UVIvkmMMhDBQzEVW4n
	Pn8Q==
X-Gm-Gg: AYBFou3fLVx8APnsRd8o2ronP8r+0NNQqOPcXMdh8g1tJaUaJnAvTJZsUUagk5xd8pc
	Z61vEUqUZoSygS+MiEUJvM+QCvI8O8A7WtcKXubb8c/FbUtI+faUq0sw6+pLjhCPbo8iyqVwgKs
	Ba9bpxzHScqKpuXI6V43BTTjYBv2DiP3bRm28jUlMt0PPAGjVgWrb3nEKMgEV38/axecZW6hNoO
	nQNCLtTp48+YYeyt82YHyiE5Zq0BcONSr1P3j+zPCLMZkIWHTQPEqWbk09HPvT0n7oS2j+c1VBz
	hBIu5F4Ovo+tdTIQgWP1yBwpxPahZVH2HbHRQRPIR7Su7n7Cqji0V3hOQvGHKESWpNTrBnCbl6y
	C4VdA71OhVpYziQ==
X-Received: by 2002:a05:6102:509f:b0:7c0:cdd9:31c1 with SMTP id ada2fe7eead31-7cc3691e07emr3385065137.12.1792503156827;
        Tue, 20 Oct 2026 06:32:36 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:7c0:cdd9:31c1 with SMTP id ada2fe7eead31-7cc3691e07emr3385044137.12.1792503155962;
        Tue, 20 Oct 2026 06:32:35 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3666sm75084605e9.1.2026.10.20.06.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:32:33 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:32:33 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v8 5/5] net: stmmac: rework stmmac_rx to support
 XDP rx multi-buff
Message-ID: <atdtcD1o6N--LRpl@lore-desk>
References: <20261018-stmmac-rx-mb-v8-5-5f58c0b25849@oss.qualcomm.com>
 <179243152020.3135.588086716583719127@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lJZGZmpUiB07xMUc"
Content-Disposition: inline
In-Reply-To: <179243152020.3135.588086716583719127@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX6lXY8Uktdupx
 tv+Fga1ozeWO6DN+2vv5Es6pYPyg0FzpXwOHdbXahZDHgutpuqluWK+Z5OZKV8hEtYdT2yayssO
 9nukZz6nkx5qdux8yYuE2LvDwFcjTl7c1GCjCyjLecN5kwqoYRDcX7wP/L2JihjsIDwCtc9X1j2
 rDJUgAUK6BdIyPHgsTrdXFXXJn5oOa2waXGoBoHsNPzY1eG6KZvKaTBTdlRKS5+5d0C+4P4qCOY
 eoIPnPTPbCETJ6DU1UJ00wqfs/k+Yp7o8kBlbheUx/RPtgioHW3jbsBw4ew6o+PXkBo5trR08BV
 zy6BPVwkwhy2uGwvHuZA7AGdRveFlU0Ub9ySKh7vK6DEJ4ScZTjij3wphIphYxfsIC1q2Ng/lJS
 H+wnSRDsL3nNUi5+m47bDiTbv3G27MXDm+agzqAxyIRnXt0teK8Ikyjp5wBnOukzRuoDsfpHa3O
 W0kyo+Elc8sL948kdAA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad76d75 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=AAtxJrX6kwZzT1o8YZAA:9 a=QEXdDO2ut3YA:10
 a=gBTJZmOXgchuYORFWpUA:9 a=1WsBpfsz9X-RYQiigVTh:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-GUID: VukwnZhI03M5MTGVNKh7FcTfR0m5O7xE
X-Proofpoint-ORIG-GUID: VukwnZhI03M5MTGVNKh7FcTfR0m5O7xE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX4OjNsxmyy63I
 kFq87ZRk9bdNIf8Hw+S4EDnmjFvqVuw11JVBLIR6dDti20KP0RXqbzFpJZCC12WYdHF5QRlVGsl
 yNgvKHEmj3HXIC/hSyOWL4y9X9UeQO8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_063239_211934_26AD8FDF 
X-CRM114-Status: GOOD (  49.07  )
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

--lJZGZmpUiB07xMUc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 (1) =C2=B7 Medium: 2 (1) =C2=B7 Low: 1
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The patch fixes a DMA under-sync on the XDP drop path but does
>   not say so.
> - [Medium] Fragment truesize is undercounted when num_pages is not a
>   power of two.
> - [Low] The patch advertises NETDEV_XDP_ACT_RX_SG (line 8189) and now
>   runs frags-aware programs on multi-buffer xdp_buffs=E2=80=A6
>=20
> Pre-existing issues:
> - [High] XDP_TX completions are recycled into the RX page_pool's lockless
>   alloc cache from a different NAPI context.
> - [Medium] The AF_XDP zero-copy XDP_PASS path reports XDP metadata whose
>   bytes it never copies.
>=20
> --
>=20
> net: stmmac: rework stmmac_rx to support XDP rx multi-buff
>=20
> This reworks stmmac_rx() to collect every descriptor of a frame in an
> xdp_buff, so the XDP program runs on the whole frame, including any
> fragments. The skb is then built from the xdp_buff with napi_build_skb()
> and xdp_update_skb_frags_info(). The in-progress xdp_buff is saved in
> rx_q->state across NAPI polls, and NETDEV_XDP_ACT_RX_SG is advertised.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 04dc6dcaa435d..e9c61524fc740 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -5806,6 +5812,119 @@ static int stmmac_rx_zc(struct stmmac_priv *pri=
v, int limit, u32 queue)
>=20
> [ ... ]
>=20
> > +static struct sk_buff *stmmac_build_skb(struct xdp_buff *xdp)
> > +{
> > +	struct skb_shared_info *sinfo =3D xdp_get_shared_info_from_buff(xdp);
> > +	u32 metasize =3D xdp->data - xdp->data_meta;
>=20
> [ ... ]
>=20
> > +	skb_mark_for_recycle(skb);
> > +	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> > +	skb_put(skb, xdp->data_end - xdp->data);
> > +	if (metasize)
> > +		skb_metadata_set(skb, metasize);
>=20
> [Severity: Medium]
> This isn't a bug introduced by this patch. Now that the page_pool path
> keeps the metadata, though, the AF_XDP zero-copy XDP_PASS path no longer
> matches it. Does stmmac_construct_skb_zc() pass stale headroom bytes to
> TC/BPF as metadata?

Since this issue has not been introduced by this patch I guess we can fix it
with a dedicated patch.
>=20
> stmmac_construct_skb_zc() {
>     ...
> 	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> 	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
> 	if (metasize)
> 		skb_metadata_set(skb, metasize);
>     ...
> }
>=20
> Only [data, data_end) is copied into the new skb, but the metasize bytes
> in front of skb->data are still marked as metadata. A TC/BPF program that
> reads data_meta on frames from stmmac_rx_zc()->stmmac_dispatch_skb_zc()
> would see leftover bytes from the napi_alloc_skb() headroom instead of
> what the XDP program wrote.
>=20
> Other zero-copy drivers copy metasize + datasize bytes starting at
> xdp->data_meta and then call __skb_pull(skb, metasize). Would the same
> approach work here?
>=20
> > +
> > +	if (unlikely(xdp_buff_has_frags(xdp)))
> > +		xdp_update_skb_frags_info(skb, num_frags, sinfo->xdp_frags_size,
> > +					  sinfo->xdp_frags_truesize,
> > +					  xdp_buff_get_skb_flags(xdp));
> > +	return skb;
> > +}
> > +
> > +static bool stmmac_build_xdp_frags(struct stmmac_priv *priv,
> > +				   struct stmmac_rx_queue *rx_q,
> > +				   unsigned int len, struct page *page,
> > +				   unsigned int offset,
> > +				   enum dma_data_direction dma_dir,
> > +				   struct xdp_buff *xdp)
> > +{
> > +	dma_addr_t dma_addr =3D page_pool_get_dma_addr(page) + offset;
> > +
> > +	dma_sync_single_for_cpu(priv->device, dma_addr, len, dma_dir);
> > +	if (!xdp_buff_add_frag(xdp, page_to_netmem(page), offset, len,
> > +			       xdp->frame_sz)) {
>=20
> [Severity: Medium]
> The commit message says:
>=20
>   charge fragments the whole page_pool page size (xdp->frame_sz) as
>   truesize instead of the old dma_buf_sz
>=20
> Is xdp->frame_sz the page_pool page size in every configuration?
>=20
> frame_sz comes from bufsz =3D rx_q->napi_skb_frag_size in stmmac_rx(). Th=
at
> value is set in __alloc_dma_rx_desc_resources():
>=20
> 	rx_q->napi_skb_frag_size =3D num_pages * PAGE_SIZE;
> 	...
> 	pp_params.order =3D order_base_2(num_pages);
>=20
> When num_pages is not a power of two, each page_pool buffer is
> PAGE_SIZE << order, which is larger than napi_skb_frag_size. Two examples
> with 4K pages and no XDP:
>=20
> - dma_buf_sz of 8KiB: num_pages =3D 3, order 2, so each 16K page is charg=
ed
>   as 12K.
> - dma_buf_sz of 16KiB: num_pages =3D 5, order 3, so each 32K page is char=
ged
>   as 20K.
>=20
> stmmac_xdp_shrink_tail() subtracts the same xdp->frame_sz. Then
> stmmac_build_skb() adds sinfo->xdp_frags_truesize to skb->truesize
> through xdp_update_skb_frags_info(). As a result, skb->truesize is lower
> than the memory the fragments actually pin.
>=20
> Could the fragment truesize use PAGE_SIZE << pp_params.order instead? Or
> could num_pages be rounded up to a power of two?

I will fix it in the next iteration.

>=20
> [ ... ]
>=20
> > @@ -5927,129 +6039,89 @@ static int stmmac_rx(struct stmmac_priv *priv,=
 int limit, u32 queue)
>=20
> [ ... ]
>=20
> > +		pre_len =3D ctx.xdp.data_end - ctx.xdp.data_hard_start;
> > +
> > +		ctx.desc =3D p;
> > +		ctx.ndesc =3D np;
> > +
> > +		skb =3D stmmac_xdp_run_prog(priv, &ctx.xdp);
> > +		/* Due xdp_adjust_tail: DMA sync for_device
> > +		 * cover max len CPU touch
> > +		 */
> > +		sync_len =3D ctx.xdp.data_end - ctx.xdp.data_hard_start;
> > +		sync_len =3D max(sync_len, pre_len);
>=20
> [Severity: Medium]
> The old pre_len and sync_len subtracted buf->page_offset:
>=20
> 	sync_len =3D ctx.xdp.data_end - ctx.xdp.data_hard_start -
> 		   buf->page_offset;
>=20
> The new ones don't. This looks like a separate DMA sync fix, and the
> commit message doesn't mention it.
>=20
> Commit 88095728511e ("net: stmmac: fix rx Scatter-Gather support") set
> pp_params.offset =3D 0, and __page_pool_dma_sync_for_device() syncs from
> dma_addr + pool->p.offset. So with the old formula, the XDP_CONSUMED path
> synced [0, L) for an L-byte frame at XDP_PACKET_HEADROOM. The bytes the
> CPU had touched were at [256, 256 + L).
>=20
> Take a non-coherent platform and an XDP program that writes the packet,
> grows the tail or writes metadata, and then returns XDP_DROP or
> XDP_ABORTED, or fails a redirect. Could that leave dirty cache lines in
> the recycled page? Those lines could later be written back over a frame
> the device has DMA'd into the page.
>=20
> The new formula looks like the correct one. Stable kernels that picked up
> 88095728511e would keep the under-sync. Could this go out as a separate
> net fix with:
>=20
> Fixes: 88095728511e ("net: stmmac: fix rx Scatter-Gather support")
>=20
> or at least be described in the commit message?

I will post a dedicated patch to fix it.

>=20
> > +
> > +		/* For Not XDP_PASS verdict */
> > +		if (IS_ERR(skb)) {
> > +			unsigned int xdp_res =3D -PTR_ERR(skb);
> > +
> > +			if (xdp_res & STMMAC_XDP_CONSUMED) {
> > +				stmmac_xdp_put_buff(rx_q, &ctx.xdp, sync_len,
> > +						    true);
> > +				rx_dropped++;
> > +			} else if (xdp_res & (STMMAC_XDP_TX |
> > +					      STMMAC_XDP_REDIRECT)) {
> > +				xdp_status |=3D xdp_res;
> > +			}
>=20
> [Severity: High]
> This is a pre-existing issue, but this patch sends fragment pages down the
> same path. Is it safe for tx_napi to recycle XDP_TX completions directly
> into this RX queue's page_pool?

Since this issue has not been introduced by this patch I guess we can fix it
with a dedicated patch.

>=20
> stmmac_tx_clean() runs from ch->tx_napi and does:
>=20
> 	if (xdpf &&
> 	    tx_q->tx_skbuff_dma[entry].buf_type =3D=3D STMMAC_TXBUF_T_XDP_TX) {
> 		xdp_return_frame_rx_napi(xdpf);
> 		tx_q->xdpf[entry] =3D NULL;
> 	}
>=20
> That call ends up here:
>=20
> xdp_return_frame_rx_napi()
>   __xdp_return(..., napi_direct=3Dtrue)
>     page_pool_put_full_netmem(pp, netmem, true)
>       page_pool_recycle_in_cache()
>         pool->alloc.cache[pool->alloc.count++] =3D netmem;
>=20
> The page_pool belongs to ch->rx_napi, which is a separate napi_struct.
> stmmac_xdp_get_tx_queue() picks the XDP_TX queue by CPU. tx_napi can also
> be scheduled on another CPU by stmmac_tx_timer() or by a per-channel TX
> MSI vector. stmmac does not set pp_params.napi, so page_pool cannot catch
> this.
>=20
> At the same time, stmmac_rx() on rx_napi uses the same alloc cache. It
> does so through stmmac_rx_refill() and through the new allow_direct=3Dtrue
> puts in stmmac_xdp_put_buff(), stmmac_build_xdp_frags() and
> stmmac_xdp_shrink_tail().
>=20
> Can these two contexts race on alloc.count and the cache slots? That
> could lose a page, or cache the same page twice so that it gets handed to
> two RX descriptors.
>=20
> With multi-buffer frames, xdp_return_frame_rx_napi() now also returns
> every fragment page with napi_direct=3Dtrue, so more pages go through this
> race.
>=20
> [ ... ]
>=20
> > @@ -8106,6 +8186,7 @@ static int __stmmac_dvr_probe(struct device *devi=
ce,
> >  	ndev->hw_features =3D NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSU=
M |
> >  			    NETIF_F_RXCSUM;
> >  	ndev->xdp_features =3D NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT=
 |
> > +			     NETDEV_XDP_ACT_RX_SG |
> >  			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
>=20
> [Severity: Low]
> With NETDEV_XDP_ACT_RX_SG advertised, frags-aware programs now see
> multi-buffer frames. However, __alloc_dma_rx_desc_resources() still
> registers the rxq with:
>=20
> 	ret =3D xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id);
>=20
> That leaves frag_size at 0, so bpf_xdp_frags_increase_tail() always
> returns early:
>=20
> 	if (!rxq->frag_size || rxq->frag_size > xdp->frame_sz)
> 		return -EOPNOTSUPP;
>=20
> Is it intended that a positive bpf_xdp_adjust_tail() on a multi-buffer
> stmmac frame always fails, even when the last fragment page has room?
> Other RX_SG drivers such as bnxt behave the same way, so this may just be
> a limitation. Would registering with __xdp_rxq_info_reg() and a real
> frag_size be worth considering?

I will fix it in the next revision.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261018-stmmac-rx-mb-v8-0-5f58c0b25849%40oss.qualcomm.com

--lJZGZmpUiB07xMUc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatdtcAAKCRA6cBh0uS2t
rATLAQCSvZ33CM/2uk7SiugoyWVQyTLcX4+EuDn+8YQzsGZdZwEA5TNtIM50LdiW
eMNXxEqYgA/WRnQ0sRpIoSDa8/M01QQ=
=LdD9
-----END PGP SIGNATURE-----

--lJZGZmpUiB07xMUc--

