Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B73C606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U1NsVzXn;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8yr7sZN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RClNsPGT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4wytZ7YbEEeBBVHe06rvMZ2OXjLqmKmm9QBKQw7r92U=; b=U1NsVzXnNcH8R8Y5C/uMMD2kft
	uA7iVLs5Dpjsm8BPctgkP0UI6VBbFHCokAt7pG4NGdzPTmjkjKjYlSSIsUGnrP+iUFTjmRCGl2Egx
	YBhyKiAbluPrMPU7jO609VO0q8hvBfrf1wjrGB+Z5TLyvRSKdMlXowOKkYFqmZ357bN3xyiTWSUyd
	Jg8ZCR5WgvS3qCEEYvvZz2ysYoDE925/cFFskUMMhtf8fKGav5KI79PdnxGW+jetIIFmtRQq5AGBF
	x46DhXyjqY+xPdEtC0Vkaxkq3ZIxXZScNE41HMJ4dQlRQn7Cto5dvCEP7vdpBrhPM8CqELVXYrE9F
	Lq2ugiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq5R-0000000GI31-3nOC;
	Mon, 02 Nov 2026 11:20:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq5P-0000000GI2M-06rs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:20:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A93R4039353
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 11:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4wytZ7YbEEeBBVHe06rvMZ2O
	XjLqmKmm9QBKQw7r92U=; b=a8yr7sZNLXHq3Db4S5ywPHTmKS0PcMcbZGpvGH3Z
	XfsPbdkJRkqN6yHDHFOhGzPOXpGKCfdi48pdlRNjNGyF19BtrGh31SvKOvwJZ4m7
	jmdfxXwCaXYlOdg6K+oH7LC4zyhQu4rm81KjGJF54WI6nLVMEErlQsdWpzedLU1l
	Pau4Yz6VgzsCkN8gREtTS1Z99EYL2AeUZ2GypyWcPdShSKS1072NVIMm2tZ77w6O
	k/YjvFJkRCdRkTamxj3CuQXS63nvEWnGUv196JKAGug8pLoy8dglRXz9xg0akoBF
	yzcqeefh3Kbe968GXXdhUcmfwF8uagWC5o0QQT+aspkBfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18v1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:20:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so524323385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 03:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618420; x=1794223220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wytZ7YbEEeBBVHe06rvMZ2OXjLqmKmm9QBKQw7r92U=;
        b=RClNsPGT27IoWoW1UeSKAZ70ie0mabtUiwa2+8/mAhVDpCA0enabGhVFLkNp4DjTUj
         v+qhD9UpPxDNPdpU1b+PTy/QYsNBXtBtRqzHngPAf/a7uI5rcFCj2jIESERlrzpHURpU
         0hlTpdDmQ5hjjIzZA0KJzXaz/OK5W6OrZYvExRfqiBlf/yoRV4sstuoYRuo3lW5oK160
         17+Vogj07b+A8vzZCO75dHQWJPasJ+OAHi7312uy086KpPtmsJBbfFwiu+lZVNRa+DQT
         FM5W7PLMja+HZnEnfTOpiVJHKSn7YVTGtYFC5jtGCzPRvRXjg4SAtmCtlLzHE5O4n6ON
         AMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618420; x=1794223220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wytZ7YbEEeBBVHe06rvMZ2OXjLqmKmm9QBKQw7r92U=;
        b=F76VtpmEJZWpUu/OWtzKc6+qZWGWbENDYOvuIsuRSkUh75xc7JjpTnfR9MSO13HjDD
         TYh3PTCeE/sNLkBDdT29p8V0TDIjhbr5C0oswMVfv1aUEelMHNU+sYnJffsS1ePoSPWW
         v89XiPtEwO/zavdof2Avg6nzVQqBsQll+YThuTYll9r9llmT855SawmNmJkkrNMIbqWT
         qE8ZQRCX2MXc5aqkkaWgiiyKIoqgFX37HrRu3eh3wlJ9iMyH8HdCl4LV0ubPtwCHgIkF
         9PCe4XQH3QDaop24EMXHeQpW4kTUcHrz9L6jXQM2rE/mNC4heN2Q0Gg/RvkSLGVKelsE
         CD7A==
X-Forwarded-Encrypted: i=1; AKwUvBwmF0zvR1yX0O9ELdL9LI5RIgJfqOOde8vrYMp3vWHHcRTsRvlLfKLT8XDAhSZrvXEeBogTw1TpKN+iY/KYxCZW@lists.infradead.org
X-Gm-Message-State: AFq9FYJSlFvUpGQuiQsCZEI/nTxtuQCl5Mc9R9+148/urNGPxlllhi9t
	yPP9GtO3+SLO4KQ4yd022s5wi3GjPW0VD2XvvkeW7UW+4nEAcOA/ObWwMDxGRqlOjArUqba+hQE
	LYbKV0SHec6e/yBZKV1ZgzG55Zid1jxvoxwfkPjSlZ1C7dZiLH8cmOgI4B8549R/cHpe9raBRB9
	C21g==
X-Gm-Gg: AYBFou1y1lnEN8tE8/O54CUmGktPzGQdvTUhLFQKQr94kSYfIMWZ8REEGTu2TSp1BUr
	pbcFrvSY+4QRit9S8QZSlVL5is4rSVacX5psiIkNajssA7J9ML4nzrO0ZQBACPfYobji4jlz+Rj
	xlA3lCM/NzePMV7j20yfiSWEQOHSrdod2cxtTEdK5kEcI6GuHqj13JPBuBK/DpP5zIgKQYUPzkN
	fE8JB1mSEPoloYI8wCtebc3pH7cXAkA+MITY9k8QcDpqWYTwR6Xutg7tcq+EiPZ6aFEZiUzGWo7
	p6phNKIxzn8nnN103Df0OGCXkJa1rDziNR4zFxnI3iz/bCj+pAJBo9/4EOU0dTn4erX/ECdchNQ
	uB89oKt2FCjhgr5N0t4UzVy3AeGuh4pdN6ke/Asm8DohC5wyrTSz3mf/8MUQ9Dg==
X-Received: by 2002:a05:620a:4402:b0:93f:1af1:7952 with SMTP id af79cd13be357-94421584b85mr1636763385a.4.1793618419937;
        Mon, 02 Nov 2026 03:20:19 -0800 (PST)
X-Received: by 2002:a05:620a:4402:b0:93f:1af1:7952 with SMTP id af79cd13be357-94421584b85mr1636757985a.4.1793618419168;
        Mon, 02 Nov 2026 03:20:19 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm24879798f8f.53.2026.11.02.03.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:20:18 -0800 (PST)
Date: Mon, 2 Nov 2026 12:20:17 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        richardcochran@gmail.com, linux@armlinux.org.uk,
        Jose.Abreu@synopsys.com, james.hilliard1@gmail.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        rayagond@vayavyalabs.com
Subject: Re: [PATCH net v5 2/3] net: stmmac: pass the desired EST enable
 state to est_configure()
Message-ID: <auhx8SuHafjAnzJ9@lore-desk>
References: <20261029-stmmac-est-fixes-v5-2-85b830a795a9@oss.qualcomm.com>
 <179361656635.3131.18359030964578099180@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w09fbWP8zAPXJjBS"
Content-Disposition: inline
In-Reply-To: <179361656635.3131.18359030964578099180@kernel.org>
X-Proofpoint-GUID: GMGn8n5sjkBKlHof8D1gWSPY1BNdevvd
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae871f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=UarSiPXRvnQt6UJiVTEA:9 a=QEXdDO2ut3YA:10
 a=NGW1ISiYAZ_3V0LsNgwA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: GMGn8n5sjkBKlHof8D1gWSPY1BNdevvd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX1wVUSOcZau1n
 oQNLk54lKHS34HDQ9/iGWQ5BBDbRBRl1MoNii8eyrVm3zwYEVTWm/ReM6MKMdBtorQ1vIYTU18T
 TrDLdrjQsaJt/oM9Eeppb0oZbBQ47pJ2UQlixdb7LmWaCsqz2SOEeSdQPMzQIMwNS4OW+QbDfYI
 4piz7sSJPc66mSe2aA6VCnjZsHs5b0Ubqt2MD5/o2W2sxSM/LC0gYq4cby3X3gGKx6lejsXW9jQ
 2eQjeWnOeUKUvvOP7OMRzBa7F4Ra8h9RxYElZGmITLB1lNd2SRPUw7oGXzaul3U7iFbFZiB3Bsn
 wS3skcw1hc5yqAxG3Cmgbb3lKkXPVmfXiXSupMwmfo0uDxowsz/yjNHd64AjNHk7fev9nVCIKz7
 PoAL8kLrKK2mWohbI/FBP7aqjeASCmODrJ4yDf6beM+3iBr18+RGO5NiNtmTnuOywmZ7AZdg15j
 h9yJgn2lKMQ4ZjOFTdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX5XnczQ0arqV9
 U+Dzh7v+TvhSbACIh6tGi/saVikULkf8ASLTCCGwZfnyFWRvyhFaMqyzxPGM9cD76jNKJKq4o+/
 NQtzgjrWHGOlkOmOWsO8DViosnNUTNo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032023_203860_D910F593 
X-CRM114-Status: GOOD (  41.24  )
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

--w09fbWP8zAPXJjBS
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
> - [Low] The commit says "No functional change intended", but there is a
>   change when stmmac_adjust_time() runs concurrently.
>=20
> Pre-existing issues:
> - [High] This happens at this commit in tc_taprio_configure()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c).
> - [High] At this commit stmmac_adjust_time() (stmmac_ptp.c:72) checks
>   priv->est->enable without est_lock.
> - [Medium] est_configure()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_est.c) rewrites=E2=80=A6
> - [Medium] At this commit stmmac_adjust_time() decides est_rst from an
>   unlocked read of priv->est->enable (stmmac_ptp.c:72-73) and drops=E2=80=
=A6
>=20
> --
>=20
> net: stmmac: pass the desired EST enable state to est_configure()
>=20
> This patch adds an explicit enable argument to est_configure() so it no
> longer reads cfg->enable. The callers in stmmac_adjust_time() and
> tc_taprio_configure() now pass true or false directly, and they still set
> priv->est->enable around the EST programming as before.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_est.c
> > index afc516059b897..f15d4d046aa74 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
>=20
> [ ... ]
>=20
> > @@ -62,7 +62,7 @@ static int est_configure(struct stmmac_priv *priv, st=
ruct stmmac_est *cfg,
> >  		ctrl |=3D ((NSEC_PER_SEC / ptp_rate) * EST_GMAC5_PTOV_MUL) <<
> >  			 EST_GMAC5_PTOV_SHIFT;
> >  	}
> > -	if (cfg->enable)
> > +	if (enable)
> >  		ctrl |=3D EST_EEST | EST_SSWL | EST_DFBS;
> >  	else
> >  		ctrl &=3D ~EST_EEST;
>=20
> [Severity: Medium]
> This isn't a bug introduced by this patch, but when enable is false,
> est_configure() still rewrites BTR, TER, LLR, CTR and the whole GCL
> through est_write() before it gets here:

This issue has not been introduced by this patch and it needs to be fixed w=
ith
a dedicated patch.

>=20
>     ret |=3D est_write(est_addr, EST_BTR_LOW, cfg->btr[0], false);
>     ...
>     if (ret)
>         return ret;
>=20
>     for (i =3D 0; i < cfg->gcl_size; i++) {
>         ret =3D est_write(est_addr, i, cfg->gcl[i], true);
>         if (ret)
>             return ret;
>     }
>=20
> If one of the SRWO polls in est_write() times out, the function returns
> before it clears EST_EEST here and before it zeroes EST_INT_EN.
>=20
> The disable callers ignore that return value and set
> priv->est->enable =3D false anyway. These are the disable: label in
> tc_taprio_configure() and the quiesce block in stmmac_adjust_time().
>=20
> On TAPRIO_CMD_DESTROY, tc_taprio_configure() returns only the result of
> stmmac_fpe_map_preemption_class(), so taprio treats the offload as
> removed.
>=20
> Could the MAC keep gating TX with the old schedule, with EST interrupts
> still on, while software thinks EST is off? This ordering is unchanged at
> the end of the series.
>=20
> [ ... ]
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > index e54a3c8878265..9a32af00d7d2d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > @@ -74,7 +74,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *=
ptp, s64 delta)
> >  		mutex_lock(&priv->est_lock);
> >  		priv->est->enable =3D false;
> >  		stmmac_est_configure(priv, priv, priv->est,
> > -				     priv->plat->clk_ptp_rate);
> > +				     priv->plat->clk_ptp_rate, false);
> >  		mutex_unlock(&priv->est_lock);
> >  	}
>=20
> [Severity: High]
> This is a pre-existing issue, but the check that guards this block reads
> priv->est->enable without holding est_lock:

This issue has not been introduced by this patch and it needs to be fixed w=
ith
a dedicated patch.

>=20
>     if (priv->est && priv->est->enable) {
>         est_rst =3D true;
>         mutex_lock(&priv->est_lock);
>=20
> A TAPRIO_CMD_REPLACE in tc_taprio_configure() drops est_lock between
> steps:
>=20
>     mutex_lock(&priv->est_lock);
>     memset(priv->est, 0, sizeof(*priv->est));
>     mutex_unlock(&priv->est_lock);
>     ...
>     mutex_lock(&priv->est_lock);
>     priv->est->gcl_size =3D size;
>     priv->est->enable =3D qopt->cmd =3D=3D TAPRIO_CMD_REPLACE;
>     mutex_unlock(&priv->est_lock);
>=20
>     for (i =3D 0; i < size; i++) {
>         ...
>         priv->est->gcl[i] =3D delta_ns | (gates << wid);
>     }
>=20
>     mutex_lock(&priv->est_lock);
>     /* ctr[] and btr_reserve[] are filled only here */
>=20
> Suppose the second est_lock section of stmmac_adjust_time() runs in that
> gap. It then computes:
>=20
>     cycle_time =3D (u64)priv->est->ctr[1] * NSEC_PER_SEC +
>                  priv->est->ctr[0];    /* still 0 */
>     time =3D stmmac_calc_tas_basetime(basetime, current_time_ns,
>                                     cycle_time);
>=20
> and stmmac_calc_tas_basetime() does:
>=20
>     n =3D div64_s64(ktime_sub_ns(current_time, old_base_time),
>                   cycle_time);
>=20
> Can this divide by zero and oops on x86? It would also program a GCL
> that is still half written through est_configure(..., true).
>=20
> This looks to be addressed later in the series by "net: stmmac: re-apply
> taprio offload in __stmmac_open() and stmmac_resume()". That commit:
>=20
>   - holds est_lock across the whole validate, memset and program
>     sequence in tc_taprio_configure()
>   - sets enable only after programming succeeds
>   - checks enable under est_lock in stmmac_adjust_time()
>=20
> > @@ -105,7 +105,7 @@ static int stmmac_adjust_time(struct ptp_clock_info=
 *ptp, s64 delta)
> >  		priv->est->btr[1] =3D (u32)time.tv_sec;
> >  		priv->est->enable =3D true;
> >  		ret =3D stmmac_est_configure(priv, priv, priv->est,
> > -					   priv->plat->clk_ptp_rate);
> > +					   priv->plat->clk_ptp_rate, true);
> >  		mutex_unlock(&priv->est_lock);
> >  		if (ret)
> >  			netdev_err(priv->dev, "failed to configure EST\n");
>=20
> [Severity: Medium]
> This isn't a bug introduced by this patch, but est_rst comes from the
> unlocked check before the first critical section. Nothing is re-checked
> here after est_lock was dropped around the systime step.

This issue has not been introduced by this patch and it needs to be fixed w=
ith
a dedicated patch.

>=20
> A TAPRIO_CMD_DESTROY can land in that gap:
>=20
> CPU1 (stmmac_adjust_time)        CPU2 (tc_taprio_configure, DESTROY)
> est_rst =3D true
> priv->est->enable =3D false
> est_configure(..., false)
> mutex_unlock(&priv->est_lock)
>                                  disable:
>                                  priv->est->enable =3D false
>                                  est_configure(..., false)
>                                  returns success
> stmmac_adjust_systime()
> mutex_lock(&priv->est_lock)
> priv->est->enable =3D true
> est_configure(..., true)
>=20
> Does this bring back a schedule that taprio has already removed? The
> xmit paths would then also enforce the priv->est->max_sdu[] drops again.
>=20
> The same later commit, "net: stmmac: re-apply taprio offload in
> __stmmac_open() and stmmac_resume()", appears to fix this. It re-checks
> priv->est && priv->est->enable under est_lock before calling
> __stmmac_setup_est(), and stmmac_adjust_time() no longer writes the
> enable flag.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_tc.c
> > index aea235a69105e..ac926c60f9f9a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > @@ -1090,7 +1090,7 @@ static int tc_taprio_configure(struct stmmac_priv=
 *priv,
> >  	tc_taprio_map_maxsdu_txq(priv, qopt);
> > =20
> >  	ret =3D stmmac_est_configure(priv, priv, priv->est,
> > -				   priv->plat->clk_ptp_rate);
> > +				   priv->plat->clk_ptp_rate, true);
>=20
> [Severity: Low]
> The commit message says:
>=20
>   No functional change intended: the callers keep toggling
>   priv->est->enable around the EST programming, as before.
>=20
> Does that still hold when stmmac_adjust_time() runs at the same time?
>=20
> Before this patch, this call read cfg->enable under est_lock. The REPLACE
> path sets enable =3D true in an earlier critical section and then drops
> est_lock while it fills the GCL. Consider this sequence:
>=20
> CPU1 (tc_taprio_configure, REPLACE)  CPU2 (stmmac_adjust_time)
> priv->est->enable =3D true
> mutex_unlock(&priv->est_lock)
> fill priv->est->gcl[]
>                                      priv->est->enable =3D false
>                                      est_configure(..., false)
>                                      mutex_unlock(&priv->est_lock)
> mutex_lock(&priv->est_lock)
> est_configure(..., true)
>                                      stmmac_adjust_systime()

As the one above, this issue has not been introduced by this patch and I th=
ink
we should fix it with a dedicated patch.

>=20
> With the old code, the REPLACE would program EST with EEST cleared,
> because cfg->enable was false. EST then stayed off across the time step.
>=20
> With the hard-coded true, EST is turned on with a BTR computed from the
> pre-step time. The PHC step then happens with EST active while
> priv->est->enable is false, until the second section of
> stmmac_adjust_time() reprograms it.
>=20
> The underlying race is pre-existing, since no lock covers the time step
> together with the EST programming. Still, this interleaving behaves
> differently after this patch, and the window remains at the end of the
> series.
>=20
> >  	mutex_unlock(&priv->est_lock);
> >  	if (ret) {
> >  		netdev_err(priv->dev, "failed to configure EST\n");
> > @@ -1109,7 +1109,7 @@ static int tc_taprio_configure(struct stmmac_priv=
 *priv,
> >  		mutex_lock(&priv->est_lock);
> >  		priv->est->enable =3D false;
> >  		stmmac_est_configure(priv, priv, priv->est,
> > -				     priv->plat->clk_ptp_rate);
> > +				     priv->plat->clk_ptp_rate, false);
>=20
> [Severity: High]
> This is a pre-existing issue, but the entry validation loop earlier in
> tc_taprio_configure() returns directly instead of going through this
> disable: label:

This issue has not been introduced by this patch and it needs to be fixed w=
ith
a dedicated patch.

Regards,
Lorenzo

>=20
>     priv->est->enable =3D qopt->cmd =3D=3D TAPRIO_CMD_REPLACE;
>     mutex_unlock(&priv->est_lock);
>=20
>     for (i =3D 0; i < size; i++) {
>         ...
>         if (delta_ns > GENMASK(wid - 1, 0))
>             return -ERANGE;
>         if (gates > GENMASK(31 - wid, 0))
>             return -ERANGE;
>         ...
>         default:
>             return -EOPNOTSUPP;
>         }
>=20
> By that point priv->est has already been memset. So a REPLACE with one
> invalid interval, gate mask or command leaves enable =3D=3D true while ct=
r[]
> and btr_reserve[] are zero.
>=20
> taprio_disable_offload() does not call back into the driver when the
> first offload attempt failed, so nothing clears the flag later.
>=20
> A later clock_adjtime(ADJ_SETOFFSET) on the PHC then does:
>=20
> stmmac_adjust_time()
>   cycle_time =3D 0
>   stmmac_calc_tas_basetime(0, now, 0)
>     div64_s64(now, 0)
>=20
> Can this divide by zero and oops on x86?
>=20
> This also looks to be fixed later in the series by "net: stmmac: re-apply
> taprio offload in __stmmac_open() and stmmac_resume()". That commit
> validates every entry into a temporary kcalloc() buffer before it touches
> priv->est, and sets enable only after programming succeeds.
>=20
> >  		/* Reset taprio status */
> >  		for (i =3D 0; i < priv->plat->tx_queues_to_use; i++) {
> >  			priv->xstats.max_sdu_txq_drop[i] =3D 0;
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261029-stmmac-est-fixes-v5-0-85b830a795a9%40oss.qualcomm.com

--w09fbWP8zAPXJjBS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauhx8QAKCRA6cBh0uS2t
rCUIAPsFCawyd5Cgdr32fDn3TYCpBDWq+i/xcujYMtMHg9vX2wD5AeYukKEBM4cM
dYZTujhnUqwzaV1c+1K9K3KbsJLciAE=
=Eylt
-----END PGP SIGNATURE-----

--w09fbWP8zAPXJjBS--

