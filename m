Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F14D606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HEcFG3s1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TZ+1xYDT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBtzqgIL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqphKuuzdQfZj8vC8DGTuD4kcrG3fghciLwkO9jLrUc=; b=HEcFG3s1P7boOBSUVY1HzGArgC
	/pTTC7EP8s2Qj4R2xZ5GeOc7lemWonRnoN59WutRKq5HOC9OVKkZFV1KcnQiAr1jXIUMBVhDWOT1h
	umu9vDJLAUIjtIj+bznU6Iu3/9UQp8hroYLrIWhKyjx/3VvSMKwWgegZrsyFG7farEMNFZFN2nQ4O
	Lvsfq3pAa6bfN9ryBmQc/LD5PexkwOkzqRaIx4SlIiziQSqa7N+suGLAFL93On6iDJ8xLM2ajo5uv
	fPMyOkRcmGHSXp1689L5WR7nvxlxRhqGowf4EzSA4RPIUXHdMwGDyZfCHdRchLQMN4E3COpqpPUhu
	cxk8Lb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9qc-00000009mo8-3ENL;
	Tue, 20 Oct 2026 13:25:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9qb-00000009mna-076t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:25:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAJV92214644
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TqphKuuzdQfZj8vC8DGTuD4k
	crG3fghciLwkO9jLrUc=; b=TZ+1xYDTCOweYc3NVCBnbpA4EmccBikSPN8shBC2
	VjAI1tyaEqOSGl47xUIIyarYRg7jlIl2vudoYbHxUovAvAlSsRMZCKThdeQyFx9X
	ONH/iujzpXDo7m37t5nXJ3OjX2reb8OjSRzIiQ6wrq8ReruE1osHFRdBbksDes0x
	WDQHXYQqm+/+/UcTjxit7A4hgy2OprFLb76OD+uHB8K1qkXR6Zxi3kJHN7rit+bv
	DjOi9rL1CcEbmWaaEyunuxcFMoG5oy03tGVaAM0jusEaqWartsb0LNucDwwAbOdT
	SvugRnLjVOL7Up/JBfmX7j8gUHDLHj5Av25RIHlWpbYTwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntjmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:25:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso129070985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502743; x=1793107543; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TqphKuuzdQfZj8vC8DGTuD4kcrG3fghciLwkO9jLrUc=;
        b=YBtzqgILC7aW997Y2qRYZXH6KmlA+/V3N5zK4FIEbO/RvUh0mnKwTYcHEAwLSHGOrp
         DUUnMKHWeFAdHDr6a6+zNDHF7/UrCzkXcGE7kqpoT4uvMMUsATl9+oEJiskAE+Ae0oKa
         mJAWW+qgaB8Cz7/vtpUvr9tIahFW1jooLPsvtvCNsmDWN8osVfeLGjeLY0S+zJMTvVVb
         aXMmnPj/e/+bJSOm1Nm4pjttq/ttMCnh67fHFIihr0iEAXwPPaFGr3wFYf+pKFF3muvP
         oiRz0sfm+/fPVrkRkCU/deiI+mAqkxPAPQCjWtlsVReGsB7RgV6C0P2F1Wdzx3mv7fJI
         kJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502743; x=1793107543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqphKuuzdQfZj8vC8DGTuD4kcrG3fghciLwkO9jLrUc=;
        b=j14X+1XkpY1wL0HLNcnQcD1pjyJD7Y1bjjPia9XoHY1QqaxwotX0OkT4ySOYjvSti4
         XmtEcbjGvsu89sx0brtY4CtLwlsMu9qDYYSnTLR7D3/Tr+3vh6VpzMqjAAwozMfr6FNc
         vLUlPflq0relQiF88kS1PAh0RRYsFOhjoZCuSXdeKAn4BjNYLB9ECsc1EsRPFwS/fQ0o
         IXgkRNzJuTkifv4U2snULUsDFA2LG+FfhSORgilpk/QlX2Nf75xY1e5XX2Ho2tskq8bp
         7pSTCRDURhlgGweC3+liuM+QWGvYF664UcSsT5bR1BLE1pxTORTiRdYWmKOJhUUU+ghj
         GKzA==
X-Forwarded-Encrypted: i=1; AKwUvBx3EV5qkD3l545XtiRSxhWjyxloVjl62m8m0zw/Mkrl3+7ucXwnQxWBRi4io0uf+J0MVPEeok7T03+DkuSqFGc7@lists.infradead.org
X-Gm-Message-State: AFq9FYK3SGxAUkF5nYvVwIfYykUa7lcUgmVASdyX11vPaoEN8udp2Vpq
	WPJn00JdUChcFf9KTJ0JSfOjeHQBMt+TAD1JpPxaIYNVOnToxTmv2PmIekPW/NlTwoBU4UKrxu8
	ES5UIxQ2zTTcn4Bz1phYwmZSzHMeZmw1gzK/jr8CBLvgVzHkXxnjjnfwYFJr8VFIM9Wp+hyJbkK
	ThWw==
X-Gm-Gg: AYBFou1kkjqCjKoj9r7eGravBOhhXT8w6/oX4O3RAfjtneJx/Eurf33gS18QHIEN+d6
	tT8Y43o9dV6zG4ZE47BgPqTFGNNlnEJc1pIRz7pMBECYWXUJy7PpfavcygGMloJG94pLNVzUGk5
	oiUH7L9z81yvhIrx75eF7h2FnBVNs/1iGTv7QC+dPp+rQpPzYACXKDEvKfRsct7X2Q8v5+Hpeas
	i82CnKz4MaPgIP/+wqTYw4Wn25bUH98w1W7BC02Y8OwDqWpRTbGSAo2J4QuFylsRv5/HqVHY21X
	QOneRIvgpx9z+9+q9PUr064TQApIElvAzHeFMvuPj+kHs35YFMubkLsmmc4E/ju/NeR8ohCa97E
	RRbUi7leR3NteEg==
X-Received: by 2002:a05:620a:294a:b0:93f:3834:31f9 with SMTP id af79cd13be357-93f4c54760amr297016885a.12.1792502742996;
        Tue, 20 Oct 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:93f:3834:31f9 with SMTP id af79cd13be357-93f4c54760amr297010885a.12.1792502742352;
        Tue, 20 Oct 2026 06:25:42 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82456asm6766343f8f.42.2026.10.20.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:25:40 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:25:40 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v8 3/5] net: stmmac: drop multi-buffer frames in
 XDP mode
Message-ID: <atdr1N29Z3X0V2hR@lore-desk>
References: <20261018-stmmac-rx-mb-v8-3-5f58c0b25849@oss.qualcomm.com>
 <179243151663.3135.5003290847659035107@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vxBQXxJ5vVdF3FzZ"
Content-Disposition: inline
In-Reply-To: <179243151663.3135.5003290847659035107@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX6D/AH59HuMQi
 M+323AIVpYn5H2qoRAYInrEmE8erKaHhxRQy6EjKXB7g7J8zCcp9WrSxcLTwyZ/9U/WBiAfQE2L
 +ACLwzacX/W4B+7A4kgLQLvXuH3OlaU=
X-Proofpoint-GUID: DjDoDi6QoAv9ANdd44OVVW8amufSYr3U
X-Proofpoint-ORIG-GUID: DjDoDi6QoAv9ANdd44OVVW8amufSYr3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX0RVSenDwlcJ9
 MsxmjRwcSyNH1P+dQxjXd7/7Vkvr8oYFOgNbBnGbhqmeeTsB2W99MiT5uNiL1gc9Lw/kRa53iHy
 RVj/7MBnBL30FbNlp6GpHcYHkvcl3NwdycDVQsj3KWr0VAOc53Wek+1fuXUdBiGWK55pkqT7Ur9
 ++rTN8CljW6wAD78PsM8Yb+k1ExVHNyEYU1eu4TaDcW1cR9mg/Ae7funAUBMwZJenaor0xedpey
 ECE5w6hqFjLmzZEzKbqwVPvVYh6BRtn8ue+KzSnOJGZiRKO+vK8BhUWsJyKQNxhk2sXaAN90bHk
 LK0tIJ8M6JmPN3Twiia1iPvwiS3Qq9YnuGabGNN3cU6kxle6ifGlrj+UHHoDVKb/WhHHOINNIXf
 VKMXinM7lFnkA6l37n0xkxHg8I4Yv+aggib5sl1BxGHrp9u6jf+a1a+1rcazGVV/4aPrkAp3YW8
 xyv/ZY1kG6FNpeL7CCg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad76bd7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=TDT_cie5QS2Ta5137pIA:9 a=wPNLvfGTeEIA:10
 a=JLkvtGKUs3jDVbLDuzwA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_062545_210364_88601584 
X-CRM114-Status: GOOD (  36.33  )
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

--vxBQXxJ5vVdF3FzZ
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
> - [Low] The commit message does not describe what the patch actually
>   does, and it hides changes to the non-XDP RX path.
>=20
> --
>=20
> net: stmmac: drop multi-buffer frames in XDP mode
>=20
> When an XDP program is attached, stmmac_rx() now drops any frame that
> spans more than one descriptor, or that uses the second buffer of a
> descriptor. This prevents the XDP program from running on partial
> frames. Both XDP_CONSUMED and XDP_TX/XDP_REDIRECT now finish the packet
> via next instead of re-parsing the following descriptor.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index efa88cd359dac..e929cc0f23125 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5888,18 +5888,23 @@ static int stmmac_rx(struct stmmac_priv *priv, =
int limit, u32 queue)
> >  		if (priv->extend_desc)
> >  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entr=
y);
> > =20
> > -		if (unlikely(status & discard_frame)) {
> > -			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
> > -			buf->page =3D NULL;
> > +		if (unlikely(!error && (status & discard_frame))) {
> >  			error =3D 1;
> >  			if (!priv->hwts_rx_en)
> >  				rx_errors++;
> >  		}
>=20
> [Severity: Low]
> The commit message says the patch will:
>=20
>   "mark it as errored as soon as a non-last descriptor, or a descriptor
>   using its second buffer, is seen while an XDP program is attached,
>   drain and release every descriptor - including the last."
>=20
> Is this description accurate? This hunk removes the only
> page_pool_put_page() call on the error path in stmmac_rx(). After the
> patch, none of the drop paths returns a page to the page_pool. That
> covers the hardware discard_frame drop, the new XDP SG drop and the new
> buf2 drop.

I will fix it in the next iteration.

Regards,
Lorenzo

>=20
> The dropped buffers stay in rx_q->buf_pool[], and stmmac_rx_refill()
> reuses them in place because it only allocates when the slot is empty:
>=20
> stmmac_rx_refill() {
>     ...
> 		if (!buf->page) {
> 			buf->page =3D page_pool_alloc_pages(rx_q->page_pool, gfp);
>     ...
> }
>=20
> The reuse itself looks safe. All three drop checks run before any
> dma_sync_single_for_cpu() or net_prefetch() on the buffer.
>=20
> The new !error guard also changes rx_errors from once per descriptor
> carrying discard_frame to once per frame. Both changes apply whether or
> not an XDP program is attached, but the subject says "in XDP mode".
>=20
> On dwmac100/dwmac1000, the previous patch in this series makes non-last
> descriptors report discard_frame | rx_not_ls. So an errored frame
> spread over N descriptors used to add N-1 or N to rx_errors, and now
> adds 1.
>=20
> Separately, the new buf2 drop in the later hunk doesn't set error, even
> though the message says the frame is marked as errored:
>=20
> 	if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
> 		rx_dropped++;
> 		goto next;
> 	}
>=20
> It only behaves the same way because, in XDP mode, that descriptor is
> always the last one.
>=20
> This patch carries a Fixes: tag for net/stable. Could the commit message
> describe the in-place buffer reuse and the rx_errors accounting change
> for the non-XDP path? The later "net: stmmac: rework stmmac_rx to
> support XDP rx multi-buff" patch keeps both the !error guard and the
> in-place reuse, so it doesn't change the picture here.
>=20
> > -		if (unlikely(error && (status & rx_not_ls)))
> > -			goto read_again;
> > +		/* We do not support SG in XDP mode */
> > +		if (unlikely(!error && (status & rx_not_ls) &&
> > +			     stmmac_xdp_is_enabled(priv))) {
> > +			rx_dropped++;
> > +			error =3D 1;
> > +		}
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =B7 https://netdev-ai.bots.linux.dev/sashiko/#/patchset=
/20261018-stmmac-rx-mb-v8-0-5f58c0b25849%40oss.qualcomm.com

--vxBQXxJ5vVdF3FzZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatdr1AAKCRA6cBh0uS2t
rN3jAQCaiApD3+2JS+qQm+aR4BOcf3d7wVouCDJRsCQXljaJFwEAj5TJnQHUlrQ5
XvtiDdwp2G+QPXu/Ke2Mxtl5AN4IGgs=
=bcEw
-----END PGP SIGNATURE-----

--vxBQXxJ5vVdF3FzZ--

