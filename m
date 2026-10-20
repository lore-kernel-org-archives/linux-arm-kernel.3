Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C8560A2611
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VhperXJc;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cYSeA1t5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O5HoNmAl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lr7ieTrcyple3oJEv/wP9VlYTXentXfrpGTCLa6BCU=; b=VhperXJcXKAmkbodYbKiryqnd/
	GlkLYZ81owH9L/TNKozIorOI1GKf8TmeZ2OHmdozYAZ7yngwNuJV1/ZyIWtLgM7auCaLNyIZX4Jw2
	xm+TsPNbzATh2l+AIYV/8VBQMQpJ1YIO5nKUzQH/Az9cwt+HHalquijml1LwrTRSCOnHj60cU7iet
	wutIC4Q6pq/WlMxAYobxY6i0fIPbB0b7pMUE5SYG4dvIeR6J0NY8xjpeUpCBqKs7BC7HL4j2n082v
	nOzLL2qyn8pjlTrTCFDPtCnUAZzOUJI7gpzKGTRA4Umed58f6ezxmav8OMS0e9tYVOb7A1DBJrADr
	E7V1iA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9i6-00000009lSb-0YN6;
	Tue, 20 Oct 2026 13:16:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9i1-00000009lQd-0Wws
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:16:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAvIm1733238
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3lr7ieTrcyple3oJEv/wP9Vl
	YTXentXfrpGTCLa6BCU=; b=cYSeA1t5hXejILz6jvWAz+7FyfJtYYRBR+9pKqd7
	G94J9hsTDSi9XtBM3cfZJLdKjrrc5ApXdQiJ/hL+ybiWCCbBfiZEIL+2ykACF0sW
	DfLDVwXXil/VNSivso4ewm5B5j4GX6UbzbtM8CqLdOWhM4vCwNie9PiE+cXJJ98U
	aZ0uM0TlLgRvStKSM5Wi05JhArygcQrvQutaalffY+DsznG2L89bjgFQIqSsignT
	smYg9yXdwnNB5oxZjhn0/Y5jUDxdXNY5sfhucJMAVpD4AsDs6fsKf/6ZULJCgEmG
	9xu54cWTppmN3FHQYtCchxUurEZlKCfkogLvCy1saO67EQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2m1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:16:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9902e6f65dbso366570241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502211; x=1793107011; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lr7ieTrcyple3oJEv/wP9VlYTXentXfrpGTCLa6BCU=;
        b=O5HoNmAl0rMlgOmuH98xaP4MGQkVJEwCwE4J9Qjh1yCZAYIBNL9EwqpXA9/zaE+5we
         owQ8VMGURrNeZZMBTfJMpyL4lZCEdyEms+ZidOdL2lbGv6+QYa7GP1MN2m/MdZJS1Hrk
         1xp8ClJ2ReNgXkQNQeUQJES/p4CF6TbvWsJ81BdtPVxiZzEc7pkgEyTTbenileD8mKUn
         y+n0z+PAyrCUjJ9ENQv/IEDLBBg7jf6rGlL75+6Jv1Nhl1OQ2rAVtcf/Dc4j2/AvMeti
         4Y51Q5yjjVVe4thVQHNOkCfSxEeoBf7hCxsN3eH18y92WsORqwCwyvfp6/IDpo1bNof+
         5WNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502211; x=1793107011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lr7ieTrcyple3oJEv/wP9VlYTXentXfrpGTCLa6BCU=;
        b=m1qsK5vl3brbl25qqO6vgTKsS/7fMfv9qHSFsqW+AlpLrODA78qq9zPn16KPj6P4fy
         rgsZ5/d3WR9OeLKmd5n+QELIUfedOpWLrqukJtiiiBUUZrXMjId3akcGx3G+3IyplGW1
         EImlUCbtXX5ceZbGNjRqXN3eszldXKMlfHiT+JBO/NjKAnNFGAlRu/vJ6iCMQrNSj5ks
         6g9aEgqjHa7x+5omfaV6ojyWuUK1D7LxkMA26rjYfUJzK7onpvPrb1Q37NpMVMIsDavW
         Bqt8wHStdwA1nlIS8SlhwkMiKdGwfy4xmSAHVXcEobwlhkKgddQJYF+K6YWl8N0w6aw6
         X62A==
X-Forwarded-Encrypted: i=1; AKwUvByYkVXeox7WwwgaBijzS4O9IwrbFK3N2bwk0KVNVOT3zvSt7/Wj6neOFirsy4IR5JiKEH7MGAKRGzUSBAiNqPbK@lists.infradead.org
X-Gm-Message-State: AFq9FYIVRymIQWXmdbjG+Hh4gCybcCph+FTtegbW1btGCfpqxPhNwua5
	WXAxZvaNSEWhR1K3ieZ3c4SwTYyOBUw5OObj3NGOFeKKCFVYJZMpaIgq2KBBOD84pOeLutk6vM0
	mTHlFaC5SbSONWrjGkdteL/zLYbZh7cDtIxzSYJT+bDJCg37011gpcq1jCpBGniCsDyT9yqHNMb
	eKCw==
X-Gm-Gg: AYBFou3dszOpmtwcykjVb0h6SBUPThSMZrJgDJkH1k1ptEiEGevJb/qojcZAv9/yV8A
	7ca+CpI7MqJMV54lE79Iqs3tebsfpiYdIR40AaBunPu+KYKiR0J/L3dCVurrqxpw74iP2C16fOA
	kNqp8TFh4vgcC1gWhTDpY4Bv0P5BwWz2celHS7muG0tNAs8x+akZd98wvZjFUo9QgkjPYovNrxs
	lLot39ZiNc5GUtCpzQkxVDGPeO+Q0UYeVtkeJhlM876JtkW/ZmIM+BlLnwNbLsZkucCyknrH4GW
	8XEaTlKB3FsTWBximh1xHXXCg5RTUMCVc/qiaH2k3szLOeT7mfJm3eOjC5kKFGa/FfLGuemsp3W
	o6dnQ9Wq+0b7ZPw==
X-Received: by 2002:a05:6102:5346:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7cc36b04d29mr2259993137.31.1792502210592;
        Tue, 20 Oct 2026 06:16:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5346:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7cc36b04d29mr2259987137.31.1792502209897;
        Tue, 20 Oct 2026 06:16:49 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm6391505f8f.33.2026.10.20.06.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:16:48 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:16:48 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v8 1/5] net: stmmac: take ownership of saved RX
 state at poll entry
Message-ID: <atdpwITVxsWcDIWG@lore-desk>
References: <20261018-stmmac-rx-mb-v8-1-5f58c0b25849@oss.qualcomm.com>
 <179243151310.3135.16032115262445521338@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NxY+HFPlk8WKRDAH"
Content-Disposition: inline
In-Reply-To: <179243151310.3135.16032115262445521338@kernel.org>
X-Proofpoint-GUID: qfF9MABWeshbm-bM1Zyt702mil7-Q7rD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX6HuS77DZtk7V
 UaG28uKmGeJ41xZO84DPYLX7/rXEKjLRhNtKj2UFFBSobUWAN3tscD28w/ujKA2KMC0fy3EZFvn
 3TduxRi7hGX/+4WLT5S4D96D+Pq+U4w=
X-Proofpoint-ORIG-GUID: qfF9MABWeshbm-bM1Zyt702mil7-Q7rD
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad769c3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PemzsjJJBjkDWbXggMwA:9 a=wPNLvfGTeEIA:10
 a=uEPnGdNO0VHfa3VMbwkA:9 a=TOPH6uDL9cOC6tEoww4z:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX/gDj91aaqttL
 qDiRww5peckTiNGwynnAvl3nIESBiOYIf4/4S1tG5apny6lAFzaiG5MSZ7T2eVgOfTk0dYhRis8
 ZGNCpuxb2xxohIFWPtCjvEGgNmGBMMmLReY9PY0+ZHVwvhwke/wwhwgf5Wt0L2rb2MxhzmZX647
 4GWZvAJF0PslJcb07K9qzQMstwqCuHr99EqGzkMfn9Jys3mQ3Ci1KwHHOoCaRXl3zrTqf9Se406
 CzIfw8Tpc0+ZqY30eRPuzpxss2xMxE7XfNSj8dEtIQYBqRMuEf8yQsz6/e8sdffMejgDkMhXm1E
 ASEwf4eecnXxyHBVy2e05Oby6Ir2Rp6/Pj+neUILtqI45rHgsX3aYkE4/1qFpYXc0bN3IBgIv5l
 3bIKFeh1KSsaZx/VXO3ZQ2SuHTSdfW23Bm2nsoe0QHbQ+Xq0VsjZ5YYrEVzVhMGh/dsiwFmwbV9
 uPcoZNYk4fkTMoQtd6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_061653_285572_5DB32259 
X-CRM114-Status: GOOD (  45.48  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--NxY+HFPlk8WKRDAH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>=20
> Low priority / nit picks for your consideration:
>=20
> - [Low] The authorship and Signed-off-by chain disagree.
>=20
> Pre-existing issues:
> - [High] At this commit, stmmac_rx() still uses `skb =3D=3D NULL` to deci=
de
>   that a descriptor starts a new frame.
> - [High] This problem wasn't introduced by this patch, but the commit
>   message relies on it being absent.
>=20
> --
>=20
> net: stmmac: take ownership of saved RX state at poll entry
>=20
> This commit makes stmmac_rx() and stmmac_rx_zc() take the saved
> partial-frame state at poll entry. A new in_progress flag tracks whether
> a frame is still incomplete, and the state is saved again only in that
> case. It also frees the saved skb in stmmac_reset_rx_queue() and in
> __free_dma_rx_desc_resources().
>=20
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> [Severity: Low]
> This isn't a bug, but the author field and the Signed-off-by chain don't
> match. The commit author is Lorenzo Bianconi. The first Signed-off-by is
> James Hilliard, and there is no Co-developed-by tag.

I will fix in the next revision.

>=20
> If James wrote the patch, should it carry a "From: James Hilliard
> <james.hilliard1@gmail.com>" line so git credits him as the author? If
> Lorenzo is the author, does James's sign-off need a matching
> Co-developed-by tag?
>=20
> The other patches in the series carry only Lorenzo's sign-off. That
> suggests this patch was written by James and picked into the series.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 53782ab55e125..8fd2acb25fb60 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -5958,9 +5970,7 @@ static int stmmac_rx(struct stmmac_priv *priv, in=
t limit, u32 queue)
> >  						      STMMAC_XDP_REDIRECT)) {
> >  					xdp_status |=3D xdp_res;
> >  					buf->page =3D NULL;
> > -					skb =3D NULL;
> > -					count++;
> > -					continue;
> > +					goto next;
> >  				}
> >  			}
> >  		}
>=20
> [Severity: High]
> This is a pre-existing issue, and this patch doesn't change how it
> behaves. What happens here when the XDP verdict is taken on a descriptor
> that still has rx_not_ls set?

Since this issue has not been introduced by this patch I guess we can fix it
with a dedicated patch.

>=20
> stmmac_rx() uses skb =3D=3D NULL to mean a new frame is starting. The goto
> next now also clears in_progress, and error stays 0. The remaining
> descriptors of the same hardware frame would then each be handled as the
> first descriptor of a new frame.
>=20
> The XDP_CONSUMED branch just above has the same shape:
>=20
> 	skb =3D NULL;
>=20
> 	if (unlikely((status & rx_not_ls)))
> 		goto read_again;
>=20
> So does the napi_build_skb() failure path:
>=20
> 	if (!skb) {
> 		page_pool_recycle_direct(rx_q->page_pool,
> 					 buf->page);
> 		buf->page =3D NULL;
> 		rx_dropped++;
> 		count++;
> 		goto drain_data;
> 	}
>=20
> In each of these three cases, could the middle and tail descriptors be
> passed to XDP and built into an skb with a stale or zero len? Could
> buf1_len then underflow and produce an skb length near 4G?
>=20
> An on-link peer can reach this by sending a frame that spans several
> descriptors while an XDP program returns a non-PASS verdict. A
> napi_build_skb() failure on such a frame reaches it too.
>=20
> Later patches in this series seem to fix it. "net: stmmac: drop
> multi-buffer frames in XDP mode" sets error on non-last descriptors when
> XDP is attached. "net: stmmac: rework stmmac_rx to support XDP rx
> multi-buff" runs XDP and stmmac_build_skb() only on the last descriptor
> and sends build failures to error_free_frag.
>=20
> [ ... ]
>=20
> > @@ -8399,6 +8408,9 @@ static void stmmac_reset_rx_queue(struct stmmac_p=
riv *priv, u32 queue)
> >  {
> >  	struct stmmac_rx_queue *rx_q =3D &priv->dma_conf.rx_queue[queue];
> > =20
> > +	dev_kfree_skb_any(rx_q->state.skb);
> > +	rx_q->state.skb =3D NULL;
> > +	rx_q->state_saved =3D false;
> >  	rx_q->cur_rx =3D 0;
> >  	rx_q->dirty_rx =3D 0;
> >  }
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but the commit message says
> that, without this change, the first poll "resumes that stale skb with
> descriptors from the freshly initialized ring". Is the ring actually
> re-initialized on the stmmac_resume() path?

Since this issue has not been introduced by this patch I guess we can fix it
with a dedicated patch.

Regards,
Lorenzo

>=20
> stmmac_resume() does:
>=20
> 	stmmac_reset_queues_param(priv);
>=20
> 	stmmac_free_tx_skbufs(priv);
> 	stmmac_clear_descriptors(priv, &priv->dma_conf);
>=20
> 	ret =3D stmmac_hw_setup(ndev);
>=20
> None of these calls refills buf_pool or rewrites the descriptor buffer
> addresses. stmmac_clear_rx_descriptors() calls stmmac_init_rx_desc() on
> every entry. On dwmac4 that only sets the owner bits:
>=20
> static void dwmac4_rd_init_rx_desc(struct dma_desc *p, int disable_rx_ic,
> 				   u8 descriptor_mode, int end, int bfsize)
> {
> 	dwmac4_set_rx_owner(p, disable_rx_ic);
> }
>=20
> Suppose stmmac_rx_refill() hit a page_pool allocation failure before
> suspend:
>=20
> 		if (!buf->page) {
> 			buf->page =3D page_pool_alloc_pages(rx_q->page_pool, gfp);
> 			if (!buf->page)
> 				break;
> 		}
>=20
> Then the entries between dirty_rx and cur_rx still have buf->page =3D=3D
> NULL. On resume, cur_rx and dirty_rx are reset to 0 and every descriptor
> goes back to the DMA. When one of those entries completes, can
> stmmac_rx() call page_address(buf->page) and napi_build_skb() on a NULL
> page?
>=20
> There is a similar problem on dwmac4/xgmac. Descriptors that the hardware
> writes back between napi_disable() in stmmac_suspend() and
> stmmac_stop_all_dma() have RDES0/RDES1 overwritten with status words.
> If those descriptors are given back to the DMA, would it write to a
> bogus buffer address?
>=20
> The resume sequence is the same at the end of the series.
>=20
> --=20
> Sashiko AI review =B7 https://netdev-ai.bots.linux.dev/sashiko/#/patchset=
/20261018-stmmac-rx-mb-v8-0-5f58c0b25849%40oss.qualcomm.com

--NxY+HFPlk8WKRDAH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatdpwAAKCRA6cBh0uS2t
rK/rAP9eeUWDw5jEkLXbZGZjD44MWM5eQ7vU1AdbT4Lc6/gFZAD9HjzeJTtHr8HQ
TZlUcSBRhfUzqQDfqiP15dZDUnPK4gw=
=ieLd
-----END PGP SIGNATURE-----

--NxY+HFPlk8WKRDAH--

