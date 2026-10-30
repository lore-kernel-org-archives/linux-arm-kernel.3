Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5AC606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oPCluOvt;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvVna+u5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VgmaTiTz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d2olyE8nkwfIZoPiTmTgfbY9lInYL1sWn+D/JJOh5/4=; b=oPCluOvtlvluMOmNVirD7rS1zr
	t17zJf01TBBi8fBQWGbTzUkDpdziwZtjZP4WJwf4CXRw27FH+9uK0A4nzdEPEAFPeZZimBl14orOW
	FGrJc4bFAy6bHnfc1Q+Q6LJW4C7F/IQFqiminhHzN33bnW3mMtbIHaTZb2yN8V9yDa2BAzjF6gs86
	aTLPcpVtJrfxrJb+O8gVXubSNoqe3rA1bVEEu1SIZ8Rtvg350dcB7+KDh5Dykls+68xFiB6aYoX4H
	aPJqAhwF/nzzZMVnn/457Oit3Z+k8YNZwO9wo3ZsxY/J/UmmJ/jxIcOfuUdXY9cT+Xe6GaUUiqVBf
	ii8emGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiIE-0000000B9sv-1Wb1;
	Fri, 30 Oct 2026 08:48:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiIB-0000000B9ry-01gN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:48:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F3PQ1761962
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d2olyE8nkwfIZoPiTmTgfbY9
	lInYL1sWn+D/JJOh5/4=; b=YvVna+u5ZUvrfMKUUOJEHq3TIudxwxpc2vWcdbS9
	GOVXFvI2WINW2F5/40Yu/QSaPn86s/5MXDI+BrNR+ESUT+AebPhpLJSTePNiPQjE
	+4F8S/WfzATpeRcnOwRNWBTZjGWD9i3Gw7+5Q/teSjPQwwerRtXgUKg2Y5CFHpD3
	+kP8jsxprtoFugP+PzLHsiiJUVi6dOeCBV6Bv2DJNipFxZYHYBGpZyjdi9ZAmK1d
	7S5NyjcwHhgka9878N1BFEm/SEpxsYLTVsZx3DlaDCHjC4qUkDbDyE+Qa8jm5TmT
	bXLQxw5Cgx/uYSjapZx7sc0w0os4zbiIYDVhG3gpFpZJkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pa1e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:48:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so70635385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793350133; x=1793954933; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2olyE8nkwfIZoPiTmTgfbY9lInYL1sWn+D/JJOh5/4=;
        b=VgmaTiTzwQ66USbgDyPTQyMQgN5PBB414qmcxMKCPTsMM2YirXARizSKntOfD4r0Vi
         UJYewiC9IjjUUCmg2ta6JUECJ1i0xqbykJAW49C45CBF4hxsuVMXaPtCtWTI0E9yoN7i
         nDXtyKbjSbJn0x06C2PKL1wFM03oBz8srQjAHIIM4kdJZBbiGb3L6KjYoawndanfF5uJ
         0zbL83z1R157RgnZ+sBacFjI8/+mq/nUvMIaTUMniTm55Is/nsoTIp+KTIQMlRVf0n1S
         rIbIRr62NZrmkP+DESwWuG90Ef7LZ4o/9UHXfSkQR6mpcN0jTKeQ1RGzJlGqALUbqH2s
         Un1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350133; x=1793954933;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2olyE8nkwfIZoPiTmTgfbY9lInYL1sWn+D/JJOh5/4=;
        b=Ofs78nzwoZKkw8eXi5tj20upwlcsUeIFNJPY9rjs+m3nOWbgYa+uUTTUBsmN/KJ59w
         I273t7wpPHR2ta4F1KR46QQ9GSeTuiRHyPOj1EP4Mial5EnUpJSV6fEdPgATVtMagIsH
         c2GiJ3BrE6VMzcoj0ZMmm9CaRH+dqE954KQbR2t9jYmi3fRuLRxilVO30ceM92BMa33/
         nYE+JxWB3yhH5HaFK6g6Wf+zDQ0Kig3WKd3TOCEz4ulpkOLsSEdamKR66seKmAPSidqp
         2LDC5KWyQAXb9GAkchrq47NwSpn2EAMTjOriOlJtPh1SezgREPqcIBAtsHwmCyzhYWjx
         veYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8bj1OPzSXk4fLF74tRvLeKpZuZCmZYnNYr6XCo68Kt3dWnBPVwsr2oo2RyPeDMzO40MfWaHHilydm84VZ9xVq@lists.infradead.org
X-Gm-Message-State: AFq9FYIF+CO0gUKkOOyfvnUXuGcG3DwlQP2Z0RnnlwY1aa2mU6aVHzUz
	7dePak3HW899ye/6uWqUYVGseMWenCMRb4jPAWueGaYHudAVxwPXhKLmLOyIOk4RNntB7evrnEB
	CqO2k4fvIv4gRxxOSxEVqhJkAAXsuEpM7lm0+Msk/6dvW0XArUxg1ELDY5UNQFpm+eQucz8dNfo
	anMg==
X-Gm-Gg: AYBFou2RcATQCOYbVFqePpt6wwxcIlwbxGPJxXYVRcuhdQEOh9vmTb7KWPWGOnPGn6u
	HWMugLN2JACW2NmI7GX5BdxZWyFwd1Ng+DUMGurfllI0Goa7unuXTxLUHnxQbZSuBRpFAUHcQNI
	6TnFqBQkE01L6ON6zX15ITJjdsJk2TYMmc/sS1IgmPlTHI7Edb0S2m/gl7Lk/QImvLBpYIfZY3I
	LNup4d87r/v4wtVeEdtdSXkN7AVFv3LYZBjdiBirIIspbukrMeMl6RqLTg3AW3ad4S5/tdf0HT4
	rGpPUZGL8I9D5qJAAtIGuZGvz3Nd02xyrGxu+VMo0vEi63DbryEnrmuF38IbF68ZdA/7GWn2Xcp
	+K3P8uZciHjdd5NCDM5ZHpJvzr2GFcp0uloezosN5VyQyDz+jLyL96dT4JX//P3251PXuTmGxYP
	0NQoK4pP21X6yGHtkxoPCYTg==
X-Received: by 2002:a05:620a:1712:b0:93e:fa30:f1dc with SMTP id af79cd13be357-944217ebd9fmr275562785a.72.1793350133109;
        Fri, 30 Oct 2026 01:48:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1712:b0:93e:fa30:f1dc with SMTP id af79cd13be357-944217ebd9fmr275558885a.72.1793350132551;
        Fri, 30 Oct 2026 01:48:52 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm47152495e9.10.2026.10.30.01.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:48:51 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:48:51 +0100
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
Subject: Re: [PATCH net v2 4/6] net: stmmac: copy XDP metadata in AF_XDP
 zero-copy RX
Message-ID: <auRZ8qGf-6smpZNo@lore-desk>
References: <20261027-stmmac-xdp-fixes-v2-4-10eae8a093a8@oss.qualcomm.com>
 <179334662537.3134.7910783540285829149@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uOk9qAS7xtVWcgde"
Content-Disposition: inline
In-Reply-To: <179334662537.3134.7910783540285829149@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXzpi10gHCEW2Z
 1+R14W3xsG/vGBUnP/B94Q9i3eeMVoogx/PkbvaGPU+/trTjwa3O+RWymFfHq5Di/cs3MiaBM6T
 3l7JtSSRSH5AxeqmRvqnfcacLKjag86DxoeL7zC2lzX97EtpTZzmgq5WInbsxDumBGv/C3qV0Mn
 bz9lQ6MvX8CyIfaZwnTFG6TobdO6onwhaZIlv7VpnWZ5jE2zdOtGfE8UjJ8YHshfQE1X/p2UQrl
 0jlHz+2wa3NC25jBQigBt45kluImVGUd+6mUIIyJQA+cM4mYSIwnHeR60s2qt/rXKm15Y4XCGg9
 anQcEuWf708nT0ef5Z2VEh13+E+63+l0jsjaxyc058a/hvx6QRURHyoRzHwx3G9hFxzQaAI8odm
 Zs5rgZZ/XFm7muGHtCELxlzWSVEuq3mWnaNOvOu4mAj5Yzy8iAKqlXeysmk3vXGLbW8fpP1sYHL
 aCskZXpSsB5inBsKUXA==
X-Proofpoint-GUID: azKrwAFIZTWNI_dbha0on5msC8jk6cVL
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae459f6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=MXY1n-zC4wgOH_4sE1YA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=7PUuv8MLwXOgIG9yGv4A:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: azKrwAFIZTWNI_dbha0on5msC8jk6cVL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX4DckSpNNsm+9
 H7BWaWkBjrk0O08Ln2cQLNamHcPmky0GraF0qisCOP33VwFVVUx4v4n+4CdxuCCZRwN28YJ44my
 IYFYiVIwvzTBg+wPtj5y9q+Rvag6fBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_014855_054480_1C713A06 
X-CRM114-Status: GOOD (  35.91  )
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

--uOk9qAS7xtVWcgde
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 30, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] In this patch, stmmac_construct_skb_zc()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5521-5525) copies=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: copy XDP metadata in AF_XDP zero-copy RX
>=20
> This patch changes stmmac_construct_skb_zc() to copy the XDP metadata in
> [xdp->data_meta, xdp->data) into the new skb together with the packet
> data. The metadata sits right before skb->data, and its length is recorded
> with skb_metadata_set().
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 71858af6fd66d..d9fc2464a160a 100644
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
> Does the metadata stay valid for VLAN tagged frames that are stripped in
> software?
>=20
> The commit message says:
>=20
>   This keeps data_meta valid for the stack and TC BPF after eth_type_tran=
s()
>   anchors mac_header.
>=20
> When priv->hw->hw_vlan_en is false, stmmac_dispatch_skb_zc() calls
> stmmac_rx_vlan() after the skb is built and before eth_type_trans() runs:
>=20
> stmmac_dispatch_skb_zc() {
>     skb =3D stmmac_construct_skb_zc(ch, xdp);
>     ...
>     else
>         /* Driver level stripping. */
>         stmmac_rx_vlan(priv->dev, skb);
>     skb->protocol =3D eth_type_trans(skb, priv->dev);
>     ...
> }
>=20
> For an 802.1Q frame with NETIF_F_HW_VLAN_CTAG_RX set (or 802.1AD with
> NETIF_F_HW_VLAN_STAG_RX), stmmac_rx_vlan() moves only the MAC addresses
> and then pulls the tag:
>=20
> stmmac_rx_vlan() {
>     ...
>     memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
>     skb_pull(skb, VLAN_HLEN);
>     ...
> }
>=20
> The metadata stays at [D - metasize, D), where D is the original frame
> start. eth_type_trans() then sets mac_header to D + VLAN_HLEN. Since
> skb_metadata_end() is skb_mac_header(), TC BPF and the stack would see
> the window [D + 4 - metasize, D + 4).
>=20
> Wouldn't that window lose the first 4 bytes of metadata and end with 4
> stale destination MAC bytes?
>=20
> This can happen with AF_XDP zero-copy, an XDP program that calls
> bpf_xdp_adjust_meta() and returns XDP_PASS, and a VLAN tagged frame on a
> core where hw_vlan_en is false. stmmac_dvr_probe() sets
> NETIF_F_HW_VLAN_CTAG_RX for all cores but only sets hw_vlan_en for xmac
> cores, so dwmac100/dwmac1000 use software stripping by default.
>=20
> Before this patch the metadata was not copied at all, so this does not
> make things worse than they were. A later patch in the same series, "net:
> stmmac: fix VLAN tag stripping on short and non-linear RX frames", changes
> stmmac_rx_vlan() to move meta_len + ETH_ALEN * 2 bytes starting at
> skb->data - meta_len before skb_pull(), which fixes this case.
>=20
> Could the commit message mention that the VLAN stripping path is fixed
> separately, or could the two patches be reordered?

I guess the reported issue is fixed in the following patch: "net: stmmac: f=
ix
VLAN tag stripping on short and non-linear RX frames".

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8%40oss.qualcomm.com

--uOk9qAS7xtVWcgde
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauRZ8wAKCRA6cBh0uS2t
rEMSAP0ckjQt67ODqSh/d4rEEdTXd68ufBiuZPEyUP2VIVyEVgD8D/oK/777QoIE
JtSmhynYGNYRxd5J04Emj7z0LderAAg=
=zAho
-----END PGP SIGNATURE-----

--uOk9qAS7xtVWcgde--

