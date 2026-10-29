Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBEA60A3816
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eGDiWZY+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pmotw7g5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTGLY1gt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kPMrNR5XuqrD2/EsiVlrT5xfK46VmBxcrpdSODzCzU4=; b=eGDiWZY+ad/0+JKNkX/8BVOjny
	+r1eq9+9Idf0yDkIXkQDyXYRR3vHgtKwjK/O2J5Wcz2KLOvICvtm15QEiGiAhrNJwT0rdIrYfA3+j
	f6kM0ofrxjTUI+YFubxtlktbHOeehPzsJCXU7ckoQdVqBNRWOxLteu7Eo4oCvOFQUv7k6IDeM8cOz
	2i3x+f2B6j1MS6yVUrRZBNQNIjxTJuyuFhGd/VYRHY9xKxq3R3jt7sLdwDrEU4fcleKToGPxs5rin
	Tlq2kXaMht051EXJHS/16HPBT75ebtcFO22j2K8qECJ1Ib/eUSgvFzcghzYSv9aZxUFMi2rIQTElt
	wsp1Rw3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMr2-00000008u8q-3OdA;
	Thu, 29 Oct 2026 09:55:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMr0-00000008u84-1kOF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:55:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vtNV3279787
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kPMrNR5XuqrD2/EsiVlrT5xf
	K46VmBxcrpdSODzCzU4=; b=Pmotw7g5ljQf0pNzL8oDHKK8kaqdYfpJQMAr9Eq8
	meyQBnFtCPLf49y0ayFCQ6ymilkYN8oweVVQ4doK3er5e0unXeCPKBKs3IQ71J/F
	0QzRxEcogax8rmVyclTdUHr3EAcj/nhrkGODEcAOjIc2Y3/rsQm6DisUqmcqoxX1
	WHTQn0s9KJ7wbKExi9Tv4gZIDZI9WS0nodEmnN3VcgwuOTr5vEgsDUlX0kWCw4Tm
	JGKD33WeTge0coSjyP0hjWPWEh62g4CO+3VAQWQTChkozjaFePvC7mcD/qOwtOvF
	VLfVMY92BjbpTFxSf77Z3HjV0Iy8vvryLi8Ka5q5wBzp9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nadpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:55:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9440b27c1feso284842385a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793267720; x=1793872520; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPMrNR5XuqrD2/EsiVlrT5xfK46VmBxcrpdSODzCzU4=;
        b=FTGLY1gtYmJsgBbKPUd/5UBWY/eGyhQ8k4I6wPd5iSLV98uglOrTjbhim3E2h2IlNa
         BPgMOfmYZ/+cvhLE84WXPOql9EY+pQS4bfkQQtClm/Pc6giwgzO3uABLxy/xCjEDfJu5
         LpC4XF6nNjPoTTCphP9MokhxoRmCqWPOorq+bba84965vwYcXiCPqcjGiOo3+cf+rMYa
         VoUwRNNF12lYegfW9N8GzorNv/MqzGbvSEv5FC4ZZZGbz4Si2PJo8bZBhCJr6iuKZhX6
         mpxIRvzmMZYa+Zlw4mQGOVeVMVmnDlrmwF08JyUnVVPe+5QPcMM6cWN1dwUM0nTm4TGB
         L4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267720; x=1793872520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPMrNR5XuqrD2/EsiVlrT5xfK46VmBxcrpdSODzCzU4=;
        b=PBchMF/SDcq6mIbwnHgXRGE2DGMexUojHoVwQ/qjY7/eT4BoxkFOYM6hLEHbBKhWA2
         MlrmRxPKDT6c4WjGBnZU0wNNf+YePs6L55VobxqKAudE9J3vsS0Wtx+f9RUIIG4j7YRH
         a42eUxbrlqswmKa/ESURHYwHJp6O5FRQI9JR3wzq0t1R1jTDH4IgMt+w33NFx1Q2cdRh
         t/9E5FSAkEBN0xfQTeVS4Hd+UbuKJOtpbia9GbvBU0C84Vf3bm+ea8SV41IYTTaCULPs
         sxrnCJc45BDJHU48F2v9gOiA8H+MKrdgLxc6RNXk2DHn+peeyIGOl06UYSQhLYseQ8ff
         SsGQ==
X-Forwarded-Encrypted: i=1; AKwUvByL8LG4RcRaAi5KHyy0mFVgDUTj9lbaL2xdb8HfZhfXnAqm8OBorJQIkKfOtMun1WqHETMYe1zf7xBX1RxR+xS7@lists.infradead.org
X-Gm-Message-State: AFq9FYIopeb9Y1O5NGsXjemvJqJu6ghQkpSqKWtp+YQyW2kekByUWJaU
	ZctMERSmX8Bg3X/vhT0mtvu9qPYU0GhEwtf60vRC53ds1bxM20YsDyS8L/q1qbW2qFCwAAlzTO9
	pMwa56eBJU+hMw7gGy5fGvCWqZILDkJ2UMijJlndQCrMKcjQP7bxFCl8/pr0WJ2WfJNjFANSx4b
	VVlw==
X-Gm-Gg: AYBFou0bwZ+sD6JtDQtRmFgGtGGPdXFR6aD8DNEAY3ny3spfQcrDwNPoM9dTFaLOrRt
	c+WNTanjEz1M3UBzXUXk2cGxiRHvU3mbInpDJjreQUyxgB90dawYFW4QRxyo4ar6rfa5VX9Ko/M
	4a2ymT6vG9jU6c9dXuB7vQaMX82ojB1eo2XnVxqmTNv7vAnLSgva87MI1toE9wTtTsnfrRaGm43
	7gQfiYkfaZrfdPt6WIPKaSHvhQplp2SVc1RS/MsgR9XBvWnWnQ2rHZRb8T7ykVSPtn2mHLb4bVY
	TAdaWgqg3a5QSZRErr/s5gnKSrVrXmywYXaktarWD9B9IOu7MW+w4OG4zwAD5czh4rDh85u5NXu
	VQb0lzfbYT5rWKzp+5Tnx6/BTLqLxPTQGp2TXK4XptTHCk2RVHLZT5PbamKT0cLu5yKnzSfEx5c
	Y3rD5FVnVs6eUMYUj1QvG5BA==
X-Received: by 2002:a05:620a:31a1:b0:93c:ba44:673d with SMTP id af79cd13be357-94408a71711mr719384685a.23.1793267719416;
        Thu, 29 Oct 2026 02:55:19 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93c:ba44:673d with SMTP id af79cd13be357-94408a71711mr719379685a.23.1793267718655;
        Thu, 29 Oct 2026 02:55:18 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm32594807f8f.2.2026.10.29.02.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:17 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:55:16 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        richardcochran@gmail.com, linux@armlinux.org.uk,
        Jose.Abreu@synopsys.com, james.hilliard1@gmail.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        rayagond@vayavyalabs.com
Subject: Re: [PATCH net v4 3/3] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
Message-ID: <auMYBOj_y_Z-AXjO@lore-desk>
References: <20261026-stmmac-est-fixes-v4-3-999dac4de44f@oss.qualcomm.com>
 <179326067100.3134.15863707026342807337@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7mG7OudezMBGU53l"
Content-Disposition: inline
In-Reply-To: <179326067100.3134.15863707026342807337@kernel.org>
X-Proofpoint-ORIG-GUID: kF8LsPO2nUPb1ae5GPQCSrRNpT5_aCsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzOCBTYWx0ZWRfXxmdwPnuwrOTH
 Hbj/H0uEX6p4mK8na1XYHHI4D/4WuLAXXFgFEBdM4B+OzRAMP7n18OZBcUYKjdptJpPhdiyxXgI
 ez14nsLfB+s4el7Iu1zLK0zOKpjHh35gvUWtaA6orTVqOEkGsmMpZuDPKHaUpeJCsm+zmeZjYy5
 zaHaUwe/1WKJnD90gsgdbekdcNzd4iuwbrHDgK+sWupdxsxBZEbb8OqxAn02qUqREMKYFFw4rfR
 SqUFR/OBki7UdPcTlEuMTS61uztXG6cNyAv6s5DplrUdicnAqZoQwoyJUxGzhGoSzgGDAx/ZfgC
 CTsKeT2jdhfJgg/cnoe1O+GtsSqVs4JPDVxmS/8ikiOfqkZqmrJyCzHxynAjkLRmk7gUJfXo3TV
 mN3TnUX0wUhvXKraeywLhcWL4Ny80TzPvdBUK99lugf0IcditP0GsXNWKCSzFyfEBh8B2Upy5XQ
 M/e2oQydQ23D4LnJNXQ==
X-Proofpoint-GUID: kF8LsPO2nUPb1ae5GPQCSrRNpT5_aCsB
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae3180c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=P5ZTCZ6uBUcQaEklmTEA:9 a=QEXdDO2ut3YA:10
 a=qjOxD71wWHld8yX8xuoA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzOCBTYWx0ZWRfX+HGg4sbRQ32v
 Abvb2+idM1oFlk2aPBm06+ayY40c8RPBAfa8/cTa3RjCJRi3kCPWmKW/KX/oIHPKYEH/nQCfJZm
 ownWJSIl/3Zo2KTpu9ZdXIO4N7sTu/M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_025526_796291_98EBFF88 
X-CRM114-Status: GOOD (  42.46  )
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

--7mG7OudezMBGU53l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 4 =C2=B7 Low: 0 (1)
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The patch says it re-applies "the taprio offload" after the
>   core soft reset, but it only replays the EST block.
> - [Medium] The patch handles a failed EST re-apply inconsistently between
>   open and resume.
> - [Medium] A taprio REPLACE that is rejected only by the software checks
>   in dwmac5_fpe_map_preemption_class() still tears down the installed=E2=
=80=A6
> - [Medium] stmmac_adjust_time() checks and clears priv->est->enable in
>   one est_lock section (stmmac_ptp.c:72-79), drops the lock while it=E2=
=80=A6
>=20
> Pre-existing issues:
> - [Low] The TX hot paths (stmmac_xmit around stmmac_main.c:4861,
>   stmmac_tso_xmit, the XSK zero-copy path around 2753, and=E2=80=A6
>=20
> --
>=20
> net: stmmac: re-apply taprio offload in __stmmac_open() and stmmac_resume=
()
>=20
> The core soft reset in stmmac_hw_setup() clears the MTL_EST registers. Th=
is
> patch re-programs EST from __stmmac_open() and stmmac_resume(), recomputi=
ng
> the base time from the reserved base time and the current PTP time, and
> reuses the same helper in stmmac_adjust_time(). It also reworks
> tc_taprio_configure() to hold est_lock across validation and programming,
> and to set priv->est->enable only after hardware programming succeeds.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_est.h
> > index f70221c9c84af..0f0f162794c84 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
>=20
> [ ... ]
>=20
> > @@ -65,3 +68,18 @@
> >  #define EST_GCL_DATA			0x00000034
> > =20
> >  extern const struct stmmac_est_ops dwmac510_est_ops;
> > +
> > +int __stmmac_setup_est(struct stmmac_priv *priv);
> > +static inline int stmmac_setup_est(struct stmmac_priv *priv)
> > +{
> > +	int ret =3D 0;
> > +
> > +	mutex_lock(&priv->est_lock);
> > +	if (priv->est && priv->est->enable)
> > +		ret =3D __stmmac_setup_est(priv);
>=20
> [Severity: Medium]
>=20
> The commit message says this re-applies "the taprio offload" after the co=
re
> soft reset. Does stmmac_setup_est() restore everything that taprio
> programmed, or only the EST block?
>=20
> On a successful TAPRIO_CMD_REPLACE, tc_taprio_configure() also calls:
>=20
> 	ret =3D stmmac_fpe_map_preemption_class(priv, priv->dev, extack,
> 					      qopt->mqprio.preemptible_tcs);
>=20
> On GMAC5, dwmac5_fpe_map_preemption_class() writes FPE_MTL_PREEMPTION_CLA=
SS
> in GMAC5_MTL_FPE_CTRL_STS. On XGMAC, dwxgmac3_fpe_map_preemption_class()
> also writes the per-queue XGMAC_Q2TCMAP field and XGMAC_MTL_FPE_CTRL_STS,
> even when pclass is 0. During stmmac_hw_setup(), dwxgmac2_dma_tx_mode() t=
hen
> rewrites Q2TCMAP back to the channel index:
>=20
> 	value |=3D FIELD_PREP(XGMAC_Q2TCMAP, channel);
>=20
> preemptible_tcs is not saved in priv, and stmmac_fpe_map_preemption_class=
()
> is only called from stmmac_tc.c. That means neither __stmmac_open() nor
> stmmac_resume() can replay it.
>=20
> So what happens after ifdown/ifup, an MTU or ring size change, or
> suspend/resume? On GMAC5, would the preemptible TCs silently turn into
> express TCs? On XGMAC, would the queues go back to the default queue =3D=
=3D TC
> mapping, so the EST gate masks no longer cover the intended queues?
>=20
> Meanwhile __stmmac_setup_est() sets priv->est->enable =3D true, so taprio
> would keep reporting the full offload as installed.

I will fix it in v5.

>=20
> > +	mutex_unlock(&priv->est_lock);
> > +
> > +	return ret;
> > +}
>=20
> [ ... ]
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 9e09e11cc35e5..a13a3790207d5 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -4201,6 +4202,10 @@ static int __stmmac_open(struct net_device *dev,
> >  	if (ret)
> >  		goto ptp_error;
> > =20
> > +	ret =3D stmmac_setup_est(priv);
> > +	if (ret)
> > +		goto est_error;
> > +
> >  	stmmac_init_coalesce(priv);
> > =20
> >  	phylink_start(priv->phylink);
>=20
> [ ... ]
>=20
> > @@ -8518,6 +8523,10 @@ int stmmac_resume(struct device *dev)
> >  		ret =3D stmmac_init_timestamping(priv);
> >  		if (ret)
> >  			goto error_stop_dma;
> > +
> > +		ret =3D stmmac_setup_est(priv);
> > +		if (ret)
> > +			goto error_stop_dma;
> >  	}
> > =20
> >  init_coalesce:
>=20
> [Severity: Medium]
>=20
> The callers seem to handle a failed EST re-apply in different ways. There
> are a few cases.
>=20
> In __stmmac_open(), stmmac_setup_ptp() can return 0 without enabling PTP:
>=20
> stmmac_setup_ptp() {
>     ...
> 	if (stmmac_init_ptp_clk_freq(priv)) {
> 		clk_disable_unprepare(priv->plat->clk_ptp_ref);
> 		return 0;
> 	}
>     ...
> }
>=20
> This can happen when clk_ptp_rate is 0. For example, qcom-ethqos re-reads
> clk_get_rate() in ethqos_ptp_clk_freq_config() on every open, so the rate
> can become 0 after an earlier successful taprio REPLACE.
>=20
> stmmac_setup_est() still runs in that case. __stmmac_setup_est() reads the
> time through gettimex64 with the timestamp counter never initialised, and
> est_configure() returns -EINVAL for a zero ptp_rate. Wouldn't ndo_open th=
en
> fail, where it succeeded before this patch?
>=20
> In stmmac_resume(), any EST programming error (for example -ETIMEDOUT from
> est_write()) now goes to error_stop_dma. That path stops DMA, disables the
> MAC, powers down the serdes and returns without calling
> netif_device_attach(), while netif_running() is still true. Is it intended
> that losing EST now leaves the interface dead after resume?
>=20
> Also in stmmac_resume(), when stmmac_init_ptp_clk_freq() fails, the code
> jumps to init_coalesce and skips stmmac_setup_est(). Resume then returns
> success with priv->est->enable still true, even though the soft reset has
> cleared MTL_EST. Isn't that the stale state the commit message says it
> removes?
>=20
> When __stmmac_setup_est() fails, it returns without clearing
> priv->est->enable:
>=20
> 	if (err) {
> 		netdev_err(priv->dev, "failed to re-configure EST\n");
> 		return err;
> 	}
>=20
> For the open and resume callers the flag was already true on entry. It
> stays true while EEST is off or only partly programmed. The commit message
> says the helper "only marks the offload enabled once the hardware
> programming succeeds". Does that hold for these callers?
>=20
> Finally, stmmac_adjust_time() ignores the return value of the same helper.
> Should the three callers share one failure policy?

I will fix it in v5.

>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > index 9a32af00d7d2d..81ee896698653 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
>=20
> [ ... ]
>=20
> > @@ -69,14 +69,14 @@ static int stmmac_adjust_time(struct ptp_clock_info=
 *ptp, s64 delta)
> >  	nsec =3D reminder;
> > =20
> >  	/* If EST is enabled, disabled it before adjust ptp time. */
> > +	mutex_lock(&priv->est_lock);
> >  	if (priv->est && priv->est->enable) {
> >  		est_rst =3D true;
> > -		mutex_lock(&priv->est_lock);
> >  		priv->est->enable =3D false;
> >  		stmmac_est_configure(priv, priv, priv->est,
> >  				     priv->plat->clk_ptp_rate, false);
> > -		mutex_unlock(&priv->est_lock);
> >  	}
> > +	mutex_unlock(&priv->est_lock);
> > =20
> >  	write_lock_irqsave(&priv->ptp_lock, flags);
> >  	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
> > @@ -84,31 +84,9 @@ static int stmmac_adjust_time(struct ptp_clock_info =
*ptp, s64 delta)
> > =20
> >  	/* Calculate new basetime and re-configured EST after PTP time adjust=
=2E */
> >  	if (est_rst) {
> > -		struct timespec64 current_time, time;
> > -		ktime_t current_time_ns, basetime;
> > -		u64 cycle_time;
> > -
> >  		mutex_lock(&priv->est_lock);
>=20
> [ ... ]
>=20
> > -		ret =3D stmmac_est_configure(priv, priv, priv->est,
> > -					   priv->plat->clk_ptp_rate, true);
> > +		__stmmac_setup_est(priv);
> >  		mutex_unlock(&priv->est_lock);
> > -		if (ret)
> > -			netdev_err(priv->dev, "failed to configure EST\n");
> >  	}
>=20
> [Severity: Medium]
>=20
> est_lock is dropped between clearing priv->est->enable and calling
> __stmmac_setup_est() here. est_rst is not re-checked once the lock is tak=
en
> again. Can a taprio operation that runs inside that window get overridden?
>=20
> ptp_clock_adjtime() does not take RTNL, so this ordering looks possible:
>=20
> CPU1 (stmmac_adjust_time)
>   mutex_lock(&priv->est_lock);
>   est_rst =3D true;
>   priv->est->enable =3D false;
>   mutex_unlock(&priv->est_lock);
>   stmmac_adjust_systime();
>=20
> CPU2 (tc_taprio_configure, TAPRIO_CMD_DESTROY)
>   mutex_lock(&priv->est_lock);
>   priv->est->enable =3D false;
>   stmmac_est_configure(..., false);
>   stmmac_fpe_map_preemption_class(..., 0);
>   mutex_unlock(&priv->est_lock);
>=20
> CPU1
>   mutex_lock(&priv->est_lock);
>   __stmmac_setup_est(priv);
>     stmmac_est_configure(..., true);
>     priv->est->enable =3D true;
>=20
> A REPLACE that fails and goes to disable: would race the same way.
>=20
> The disable: path leaves gcl, ctr, btr_reserve and max_sdu[] in priv->est.
> Would the old schedule, or the rejected one, then be programmed back into
> hardware with enable set to true after the qdisc offload is gone? If so, =
the
> TX/XDP paths would keep dropping frames larger than the stale max_sdu[].
>=20
> __stmmac_open() and stmmac_resume() now trust that flag, so the schedule
> would also be re-armed on every ifup and resume. taprio would not send
> another DESTROY because q->offloaded is already false.
>=20
> Should the decision to re-enable be re-validated under est_lock before
> __stmmac_setup_est() is called?

I will fix it in v5.

>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_tc.c
> > index ac926c60f9f9a..95c5f6100c66a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
>=20
> [ ... ]
>=20
> > @@ -1060,13 +1065,26 @@ static int tc_taprio_configure(struct stmmac_pr=
iv *priv,
>=20
> [ ... ]
>=20
> > -		priv->est->gcl[i] =3D delta_ns | (gates << wid);
> > +		gcl[i] =3D delta_ns | (gates << wid);
> >  	}
> > =20
> > -	mutex_lock(&priv->est_lock);
> > +	if (!priv->est) {
> > +		priv->est =3D devm_kzalloc(priv->device, sizeof(*priv->est),
> > +					 GFP_KERNEL);
> > +		if (!priv->est) {
> > +			ret =3D -ENOMEM;
> > +			goto error_unlock;
> > +		}
> > +	} else {
> > +		memset(priv->est, 0, sizeof(*priv->est));
> > +	}
>=20
> [Severity: Low]
>=20
> This is a pre-existing issue and was not introduced by this patch. The TX
> hot paths read priv->est, priv->est->enable and priv->est->max_sdu[] with
> plain loads and without est_lock. For example, in stmmac_xmit():
>=20
> 	if (priv->est && priv->est->enable &&
> 	    priv->est->max_sdu[queue]) {
>=20
> stmmac_tso_xmit(), stmmac_xdp_xmit_zc() and stmmac_xdp_xmit_xdpf() do the
> same.
>=20
> The writers hold only est_lock. They use plain stores, a memset() of the
> live struct, and a devm_kzalloc() pointer publish with no release orderin=
g.
>=20
> Could a REPLACE that runs concurrently with transmit briefly let oversize
> frames through, or drop them? Two ways this could happen: the memset
> temporarily zeroes max_sdu[], or a weakly ordered CPU sees the new pointer
> before its zeroing is visible.
>=20
> This patch does improve the ordering somewhat, since enable is now set on=
ly
> after max_sdu[] is populated. The effect is limited to transient per-pack=
et
> filtering decisions.
>=20
> > +	memcpy(priv->est->gcl, gcl, sizeof(*gcl) * qopt->num_entries);
> > +	priv->est->gcl_size =3D qopt->num_entries;
> > +
> >  	/* Adjust for real system time */
> >  	priv->ptp_clock_ops.gettimex64(&priv->ptp_clock_ops, &current_time,
> >  				       NULL);
>=20
> [ ... ]
>=20
> > @@ -1102,11 +1119,15 @@ static int tc_taprio_configure(struct stmmac_pr=
iv *priv,
> >  	if (ret)
> >  		goto disable;
>=20
> [Severity: Medium]
>=20
> The commit message says "A rejected REPLACE then leaves the currently
> installed schedule intact in both software and hardware". However,
> stmmac_fpe_map_preemption_class() can still reject the request after
> priv->est has been memset, overwritten with the new schedule and programm=
ed
> into hardware.
>=20
> dwmac5_fpe_map_preemption_class() returns -EINVAL with an extack message
> based only on configuration checks, before it writes any register:
>=20
> 		if (priv->xmit_qdisc.algo =3D=3D MTL_TX_ALGORITHM_SP) {
> 			NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
> 			return -EINVAL;
> 		}
>=20
> It does the same for unequal queue weights within a TC. That error goes to
> disable:, which clears priv->est->enable, disables EST in hardware and
> resets the preemption class to 0.
>=20
> On the taprio side, taprio_enable_offload() returns the error before it
> touches q->offloaded, which stays true from the previous schedule.
> taprio_change() then goes to free_sched without installing the new admin
> schedule. Doesn't this leave the qdisc reporting the old schedule as
> offloaded while hardware EST is off?
>=20
> enable is now false, so stmmac_setup_est() will not restore the schedule =
on
> a later open or resume either.
>=20
> One way to hit this:
>=20
> 1. Install an express-only schedule with a TC mapped to two queues. This =
is
>    accepted, because pclass =3D=3D 0 skips the checks.
> 2. Run tc qdisc change to mark that TC preemptible.
>=20
> Should the FPE mapping checks run before the installed configuration is
> replaced?

This behaviour has not been introduced in this patch and it needs to be fix=
ed
with a dedicated patch.

Regards,
Lorenzo

>=20
> > +
> > +	priv->est->enable =3D true;
> > +
> > +	mutex_unlock(&priv->est_lock);
> > +	kfree(gcl);
> > +
> >  	return 0;
> > =20
> >  disable:
> >  	if (priv->est) {
> > -		mutex_lock(&priv->est_lock);
> >  		priv->est->enable =3D false;
> >  		stmmac_est_configure(priv, priv, priv->est,
> >  				     priv->plat->clk_ptp_rate, false);
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261026-stmmac-est-fixes-v4-0-999dac4de44f%40oss.qualcomm.com

--7mG7OudezMBGU53l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauMYBAAKCRA6cBh0uS2t
rPhLAP9n3WI1Il/HUYZwkpR+EzGsbN/qOd/XhtP3A+8muzMFyAEAoxwijLgqLJOS
I3g1IObe+OfcYqQcoR+5j9TuDlWOQgQ=
=9DUU
-----END PGP SIGNATURE-----

--7mG7OudezMBGU53l--

