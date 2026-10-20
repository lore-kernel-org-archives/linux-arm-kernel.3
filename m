Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A05606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HIbLdJpT;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mQPqk7Em;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElvXLeWS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFh44IPn0Z2OtZ26u5Gbqg0riMUGip4dDBAHiyyYehE=; b=HIbLdJpT58h0eJklh2SsE4dd0b
	JKM3ODX0eq1w9eSIZLMfsKIOw39jPy1wIvh4BFklDSAbKTkRBilJIUEleJtOHgfpVNRYHEcnmzGFI
	ct524PnKkvDPbbQYWytDkRUyw0+lEua40jMHTgIOuPwVtW0WROM4+veaoGAtY+RuZ1kNAZZ87STvx
	TyDTMM1n4OGfeW70PCCDtB2JYb0hWIsfsSglfwKVPVM8BKZlDltmhAuYCdHVT6UTOlp7aTm7G0DRT
	onQvWe+8uEAnSXhHFE1UGfp0atPfHwqPUgpfZKvxk7YUORYLeaM8eLxZqB387GZc4cGuIuOQBcTNo
	4bxoP0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9m1-00000009mFN-31u9;
	Tue, 20 Oct 2026 13:21:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9lx-00000009mEU-1IP1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:20:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA5cn1575223
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bFh44IPn0Z2OtZ26u5Gbqg0r
	iMUGip4dDBAHiyyYehE=; b=mQPqk7EmAwfLqUmJjANU/qZFcFlEc920Rvio2IWi
	d9pRhELVtXTt9xyH5UeOfqu8tvWMja/HEjV9CJwIDnrCvTV4RRDkj9l2xG8pF0wr
	OBFqWp+hsaO3vfwyyDulg+GS1mHNDa/v9xWe3lZy9wMBeRLjkUJQynRUBZq57wcU
	c1PrnK0C3+2G2NbHD2YtZP/f8RhvHhMIrU7ebhay6HnB4WGGGV1jVX9RrPUnlkxx
	6GozfqKn+0K0Gjd8paRS18SEeKZooZUsvlg6CefaEsfJ719GxTU8nwrYCb5GeONr
	4L35QhLOdLyO4IIQ/S9A7PeSXpZ8pGUUcvJb3crIyC1P+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2mp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:20:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so758842585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502455; x=1793107255; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bFh44IPn0Z2OtZ26u5Gbqg0riMUGip4dDBAHiyyYehE=;
        b=ElvXLeWSvDbVV6QpM6j1gzsAJWg9CYQnoXsrHnz1U1AVy5YkPPofffM5eTjbrEltdJ
         mlVxHkRUSRG+PsSshddWpVW+qJVp6AorNz9aQVXYYcdW/cGiqPoUKolfQbub2WU0Vx/Q
         ZBcUCRD6CV1agDFUQc9z+VorXaUYqugWDSBMFm8oivib0zyHv0GpAEC+sIhTH9wOU4w1
         WW/JynhbK9yF21DbsICCk+/gEov4AKYBWYoHD8Uk+mV2uJOYiRdu9QtOvEp5SQkS93OY
         f4/k0UiqW/916pinb8me2OJcE+XD2YCVyD5AhFknORAg6MQyag0Qpu0x2h2aRMuaMDF1
         /o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502455; x=1793107255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFh44IPn0Z2OtZ26u5Gbqg0riMUGip4dDBAHiyyYehE=;
        b=p/TUQhhaeglvYUEjuDyApoi7qjUwPPYYSkRKApgQZTNJbqG0lidJXb4eoSeHprmQVk
         +LHxvP5m17BCvzEdp4IC4wk6Hqv7PpZgtdbzyXUSUIDUrinVbYty4wNXqQYsee1Gdidw
         kcjBVwpxSykQinlN2zcFQzHrUPDYjFHSNkmRPtrjPutRCkRZSvbfAqOkJvCmsdRZyf7J
         bTKNHR6MjbmAqZk81YTsX3pi7ED1DfSHdW2nkUx/S1veWt30dpt6GikUQdXyuK1MLPNc
         pV7sslI0AZ2LGWUf46WS+c1Ch2vApLg1ngGs7xI+z9Ud/llfcw9ncC0MDh7FMZPoHxya
         oOHw==
X-Forwarded-Encrypted: i=1; AKwUvBz+iWon8bZCt4+gGwl5A88rvh2TKMu7ChtZiMjpI7bHuPYqw3QTgmc+YcPemWTPFJo58xAy46YcjRo0Wy7Jrbgr@lists.infradead.org
X-Gm-Message-State: AFq9FYIL8Q0hB03XK1sLR3gns7Qf9WeeggqKVp9ineIc5i2WJpZDMmKO
	OCNj/B4s0SR31sR8sx8clt0N8HMg+Up5PiCL7UovhlmLjz9E34nv1KHne6MxvtYpIrkX93uCt+6
	IMPxGCx7fW6IMgxeI56BEzVm6iqkv1TWRwNpbOAmnbIYIaRNQFo6fIEnlxmbAoMTUxO8FYAcOv2
	gTZg==
X-Gm-Gg: AYBFou3TPgIw81uwVWcfaIXROzd4LtGcw7+tpGeMjfxLgKui/TQRouYfulJz1BxkA8f
	CSPg8lun4UymAp7GXHhFA/fT7FZBO1FjVGmo1agCntvui/IGzzUZE9XaQ0fbuq+Ynk3akwKnuuB
	+HQ4xfg19TAbL2b0QTmeQBfby4i9sLFzU1aELlfFIKFY9P0+GW9jC8jCmnftZUjy6uTqC/jGtjR
	Dj7ftTP0T6W5j1+3EdXPtt0r9P5EtjHtatVbsZEgeD0ceINayL9TctFH9aQFrqNGDtzARIv/+Zr
	ZZkvlN55yGNeYnkaDPP9zMij+qUpv72MhFytz7tlHhhPXvftqNPgyorOdcNGClyjUpFI66cVebK
	kVg3QeRdOCZzY8Q==
X-Received: by 2002:a05:620a:801c:b0:93f:38c7:70f8 with SMTP id af79cd13be357-93f38c771b7mr1235467585a.28.1792502455207;
        Tue, 20 Oct 2026 06:20:55 -0700 (PDT)
X-Received: by 2002:a05:620a:801c:b0:93f:38c7:70f8 with SMTP id af79cd13be357-93f38c771b7mr1235459085a.28.1792502454497;
        Tue, 20 Oct 2026 06:20:54 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c59sm6374406f8f.30.2026.10.20.06.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:20:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:20:52 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v8 2/5] net: stmmac: drop split frames on AF_XDP
 zero-copy RX
Message-ID: <atdqtO5H2Xm4PF0h@lore-desk>
References: <20261018-stmmac-rx-mb-v8-2-5f58c0b25849@oss.qualcomm.com>
 <179243151485.3135.12311252292585825@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ikcYgxqamUq5IIf"
Content-Disposition: inline
In-Reply-To: <179243151485.3135.12311252292585825@kernel.org>
X-Proofpoint-GUID: tVRgsUpxDU27942chiHmeaWPGDheMYhd
X-Proofpoint-ORIG-GUID: tVRgsUpxDU27942chiHmeaWPGDheMYhd
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad76ab8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=1APB42EX1ZTcaJcjk3kA:9 a=QEXdDO2ut3YA:10
 a=nCUn8_fOkXnfcJFlgTMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX696EykhtJoUx
 APKIR28Z/HGWVpONS2Uny3KVeSZMFpJFDf1QTLb4jPMKFdMPAolspqYA1FnRLmrM3WsvNWe5yNT
 mNf/ZrWREeIPoljZieOldb33tJeUdcxxCrhY9O5Phaw0DnrQjM/JW8h/Y+ISv+TbwMetDHKCbPr
 oKUI8IWoYmKd54b4d+P1BhxRIJ30ytxsXQSyRe3JrTbiFnvckhPRLThVuSf2LY7z7VBlrjaJfgg
 D+kvNUc19xV5hXYNzyd7RT9sjwv2lRZApw90ufspGBrIf2Zdtb5vtRRvmOBU+VTHgtuMjCGKnCi
 FsvSEOuUJ1lrSYZ7e1ptJWQ70mDd7JTIk8eQgzHZW1jTyRoJbU1W5zNhjkHELKc03GlUBb8MYQ9
 rLLCo8Ib/BtVrbfqupGCSHUNrHSwqH+l2B3ejmS3EhrxurpRK2up7lKrQHugbs1YB0DoT1aLY4c
 cIEG7OnOqJs1Pivpy2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX3d+GWoWsppOq
 JepfcjbAFSs02FDQlTbECyWq3yXxy77rztUDlvonY9lZhhPb8hRhLFCWrDeh/d1MIp5RyKcduQ8
 FWfsgqHBZw4reksB8/m5+EWTPypN2y4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_062057_497131_8BA5B9E7 
X-CRM114-Status: GOOD (  48.59  )
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

--3ikcYgxqamUq5IIf
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
> - [Low] The patch changes the discard test from `status =3D=3D discard_fr=
ame`
>   to `status & discard_frame` in both stmmac_rx() and stmmac_rx_zc().
> - [Low] After this patch, stmmac_rx_zc() counts the same event (a frame
>   split across RX descriptors on an AF_XDP zero-copy queue) differently=
=E2=80=A6
> - [Low] In stmmac_rx_zc() on dwmac4/XGMAC, a split frame can now be
>   counted in both rx_dropped and rx_errors.
>=20
> Pre-existing issues:
> - [High] At this commit, stmmac_rx() (non-ZC, XDP attached, GMAC4/XGMAC
>   whose non-last descriptors report bare rx_not_ls) still drops a non-=E2=
=80=A6
> - [Medium] stmmac_rx_zc() and stmmac_rx() add their local
>   rx_dropped/rx_errors into the device-wide `priv->xstats.rx_dropped`=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: drop split frames on AF_XDP zero-copy RX
>=20
> In stmmac_rx_zc(), when the 1:1 XSK mapping check drops a non-last
> descriptor, this patch now marks the frame as errored. The rest of the
> split frame is then drained, and its tail is no longer handled as a new
> frame. The patch also makes the legacy enhanced and normal descriptor
> callbacks report rx_not_ls together with discard_frame, and changes the
> discard test in stmmac_rx_zc() and stmmac_rx() from =3D=3D to &.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/n=
et/ethernet/stmicro/stmmac/enh_desc.c
> > index 0512536012251..297e2428a8f9b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> > @@ -184,7 +184,7 @@ static int enh_desc_get_rx_status(struct stmmac_ext=
ra_stats *x,
> > =20
> >  	if (unlikely(!(rdes0 & RDES0_LAST_DESCRIPTOR))) {
> >  		x->rx_length++;
> > -		return discard_frame;
> > +		return discard_frame | rx_not_ls;
> >  	}
>=20
> [Severity: Low]
>=20
> With this change and the matching one in ndesc_get_rx_status(), does
> stmmac_rx_zc() now count the same split frame differently depending on
> the descriptor format?
>=20
> On dwmac4 and xgmac, dwmac4_wrback_get_rx_status() and
> dwxgmac2_get_rx_status() return a bare rx_not_ls for a non-last
> descriptor:
>=20
> 	if (likely(!(rdes3 & RDES3_LAST_DESCRIPTOR)))
> 		return rx_not_ls;
>=20
> So the frame reaches the new 1:1 mapping drop and rx_dropped is
> incremented once.
>=20
> On dwmac100/dwmac1000, non-last descriptors now carry discard_frame. The
> status & discard_frame block in stmmac_rx_zc() runs first and increments
> rx_errors for each non-last descriptor (when hwts_rx_en is off). The new
> rx_dropped++ in the 1:1 path is never reached on these cores.
>=20
> An N-descriptor jumbo frame would then show up as 1 rx_dropped on
> GMAC4/XGMAC, but as N-1 rx_errors on dwmac1000. Both counters are
> exported through stmmac_get_stats64(). Is this asymmetry intended?
>=20
> The legacy cores already counted rx_errors per descriptor before this
> patch; what is new is the different rx_dropped accounting. Later in the
> series, "net: stmmac: rework stmmac_rx to support XDP rx multi-buff"
> changes stmmac_rx() to test !error && (status & discard_frame), so it
> counts once per frame. stmmac_rx_zc() still counts per descriptor at the
> end of the series.
>=20
> [ ... ]
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 8fd2acb25fb60..efa88cd359dac 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -5715,8 +5718,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv,=
 int limit, u32 queue)
> >  		if (likely(status & rx_not_ls)) {
> >  			xsk_buff_free(buf->xdp);
> >  			buf->xdp =3D NULL;
> > +			rx_dropped++;
> > +			error =3D 1;
> >  			dirty++;
> > -			count++;
> >  			goto read_again;
> >  		}
> > =20
>=20
> [Severity: Low]
>=20
> Can one split frame on dwmac4/XGMAC now be counted in both rx_dropped and
> rx_errors?

ack, I will fix it in the next revision.

>=20
> The first non-last descriptor takes this path, which increments
> rx_dropped and sets error =3D 1. Suppose the last descriptor of the same
> frame then reports discard_frame (RDES3_ERROR_SUMMARY, for example a CRC
> or giant error on an oversized frame). The earlier block in
> stmmac_rx_zc() still runs:
>=20
> 		if (unlikely(status & discard_frame)) {
> 			error =3D 1;
> 			if (!priv->hwts_rx_en)
> 				rx_errors++;
> 		}
>=20
> This happens even though error is already set for this frame.
> stmmac_get_stats64() exports both totals as rx_dropped and rx_errors.
>=20
> Later in the series, "net: stmmac: rework stmmac_rx to support XDP rx
> multi-buff" avoids this in stmmac_rx() by testing !error && (status &
> discard_frame). stmmac_rx_zc() is not changed, so the double count is
> still there at the end of the series.
>=20
> [Severity: Medium]
>=20
> This is a pre-existing issue and was not introduced by this patch. The
> new rx_dropped++ feeds this accumulation at the end of stmmac_rx_zc():

Since this issue has not been introduced by this patch I guess we can fix it
with a dedicated patch.
>=20
> 	priv->xstats.rx_dropped +=3D rx_dropped;
> 	priv->xstats.rx_errors +=3D rx_errors;
>=20
> These are plain unsigned long fields in struct stmmac_extra_stats,
> shared by the whole device. Each RX channel has its own NAPI instance,
> so stmmac_rx_zc() and stmmac_rx() can run at the same time for different
> queues on different CPUs.
>=20
> Can these non-atomic read-modify-writes lose updates?
> stmmac_get_stats64() also reads the fields without any synchronization.
>=20
> stmmac_rx() does the same accumulation, and it is unchanged at the end
> of the series.
>=20
> > @@ -5883,7 +5887,8 @@ static int stmmac_rx(struct stmmac_priv *priv, in=
t limit, u32 queue)
> > =20
> >  		if (priv->extend_desc)
> >  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entr=
y);
> > -		if (unlikely(status =3D=3D discard_frame)) {
> > +
> > +		if (unlikely(status & discard_frame)) {
>=20
> [Severity: Low]
>=20
> Changing =3D=3D to & here and in stmmac_rx_zc() also changes the normal RX
> path on dwmac4/GMAC4/GMAC5. Should the commit message mention this?
>=20
> dwmac4_wrback_get_rx_status() sets ret =3D discard_frame when
> RDES3_ERROR_SUMMARY is set. It then ORs in csum_none for IP header or
> payload errors:
>=20
> 	if (rdes1 & RDES1_IP_HDR_ERROR) {
> 		x->ip_hdr_err++;
> 		ret |=3D csum_none;
> 	}
>=20
> So a frame with both an L2 error and an IP checksum error reports
> discard_frame | csum_none.
>=20
> Before this patch, such a frame failed the =3D=3D test. It was run through
> XDP and passed to napi_gro_receive() with CHECKSUM_NONE. Now it is
> dropped and counted in rx_errors.
>=20
> The new behaviour looks correct. It stops errored frames from reaching
> the stack, which has been possible since commit 644b8437ccef9e ("net:
> stmmac: dwmac4: report Rx checksum errors in status").

I will add the missing Fixes tag in the next revision.

>=20
> However, the commit message presents the operator change only as a
> result of the enh_desc/norm_desc normalization, and limits the scope to
> AF_XDP zero-copy. Could it describe this GMAC4 change and reference
> 644b8437ccef9e?
>=20
> >  			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
> >  			buf->page =3D NULL;
> >  			error =3D 1;
>=20
> [Severity: High]
>=20
> This isn't a bug introduced by this patch. The commit message says the
> change lets stmmac_rx() drain split frames, which holds for
> dwmac100/dwmac1000.

Since this issue has not been introduced by this patch I guess we can fix it
with a dedicated patch.

Regards,
Lorenzo

>=20
> GMAC4/XGMAC report non-last descriptors as a bare rx_not_ls. On those
> cores, with an XDP program attached, are there still paths in
> stmmac_rx() that drop a non-last descriptor without setting error?
>=20
> When the XDP verdict is STMMAC_XDP_CONSUMED:
>=20
> 				if (xdp_res & STMMAC_XDP_CONSUMED) {
> 					...
> 					skb =3D NULL;
>=20
> 					if (unlikely((status & rx_not_ls)))
> 						goto read_again;
>=20
> error is still 0 here, so the next fragment goes through XDP as a new
> frame. With a 1-3 byte tail, wouldn't buf1_len -=3D ETH_FCS_LEN underflow?
>=20
> For XDP_TX/XDP_REDIRECT:
>=20
> 				} else if (xdp_res & (STMMAC_XDP_TX |
> 						      STMMAC_XDP_REDIRECT)) {
> 					xdp_status |=3D xdp_res;
> 					buf->page =3D NULL;
> 					goto next;
> 				}
>=20
> goto next clears in_progress even when rx_not_ls is set. The loop head
> then resets error and len, and the tail is reparsed with len =3D=3D 0.
>=20
> When napi_build_skb() fails:
>=20
> 				rx_dropped++;
> 				count++;
> 				goto drain_data;
>=20
> error is not set here either, so a later descriptor can build an skb from
> only the end of the frame.
>=20
> This is the same class of bug the patch fixes in stmmac_rx_zc(). An
> on-link peer can trigger it, since GMAC_CONFIG_JE is always set on
> GMAC4.
>=20
> It looks like later patches in the same series fix it: "net: stmmac:
> drop multi-buffer frames in XDP mode" and "net: stmmac: rework stmmac_rx
> to support XDP rx multi-buff". After those, XDP and stmmac_build_skb()
> only run on the last descriptor, and failures go to error_free_frag.
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261018-stmmac-rx-mb-v8-0-5f58c0b25849%40oss.qualcomm.com

--3ikcYgxqamUq5IIf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatdqtAAKCRA6cBh0uS2t
rFnpAP9kUYgi1aeqEJMSrracOvJ7U1ToKfeWpWACBamRci7fVQD+KOxWQSvQwbwU
pBve9kJadKpS13su5VQqmXY49H/BjwA=
=7mTf
-----END PGP SIGNATURE-----

--3ikcYgxqamUq5IIf--

