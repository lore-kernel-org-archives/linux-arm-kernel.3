Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90460606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NtFzj4UD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aAGUXCZE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyHngtJD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hNMApI64BDzXWX7uofxqBhSLNs4PiRuIdYa6n5sxpzM=; b=NtFzj4UD6i3e7Q6a9zlSlKbEMy
	wiUFt5dBm7UHHCTLYqBVxVKZH2jAy8MRrqaN3HRORbtl2ZgGIQNCcVmfoImTmKfUYSecV9nt8H85M
	KT3k0+kiHJRw2fEvfiMDEFCqa9aJhQxzXksAndNgQZwgwAhvF7ZFiEr+LuhCzHK5BqH6pTtzbVj7S
	3JA+MXeTpqnWJs4MycS9hMdzPI70OtRZ2ekK60oHZpcnze5TaBeqsfxBOfK+/5avHjYS4+QShYxIk
	Ewz/anei+Re/0RI1ReqP1/cF6qa3nIbTxs+zlV4OGIu6fyP57WI+DAdbYUjZQXhfdMzPRn241ow90
	lgf0/RfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqHR-0000000GMG2-1Wjp;
	Mon, 02 Nov 2026 11:32:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqHO-0000000GMFf-46dY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:32:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B4SFI2616321
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 11:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hNMApI64BDzXWX7uofxqBhSL
	Ns4PiRuIdYa6n5sxpzM=; b=aAGUXCZE3le2vWGnM+L29f/ZXzXbQauQp0i1gvCm
	H9qb3wDccj3V6/+VCrRel3HdkoMUZX1tH8jgKqJ5CJEl7tJbW+ghWtNJnsgYitqe
	1qn/s6eTbKEpiMtH+2DUVggvJ78gxHklLvF4yUJKoJZzM4yyjxCC/pLYC6zhgQIF
	3QtTSr8avpqbOzl1S89PvFpPanIppGi1+rL1JSssULCShdwTV+aEXPJzgLuKacXA
	VeXZYPl/M+yduWcuP2gIQ5N6mjleRL3iqE5UEzCwnOTA041kyX20ghjeJlgWiDm8
	twbpdeOczyG1Dpq43wqdKXeKGquyIjb8iD4oU6XkZ3qnmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavg388-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:32:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso734713485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 03:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619165; x=1794223965; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hNMApI64BDzXWX7uofxqBhSLNs4PiRuIdYa6n5sxpzM=;
        b=eyHngtJD6ybtiADZQ2Hn26r+ZPK2a7bRvZDOp7hxRO5zyHKdiLKYBZHkdipG/SKK6O
         2XKZ+OgarWMZgOSKptTwTrc3y8kO5WDt6QER8kn4JpC3Yv8jhZ2XzApPxns2uHteTWP7
         XbytE52W/eXTelDxbInkBBjBblY9tixDr65mOyZZdKAq78nTkznkC+CENxlpMIXzKztT
         oLUsBflWmyLUTt8SOsiWBC3Z/pAgOhjsyNTlDxolL7XvjURASOrYTAtC3Dkph2KDf5ZG
         HabgRlkFzgfBh+Ahx4EuZKtRDt4qH0iCUIXJJAJjvjgByipQc+mrk7tvoswKOU04nJ++
         R82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619165; x=1794223965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNMApI64BDzXWX7uofxqBhSLNs4PiRuIdYa6n5sxpzM=;
        b=hACfe3MfyIXOvBaXT21uLS0nfxXDI88EmjqJLc68FGEL7dAzM2YXvKCnhjbeaC+Kw4
         amrw6IVkTKOo4n15G6bmev+IF2E+QVGFPWIMzyL2nouzwInATxTetCmNu81SojDbzilS
         8sgbb4w0Xuf7w0q1zeXn8QCD+S6vBfCNvmIE8r5s+iR51JZOw58OavRapAL62GraU2D7
         6KsJoxvmfXjFP8PxehMdS9VV2h/ltoqpMli8lg8xv+9cpmXGWnlW/Xl6LRJEFn5cFoBT
         ci4+TA7aJnJIEjAzfmFJRWdASh7EXsuUbOvKLdWcebyFw+QRG7gns9uSs3uUlxNzIsC+
         QCiA==
X-Forwarded-Encrypted: i=1; AKwUvByW/1JeS5+q4PsIoXjiwjNAM0C+rN6nx6nLFR9PoZrB+/wOkavbeeqNBiafCFPicEYBiqQ1KyZ5balFP5RsYD+P@lists.infradead.org
X-Gm-Message-State: AFq9FYKzv9th1kg1xGJvYuW48gx31Mx9XfDo6+NiS7IV3UdspbQFXtfK
	dI90DgfMzcu7XGmAoJqH7IMuCrzNHKfxpjPQrEFWV2sdvZ+tijVzL8ce776nTlsvQqiwKe4og1H
	O5bT9lkMq3tn3et/KVM1J1XF3qGj9XOWpQ114nNxeVlG5o6RnCPFDD55XaTlgaBMkBTj248a3d7
	YXMg==
X-Gm-Gg: AYBFou1id4GJMZ7xWT/tc0xXEPrb52Wp8whjpsFWBTCi5X9IWmRJSr2iZh2y0L+DX0I
	1wO5A1iR0hroPc/KfXwJys4DFfwSz7oTw+sgZQZPS4QcN91xa/E3uMHATgpSZniUIAfCNlpB9Hp
	9Z6fLc70BtQRYqtPg79cUKm0Uls6eI/u/KlVI2bLTAc+LtjUyxqZObaZf75y9Aaa4lJ8uccXLiT
	X5F5Mel0wPGWyDCv0raM6KEsVqfmHEwPgC/p7Y8Ugkw2qAd/D6bbmP/4FksfjHvD7pOZU1sz8Ld
	2IW/37afuFTqf3CZDUGR/9/3oiXGzG8V2ZKipWz+KmJDCxG4C9bf+3o/id93pUn8cusdEXxNiHe
	Vyvw5p1H49WqWYVfFkLxAjO58d97j/+z8hCGEfau1NoOXwbeoCZZetdoOOksdqQ==
X-Received: by 2002:a05:620a:7111:b0:945:af5d:287b with SMTP id af79cd13be357-945af5d28eamr575850285a.30.1793619164810;
        Mon, 02 Nov 2026 03:32:44 -0800 (PST)
X-Received: by 2002:a05:620a:7111:b0:945:af5d:287b with SMTP id af79cd13be357-945af5d28eamr575847385a.30.1793619164145;
        Mon, 02 Nov 2026 03:32:44 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf723b5dcsm269045785e9.14.2026.11.02.03.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:32:42 -0800 (PST)
Date: Mon, 2 Nov 2026 12:32:42 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        richardcochran@gmail.com, linux@armlinux.org.uk,
        Jose.Abreu@synopsys.com, james.hilliard1@gmail.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        rayagond@vayavyalabs.com
Subject: Re: [PATCH net v5 3/3] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
Message-ID: <auh02q2HFi2OJjI0@lore-desk>
References: <20261029-stmmac-est-fixes-v5-3-85b830a795a9@oss.qualcomm.com>
 <179361656787.3131.5817596791384004529@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KGy68gsddh448JTx"
Content-Disposition: inline
In-Reply-To: <179361656787.3131.5817596791384004529@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfXybg0D9JEmw2K
 3n6KDBbBmsAB8MgJpoHF4G+VqTmKzNEHrW7gif3Mof7rInUYAsVRIvrSMPbGqilfoglhSLzYf0B
 peGR7JL+mLAcHYim4HtxPVaX5Rs8hAU/2HCMvwaBZNKgsIkwTrGJ5sHnIRwcdyon7Z0Q3eyfnv7
 wn2uCmvcz4lOvjWb5WY6X71d4Qqi5+QGnoS/4ekErLdMBAuINu+z4zZQJIc6Ki0Cd+rhmFFkXYb
 RO3mH/Etiq5+aZU1+jHf4Gos1F14dr3Bd9/nlykXDqPersV4lGfK0ZCItA+9MGw+iqJdtuUFCiu
 pvCSP1jN9hkkYDcd7YiYF0IXhJjL4FvDDl+fT4iJ2jbnaSx7dRaOxxMVbj1wh5QMGbx6zrDqRn7
 UV+o21TL83Mxf0Shoiq1cotFfEnFRxjSsieMuiT5cDQmPPGEjyAmc+HzUBrKeVdHqVf4G5HaYMr
 jnkPK8pyYHCNdBT+8xQ==
X-Proofpoint-GUID: nk9PIpwjAHqcdjculHnPoJTxZ-lJfb0d
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae874dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=vwSTzRkvEfDpTB41HsoA:9 a=QEXdDO2ut3YA:10
 a=RYqGYfE62diCt-6m_3gA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX6OaHO2ap/AXb
 gheOWtVlNQ+hgCd+XybQzun4XAPA6tTRODAP5OS8V61j3JR63+28TUxhATLpxvXPAgu+nZMJ9lR
 6qzK0BqQ02b2t3bAAv94E7L1FMKQlno=
X-Proofpoint-ORIG-GUID: nk9PIpwjAHqcdjculHnPoJTxZ-lJfb0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_033247_140543_7CDD227E 
X-CRM114-Status: GOOD (  41.43  )
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

--KGy68gsddh448JTx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 (1) =C2=B7 Medium: 1 =C2=B7 Low: 1 (1)
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] A taprio REPLACE that fails the FPE callback's software
>   validation destroys the installed hardware schedule, even though the=E2=
=80=A6
> - [Low] stmmac_adjust_time() still uses two separate est_lock critical
>   sections: it disables EST, runs adjust_systime under ptp_lock only,=E2=
=80=A6
>=20
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the patch adds
>   a new way to reach it.
> - [Low] The TX/XDP hot paths (stmmac_main.c:2753, 4861, 5286) read
>   priv->est, priv->est->enable and priv->est->max_sdu[] with no lock and=
=E2=80=A6
>=20
> --
>=20
> net: stmmac: re-apply taprio offload in __stmmac_open() and stmmac_resume=
()
>=20
> This commit re-applies the taprio EST offload and the FPE preemption
> mapping after the core soft reset, in __stmmac_open() and stmmac_resume().
> The base time recompute moves into __stmmac_setup_est() and
> stmmac_setup_est().
>=20
> tc_taprio_configure() now holds est_lock across validation and
> programming, builds the gate list in a temporary buffer, and sets
> priv->est->enable only after success.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 2163e79fea9a4..d1e3d2cc77670 100644
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
>=20
> [Severity: High]
> This issue predates the patch, but the new est_error exit gives it one
> more trigger. If stmmac_setup_est() fails during an MTU change, is the
> running netdev left with freed rings and TX hrtimers that were never
> initialised?

This issue has not been introduced by this patch and it needs to be fixed w=
ith
a dedicated patch.

>=20
> stmmac_change_mtu() calls __stmmac_release() and then
> __stmmac_open(dev, dma_conf), which memcpy()s the kzalloc'd dma_conf into
> priv->dma_conf. The est_error exit returns before stmmac_init_coalesce(),
> so hrtimer_setup() never runs on the txtimers.
>=20
> stmmac_change_mtu() then does:
>=20
> 	ret =3D __stmmac_open(dev, dma_conf);
> 	if (ret) {
> 		free_dma_desc_resources(priv, dma_conf);
> 		kfree(dma_conf);
> 		...
> 		return ret;
> 	}
>=20
> and the interface stays up. On the next ifdown, __stmmac_release() calls
> hrtimer_cancel() on priv->dma_conf.tx_queue[chan].txtimer, and
> hrtimer_active() dereferences a NULL timer->base. After that,
> free_dma_desc_resources(priv, &priv->dma_conf) frees the same rings a
> second time.
>=20
> Failures in stmmac_hw_setup() and stmmac_setup_ptp() already reach this
> path. A failed EST/FPE replay is a new way in.
>=20
> > =20
> >  	phylink_start(priv->phylink);
> > @@ -4224,7 +4229,7 @@ static int __stmmac_open(struct net_device *dev,
> > =20
> >  	for (chan =3D 0; chan < priv->plat->tx_queues_to_use; chan++)
> >  		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
> > -
> > +est_error:
> >  	stmmac_release_ptp(priv);
> >  ptp_error:
> >  	stmmac_stop_all_dma(priv);
>=20
> [ ... ]
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > index 9a32af00d7d2d..a37405534bebf 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
>=20
> [ ... ]
>=20
> > @@ -69,47 +69,21 @@ static int stmmac_adjust_time(struct ptp_clock_info=
 *ptp, s64 delta)
> >  	nsec =3D reminder;
> > =20
> >  	/* If EST is enabled, disabled it before adjust ptp time. */
> > -	if (priv->est && priv->est->enable) {
> > -		est_rst =3D true;
> > -		mutex_lock(&priv->est_lock);
> > -		priv->est->enable =3D false;
> > +	mutex_lock(&priv->est_lock);
> > +	if (priv->est && priv->est->enable)
> >  		stmmac_est_configure(priv, priv, priv->est,
> >  				     priv->plat->clk_ptp_rate, false);
> > -		mutex_unlock(&priv->est_lock);
> > -	}
> > +	mutex_unlock(&priv->est_lock);
> > =20
> >  	write_lock_irqsave(&priv->ptp_lock, flags);
> >  	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
> >  	write_unlock_irqrestore(&priv->ptp_lock, flags);
> > =20
> >  	/* Calculate new basetime and re-configured EST after PTP time adjust=
=2E */
>=20
> [ ... ]
>=20
> > +	mutex_lock(&priv->est_lock);
> > +	if (priv->est && priv->est->enable)
> > +		__stmmac_setup_est(priv);
> > +	mutex_unlock(&priv->est_lock);
>=20
> [Severity: Low]
> Can stmmac_setup_est() turn EST back on between these two est_lock
> sections?
>=20
> The first section no longer clears priv->est->enable, so any est_lock
> user that runs while the time is being stepped still sees
> enable =3D=3D true.
>=20
> In __stmmac_open(), stmmac_setup_est() runs right after
> stmmac_setup_ptp() has registered the PHC. clock_adjtime() is not
> serialised by rtnl:
>=20
> CPU0 (stmmac_adjust_time)          CPU1 (__stmmac_open)
>   disable EST, drop est_lock
>                                      stmmac_setup_est()
>                                        sees enable =3D=3D true
>                                        __stmmac_setup_est() enables EST
>                                        with a pre-step base time
>   stmmac_adjust_systime()
>     (EST running across the step)
>   __stmmac_setup_est()
>=20
> A taprio REPLACE can race with adjust_time in the same way.
>=20
> Before this patch, clearing enable during the window kept other paths
> from re-arming EST. Would holding est_lock across the disable, the
> adjust and the re-enable close this window?

This is the same issue reported in patch 2/3. As pointed out before this is=
sue
has not been introduced by this patch and it needs to be fixed with a dedic=
ated
patch.

>=20
> >=20
> >  	return 0;
> >  }
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_tc.c
> > index ac926c60f9f9a..10b61fa2c27c5 100644
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
> This is a pre-existing issue that the patch did not introduce.
> stmmac_xmit(), stmmac_xdp_xmit_xdpf() and the other TX paths read
> priv->est, priv->est->enable and priv->est->max_sdu[] without est_lock
> and without READ_ONCE():

This issue has not been introduced by this patch and it needs to be fixed w=
ith
a dedicated patch.

>=20
> 	if (priv->est && priv->est->enable &&
> 	    priv->est->max_sdu[queue]) {
>=20
> If a REPLACE runs while traffic is being sent, can this memset() and the
> plain stores after it race with those readers? That could drop a frame
> by mistake, or let one through past max_sdu, while the schedule is being
> reconfigured.
>=20
> Setting enable last in this patch does make the window smaller.
>=20
> > +	memcpy(priv->est->gcl, gcl, sizeof(*gcl) * qopt->num_entries);
> > +	priv->est->gcl_size =3D qopt->num_entries;
> > +
>=20
> [ ... ]
>=20
> > @@ -1091,7 +1109,6 @@ static int tc_taprio_configure(struct stmmac_priv=
 *priv,
> > =20
> >  	ret =3D stmmac_est_configure(priv, priv, priv->est,
> >  				   priv->plat->clk_ptp_rate, true);
> > -	mutex_unlock(&priv->est_lock);
> >  	if (ret) {
> >  		netdev_err(priv->dev, "failed to configure EST\n");
> >  		goto disable;
> > @@ -1102,11 +1119,16 @@ static int tc_taprio_configure(struct stmmac_pr=
iv *priv,
> >  	if (ret)
> >  		goto disable;
> > =20
>=20
> [Severity: Medium]
> If a REPLACE fails FPE validation, is the installed schedule still torn
> down?
>=20
> The commit message says:
>=20
>   A REPLACE rejected during validation then leaves the currently
>   installed schedule intact in both software and hardware
>=20
> However, by the time stmmac_fpe_map_preemption_class() runs, priv->est
> has already been memset and overwritten, and
> stmmac_est_configure(..., true) has programmed the new schedule.
>=20
> dwmac5_fpe_map_preemption_class() only does software validation, and it
> can return -EINVAL. One example:
>=20
> 	if (priv->xmit_qdisc.algo =3D=3D MTL_TX_ALGORITHM_SP) {
> 		NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
> 		return -EINVAL;
> 	}
>=20
> It can also fail on a TXQ weight mismatch. Either error takes the
> disable path, which clears priv->est->enable and turns off EST in
> hardware.
>=20
> Meanwhile taprio_change() sees the error, jumps to free_sched, and keeps
> the old schedule along with its full-offload state.
>=20
> For example, on DWMAC5 with FPE: install an all-express schedule that
> has a multi-queue TC, then REPLACE it with that TC marked preemptible.
> The user gets -EINVAL and the qdisc still reports the old schedule as
> offloaded. But hardware gating and max_sdu enforcement are gone, and a
> later reopen or resume will not bring them back because enable is now
> false.
>=20
> Could the FPE validation run before priv->est is changed and EST is
> programmed?

This issue has not been introduced by this patch and it needs to be fixed w=
ith
a dedicated patch.

Regards,
Lorenzo

>=20
> > +	priv->est->pclass =3D qopt->mqprio.preemptible_tcs;
> > +	priv->est->enable =3D true;
> > +
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261029-stmmac-est-fixes-v5-0-85b830a795a9%40oss.qualcomm.com

--KGy68gsddh448JTx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauh02gAKCRA6cBh0uS2t
rJLzAP0eEh5JhobVfUU2pRcoC6A2k2LeDfoAm4CDQO0r47r1fwD/YmaNLRHdQvDc
p1aeZw1CGQpbDVDs1PAkqrgm7fOw2A8=
=YukB
-----END PGP SIGNATURE-----

--KGy68gsddh448JTx--

