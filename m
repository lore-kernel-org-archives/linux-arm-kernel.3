Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F004560A3813
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CT49MC4x;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d2IPC+K+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1wZI67Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oBwEXRRzD4Ff3hTa/71jc1yF6BC+HAxpTNSMjbQEtk=; b=CT49MC4xsS7/BFP7xn8MM0hnOW
	ymlDhARkPw2ksi93D7dv+1h+i3bfcdOLLyiNh++0wqo/UiDwonJGuvxw8zGcHjpToe9DlPIPS3ezL
	+0lvst2kOdr7qF9QVeqoO/e+kGGAObJZid3Za/o0QLI2wmPsBI4cs3pHXQkGiryZW80jwXqhJgNwL
	R/FY8DCiJSkjyhycWFKKjgqm7nmXTdjaEQOEYo3Tt+QoQbIHKGSeH35dpclHyfsBqn9xfpp0Nmlsk
	TqMxK5m6Q3rwLlGypklHiOi0V9rXltTU+etj/g7QsUe7QlLm4NVMSXuhsu6kQMKgE2gIa/0eKrBTw
	p/hZ8n6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9uX-00000009nU3-2Y66;
	Tue, 20 Oct 2026 13:29:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9uT-00000009nTG-0rhH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:29:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9tUh270464
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9oBwEXRRzD4Ff3hTa/71jc1y
	F6BC+HAxpTNSMjbQEtk=; b=d2IPC+K+sazAukoGXPBqWD+uW/TP9wWPpUZsmlZA
	ieTU/Y5V6eigtfsHEUZvZIPRcQcgN6VTs+d9DebC/bx2XQ5r3SNOkOlP6+8VNAn3
	SzMwAfdWqqImZ/8ikEB6BxzpOu5JUpg6t6Fmja4TeRAXzU+IXrB3l9C9NXriBXwm
	ezRRGXOyKrD4s0rGoyHi7R0qkSzGAivd79GPZSo+mmul42rjwpMdxnuYeZ4qpy1T
	sXvrWKoJuYSjwIsk5c6/ckYv2ye4Is6TsZ8yUFIlV1u7B678JcrpiMw7JQ8nNvyD
	6qRt0wmHLXYbSo3wRmmHg8mK+g6aq6mMDZIZm7OXb7HKJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv8c35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:29:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so9076285a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502983; x=1793107783; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9oBwEXRRzD4Ff3hTa/71jc1yF6BC+HAxpTNSMjbQEtk=;
        b=Y1wZI67Z5q/av4QEEasjakhCE40vR5eXW/gNMUYsWfrxaFlOXFDVBJTaQ9IEYCL/R3
         JGvfa7hrlaxfR1xaIufx3GWJksMTphGtSmLKlNdQtcf6RwPOK1KSn605512cG2ayRSVP
         YQkfoUvgkGlfOKzOTnUFu0Bt51rsjUr5zIfRIozhnpqHRxrQzaVMa1OpKAHa/cX05Ke9
         wSLApafq78F2L5+wDTeRwd+jD4x/Hr+9cKueJsS3Qky97JpkMOaRSVEzZRzWOppYzqM2
         WCJiqBFYZvTdbGqsJ07GSMzPs5weD31xdLRSI1zJ/xEhP/jBFgKUKHs3dxNfGgwTceAr
         gP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502983; x=1793107783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oBwEXRRzD4Ff3hTa/71jc1yF6BC+HAxpTNSMjbQEtk=;
        b=OBm0zuTgwE9lkg4VHdBWl66lFIZzcwLapej0GZWI1T4Pa6PTXVak2xnB2A8o34Mbo4
         C+5rCslDcgooLXCMVrCLQrs1qae/LZPKsw0tgaTQGz3Jsh92aHGa9+/eJ8Ew6hx24xsQ
         cdoje06z59gzMeNGEsv1+T/nbd61PR7KHYY7DjjUKPS+ylMX87zzQlVzKlOqKqVseAAj
         FgSO3m1emD9nQjibZsHuGzt+jNEejWGhDi1U71MLzm5kt/W2c1NjLpMiw8nT8tUrfNb8
         u+1mZzMzumzStzvltuB2dYE6U2ago9nzkSmt4fExBSXn4OECak6x+zVZG6gL7Ji9cCxz
         RtuQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+QfLOB2OWqO3pMeMb8kk1J1gOh0R4FvTa9G2lVTj2c7XjMPIf3Po/I0L1icnSBq3ZWvC2SoIVKHmXiCI51ocT@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2Cuds+PXLas40e+5awkunPE3ViTaTPH7L6zD07kRocJvN96jq
	SYJ6kw3FV0BnUNx/wgdhcWv9zHSJ3YUPbdiZpzzS+HxlYIwTsX6VujbhpH29+qmMSL2sFq01m04
	JQ8MkcD+NJ9iYZ80OCVNR+pEIC606BgJvKaX1OO+cFQAVZYI3iqJDbaOKgh9YyjxliZrb8+njKG
	kc+w==
X-Gm-Gg: AYBFou2NFE6xkobE199eT2hYvSLxM+CfIxvkdYBfEzjW40BvQGH27XQukFxDqc/2D7Q
	nM/dzUwd5OTxMgikEeWLI4LxidXcKolCb2BqAZqlATRhyl/KlTPV0MORqgxv7dDzmCg2cxOjIN8
	QS8Z2PrX0z1N1tMuF5NFwIhQo+5VuZHniS5as9j0EvfchyVq/WqG1P4j8htBM+iNvQW9xWwk4zC
	KznBWo1pNUqvY8BFrmSv5CcQqZKO7YIObguhuiPLJrZkbe9FtNTJtC0i1ZkX5tKZ98ptFTc45ee
	6kWBu4dDF0VbGsSoNtmB2OJ2VLc106+97msj3yWW2YdS3rmZQXViEgReGddjixtPcPkGvaPRzH+
	s0gpNNyAEfzI/wg==
X-Received: by 2002:a05:620a:1a20:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f29cc7983mr1918670785a.26.1792502982562;
        Tue, 20 Oct 2026 06:29:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f29cc7983mr1918663585a.26.1792502981752;
        Tue, 20 Oct 2026 06:29:41 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm6024062f8f.31.2026.10.20.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:29:40 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:29:40 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v8 4/5] net: stmmac: fix VLAN tag stripping on
 non-linear RX frames
Message-ID: <atdsxFPHU00Oc0Zk@lore-desk>
References: <20261018-stmmac-rx-mb-v8-4-5f58c0b25849@oss.qualcomm.com>
 <179243151841.3135.10232947668205235199@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="INi3XEPXl+Bdj046"
Content-Disposition: inline
In-Reply-To: <179243151841.3135.10232947668205235199@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX3zXYfZJX5SDr
 pfel2+UMLMWXd+X7TjYJSaiv7qek69YNzPfGDxnvxGP4+pw9VPKv+09Gu7dFi5Rs6wCvfhNZ4NE
 GL7RN3U1nbUJZNP1fVcU28AFtzUnO9vkrrfa40fh+DL+k9yJQIGoMK3DTnskJnrhI372KwpEqb6
 GYq3RNDhqU1+WibbV5dDTu19MsY4cOg295kBW/0OCnnapsB4MeffLZMis9+95gOoKqK5xip6ady
 3/e0ZilaQZy5YkMVI2V/T/zIomUcppZni+o9RcKyDrXwZ6fR/Fuwg7d6QNOOB7+RPxT1e+k1Equ
 NW6NMtmGU2m4UcKKtLWyxn2bM5SIN8qGSDRoENScKZeD63Rukk8Tqb6fY8N1nRokN75KM2YwRXE
 TwuT6naiJG9DjoIc/gOTnH29y4LR3b5UwypB5ye5NLqAhzUFRcAjUwalQ/18jz3GObhJzcF5GTu
 f19jMLhdeDRzwVwxOEA==
X-Proofpoint-ORIG-GUID: -G4jAUGeNL3hS34KQV2N9yb_j0sjqGNo
X-Proofpoint-GUID: -G4jAUGeNL3hS34KQV2N9yb_j0sjqGNo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfXzs5wozNYFEQM
 UN7eSBoit7lcFoo8RbK/KgFoO5uVgvZ/xgLRmnWFaEOrxYUwBcuozxeU/0bsuj7Yz71nFhljRTy
 qv7Nq0JqF4eRrTFJ1EWIrrl1J+Azudo=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad76cc8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=a3DH8UJokq-MAUnuC1gA:9 a=QEXdDO2ut3YA:10
 a=tRD2RFjWxTLXFJH57dcA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_062945_261259_4A130760 
X-CRM114-Status: GOOD (  49.92  )
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

--INi3XEPXl+Bdj046
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 (1) =C2=B7 Low: 1
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The commit message and Fixes: tag describe a crash that cannot
>   happen in any tree this patch would be backported to.
> - [Medium] The commit message says that moving meta_len bytes together
>   with the MAC addresses in stmmac_rx_vlan() keeps data_meta pointing at=
=E2=80=A6
> - [Low] stmmac_rx_vlan() now calls pskb_may_pull(skb, VLAN_ETH_HLEN)
>   before checking h_vlan_proto or dev->features.
>=20
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but
>   priv->xstats.rx_dropped is a plain 'unsigned long' (common.h:241)=E2=80=
=A6
>=20
> --
>=20
> net: stmmac: fix VLAN tag stripping on non-linear RX frames
>=20
> This patch makes stmmac_rx_vlan() call pskb_may_pull(skb, VLAN_ETH_HLEN)
> before it reads the VLAN header. When the tag is popped, any XDP metadata
> is now moved along with the MAC addresses. If the pull fails, both RX
> callers drop the frame.
>=20
> > stmmac_rx_vlan() reads the VLAN header straight from skb->data and
> > removes it with skb_pull(), assuming the header is always in the linear
> > part of the skb. That is not true once non-linear skbs can reach it: a
> > program loaded with BPF_F_XDP_HAS_FRAGS can pass up a fragmented frame
> > whose linear head has been shortened to as little as ETH_HLEN by
> > bpf_xdp_adjust_head(), and the unguarded skb_pull() then drives skb->len
> > below skb->data_len, tripping BUG() in __skb_pull().
>=20
> [Severity: Medium]
> Can this scenario happen in a tree that matches the Fixes: tag?
>=20
> On the AF_XDP zero-copy path from bba2556efad6, stmmac_construct_skb_zc()
> always builds a linear skb:
>=20
> 	skb =3D napi_alloc_skb(&ch->rxtx_napi,
> 			     xdp->data_end - xdp->data_hard_start);
> 	...
> 	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
>=20
> On the regular stmmac_rx() path with XDP enabled, multi-descriptor frames
> and buf2 frames are both dropped:
>=20
> 		/* We do not support SG in XDP mode */
> 		if (unlikely(!error && (status & rx_not_ls) &&
> 			     stmmac_xdp_is_enabled(priv))) {
> 		...
> 		if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
> 			rx_dropped++;
> 			goto next;
> 		}
>=20
> The XDP_PASS skb there is built with napi_build_skb() plus
> skb_put(buf1_len) and has no frags. XDP_PASS skbs with frags seem to
> appear only with the later "net: stmmac: rework stmmac_rx to support XDP
> rx multi-buff" patch in this series.
>=20
> Even with a 14 byte linear head, skb_pull(skb, VLAN_HLEN) here would leave
> 10 bytes of headlen and would not BUG. Wouldn't the BUG() come from
> eth_type_trans()->eth_skb_pull_mac()->skb_pull_inline(skb, ETH_HLEN)
> instead?
>=20
> On current trees, the patch fixes a different case. An XDP program can
> use bpf_xdp_adjust_tail() to shrink a linear frame to 14..17 bytes while
> bytes 12-13 still hold a VLAN ethertype. The old code then reads
> h_vlan_TCI past skb->len and pops the tag. That leaves skb->len below
> ETH_HLEN, and eth_type_trans() passes a malformed skb up the stack.
>=20
> Could the commit message describe that case, and could the Fixes: tag be
> rechecked? As written, stable maintainers may conclude that 5.13+ kernels
> hit a BUG() they do not have.

I will fix it in the next iteration.

>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index e929cc0f23125..04dc6dcaa435d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5095,22 +5095,30 @@ static netdev_features_t stmmac_features_check(=
struct sk_buff *skb,
> >  	return vlan_features_check(skb, features);
> >  }
> > =20
> > -static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
> > +static int stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
> >  {
> > -	struct vlan_ethhdr *veth =3D skb_vlan_eth_hdr(skb);
> > -	__be16 vlan_proto =3D veth->h_vlan_proto;
> > -	u16 vlanid;
> > +	struct vlan_ethhdr *veth;
> > =20
> > -	if ((vlan_proto =3D=3D htons(ETH_P_8021Q) &&
> > +	if (!pskb_may_pull(skb, VLAN_ETH_HLEN))
> > +		return -EINVAL;
>=20
> [Severity: Low]
> Does this drop every 14..17 byte frame, including untagged ones?

I will fix it in the next iteration.

>=20
> The pull happens before h_vlan_proto and dev->features are checked. Any
> skb with skb->len < VLAN_ETH_HLEN now fails here, and both stmmac_rx()
> and stmmac_dispatch_skb_zc() free it and count it in rx_dropped.
>=20
> This also covers interfaces set with "ethtool -K rxvlan off". There,
> stmmac_set_features() clears hw_vlan_en, so stmmac_rx_vlan() runs for
> every frame. It also covers non-xmac cores, where hw_vlan_en is never
> set.
>=20
> Such frames can come from an XDP program that shrinks a frame with
> bpf_xdp_adjust_tail(), which allows lengths down to ETH_HLEN, and then
> returns XDP_PASS. Before this patch they went through eth_type_trans()
> unchanged.
>=20
> Would it work to check the ethertype and features first? ETH_HLEN is
> enough to read h_vlan_proto, and VLAN_ETH_HLEN would only be needed
> when the tag is about to be popped.
>=20
> > +
> > +	veth =3D skb_vlan_eth_hdr(skb);
> > +	if ((veth->h_vlan_proto =3D=3D htons(ETH_P_8021Q) &&
> >  	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
> > -	    (vlan_proto =3D=3D htons(ETH_P_8021AD) &&
> > +	    (veth->h_vlan_proto =3D=3D htons(ETH_P_8021AD) &&
> >  	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
> > +		__be16 vlan_proto =3D veth->h_vlan_proto;
> > +		u16 vlanid =3D ntohs(veth->h_vlan_TCI);
> > +		u8 meta_len =3D skb_metadata_len(skb);
> > +
> >  		/* pop the vlan tag */
> > -		vlanid =3D ntohs(veth->h_vlan_TCI);
> > -		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
> > +		memmove(skb->data - meta_len + VLAN_HLEN,
> > +			skb->data - meta_len, meta_len + ETH_ALEN * 2);
>=20
> [Severity: Medium]
> On the AF_XDP zero-copy path, do the meta_len bytes before skb->data
> actually hold the XDP metadata?

I guess this issue is not introduced by this series. I will fix it with a
dedicated patch.

>=20
> stmmac_construct_skb_zc() records the metadata length but never copies
> the metadata bytes:
>=20
> 	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> 	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
> 	if (metasize)
> 		skb_metadata_set(skb, metasize);
>=20
> The skb comes from napi_alloc_skb(), which does not zero the headroom,
> so the bytes in front of skb->data are stale. This memmove() moves those
> stale bytes in front of the relocated MAC header.
>=20
> After eth_type_trans(), bpf_compute_data_pointers() sets data_meta to
> skb->data - skb_metadata_len(skb). TC BPF programs would then read
> uninitialized headroom instead of what the XDP program wrote.
>=20
> On the regular stmmac_rx() path, skb_metadata_set() is never called at
> this commit. meta_len is therefore always 0 there, and this part of the
> change does nothing until the later rework patch adds the call in
> stmmac_build_skb(). stmmac_construct_skb_zc() is still unchanged at the
> end of the series.
>=20
> Peer drivers such as igc_construct_skb_zc() copy starting at
> xdp->data_meta and then call __skb_pull(skb, metasize). Should
> stmmac_construct_skb_zc() do the same, or should the metadata claim come
> out of the commit message?
>=20
> >  		skb_pull(skb, VLAN_HLEN);
> >  		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
> >  	}
>=20
> [ ... ]
>=20
> > @@ -5530,12 +5538,15 @@ static void stmmac_dispatch_skb_zc(struct stmma=
c_priv *priv, u32 queue,
> >  	}
> > =20
> >  	stmmac_get_rx_hwtstamp(priv, p, np, skb);
> > -	if (priv->hw->hw_vlan_en)
> > +	if (priv->hw->hw_vlan_en) {
> >  		/* MAC level stripping. */
> >  		stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
> > -	else
> > -		/* Driver level stripping. */
> > -		stmmac_rx_vlan(priv->dev, skb);
> > +	} else if (stmmac_rx_vlan(priv->dev, skb)) {
> > +		dev_kfree_skb_any(skb);
> > +		priv->xstats.rx_dropped++;
>=20
> [Severity: Medium]
> This isn't a bug introduced by this patch, but priv->xstats.rx_dropped is
> a plain unsigned long shared by all RX queues. Per-queue NAPI contexts,
> which can run at the same time on different CPUs, update it with
> unsynchronized read-modify-write:

Since this issue has not been introduced by this patch I guess we can fix it
with a dedicated patch.

Regards,
Lorenzo

>=20
> stmmac_dispatch_skb_zc():
> 	priv->xstats.rx_dropped++;
>=20
> stmmac_rx_zc() and stmmac_rx():
> 	priv->xstats.rx_dropped +=3D rx_dropped;
>=20
> stmmac_get_stats64() also reads it without READ_ONCE().
>=20
> Can concurrent updates from two queues lose increments here? The new
> error path adds one more writer that follows the existing pattern.
>=20
> > +		return;
> > +	}
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261018-stmmac-rx-mb-v8-0-5f58c0b25849%40oss.qualcomm.com

--INi3XEPXl+Bdj046
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatdsxAAKCRA6cBh0uS2t
rKQoAP4/pJPKdXpLyqrHEoZ9hjCpzl7Ao3ihZm/BO2XQn+kadQEAiiu1toFS/K4W
U6LBTRJeuv31t0+QLs3auhpkTAQ+/AQ=
=b1Cd
-----END PGP SIGNATURE-----

--INi3XEPXl+Bdj046--

