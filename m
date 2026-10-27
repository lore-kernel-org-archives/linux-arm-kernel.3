Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB2606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gfzs945b;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuCRiRC/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST5pjkQ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iqD5vVTTBfwoyL27JJNk8QW987++ASEipnY8mTx2+X8=; b=gfzs945byw1n48SXISyFZMhZcm
	T+NcaQJZzuNZQQgtfWtKB06zrywyB6L5hUGfW7o68AyzJF/Wb2fppC5X2Jj5HyGRpSgPAdIHbhy/b
	1AMq/I5A1WLdIx003UcIYuCNW0bJjIntaGsTtNplDpJThuPk+SNKbegNMLH3nOH9YtmCLsXX9TkVP
	DIvcwQCUjtrWeLYnnKZI5lAfO9m73DFZ7WuPWjsc78l8jDS4Ud9kiXUh2T5zGnxq9G+0kOFYvUCFt
	bB6psakCaPqhELoNFimgm7YArtdo5b1+14sYng5EsGHuPfFZDL3/Hv89pPimixoNEMSdeSlWmNyuI
	ZQNmr0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfWG-00000004Uvw-3mLy;
	Tue, 27 Oct 2026 11:39:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfWE-00000004UvK-1tdR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:39:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2fi1974129
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 11:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iqD5vVTTBfwoyL27JJNk8QW9
	87++ASEipnY8mTx2+X8=; b=VuCRiRC/VaFyAGrn6r+gYBN1zvuZ/8RX7thyBd7U
	XuGZU3AtaQzIPZ642s80omtQq4OPa7YVpGQNnWd0aM7Yx8ICHzQD0+bjfUEEaF/Y
	USegby5gMJG84trbWA+mgM9AKi24d+CpFx/jkpXkLzZFEFOqA0eGJfZR3GrkMeYK
	pouWkLCbRomvOO79HB26LtD1tDnLYTssi7N1U5+6HMqhFmBOXtOu3V2symLqsZiG
	M4jsJQD3G0F+slbafLirjxbPFJmVeA8XWL+XgMfDXcm5dYkCx3M9/kzvGDnJBSmK
	lUvhGtxZCyK6bmLTxHrST4SVGPRM4k+h4qcH/hUkESavpw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gbpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 11:39:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bebff9fcaso144872046d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101145; x=1793705945; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iqD5vVTTBfwoyL27JJNk8QW987++ASEipnY8mTx2+X8=;
        b=ST5pjkQ0SzyF5WLXvmeSRg/RfUOWy1QvS2sq6OtOvrpSEB6KGt81ooIjI++54X/Dcm
         m3cwSFTGGSSOUP76F6a5xh1F+8KaoG9E5lFlFIwb+aQYl2V5AKpGX7NFBT9cVQ+YCW51
         KV8McK4wZl6RmlGzFuewVg09C7VzBh46P8MYn6mT17Q0dxh643dzP3Dbo/Taudhg3c/I
         GoXDvcimtIgkR4t/WjgE6hgR9mkknIV5o4mDr8ftGnZAF3acCm/ztX/J/AXfHalF4pf+
         dKvTgA1NWbnKY/8IIYoOXPqEUcUf7XX5bjgzVAJWNZ2FOVsq6DFymIXps9q4CHz/kcKL
         hZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101145; x=1793705945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqD5vVTTBfwoyL27JJNk8QW987++ASEipnY8mTx2+X8=;
        b=Eg9QOLaHm4wpkfamJ/G4pC3XlCWntLe4UxPnWW1hKItVAc4ppiVM0A0kmK9VovZVP2
         hkcU03GZx+2m7KfW8k1OQkExKKtsmWoLNwSdzWxUSzGLxEEcgjqWrG8qWYhzL+uzep1T
         cY1Q6NtX2XsObY2hpSNWQg2pDi58DCcjBsoAOOIr6aaz+zDmlOEPJ+CcXFH0C5FLpa1b
         6de0VtcY+DnC7OTUp2/CJdqgPk8ktugEzRGVAJqiP9BjA/1IttWv/3xilDJXi/Sl1RDk
         eIfEE2aGyp1lO8MORczrZUBknNMRkM77upoI/cRRBNCftPPF1TAtj4WzXdgsB7GMjROV
         X5Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzYop5JTyH+sK/r5ckUIXX9vDw+/E2kFJ7DkxGP8unWaXq5Syi1fYM4q6tfzHrBniuS4CF6DkFgciQS8N0v7nWD@lists.infradead.org
X-Gm-Message-State: AFq9FYLMVDp3kx2b/+kA7mIJy7ULTqTsVXMArN1rtcAM9wU/Viouwt+Z
	bwKNpW31ZUmdMDyA0yTJvfyrGmn7EOtVBx3rRTrq0lnLkR5DSXtXEbYtViMT6Hyd1Zt5WJ0aDcJ
	yvyUFgBddBsdnRiTFNIb9ywn8duE69cgr/zRQDTaiBMw51l1peBH72krVMvKcxqCI9E9WGWKLMb
	Mj9g==
X-Gm-Gg: AYBFou2jcN9Q3b5RgIYIFnb00D81CvZ4Rer1L4wTm8qGqrXgSEYFS8yj3d6G5AiA/mw
	JBZzfbFvzGZdCZ2phfTAMgs/p0QqSMpIXLYkXF4qEX/7EFkNSlL/RIA5aikIJVnTfySclSQeNCS
	LDrVtFYb3LZ5G/WhIHCutcI6BVtVtasrhkwq+VNgW8gG9ZTFBn+BjQT6sea0rVpkwFAu2S4tMik
	sO0fE+flmkls270n3cIBt3SXe3WwRJeR2fK0+T7GbCRO1e8SeP7Tu3ghZUPNixvDef6ejZxJmFA
	MIhKN1P9XRDbgBC6eWv5OxsNvddWJGhfgJrkud2K0lKIql3n+H9vTYniddV/OClq1c6u89CwElJ
	WzApX/988awRayg0RaAbaf/Szd4IfQwVieT0dzfji5fK8pRCg
X-Received: by 2002:a05:620a:4515:b0:93e:48fc:aa85 with SMTP id af79cd13be357-940ef9571aamr1426241185a.43.1793101144046;
        Tue, 27 Oct 2026 04:39:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93e:48fc:aa85 with SMTP id af79cd13be357-940ef9571aamr1426228385a.43.1793101143118;
        Tue, 27 Oct 2026 04:39:03 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22840875f8f.46.2026.10.27.04.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:39:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:39:01 +0100
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
Subject: Re: [PATCH net 6/6] net: stmmac: fix XDP RX buffer DMA sync length
Message-ID: <auCNVe1pMumVcF3s@lore-desk>
References: <20261023-stmmac-xdp-fixes-v1-6-efb37e19f5bd@oss.qualcomm.com>
 <179309225887.3134.17502896212947474889@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="meEQn4EyMsDIqBx+"
Content-Disposition: inline
In-Reply-To: <179309225887.3134.17502896212947474889@kernel.org>
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae08d59 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=3lS5nG9XOEgB1YPr8hIA:9 a=QEXdDO2ut3YA:10
 a=R8n3WUYfiK2D1sPUeuAA:9 a=OIgjcC2v60KrkQgK7BGD:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: QUIxdiTzVhc0421SLG3gcvFF6T24iUu0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX4xqMUsv1IqZJ
 oR4eai1MNZz5VWa4RpI32ZcvaJNlkHSKDVMHR2Vo8JIn6NhHAZxQyTfLNNZy5Ad+lYpxL13xmVH
 AuJDcWtPa4qG0//cJgYvDhEJOktiJVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX6bFdrJa8B1Hr
 IPWL+XTOgOhcDsuj5W1tRVQRwcuYBdSTIO23s8idBh3P5meLt/3zyWsw9T9Q6FkpbOb3pDtV7wM
 iGCsiGOnOVn7TOZwCTivwi3jvkgaxxdQKyB8tExv4X75V6A0AEVZ+d3DOFSassadwMY+zVgup1s
 tM9JjedYNWbIvp7iwiCdTnU9ASX+dMfake1pGcVKLIWlGz4EVEHXfbDuRIP2arcgphqGaV3Jie5
 ddqOoVC2yhRNq3HriiMl8V+t5/pf8XJSgL+5xmQzPjeqJhUC7XxXT4uBHt+unpFMy//maL/g3gT
 S3UsoDfHRbpMCXzZ9cYfyENkUWNlJ+cz8b7hrvbWjicyukBiv10mppU49jkV5sJNVDhS6hl2LF9
 FUSvM5IMnellsg60U90LYNViUCmbCmYhqQqr+GcjlDiTsxcVH8cP9im8tJghutdH/A5Bifykb3p
 NjCkUiLKiaUNMZsXngw==
X-Proofpoint-GUID: QUIxdiTzVhc0421SLG3gcvFF6T24iUu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_043906_499333_589FD2D4 
X-CRM114-Status: GOOD (  38.41  )
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

--meEQn4EyMsDIqBx+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 27, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [High] In stmmac_rx()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c), the length passed=
=E2=80=A6
>=20
> --
>=20
> net: stmmac: fix XDP RX buffer DMA sync length
>=20
> This commit changes the XDP path in stmmac_rx() so that pre_len and
> sync_len are measured from data_hard_start, and buf->page_offset is no
> longer subtracted. That matches the page_pool DMA window, which now
> starts at offset 0. The goal is for page_pool_put_page() on the
> consumed XDP path to sync the whole region the CPU touched.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 32b2c5834c340..c51358c51fae7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5980,8 +5980,7 @@ static int stmmac_rx(struct stmmac_priv *priv, in=
t limit, u32 queue)
> >  			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
> >  					 buf->page_offset, buf1_len, true);
> > =20
> > -			pre_len =3D ctx.xdp.data_end - ctx.xdp.data_hard_start -
> > -				  buf->page_offset;
> > +			pre_len =3D ctx.xdp.data_end - ctx.xdp.data_hard_start;
> > =20
> >  			ctx.priv =3D priv;
> >  			ctx.desc =3D p;
> > @@ -5991,8 +5990,7 @@ static int stmmac_rx(struct stmmac_priv *priv, in=
t limit, u32 queue)
> >  			/* Due xdp_adjust_tail: DMA sync for_device
> >  			 * cover max len CPU touch
> >  			 */
> > -			sync_len =3D ctx.xdp.data_end - ctx.xdp.data_hard_start -
> > -				   buf->page_offset;
> > +			sync_len =3D ctx.xdp.data_end - ctx.xdp.data_hard_start;
> >  			sync_len =3D max(sync_len, pre_len);
>=20
> [Severity: High]
>=20
> Does this cover the furthest point the CPU touched if the XDP program
> grows the tail and then shrinks it again before it returns?

ack, I agree this is a real problem. I will fix it in v2.

Regards,
Lorenzo

>=20
> The comment says the sync covers the "max len CPU touch". However,
> max(sync_len, pre_len) only looks at data_end before the program runs
> and after it returns. bpf_xdp_adjust_tail() writes to the grown area
> when the tail grows:
>=20
> net/core/filter.c:bpf_xdp_adjust_tail() {
>     ...
> 	/* Clear memory area on grow, can contain uninit kernel memory */
> 	if (offset > 0)
> 		memset(xdp->data_end, 0, offset);
>=20
> 	xdp->data_end =3D data_end;
>     ...
> }
>=20
> A later negative adjust only moves data_end back.
>=20
> Take a 64 byte frame at page_offset 256 and a program that does
> adjust_tail(+512), then adjust_tail(-512), then returns XDP_DROP. Both
> pre_len and sync_len end up at the original end, around 316. The memset
> dirtied the cache lines in [316, 828), but this call does not clean
> them:
>=20
>     page_pool_put_page(rx_q->page_pool,
>                        virt_to_head_page(ctx.xdp.data),
>                        sync_len, true);
>=20
> __page_pool_dma_sync_for_device() caps the length at p.max_len but
> never extends it. The direct recycle cache does no further sync.
> stmmac_rx_refill() gives the buffer back to the device after dma_wmb(),
> with no more cache maintenance.
>=20
> max_len is dma_buf_sz + stmmac_rx_offset(priv), which is 1792 with
> dma_buf_sz =3D 1536. So that range lies inside the window the device DMAs
> into.
>=20
> On a non-coherent platform, could one of those dirty lines be evicted
> after the device has written the next frame into the recycled page, and
> corrupt that frame? It looks like the same failure the commit message
> describes:
>=20
>     Dirty cache lines in the tail of the frame can be written back
>     after the device has DMA'd a new frame into that page.
>=20
> The commit message names "grow the tail" as a trigger and says "the
> whole CPU-touched window is synced". The max(pre, post) approach was
> already there before this patch.
>=20
> Would it be better for the STMMAC_XDP_CONSUMED path to sync the full
> pool window instead of checking only the two endpoints? Passing
> p.max_len, or using page_pool_recycle_direct(), would do that.
>=20
> > =20
> >  			/* For Not XDP_PASS verdict */
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd%40oss.qualcomm.com

--meEQn4EyMsDIqBx+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauCNVQAKCRA6cBh0uS2t
rC55AP9UGxsbij3J4aUzASRo/KyX2he35yAIxxiEqHkTq1acuwD9H5JR/kGUZHLc
maP+Ju/MorEuwb/frXx/LrWFlgWzdgQ=
=hxk0
-----END PGP SIGNATURE-----

--meEQn4EyMsDIqBx+--

