Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A313D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Yu2T8z+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puWd8yuw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Co4oYHtP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I/SWgdvBQORkmJ1e0fuSL5vTNEEBTfiMVW1AioLHo8Q=; b=4Yu2T8z+4pcrhMKjLKDXZKhLJd
	18/5c2+hLzTuYgSYkKcN4bTyeLMs4fqHHWCp6i8wulMOtyMEa9o6WZHGf2+IUss//wScjrw1pZke1
	ajvSy/o4S7zvNTEYqj+JuuWwFzreJxtAyrN+6JTyfe3jLM5cEykHFw7E1zhrKCOCeP33HDS4OD6tC
	AwDwUbNmWzka3I1LytHDV3O9rHDjPmV37MK+M69iIw7lnmLDOmjWrjNffWkzfsM7uCbQs0Yxi2z5A
	Lesckf+QZ8htX38FoCsZG19iciOlH+q6LJpWgnrFN0yAT8r+a8P2qEibLGPbjUQvZ/6hDOLN30dCV
	y1In/TcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM85-00000003ijv-1zze;
	Tue, 03 Nov 2026 21:33:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM82-00000003iiv-2Wfc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:33:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL3UI3678034
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 21:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I/SWgdvBQORkmJ1e0fuSL5vT
	NEEBTfiMVW1AioLHo8Q=; b=puWd8yuwnkgAQxDtWtP5ppHxB1L812wu3Y0Um7i+
	wAJi7w/OX+12jmzrRZnKOtwN/cuxIpqvPUNnHGyhIRUNWBMTtVlC4PBcFhpUEp4s
	znlb7c8uaqoPMnONTa6Vcmy61AoRXI9UvyGedjOjT6KCPBE5vccmSjm6uw2g2Em2
	nJ8j/RJzSxydhbFFojuFfGnDp5/31Fy/SiOyhh6Tzb31xPGaf9rz1d0w20NEOvxw
	Rf7v094GouAUHvciyo3i/rgkm3QpbjHh/ENuHtqhodiQY9nQ/h9Nq1Daw+TZ9ZJo
	B/wVg1VviKLBaBuEUnhJMcQ2+JNbEc1Xcz+cNOrlsEBUnw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bhwqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 21:33:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf634a101fso9240137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793741592; x=1794346392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/SWgdvBQORkmJ1e0fuSL5vTNEEBTfiMVW1AioLHo8Q=;
        b=Co4oYHtPnGgpCVABO42R1LW1eBcxpjsnR0VyViiZ/jy8xdaYjjq2pxdQ8Y6+m80ZZR
         e/K978AXTeFG6c/TY68K69nKVuB7M91ORIWjQ62BEfujmAsGpjXwVGHy0veXivWoRojp
         /e3r9j1KXv7BNjgTjGFkQtYFZfFF6u0x6eyFCR2sGerT1+Sjm7YPobYHYLbRQX8s4Kxa
         pTYXfFxBhjTafPhhSEEPr4Ds7nN19+ixgxPhlIgiW8TqcKGesRUGUabwb+tBP/AucCkY
         OYPuEaxh/9gx60bkBEckoQVitB7NTyryCAUHgCoj2jCBatdHhkOkVMnmAUn+WrfnRvdW
         3r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793741592; x=1794346392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/SWgdvBQORkmJ1e0fuSL5vTNEEBTfiMVW1AioLHo8Q=;
        b=XewW8oJqPazLmatb6AtO5pd2KmVW8bfuQ4GaUutQWulWdlOgHIT0s/pe+to0bn1s4d
         E+gqtd5zF+f34dbFarfy1j+MhdU8+RJ+41W+4mWxEhJhPqipkVgrRHjkeWCazZx8INQM
         QfkahgsNDzJF9pgSOP9kzB2l3pZ6XqpKGiYeyORNeacqcnsqgfiSnD9oVZK5vEOXx1kj
         AoHN/KNC8eBYW1udsX0u2fdt5yQB/IfdL1job6vZYQp/gKKE0JFJNBA6LqY6TvxVQLb6
         yjQhwprAugyX41fdPcbS2i/v8M07yTJaW+0Mg+xQ6EqUmC73mKwmw8C2Kt4kTJ25oUe+
         dQTw==
X-Forwarded-Encrypted: i=1; AKwUvBzwy3tKsPXYtDUS+W5IBX4tHRtol8OZvo0Jxou0ig4/nxgxwVFfFIVFz7yQg5VkmzOlaIAq0kHL3rFPpe7ycWWz@lists.infradead.org
X-Gm-Message-State: APuU4Z885P7u7mcBphCQUZZr3QWDXV96+Qsh1T01wNX0XYVeCkRSpxX5
	E0l9LP2AGupdXHFf3/kGoTin6mHxwsyJ7Vfj5ccM4AGCGLJrj4oN915VioKj9IBEpr0ALnNtz1l
	Vn0kqzNGRHlL9X9D9NSSC1uJ26JgsmUMFsF9YHn7hOEwqV6CzTKlEtiG1bohtTUhlJ4JzO2gZlE
	KN7I8AfRiVsg==
X-Gm-Gg: AYBFou3DKxukLb60XbP9kEkPzpYeWENDo0LLAGTmuueRyUAIx6LmCvDeufJgGrFO+ZQ
	SKF+AT3R4XXifhktn8G8y4I4ALUa6vcMtwahZSXWPMP8WUWFTAmNvScPgZ1Ql+Nj9miw4JZIa9Y
	DaDdLYwr8zsohR7uOVHnfqV91K1ZAPfE0t0RCMk38cjWvTaeIJm6JujbgIcrSo89eMawfCk4Arj
	UXsfUbjY8uOQCDWctlQ1ZJqNRwi24mfZ4eenpzAHfnQ7Tr4cYiewn621CpF0ikPESFMuzCo9QnR
	LJ1q86VeUqi9jZOuQpo9eCXXqBjKWSA/whkMOywGjlwEl2yr8nlWbRExkit4nJx5ldhcvQc08bA
	EO7lvAFZEZS7/2H0V1D2KTXj/kMbEa1UD9eHjWuhgK2bppUd13JV8cflNbjRCWQ==
X-Received: by 2002:a05:6102:162a:b0:7cf:61e8:c508 with SMTP id ada2fe7eead31-7d0726cb55dmr5782299137.21.1793741592076;
        Tue, 03 Nov 2026 13:33:12 -0800 (PST)
X-Received: by 2002:a05:6102:162a:b0:7cf:61e8:c508 with SMTP id ada2fe7eead31-7d0726cb55dmr5782283137.21.1793741591374;
        Tue, 03 Nov 2026 13:33:11 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm128037f8f.48.2026.11.03.13.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:33:10 -0800 (PST)
Date: Tue, 3 Nov 2026 22:33:09 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        richardcochran@gmail.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: keep est_lock across PTP clock
 adjustment
Message-ID: <aupTFHhGMYg0hsFN@lore-desk>
References: <20261102-stmmac-ptp-est-lock-v1-1-76fbc0cb230d@oss.qualcomm.com>
 <179372771896.488856.1466229272637573919@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u7LTxgNDxJpjZZUD"
Content-Disposition: inline
In-Reply-To: <179372771896.488856.1466229272637573919@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NSBTYWx0ZWRfX9zsfoHGwrSil
 rbWcVkm7X9x1N0+79zw5cUNDWPmcvyp7Qzl8xFrIt3zMDLvYtq1Ij70o/mi1P8kf01Cwu7HhjES
 +3RdKqmscfHvp3fhs0f5+4qpuvYCIuA=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea5319 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=06Dy6m6j6oPXgT3fdksA:9 a=wPNLvfGTeEIA:10
 a=Eqgwt4SHBu7x9DO010sA:9 a=gYDTvv6II1OnSo0itH1n:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: btaLxxqFkG8bUfLSJYQdQDd0se-LwFtg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NSBTYWx0ZWRfX97m+FnWwGxIb
 v2ptMp35XF7tSUFUdA4UF8mvtgFb4rC10+m12ZSW6mDpvJFsvaslnuCLTWD2egOlZ93EVp3empb
 q+7pCDfh7SRtZZ1g3pTdl3lg1erlgc60qkcE5OPw5YyzCCDbQTVsC2IA775vhBJHaG7/ioLkzSa
 2rvX46PAbWKtTEM7Aq7SiY/K697wDdOkf/XnedEfsUJVTsVoqlPCHHBwIa9XYV3o4BAnn6E4tKB
 +iCtixeEthCRNsb0DzlZYjL/1Kd5X8v+ijrsdrvAo3XdH261BGsLmKURLhznoS1jiqYPN+gCTmx
 PWrB+uPsn+qM+qM/jpYLhjbH4x/TPZKAwCTt23fwhH4DjwYe1tdd0nSqfCVVdHAdlXBM9Say9mg
 kwnI8pGNuXYaYgVTncW1MO/NcL2siQkRFPDMEvxYET1vPkb5rdoQ9wkxIRz1K5CHhJD2dZqZGI+
 7Eao26i7ofvrq6RfHHw==
X-Proofpoint-GUID: btaLxxqFkG8bUfLSJYQdQDd0se-LwFtg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_133314_761563_F14621AE 
X-CRM114-Status: GOOD (  37.49  )
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

--u7LTxgNDxJpjZZUD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =B7 High: 0 =B7 Medium: 1 (1) =B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] This patch closes the EST-vs-clock-step window only in
>   stmmac_adjust_time(), which serves adjtime/ADJ_SETOFFSET.
>=20
> Pre-existing issues:
> - [Medium] stmmac_adjust_time() discards the return value of every step
>   in its disable/step/re-base sequence and always returns 0.
>=20
> --
>=20
> net: stmmac: keep est_lock across PTP clock adjustment
>=20
> Before this patch, stmmac_adjust_time() dropped priv->est_lock while it
> stepped the PTP clock. A concurrent tc_taprio_configure() could then
> program EST with a base time taken from the clock before the step. The
> patch keeps est_lock held across the whole disable/step/reprogram
> sequence.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > index a37405534bebf..6ad6c2f52a0d2 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > @@ -73,14 +73,12 @@ static int stmmac_adjust_time(struct ptp_clock_info=
 *ptp, s64 delta)
> >  	if (priv->est && priv->est->enable)
> >  		stmmac_est_configure(priv, priv, priv->est,
> >  				     priv->plat->clk_ptp_rate, false);
>=20
> [Severity: Medium]
> This isn't a bug introduced by this patch, but stmmac_adjust_time()
> ignores the return value of all three steps in this sequence and always
> returns 0.

This is a pre-existing issue and it needs to be addressed with a dedicated
patch.

>=20
> The disable call above can fail before EST_EEST is cleared.
> est_configure() returns early on a zero ptp_rate or on an est_write()
> SRWO poll timeout, and both returns come before the EST_CONTROL write:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_est.c:est_configure() {
> 	if (!ptp_rate) {
> 		netdev_warn(priv->dev, "Invalid PTP rate");
> 		return -EINVAL;
> 	}
>=20
> 	ret |=3D est_write(est_addr, EST_BTR_LOW, cfg->btr[0], false);
> 	...
> 	if (ret)
> 		return ret;
> 	...
> 	else
> 		ctrl &=3D ~EST_EEST;
>=20
> 	writel(ctrl, est_addr + EST_CONTROL);
> 	...
> }
>=20
> In that case, is the clock stepped with the old schedule still armed?
>=20
> stmmac_adjust_systime() can return -ETIMEDOUT if PTP_TCR_TSUPDT never
> clears. Even then, the code recomputes the base time and re-enables EST.
>=20
> If __stmmac_setup_est() fails, it logs "failed to re-configure EST" and
> the error is dropped. EST_EEST and EST_INT_EN can then stay cleared while
> priv->est->enable stays true.
>=20
> In all three cases, ptp_clock_adjtime() reports success to userspace.
>=20
> Commit 23d96de472f7 says that the third case is intentional: "On a
> failed re-apply the open and resume callers abort, while
> stmmac_adjust_time() keeps the offload configured." Should the disable
> and adjust_systime failures still be propagated, though?
>=20
> > -	mutex_unlock(&priv->est_lock);
> >
> >  	write_lock_irqsave(&priv->ptp_lock, flags);
> >  	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
> >  	write_unlock_irqrestore(&priv->ptp_lock, flags);
> >
> >  	/* Calculate new basetime and re-configured EST after PTP time adjust=
=2E */
> > -	mutex_lock(&priv->est_lock);
> >  	if (priv->est && priv->est->enable)
> >  		__stmmac_setup_est(priv);
> >  	mutex_unlock(&priv->est_lock);
>=20
> [Severity: Medium]
> This closes the window for adjtime, but what about the settime64 path?
> The commit message says:
>=20
>   Keep est_lock held for the whole disable/step/reprogram sequence so no
>   other EST user can program the block while the clock is being stepped.
>=20
> stmmac_set_time() also steps the PHC, but it only takes ptp_lock:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c:stmmac_set_time() {
> 	...
> 	write_lock_irqsave(&priv->ptp_lock, flags);
> 	stmmac_init_systime(priv, priv->ptpaddr, ts->tv_sec, ts->tv_nsec);
> 	write_unlock_irqrestore(&priv->ptp_lock, flags);
>=20
> 	return 0;
> }
>=20
> It never takes est_lock, never disables EST before the step and never
> calls __stmmac_setup_est() afterwards.
>=20
> tc_taprio_configure() holds est_lock, reads the clock with gettimex64(),
> computes priv->est->btr[] with stmmac_calc_tas_basetime(), and then calls
> stmmac_est_configure(..., true). A concurrent
> clock_settime()->ptp_clock_settime()->stmmac_set_time() is not excluded
> by est_lock, so it can step the clock between that read and the
> programming.
>=20
> Doesn't that leave the same stale base time race open through settime64?
>=20
> There is a second effect. A taprio schedule installed before a
> clock_settime() is never re-based, so it keeps its old base time until
> taprio is reconfigured.
>=20
> Should stmmac_set_time() use the same disable/step/__stmmac_setup_est()
> sequence under est_lock? Should the commit message mention this path?

The reported issue is valid, but it is a pre-existing problem out of scope =
for
this patch (it needs to be addressed with a dedicated patch).

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://netdev-ai.bots.linux.dev/sashiko/#/patchset=
/20261102-stmmac-ptp-est-lock-v1-1-76fbc0cb230d%40oss.qualcomm.com

--u7LTxgNDxJpjZZUD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaupTFAAKCRA6cBh0uS2t
rDvIAP9tPpHWKQVQUbTr/cKabQ0rfGmIlQxmZcAOxJ6ZZrEPPgD/QP2fAC6xHv5x
Yo1LtT60Zj45J1FEXP5eCG5PXtZpcgY=
=c9CI
-----END PGP SIGNATURE-----

--u7LTxgNDxJpjZZUD--

