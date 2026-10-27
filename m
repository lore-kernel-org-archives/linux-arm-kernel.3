Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB146606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W4kohrE4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ePxgzWzH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JLqZ+p97
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1VJL2AW5tEYY+m1I9bXvobzMC6WHbBSBecMUivpnRRA=; b=W4kohrE4lJbrNRGP4n3IM82UAK
	+ePWYbEd+BcoLoRrh1RO8qksUWXqSmppV5ru/wJxuOZP1rhlU+KnYXRIbbDnjwD0v3si/WWPVnoQf
	bdmseiJ1Y13BMF3HUM6slB0I6S6OQioppKfTfkmnjGn2Y/BW9/Ka0PqPcQRlfstgFnfLFGr9vUMll
	Ww3ssJEo8NIg7Mpx5XbXLDd7sRRmhh4CVRt/lIe3hvWXSx4NLvGEBJbGctqrJ07G8EsIR55wV69R1
	Qz8FT0l2zKNwZtHVtBxDN8JJZZcUmNOBwxJLO2C5J5/8Ndk7UPvMrKY3qyt5HdkJAPB7JWd60idYW
	OYFmJ1yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdwV-00000004ElD-2T7u;
	Tue, 27 Oct 2026 09:58:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdwT-00000004Eke-1zOi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:58:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fvnW796273
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1VJL2AW5tEYY+m1I9bXvobzM
	C6WHbBSBecMUivpnRRA=; b=ePxgzWzHzVG/nr5f+N0120PhARbZZVo63Gbfw4YA
	C6CRZZV7ql7Dc7I2rlH07USA8wIAwGL2EIVDiuCjrNLocNMtxe/4sHv1mZc4oOwu
	f9QRLnUp0F1dmeGMvOnXhQjnM29QO9YEHZgmBdUn3PXo7NjoHgse4Nl713r4zFA1
	eCFsURzP566XTnJ/S5l5pg28Xchs1onSpgR4BLmE3SJCMnX2H4wryyPRXvHkcrOd
	uaD1zvC/VEpbcRX5Lvvf8K8o8EXnJ78kQnTFMGcIg0H9OgzEVfbxY0H5vRa/ZYNE
	ujyEHNjWtNTDK2ebrvrGN6nrxVAAwPI6Cm6TuF8Xld3SmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t8x7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:58:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so1087417185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793095084; x=1793699884; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1VJL2AW5tEYY+m1I9bXvobzMC6WHbBSBecMUivpnRRA=;
        b=JLqZ+p97RT3zPA5cdOBHkPruTdXu0Pegt4cH+HYUGP8Kh4u8F9BXxukJWkcgneP4aY
         YnGN0vBSCDyHsirysHYYlOiHm6UxeiYO9RmQsPZd64Wtnb/bmz24fGWWbtM0Op7sLwyE
         Qzg8XGnS0+LxXzblHktM1KLLm7iFPbWNMxsP+66GZIheKFpbRgySMn1yzXDIl9Ke59df
         Ji0D6RUvxZuws0en4+7a1vy3ht6Ddb24CfZpN3YgxJjK13smbdM2oBgmN7E0rIpimz+L
         JR2MYOlKdMJ3GhvTtnx52fJ9hvicwodYSEvJHaodU+QPRVWFhqoA/C28idvCwEdPwad6
         KD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095084; x=1793699884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1VJL2AW5tEYY+m1I9bXvobzMC6WHbBSBecMUivpnRRA=;
        b=GBpw9dCp2W8LHS1rRjmihh/MKJMTS9NDewVUat/F8O4JaC4haB0u+rDePpwl8vPxEw
         YpH98tYOiQTPPS/QSGi/ujE0qNZo1UH76vB/PcKSMWeWfJL6SuD9xeqyPto0QUGc2zDb
         2bJkD9JcKvaWmpv5euXppfuVnE/L9nCT827H6hoPmfIE1i8ZxdqowUq3xxS2ZUQ+eXMB
         bZaP7IH1smBI2291ppqzR284bkrnPeoxNk5EhBeXHHqjwrKqKbhegCcYo82g0r1adSFl
         7Y4QhSO+ptzOlZAEr8t4sDLS1Kdz5X5TcRc9SpeAotjtw3CliPLwgg0seqZHAsnrVbkl
         +PeQ==
X-Forwarded-Encrypted: i=1; AKwUvByHBZ1cCTudz0SCEyMoTdh8MlUIRXtfOcMNKDuftF16YgKrv+zZ7o8io3VV/47VEuxyjblV35fl/5wYYNpulku0@lists.infradead.org
X-Gm-Message-State: AFq9FYJ7DswZnIgSmGtmqRbM4oSLsQEHN2Y65xCYi0TLpgJY73EH4Ypn
	1XjX2RPSnklHicHpnU3BWAGKKh1P9KpKIF8blM5dy8PaCKLqkD3Cn9adBMtaj9DYgsa1mNykSpQ
	rINHch3wfHHwXQKMZ9mWg17Jvs+kU8WD9Mp967N3xD0DKwdNUqj+ShNnBdn54HQiaihqm6e+Xjn
	UHkA==
X-Gm-Gg: AYBFou1FKRhUgWY7oZjSInRLhH6TZNWAbSxXF3evSN1FM+VGoqx4nW1aSRvsHTgP1/Z
	8MIHCjknMwHSBXJtyK9cEcZz/OHcqS1EM9bTSpjPQMdPSGZKtSafE0GbJwyuWzNdmm9fMevDLyi
	LKSO820F5FiGC3RSs8jqj5C/gZsaPyDWRCRRMViLnnFoxa2iwx41iuDUIwfZbrRamnQsK4QYPr3
	Bz4IfrbEm7oxj5QyXScvF3pOwcMXnj+X+f9itoH83LRa7xfpYjZnx+DIPh4CT2IKzF7ljY+h8T+
	wlek55R83g6dqEec0CdTl5qgfttwny9APjhlD0NIChqXoj8Du9bay32KWT5XJHbmYxPkBLeqYdZ
	1szhb54HRwGXzGSFIi7UWSliJD3dQ+faOwHpkngrWHvGRLEla
X-Received: by 2002:a05:620a:178d:b0:93e:9171:b83 with SMTP id af79cd13be357-940ef8f06b1mr1489271985a.43.1793095083293;
        Tue, 27 Oct 2026 02:58:03 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:93e:9171:b83 with SMTP id af79cd13be357-940ef8f06b1mr1489267385a.43.1793095082599;
        Tue, 27 Oct 2026 02:58:02 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm441911695e9.0.2026.10.27.02.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:58:01 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:58:00 +0100
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
Subject: Re: [PATCH net 1/6] net: stmmac: take ownership of saved RX state at
 poll entry
Message-ID: <auB1qL6FE7-vTMOB@lore-desk>
References: <20261023-stmmac-xdp-fixes-v1-1-efb37e19f5bd@oss.qualcomm.com>
 <179309225078.3134.4254254722485703329@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4GXi3iNJ7oQknk1+"
Content-Disposition: inline
In-Reply-To: <179309225078.3134.4254254722485703329@kernel.org>
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae075ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=rhP4PL_XV0zjteUE_lwA:9 a=QEXdDO2ut3YA:10
 a=NadisKNWRbbon45ccpAA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-GUID: IU9KIWGu2eHagx_bkQbI7dhrgzaQEiio
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX/6JzUGTvv9hy
 BfX1bHPNkKKS0T0Bhlr33ABa0DCUL9Gs3Vxc+EwZmZKABUbskOFZ5tNE0CPFuTGJKvTtmt8eXSj
 Grq4LItaovzsO1410BfWSDpL9I/OHvo=
X-Proofpoint-ORIG-GUID: IU9KIWGu2eHagx_bkQbI7dhrgzaQEiio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfXyumLFlnMxVID
 O/JL7Nqg7VEWWATzVBZ+Ql5UDF3TRb88h7PJbNdXBOobmTPxMTb+3TeH/TrjfRrs1apKHVK7Mlb
 RcQD2/h3gwNgt4I8p8mL0O5RAPG8xJ46MBdAscOvzU7rnVYwsC364Ceb2YNdtGMhuEpYxqhVRgY
 BXk0pCfucZtx+gZ9UlyaeRASXiPEPRoDsN8De5SlmsgAL/tVWXSQVGMutZnjRc3aWU9LTsDeQrE
 ZH+E1xEGrr7p2aLCO7Gmc6bBgJnxW8ReSTg+Y7F4oQjbiaGoexRsRYX7gZogkKytM8LEs2Qh3lW
 LyXqkUJjbSJzlhArb+FT5javWkc8Q5E2qRA09vXmcpJG4BzpErX6WLfp99vL3601THjeYW+XWLU
 mLruel4tUzPyAqUvLbYJD/R0SDSX5rqX5xy9n2CHCUifglxR5QzUiTrqaI9iEWzlvmlJjP97uZ+
 O7/OlGGIY5OISOREs/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_025805_547255_6B70DD1D 
X-CRM114-Status: GOOD (  45.69  )
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

--4GXi3iNJ7oQknk1+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [High] The commit message says that on resume a saved partial frame
>   would be resumed "with descriptors from the freshly initialized ring",=
=E2=80=A6
>=20
> Pre-existing issues:
> - [Medium] In stmmac_rx()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c), the=E2=80=A6
>=20
> --
>=20
> net: stmmac: take ownership of saved RX state at poll entry
>=20
> The saved partial-frame RX state is now taken and cleared at the start of
> stmmac_rx() and stmmac_rx_zc(). It is saved again only if the frame is
> still incomplete when the poll ends. The saved skb is also dropped in
> stmmac_reset_rx_queue() and __free_dma_rx_desc_resources().
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index b20e5038eeadd..fba21599a5e15 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -6032,10 +6042,8 @@ static int stmmac_rx(struct stmmac_priv *priv, i=
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
> [Severity: Medium]
> This isn't a bug introduced by this patch, but can a multi-descriptor
> frame reach the stack as a truncated fragment when napi_build_skb() fails
> on a descriptor that is not the last one?

This issue has not been introduced in this patch and it needs to be fixed w=
ith
a dedicated patch.

>=20
> The allocation failure path in stmmac_rx() does not set error:
>=20
> 	skb =3D napi_build_skb(page_address(buf->page),
> 			     rx_q->napi_skb_frag_size);
> 	if (!skb) {
> 		page_pool_recycle_direct(rx_q->page_pool,
> 					 buf->page);
> 		buf->page =3D NULL;
> 		rx_dropped++;
> 		count++;
> 		goto drain_data;
> 	}
>=20
> When status & rx_not_ls is set, drain_data jumps back to read_again. At
> that point skb =3D=3D NULL and error =3D=3D 0, and len still holds the by=
tes of
> the dropped prefix.
>=20
> With no XDP program attached, stmmac_xdp_run_prog() returns NULL. The next
> descriptor of the same frame then builds a new skb from a mid-frame
> buffer.
>=20
> On the last descriptor, len still includes the dropped prefix. So
> pskb_trim() does nothing, because len is not smaller than skb->len:
>=20
> 	return (len < skb->len) ? __pskb_trim(skb, len) : 0;
>=20
> Wouldn't that pass a mid-payload fragment, with its FCS still attached,
> to napi_gro_receive()? Its ip_summed would come from the status of the
> whole frame, and rx_bytes would be counted with the full-frame len.
>=20
> The same thing seems to happen across a poll boundary. In that case
> in_progress saves skb =3D=3D NULL, error =3D=3D 0 and len.
>=20
> The old status & rx_not_ls save condition behaved the same way. Later in
> the series, "net: stmmac: drop multi-buffer frames in XDP mode" sets
> error for rx_not_ls when XDP is enabled. The non-XDP path is unchanged.
>=20
> [ ... ]
>=20
> > @@ -8412,6 +8421,9 @@ static void stmmac_reset_rx_queue(struct stmmac_p=
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
> The commit message says that without this drain, a partial frame saved
> before suspend would be resumed "with descriptors from the freshly
> initialized ring". Is the ring actually freshly initialized on the
> stmmac_resume() path?
>=20
> stmmac_resume() does:
>=20
> 	stmmac_reset_queues_param(priv);
>=20
> 	stmmac_free_tx_skbufs(priv);
> 	stmmac_clear_descriptors(priv, &priv->dma_conf);
>=20
> 	ret =3D stmmac_hw_setup(ndev);
>=20
> stmmac_clear_rx_descriptors() calls stmmac_init_rx_desc() on every RX
> descriptor, and that only sets ownership bits:
>=20
> - dwmac4_rd_init_rx_desc() and dwxgmac2_init_rx_desc() OR OWN|BUF1V into
>   des3.
> - enh_desc_init_rx_desc() and ndesc_init_rx_desc() OR RDES0_OWN into
>   des0.
>=20
> Buffer addresses are never reprogrammed and empty slots are not refilled.
> stmmac_init_dma_engine() then sets the RX tail pointer to buf_alloc_num,
> which gives every descriptor back to the DMA.
>=20
> Suppose page_pool_alloc_pages() failed in stmmac_rx_refill() for the
> slots used by the saved partial frame. The loop then breaks before
> stmmac_set_desc_addr():
>=20
> 	if (!buf->page) {
> 		buf->page =3D page_pool_alloc_pages(rx_q->page_pool, gfp);
> 		if (!buf->page)
> 			break;
> 	}
>=20
> Those descriptors keep the DMA addresses of pages that state.skb now
> owns, and buf->page =3D=3D NULL.
>=20
> With this change, stmmac_reset_rx_queue() returns those pages to the
> page_pool through dev_kfree_skb_any(). The same descriptors are then
> re-armed and the DMA is restarted.
>=20
> Can the device then DMA into pages that have already been recycled or
> freed?
>=20
> There is a separate problem on dwmac4 and xgmac. A descriptor that was
> written back but not refilled before suspend still holds write-back data
> in des0/des1. For example, dwmac4_wrback_get_rx_vlan_tci() reads the VLAN
> tag from des0. Re-arming that descriptor would make the DMA treat the
> write-back data as a buffer address.
>=20
> The re-arm-without-refill behaviour predates this patch: an earlier
> upstream re-init on resume was reverted. Before this patch, the stale skb
> would also have been completed and freed on the first poll after resume,
> while those descriptors were still armed. So this change frees the pages
> earlier rather than creating the problem.
>=20
> Since the resume handling depends on the ring being freshly initialized,
> should the commit message be corrected? And should the resume path refill
> and reprogram the RX descriptors before the DMA is restarted?

I will rework the commit message in v2 but the reported issue has not been
introduced by this patch and it needs to be fixed with a dedicated patch.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd%40oss.qualcomm.com

--4GXi3iNJ7oQknk1+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauB1qAAKCRA6cBh0uS2t
rDzOAQDNEQEZb+doM2iGYJUGbk3wZTR1pCww4pSuhScfzs8jlgD/SXvg0KYcSAG/
5cZMIL8eDEQYqSVsmD7+0Dudt/kZ4QU=
=3GMY
-----END PGP SIGNATURE-----

--4GXi3iNJ7oQknk1+--

