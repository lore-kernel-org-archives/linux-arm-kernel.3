Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C009606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ozwt7Wh;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kvDMF3W9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NsCHcP4Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SMwk5Ye/bYPS4wNLtjuoo+6vOdmAzp9/klLAmSpZWgA=; b=0ozwt7Wh+ZQu3GMTrCa8EAaam/
	IWkc2XTgJuXctIEVo1or5Pv83g3moT6YkzH6TOOm+RNQutQ194Q9IQs5U6chEWlEdrD6nyvKuc6EZ
	fB4dx618WjARpsAEbT0MikUoSBnHl5aIGvozWYGeH2QtF2vsYygYo9+KQunlMW3D1UYq38KA8jhxy
	YYh9mZdr7pcF+Lp2u7T8whmQ/6nYeixF90BdGbMjlFpgz5MWyup/AE6R/uGieUd1aagGKq4Y29/63
	eBS5/2u90uX6MkR9k3MXpRBiVeinKqo1+WvxEvY14QzLgeP6c+bMzrB1bUCjtmHHKsXhxoq+2DjCz
	4rl6SUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi8X-0000000B8om-3yrF;
	Fri, 30 Oct 2026 08:38:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi8S-0000000B8n9-3cCJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:38:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9Kw3267882
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SMwk5Ye/bYPS4wNLtjuoo+6v
	OdmAzp9/klLAmSpZWgA=; b=kvDMF3W9l+sTSqDU+lhaXNONwEDOIOtO64ZpR0fV
	HSk17FtTM1wXg0hbU4I9QcCj2R7xmYyIcW9PPmipGme4V/utBR4nOyhdpskrNq3M
	ZqRQRHZInjnqDm1lEZ0Hy90ynGjL21AiVvYaIXrkkPPCYsDEwtTekddKQIVLsMwF
	Ai/Y9pYvM82uCXuI8o2ujUg000vGZcIy2lfnRqq3DtH8j4zddI+feWxtVSpRNr0Z
	lvIbRBdyYdI4nZ+UtFC/Pu/M53nToFaxtDeVLCUW5W3OMLuTBupz9lIlZbwVk5/r
	u/Uq7iOtxLZOMIZ1vGQzHO7XVy2nIqzLgUAkKCqyWI4EJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj29v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:38:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so72602185a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349530; x=1793954330; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SMwk5Ye/bYPS4wNLtjuoo+6vOdmAzp9/klLAmSpZWgA=;
        b=NsCHcP4QwAhptpAS4Nutvas413X+ChnQLhjeEj7+3mg2HRQuKGeO+sCApyrsjSRzoQ
         Fiq25SOqCw/BHCKAFgx8LhMlcug6bbyK4UUqXbX4l4xvNCDYc/B5YdrAZuxicoXeUVNH
         wyRcEitNnEXQAJrtHV96A8s9u/FumsW0FBgzPUirw0J9gP0Runvemp5WeDlhubcnDPeI
         qfnGjf/AuVGlHd3BdOPCzkD8Aq0qjti+nZru0IV1zNy6gCOiqggkDq6dzcFZup2jhLoV
         NFFpbnsXfLBHgFeMh81dCR0BJIZK8vnl56/uY/+dvD7E/e9SPaZEQg0ZkuYnPorqYSj2
         pdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349530; x=1793954330;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMwk5Ye/bYPS4wNLtjuoo+6vOdmAzp9/klLAmSpZWgA=;
        b=gAJmhY8OIQCM0FG5SAXUrzfyWxGvhsUcL1cvfUDmcu/XEeQlCZa9RUhR/vasEDvJ2+
         TS9pCpQUBA4Vm6tAhBW8/g5lrCVwbyYvzVa8+fID9pu7oNtRurGjhNetSjsBFnx9SnZ3
         IXA2RlMdAMpDPdijM/4yVPL5EfOYhRtzLruXdGvPkidh6mfUEJ0YzJWuFXWe3JIYHfWI
         rKenWBzYq90OvmwbZNOcwVxt+jQzovHqsmzfb61hsnD8UxrZwbBxQedwQjLczW1xxaTZ
         cxtlVXz7VdUKiSJj9BizgZGvGG5UMPwo9Np6CT633WnpDzH12AJG5FY5UugTXAPw5XKY
         FxcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxNWJny4zXjUa2mm5yTW8LiDrqydDkTQ2uFz5Ek9sU3FVE5xaiEN5gEuuzWgAYFCVdnRn09jUFPB8notWC9Pbb@lists.infradead.org
X-Gm-Message-State: AFq9FYK64i9yn7+ExCcC+zDaFpOU9L6sLj+bEQ1nChtEBqilFvjM247l
	9DBFTBZTJOWaI8uMVfAa8k5leKhzZLEc/JJZtka7axLpHNm96uBmX18Abpnb+fIklqMsr4aJ48x
	R5llDAkfzB+1afISwP4WqftF7KyFZdcBI5BF9giRBa+yaM+VPCANlwEEdaPaTl2zVzCMmax/0mw
	wTRmA1jJNzLA==
X-Gm-Gg: AYBFou3Bk9RzRS6rRXCcz0oWM43VQUDNLDhZiB34dx71DxM5bz8Qa41mT7w15OIHh31
	J5/pSEvuT/V7FmrsXmMV+m8S5cbLuKG0ouqZ9RYklj9hY632LIgV+Kh6iz9L1BQ4xvmb9exhO8g
	x2KqbNEmH97YfAY2lS4k7b+H/SgDPKBDTqxzYJ1/SKxi0ew2nsPwxMj4NBlyYxj/Q9jMYBhnEwY
	+K3szrC6yE5COQ6dymfNSF18OPHREnfYT7xDZ6WUM4myhDnnkwxL227sxXvx7dLNXROmAZshAmd
	JphBxEaRiDh5ScZVV2h1tZDfhBw2QFv1gRvPHq9BD3wegrHjyIz2vGtLgnlnscvRjkLiT3iQK7O
	Mx6vCT6KchQuiU4Dsnn+v471MChcfEaYgbzHptm3CQRjHikJK8UT1v+xATRlyId/meP/739oTgk
	8+TDwMSnLk2rH/fiLyUFR/Tg==
X-Received: by 2002:a05:620a:8014:b0:939:733d:cbe0 with SMTP id af79cd13be357-9442158555emr265485185a.3.1793349530382;
        Fri, 30 Oct 2026 01:38:50 -0700 (PDT)
X-Received: by 2002:a05:620a:8014:b0:939:733d:cbe0 with SMTP id af79cd13be357-9442158555emr265483385a.3.1793349529805;
        Fri, 30 Oct 2026 01:38:49 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm32889715e9.2.2026.10.30.01.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:38:48 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:38:48 +0100
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
Subject: Re: [PATCH net v2 1/6] net: stmmac: take ownership of saved RX state
 at poll entry
Message-ID: <auRXmDYaLRkls6ea@lore-desk>
References: <20261027-stmmac-xdp-fixes-v2-1-10eae8a093a8@oss.qualcomm.com>
 <179334662373.3134.1104093737847451563@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GwTlmuwKyHB3BHtS"
Content-Disposition: inline
In-Reply-To: <179334662373.3134.1104093737847451563@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXz/c2QHqXJ95N
 62xSzi7RyOc/wcpCcHwzCN3erJBIAFgMEN8+hCertE79+N9Oqx0SqRz/Oky8A2gw8YHeiBcMd1r
 3jiMMfaDeDg06ByiDVjN6bFk2QEEehhR+iTGTUgij0PWLpxW4/yC31BRI9fegw8fv0fMzMls2/3
 sL8SQfZjJ9+deYzOoOvulXoqQkNfK8CBt06KOmWbhu/Qc2rhwH3CQ+gH4ZDjIYQCPAB0eHonFNA
 w/C9446jv5wMLC81YyaPBmnwtEWS0PjSC97jKc5bynkd7O72mCE0oChx17V9x69v6X4sjIrsa9D
 XRqnugcVxAUOQJMMFJQokIDOvImqUkt4aYvooLbg/K3ZSeOZ3xa1459BOHDNqVZTc2fx/wEvdv/
 rMmSCYwUbU5MQv/9ONnhG1PyV67v5YpXVaE1eUC3dABib50ed8k1htO3JTdvkEGG3qQPaTuVfSV
 iX3u3sUx/MML8tl15IA==
X-Proofpoint-ORIG-GUID: 7_0S3kfqJLP2RQVnlb8pxnCdmR-pq7li
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4579b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=x-ypl-TzxbZATBLWrugA:9 a=QEXdDO2ut3YA:10
 a=o3Dn75d1IjpRQCD25FcA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXyUveqY9l9Spx
 5vhFCG4R0OF/X2ClChIcHLL5zlOiQcZiR/jW8Q7jiDWuJOKE6FZUk1hVARTHo6x+out/de1S5lW
 bT5mhgyBd4cUgGI+mC6bzXF7ACXxD7E=
X-Proofpoint-GUID: 7_0S3kfqJLP2RQVnlb8pxnCdmR-pq7li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_013853_140214_A80DBF2E 
X-CRM114-Status: GOOD (  47.00  )
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

--GwTlmuwKyHB3BHtS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>=20
> Low priority / nit picks for your consideration:
>=20
> - [Low] The commit message gives the trigger as a saved partial packet
>   completing "with a poll budget of one".
>=20
> Pre-existing issues:
> - [High] In stmmac_rx(), if napi_build_skb() fails on a non-last
>   descriptor, the code recycles the page, does rx_dropped++ and count++,=
=E2=80=A6
> - [High] On resume, the RX ring is handed back to the DMA without its
>   buffers being refilled or their addresses rewritten, and this patch=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: take ownership of saved RX state at poll entry
>=20
> This patch makes stmmac_rx() and stmmac_rx_zc() take the saved
> partial-frame state at poll entry, clear it right away, and save it again
> only if the frame is still incomplete when the loop exits. The in-progress
> flag is now tracked separately from the status of the last descriptor
> read. The saved skb is also dropped in stmmac_reset_rx_queue() and
> __free_dma_rx_desc_resources().
>=20
> > When a saved partial packet completes with a poll budget of one, the
> > old loop can leave state_saved and state.skb pointing at an skb that
> > has already been delivered or freed. The next poll then reuses that
> > pointer, causing a use-after-free or double free.
>=20
> [Severity: Low]
> Could the commit message say how a budget of one happens on a running
> system?

I guess this comment is minor, I can amend it if I need to rebase.

>=20
> With limit > 1, the old else branch cleared state_saved on the second loop
> iteration. So the stale pointer only survives when limit =3D=3D 1. Normal
> net_rx_action() polling passes the NAPI weight.
>=20
> stmmac_napi_poll_rx() passes its budget straight through:
>=20
>     work_done =3D stmmac_rx(priv, budget, chan);
>=20
> Busy polling can supply a budget of 1. In ep_eventpoll_ioctl(), EPIOCSPAR=
AMS
> only asks for CAP_NET_ADMIN above NAPI_POLL_WEIGHT:
>=20
>     if (epoll_params.busy_poll_budget > NAPI_POLL_WEIGHT &&
>         !capable(CAP_NET_ADMIN))
>             return -EPERM;
>=20
> SO_BUSY_POLL_BUDGET in sk_setsockopt() can also be lowered without
> privilege.
>=20
> So an unprivileged local user who receives multi-descriptor frames can
> reach the use-after-free. Would it be worth saying so in the changelog, so
> stable reviewers can see this is a user-triggerable memory-safety fix?
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 9ded31150fbe6..fa7108919e90d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -6041,10 +6051,8 @@ static int stmmac_rx(struct stmmac_priv *priv, i=
nt limit, u32 queue)
> >  		/* Remove FCS if needed */
> >  		if (!fcs_stripped && pskb_trim(skb, len)) {
> >  			dev_kfree_skb_any(skb);
> > -			skb =3D NULL;
> >  			rx_dropped++;
> > -			count++;
> > -			continue;
> > +			goto next;
> >  		}
>=20
> [Severity: High]
> This is a pre-existing issue, but what happens in stmmac_rx() when
> napi_build_skb() fails on a descriptor that is not the last one in the
> frame?

This issue has not been introduced by this patch and it needs to be fixed i=
n a
dedicated patch.

>=20
>     skb =3D napi_build_skb(page_address(buf->page),
>                          rx_q->napi_skb_frag_size);
>     if (!skb) {
>             page_pool_recycle_direct(rx_q->page_pool,
>                                      buf->page);
>             buf->page =3D NULL;
>             rx_dropped++;
>             count++;
>             goto drain_data;
>     }
>=20
> error stays 0 and skb stays NULL, and drain_data jumps back to read_again
> because rx_not_ls is set. The next descriptor of the same hardware frame
> passes the error checks and takes the if (!skb) frame-start path. A new
> skb is then built from only the tail of the frame.
>=20
> len still counts the dropped prefix, so the pskb_trim(skb, len) above does
> nothing and the FCS is not removed. The trailing payload bytes are then
> delivered as a standalone Ethernet frame.
>=20
> With Split Header active, stmmac_rx_buf1_len() returns 0 for any
> descriptor after the first:
>=20
>     if (priv->sph_active && len)
>             return 0;
>=20
> That leaves the rebuilt skb with no linear data, only the buf2 frag.
> Wouldn't eth_type_trans() then hit the BUG() in __skb_pull()?
>=20
>     eth_type_trans()
>       eth_skb_pull_mac()
>         skb_pull_inline(skb, ETH_HLEN)
>           __skb_pull()
>             skb->len < skb->data_len -> BUG()
>=20
> If the stale page bytes look like a VLAN header, stmmac_rx_vlan() can hit
> the same BUG() through skb_pull(skb, VLAN_HLEN).
>=20
> An on-link peer sending a frame that spans several descriptors, plus a
> GFP_ATOMIC allocation failure, is enough to trigger this. With this patch,
> the in_progress tracking also carries this skb =3D=3D NULL, error =3D=3D =
0 state
> across a poll boundary. Nothing else in the series seems to address it.
>=20
> Should the napi_build_skb() failure path set error =3D 1, so the rest of =
the
> frame is thrown away?
>=20
> [ ... ]
>=20
> > @@ -8421,6 +8430,9 @@ static void stmmac_reset_rx_queue(struct stmmac_p=
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
> This is a pre-existing issue, but this new free happens just before
> stmmac_resume() re-arms the RX ring in place:

This issue has not been introduced by this patch and it needs to be fixed i=
n a
dedicated patch.

Regards,
Lorenzo

>=20
> stmmac_resume()
>     stmmac_reset_queues_param()
>         stmmac_reset_rx_queue()    <- frees state.skb, rewinds cur/dirty
>     stmmac_free_tx_skbufs()
>     stmmac_clear_descriptors()
>         stmmac_clear_rx_descriptors()
>             stmmac_init_rx_desc()  <- sets OWN only
>     stmmac_hw_setup()
>         stmmac_init_dma_engine()   <- restores the tail pointer
>=20
> No refill and no stmmac_set_desc_addr() runs before the DMA restarts. That
> means two kinds of descriptors get re-armed with a bad buffer address:
>=20
>   - slots stmmac_rx() consumed whose refill failed. stmmac_rx_refill()
>     uses GFP_ATOMIC and stops at the first page_pool_alloc_pages()
>     failure, so buf->page is left NULL.
>=20
>   - descriptors the DMA wrote back after napi_disable() in
>     stmmac_suspend() and before stmmac_stop_all_dma().
>=20
> On dwmac4/xgmac, write-back overwrites des0/des1, which hold the buffer
> address in read format (dwmac4_wrback_get_rx_vlan_tci() reads des0 as the
> VLAN tag). dwmac4_rd_init_rx_desc() only sets OWN/BUF1V/IOC in RDES3. The
> DMA would then write to whatever status data is left in those words.
>=20
> On norm/enh descriptors, the old address stays in des2. The slots most
> likely to have failed refill are the ones whose pages went into the saved
> partial skb. The dev_kfree_skb_any() above now returns those pages, still
> DMA-mapped, to the page_pool just before the hardware is re-armed to write
> into them.
>=20
> Can this lead to DMA into pages the pool has already handed to another
> descriptor or released?
>=20
> Also, if DMA completes into a slot with buf->page =3D=3D NULL, stmmac_rx()
> calls page_address(NULL) and napi_build_skb() on it, which would oops.
>=20
> The commit message notes that "the RX buffer addresses are not
> reprogrammed" on this path. Would a full fix need stmmac_resume() to
> refill and reprogram every RX descriptor before setting OWN?
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8%40oss.qualcomm.com

--GwTlmuwKyHB3BHtS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauRXmAAKCRA6cBh0uS2t
rNC5APwJ0r1A/1E3GxQ3pBn+CW8KtnycbSdAVH4ybEyCN8sjSQEA9LVEsM/6+ynf
5roRrlhlgDObZ9LYdupLViYh6FkLcgQ=
=C9fm
-----END PGP SIGNATURE-----

--GwTlmuwKyHB3BHtS--

