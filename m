Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01A2606B78B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=trdD5zHz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHT51Hzq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkSpnHLm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NtM3FpsdWMM2ex3dyoN58f+ry/GhVNNeuVgTFC4ju0Q=; b=trdD5zHzm0IrfA0F0/iBFeOmNb
	UmpPrIsX4PPFd7p+LzfOWMWYaiSfo50qqb0kn3iY6m6mbgx8k/2Xqx7+TPvXTg6J+LKj5RglpG/gn
	9gXUAhVuuat/FieUsfWueqs5wbt0Ns6Wu/jbcHUdled8NMjuZO9qOYhPxAYfrFeuNW7rnKfFzfged
	WFO6c6OOvVWeF/bccQClFNFROHw5UedUrWuPtAaf7u9JTDLi3bL6pefnvvpTG/Ez7cU0MkpaBgbNM
	tGcm55eWUwp/sQq0Vqqj/i4+Ki/ZaU9CJVAgSUvR6cD9ogDE/LBr8rB4bJbMa1o/TCJ5gYDO+5jLA
	sym+PQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLejI-00000004LLd-2cyR;
	Tue, 27 Oct 2026 10:48:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLejF-00000004LLA-0s6y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 10:48:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe78M432894
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NtM3FpsdWMM2ex3dyoN58f+r
	y/GhVNNeuVgTFC4ju0Q=; b=CHT51HzqShdbJtFgjVyQFsZRW7T0CI7k449+EDJy
	djLFMda+ACDhAeRkl3jjvJ7bznfI3wxIJ15K4MB6K7K50Rtouao38q/BOl/1/Erl
	y4hmklHZ4WLoJUWOBRGybluGv24l9OD23KLgzPnOLyEI74DAQMA3sSQotc4KgAP5
	OsKqVFnjXzeo2QR2AR9vJUGXCkOUTgaR/sw91wn1+hqyWo89YwrYejRTfhH8yuQo
	XbTvKr+fvv4OzyP25CeTHJgGWIrF3ncuiKlpSaHOON0oHpmfCkuUkRP9mma6nntT
	JFk21HD56yBefG+/fuEkmdtNaNIqb3QXesGDyX6t5m/AVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kcs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:48:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so378767985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 03:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098107; x=1793702907; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NtM3FpsdWMM2ex3dyoN58f+ry/GhVNNeuVgTFC4ju0Q=;
        b=PkSpnHLmoQSvMUw7pxDOFG/4EwvCyp5IMFDBNRrlgZupAfLYQZKAvGziNEKn0PbFUA
         9nlgLRQqt+tBUPdff/Q/+6iKrPKXAm57NL0ZdE67nQHF6ej5jW8zSErzBBt6yPLRH6iz
         Np4c1jUM867lwPGyHLuXLrp/dR4TUhhR579wEUXJLj1ekLIbosoSQq4xL121HcTqZy6A
         Zn6xF8ueWH22zTz0/K8Ff3ODfjKwNeLg+iNNEunwDi4i63oPWThZz3xKYeQu6ps18iQ+
         cGOCHgTiNgnu6M7+MBfa3HkWZrp7PPvS1bJOwwfjHEaE7A1Tge4KJ3+wh/nE1ITZCpz/
         6+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098107; x=1793702907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtM3FpsdWMM2ex3dyoN58f+ry/GhVNNeuVgTFC4ju0Q=;
        b=lkZ7ikbUIISNga4YLRM/ghJLAPyLIzopgu4cxeYK42i30cwDTmY+QDdvcUpQvnVgCY
         7v9wD28+pcAFaCXWhP2TX+V4oM3sfO04gmh3RXY8H3Q1YMxbcMPTZhJznNtrcnjbg7yR
         4joXTnR/XLM8N/VrxqpPEsIEOKn+2mQizao8roAZNryOS/BdKFHmX2L+xFLHn8jZ6lmi
         S+jV9qdtK+nMLgI8JLdtBm9QiD+G0+tHF1R1jgYkw0WhJA7CLfkGUIkLhinLOMAYiMjh
         NexuQSmR/QMsp7dYRk/veSZaZNvlUz07IwhaVdzzJaB5ygIRr4bq427f/Yt4FHBEYo9p
         znbg==
X-Forwarded-Encrypted: i=1; AKwUvBwlTa5u1iA20iAnVMSc0YLdlHU2BCsl9PmIRjfV5jIg+UdcWp4TDicHtJynE9wtduzKTA6UxpJzERmZE2W6MbJm@lists.infradead.org
X-Gm-Message-State: AFq9FYIXTPG9uZZ6qF0tGn5lYTkwoqSf+7+p+0YV22Gga1b0i3Oslvo+
	n56hKuNqYAwcPgx/airFcPrtLgi0l4dUDqnkAvecrJsk+KsaZcBhhG+CGlqlE/3L6nKHSSyTHn3
	BpdbQ5vo8qXkikNtFCzmbacXq4/Asb//KpdGRHCPHaN2hthqz3QX1Mvhs3gZQPd+TMVJOIHB3sE
	684g==
X-Gm-Gg: AYBFou21p2JP05i6B8n03yKtd9seS2KWEEYR9CcQROXneNfUXS21Yf5atiuAkMtl7DV
	zZ2E4PFbb8JaI8VmH3zBd62oH/2qnOW6qytfSyoBRqN2MtRM2ToIg4n/ALu5cg+//0TKugV/L+u
	uLKXMtxyOoYQK+c/+Um8IluG/GEHe2LGu/h0A80tGIIYCXjfbp01KeDQcxRiTosaY9+eIot4Ckn
	X8SXXNEtznPBBkFNGWlbbdOf1uJ8ItKluo04jmEoK4TSmxMDAzsJuQZUa8l1AMZ1Ag3gs6q1NbB
	SEELGq1fkolaW5ypq3TxdUEZ2BUWTpn2wt86tjz2a2kQqOevSaCfsVURRFwDiVgh4S1MTNK8ir5
	mKoOdV9yuWOGhZoAgWVJA4RhS79qfChfwkFf3GPRjA12fgGwG
X-Received: by 2002:a05:620a:4728:b0:93f:2236:a61 with SMTP id af79cd13be357-940ef996db1mr1431341785a.61.1793098106759;
        Tue, 27 Oct 2026 03:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:93f:2236:a61 with SMTP id af79cd13be357-940ef996db1mr1431339185a.61.1793098106087;
        Tue, 27 Oct 2026 03:48:26 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm21894250f8f.53.2026.10.27.03.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:48:25 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:48:24 +0100
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
Subject: Re: [PATCH net 4/6] net: stmmac: copy XDP metadata in AF_XDP
 zero-copy RX
Message-ID: <auCBeIMVn0hpbkE_@lore-desk>
References: <20261023-stmmac-xdp-fixes-v1-4-efb37e19f5bd@oss.qualcomm.com>
 <179309225560.3134.9863766306670060785@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5opCz2OYcNfKa8l0"
Content-Disposition: inline
In-Reply-To: <179309225560.3134.9863766306670060785@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX/vHY03LyDSNa
 41XDwOzlvUXXBI1ykW/5MaH7rSOCs95i8aKqMQw3BRzZecdK5Lnan2bZmmDa0GzjChBkeuZQYl7
 9WXNa0+93CfDUtSenn0BJobWTAu2V4w=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0817c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xcHvD7ZGWmBKKSWBBH8A:9 a=QEXdDO2ut3YA:10
 a=f-25XZo990EjwU-OyTIA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: DcXQ9QoU8sVWM1n_qKOkRfB89QMzBR3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX+/Xfo91kkLff
 xywPfEk26T6ZqlmVqBy95/44B+vc79D9EtI7k7Oeg/p74MZhXWnGQ262vUJgI7pKAFoTQykJwUI
 LrB0OSEEpzipoUuKRhtmCTyYMFFCDqeu+AFdB8BpJDbuude9jvmEuK2IjRnKnd2qlE2chdVczZf
 pRyejFHax/7LrtjDXxauGc8yhKFh1k0WjRBc2zR8i6/jCP1vGj3fn+n29+XkrVW5vEWMa32jjJW
 FEQr3E6UDTVU/xJX0lgiSwKv5gOGuBuaQx1+pdlej4NnkvHBCvJhY9gWvdR0ZUM4jGxO7ynxUzM
 mqXxDnKoyV3uaKJBPhvn19E8MWJppI/YxmDJKVLregMMChRtvAUtsCGKxjUh6WwoKOLId0k2dNN
 b201h54FCA7nM/Qh/KUpj4kp47sKM64MNXJVNGXYSX90DQ3pXHtVrNeT0Ai7VzJIKnaKF4NtKIL
 CtBuMGeyMFNodzTKT4A==
X-Proofpoint-GUID: DcXQ9QoU8sVWM1n_qKOkRfB89QMzBR3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_034829_418858_62C5092A 
X-CRM114-Status: GOOD (  32.40  )
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

--5opCz2OYcNfKa8l0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 27, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] At this commit, the commit message says
>   stmmac_construct_skb_zc() 'keeps the metadata aligned when=E2=80=A6
>=20
> --
>=20
> net: stmmac: copy XDP metadata in AF_XDP zero-copy RX
>=20
> This commit changes stmmac_construct_skb_zc() so that it copies the XDP
> metadata in [xdp->data_meta, xdp->data) into the new skb together with
> the packet data. The metadata ends up right before skb->data, and
> meta_len is recorded with skb_metadata_set().
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 30a2774d722b7..8a2faf50d6957 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5519,7 +5519,8 @@ static struct sk_buff *stmmac_construct_skb_zc(st=
ruct stmmac_channel *ch,
> >  		return NULL;
> > =20
> >  	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> > -	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
> > +	__skb_put(skb, datasize);
> > +	memcpy(skb->data - metasize, xdp->data_meta, datasize + metasize);
> >  	if (metasize)
> >  		skb_metadata_set(skb, metasize);
>=20
> [Severity: Medium]
> The commit message says this change:
>=20
>   "keeps the metadata aligned when stmmac_rx_vlan() relocates it with the
>   MAC header while stripping a tag."
>=20
> Is that true at this commit? Here, stmmac_rx_vlan() still moves only the
> two MAC addresses:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_rx_vlan() {
>     ...
> 		vlanid =3D ntohs(veth->h_vlan_TCI);
> 		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
> 		skb_pull(skb, VLAN_HLEN);
>     ...
> }
>=20
> The software pop path runs when hw_vlan_en is false, CTAG or STAG RX
> offload is enabled, and a tagged frame arrives. In that case,
> stmmac_dispatch_skb_zc() calls stmmac_rx_vlan() before eth_type_trans():
>=20
>     stmmac_rx_vlan(priv->dev, skb);
>     skb->protocol =3D eth_type_trans(skb, priv->dev);
>=20
> The metadata stays at [old_data - metasize, old_data), but mac_header is
> set to old_data + VLAN_HLEN. skb_metadata_end() returns skb_mac_header(),
> so the metadata window seen by TC BPF and the stack is shifted by 4
> bytes.
>=20
> Wouldn't that drop the first 4 bytes the XDP program wrote, and return
> the first 4 bytes of the destination MAC as the last 4 bytes of
> metadata?
>=20
> The next patch in the series, "net: stmmac: fix VLAN tag stripping on
> short and non-linear RX frames", changes stmmac_rx_vlan() to move
> meta_len + ETH_ALEN * 2 bytes starting at skb->data - meta_len. That
> fixes this by the end of the series.
>=20
> Until then, this commit is a bisection window. A stable backport that
> takes this patch without the next one would also have the problem.
> Would it make sense to reorder the two patches? Another option is to
> reword the commit message so it doesn't depend on a change that hasn't
> landed yet.

I agree, I will reword the commit message in v2.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd%40oss.qualcomm.com

--5opCz2OYcNfKa8l0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauCBeAAKCRA6cBh0uS2t
rPBBAPiEAH8oMDUQ8SayzxLOzJ7edL15RXc9f5uijlSyy1ptAP4pI+XvzoOSj4uZ
rSo3qSD8cfOQWK8YtpZHTEBCIcvjAw==
=nrVc
-----END PGP SIGNATURE-----

--5opCz2OYcNfKa8l0--

