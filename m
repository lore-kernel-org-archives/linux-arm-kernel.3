Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F1606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iKzf9BTH;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mr8GBc5N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NU06Fr1I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/CxXgblb1WraVgSV86I4VysbzdPhIpd24MIpyC6IrWA=; b=iKzf9BTHSBn8JmSiZ/hmxumYR+
	7CPcXIavSre3JgXQirZVf+JOVW4+P+R/v4n2ly7VgWdxld05LecRj583V4Uh13Jo0zXSZwTMtKat8
	SSQvhqO3ISTM6GrMIzHbkmfkoDLr9hkx6vltaUIV7lT1WNojBKH3x82BFxFrzgimPWe34sVM34pGt
	vqA6tUhQKfi4TFhqk4v+3W6z0p4J3NHOW+ElU2ntV/PfiyDmQS8RszikWLJtNGY0ajM9YLWW2I9dJ
	OaEMTT0B4pwmCQgtm5A8waebeEyNHIMZOvPBtWZQ15fr1vE5avzsmGn9/FD3UgO7AMm43NfcO6n5S
	0pHQJ8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLf56-00000004PXU-2fuD;
	Tue, 27 Oct 2026 11:11:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLf53-00000004PWc-1uVQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:11:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCnD3012028
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 11:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/CxXgblb1WraVgSV86I4Vysb
	zdPhIpd24MIpyC6IrWA=; b=Mr8GBc5Nvz13YHEJS/SNjAEMNAZe4ggH45/KfNPi
	WIiZN+rwSxJBJ2WGukpie89sCuDtGdfba8u14PJBDbfKjvOhgM0+UpZsqrtUvZOj
	iAb/URiegWg7+7GZdMaGj8oN0qdrkvPS0ap5ATWbjGt7/oB21aRCxX0MnVY98Ewz
	KVYXjh56IM5fxCxfmrj3N5oKz9qOlRM7DKOvHBnxWYkvyq2vI6pbcYTXwoKk5wGs
	YLpHgWoiinnFcuJC8/DpOAvcfc+NCDhAVYp3MkKMPi2PzrBh0Fp8vjYdgO6Fv5pq
	u1/yV3D3qxJIX/ZW+Ci23ASQ0Jlfo+pWmnHwM+tDdJdvAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3daq7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 11:11:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso954343685a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099460; x=1793704260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/CxXgblb1WraVgSV86I4VysbzdPhIpd24MIpyC6IrWA=;
        b=NU06Fr1Ia2jF26phfPe2zsQRHA6AT6lRxdc3SdG9TLYKwiMil58rQIcjojn7+3C4Yl
         BdC1LsZFy+y0axCgbzBN0FJY7Hx8fi/COSIvgr7nTj5nBjXKLIGmcuaorG4fc/b9IaEl
         PRFNamCKp/W/YfqZRlbucIM4r2locDW/IDcdkrVWMisQw6kEzXI//SgZfx/G3+SNvKHk
         YKHba8Rh1HnlYE6GD0xOIgqzz2Mzo6klh9E+cS2SQ48rA1c1Tp8MEWaeCsCBexXCDnh9
         AR3Rjm6lbEYvweU0e5ajfBcRTC22lkk+TIV76TK/cI2ej0ssnQjOwIjHh4dpejeg523Y
         M+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099460; x=1793704260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CxXgblb1WraVgSV86I4VysbzdPhIpd24MIpyC6IrWA=;
        b=mz1mDFbCLgdfZAvskByKtC7uGY9I0kHIR/TcuBD8DudJMeNNauwnAur98a7tWb8NYb
         jXSEWYUTKN0Hv8qLWa0KYGj7CL5zQg0v804p/97uISkeXORmYIovRqcFxfoMhFF9h7If
         naIDXrvuDvInbWwhrz49GBaNQ35dA+h/Hfh41uPdvUeZrcTWG/3Qo3wLsSAWzSD4Jd0x
         5Mvkj+6btPhGzjjLj2OfEvidQ8Of0kGECV6iCHLtiGazzUy/i4DYFzyv9P7eEl5lwn2r
         XeKwS+U5fKTjTe5bmMdDQCjV1Ize+eK2Vt4PjUmFXja7dlu9SW4k3NSeXR4/VHNdl/ol
         RDOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPuCgBGPEr/4R5B5CMi/idT4lVei9J3fkMrgCSRvuKYqlvQ90SLeEiWiNeaAAyzUsqcAAKIaATlZsmqW9z7h8V@lists.infradead.org
X-Gm-Message-State: AFq9FYLvcGOssqsePCFUrafy8IQCH/LIWe835ixtz7qHdZH2RtPHJXrq
	V/X1ZJ6JHTbFoIDFuYX1u+zMNWNsRpoiQQhOI4mDmYiYM5OfMq6F6iA5Fg/cT+tVb5EIXpw3XhC
	5W0ZzQKEkBz/vNgJFY+pGADHKB9w9KHNlugJBga+oM7KTq0xqHT4tR+jhcpX+mivDhTBrztu5Hp
	ZiKg==
X-Gm-Gg: AYBFou3ok71x9jHLdbWxpDYkx0diqebo8QUgLAnmC+Eqx2iqnTq/tjvzFUWWXeEAmq5
	0MHGGnguXCsUNAqsxu6gubMAL7TKfyAVW1SOwd+b7c5l7YFz9BvQ2pcpAZYiPttEHycIe2OGDUO
	+lIN/moKuOziR5dd5yr7VWVK/a8kMCkxuMqluaVvM/EX2hyrVL3utvQiuFlqmUNlOVjZMfUwHMY
	Y5WbHgmsvmFmCrdkSHDQLHan8/9uIX5bXupukc2ybuZNqkDFWvOGrneSI5hWt0Mf1MamDebgrLr
	7fG/BkzVKJe4l4iW1lqzxsxxCgesYiM60/8L5KbGpY8f0TQVIIdGcYtFdx0NttxR/rZlRDCZZBC
	wqEUVa+AoFsGVZzHntkFf/SPwQy2nvw7KcyJzbc0Uy88rmopH
X-Received: by 2002:a05:620a:4482:b0:93e:c12c:9b73 with SMTP id af79cd13be357-940ef9dfbfemr1490758085a.78.1793099459601;
        Tue, 27 Oct 2026 04:10:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:93e:c12c:9b73 with SMTP id af79cd13be357-940ef9dfbfemr1490752985a.78.1793099458961;
        Tue, 27 Oct 2026 04:10:58 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm675152295e9.1.2026.10.27.04.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:10:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:10:57 +0100
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
Subject: Re: [PATCH net 5/6] net: stmmac: fix VLAN tag stripping on short and
 non-linear RX frames
Message-ID: <auCGwWCHK6e9cbxk@lore-desk>
References: <20261023-stmmac-xdp-fixes-v1-5-efb37e19f5bd@oss.qualcomm.com>
 <179309225715.3134.11251912403308890296@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cZrf2fHhcABm3x1K"
Content-Disposition: inline
In-Reply-To: <179309225715.3134.11251912403308890296@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX6P5q9JmsQdfV
 o2LROPxOQ8lcIhPNeu/YgqVQJ5ClskMGUxyXreu25gqelATWT2snaNpK3PSBRzKHz6BQX5sEimu
 BSI8oL67AF++IjOZ6gtlp2F1Dj6EnVA=
X-Proofpoint-GUID: sQwGWkBbT8FODlE7Mb_utlHODWdnALIo
X-Proofpoint-ORIG-GUID: sQwGWkBbT8FODlE7Mb_utlHODWdnALIo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX8iL3uoIOQkw7
 aNBlEWoeMhWuPGDe8Ynx9hKxBxwvbAy3qzTLx4W/FTNy0GgU1wKQG3X8j/G5D6ogdp/mGXfc2SU
 e76YmeBjlSREuiBeS96bwEC83ILphrqkXk6ldgfNQ9MxApJOkH/8BBTZMhmmbxM8UDJkS2oha8i
 WQ/BG8Bd1CUWeMaUy052R9MLXfPHcNMzQdNL48eHnmd5rn5S0xfUTb2tz+A/cD3oBM/oJwP3lLS
 MDIoYjuxZLcULENpUNeiyjmgRD+WBEi66htsnfDrHGSMSp0oFITsqXGyINKWzpqSDALvZPljaul
 Xr/oKRwtOV86x2DDcCQl4abT61fOp6b+toJLhdjuFFGB6p9z/tvSDJ9ymiN+N+Kj8fojsyf763h
 dTd/68pAF+i/Fk3ufovk/mm7ATnKVv6yUI/sry2FFE15+tiOzGaniR3WaxWhF/0U9+ywZzGHhWl
 dmXY8T5wCj1UyjRAbMg==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae086c4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=kOcqg-R2egU1R50GgGQA:9 a=QEXdDO2ut3YA:10
 a=gJhHHGP7ekgXX11HjIMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_041101_507778_CFD5C108 
X-CRM114-Status: GOOD (  42.15  )
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

--cZrf2fHhcABm3x1K
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
> - [Low] In stmmac_rx_vlan()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c), the patch adds an=
=E2=80=A6
>=20
> Pre-existing issues:
> - [Medium] Only one of the two stmmac RX paths that call stmmac_rx_vlan()
>   records XDP metadata in the skb.
> - [Medium] The new VLAN-error drop branch in stmmac_dispatch_skb_zc()
>   does a plain `priv->xstats.rx_dropped++` (line 5567).
>=20
> --
>=20
> net: stmmac: fix VLAN tag stripping on short and non-linear RX frames
>=20
> This patch changes stmmac_rx_vlan() so that it pulls ETH_HLEN before
> reading h_vlan_proto, and pulls VLAN_ETH_HLEN before reading the TCI. It
> returns an error so callers can drop frames that claim a VLAN tag but lack
> the full header. It also moves XDP metadata together with the MAC
> addresses when the tag is popped.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 8a2faf50d6957..32b2c5834c340 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5102,22 +5102,35 @@ static netdev_features_t stmmac_features_check(=
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
> > +	if (!pskb_may_pull(skb, ETH_HLEN))
> > +		return -EINVAL;
>=20
> [Severity: Low]
> This pull happens before the h_vlan_proto and dev->features checks. A fra=
me
> shorter than ETH_HLEN is now freed and counted in rx_dropped by both
> stmmac_rx() and stmmac_dispatch_skb_zc(), even with CTAG/STAG RX stripping
> disabled. The hw_vlan_en branch in those callers has no matching check.
>=20
> Is that intended? The commit message says:
>=20
>     untagged frames, including short ones, are left untouched.
>=20
> That holds only for frames between ETH_HLEN and VLAN_ETH_HLEN in length.
>=20
> XDP doesn't seem able to reach this case, because bpf_xdp_adjust_head()
> and bpf_xdp_adjust_tail() both refuse to go below ETH_HLEN. Dropping such
> a runt is also arguably safer than handing it to eth_type_trans().
>=20
> Could the commit message mention that frames shorter than ETH_HLEN are now
> dropped?

ack, I will fix the commit message in v2.

>=20
> > +
> > +	veth =3D skb_vlan_eth_hdr(skb);
> > +	if ((veth->h_vlan_proto =3D=3D htons(ETH_P_8021Q) &&
> >  	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
> > -	    (vlan_proto =3D=3D htons(ETH_P_8021AD) &&
> > +	    (veth->h_vlan_proto =3D=3D htons(ETH_P_8021AD) &&
> >  	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
> > +		__be16 vlan_proto =3D veth->h_vlan_proto;
> > +		u8 meta_len =3D skb_metadata_len(skb);
> > +		u16 vlanid;
> > +
> >  		/* pop the vlan tag */
> > +		if (!pskb_may_pull(skb, VLAN_ETH_HLEN))
> > +			return -EINVAL;
> > +
> > +		veth =3D skb_vlan_eth_hdr(skb);
> >  		vlanid =3D ntohs(veth->h_vlan_TCI);
> > -		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
> > +		memmove(skb->data - meta_len + VLAN_HLEN,
> > +			skb->data - meta_len, meta_len + ETH_ALEN * 2);
>=20
> [Severity: Medium]
> This isn't a bug introduced by this patch, but skb_metadata_len() can only
> be non-zero for skbs built by stmmac_construct_skb_zc() on the AF_XDP
> zero-copy path:

This issue has not been introduced in this patch and it needs to be fixed w=
ith
a dedicated patch.

>=20
> stmmac_construct_skb_zc() {
>     ...
> 	memcpy(skb->data - metasize, xdp->data_meta, datasize + metasize);
> 	if (metasize)
> 		skb_metadata_set(skb, metasize);
>     ...
> }
>=20
> On the page_pool path, stmmac_rx() calls xdp_prepare_buff() with
> meta_valid set to true, so bpf_xdp_adjust_meta() succeeds there. The
> XDP_PASS skb is then built without recording the metadata length:
>=20
> stmmac_rx() {
>     ...
> 			/* XDP program may adjust header */
> 			head_pad_len =3D ctx.xdp.data - ctx.xdp.data_hard_start;
> 			skb_reserve(skb, head_pad_len);
> 			skb_put(skb, buf1_len);
> 			skb_mark_for_recycle(skb);
>     ...
> }
>=20
> So skb_shinfo(skb)->meta_len stays 0 for these skbs. Doesn't that mean
> metadata written by a non-ZC XDP program is lost before tc BPF can see it?
> It would also mean this memmove only moves metadata for zero-copy skbs.
>=20
> Should stmmac_rx() also call skb_metadata_set() with
> ctx.xdp.data - ctx.xdp.data_meta?
>=20
> This patch's own claim still holds on that path, since meta_len is 0
> there and data_meta cannot end up pointing at the wrong bytes.
>=20
> >  		skb_pull(skb, VLAN_HLEN);
> >  		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
> >  	}
> > +
> > +	return 0;
> >  }
>=20
> [ ... ]
>=20
> > @@ -5546,12 +5559,15 @@ static void stmmac_dispatch_skb_zc(struct stmma=
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
> This is a pre-existing issue, but priv->xstats.rx_dropped is one
> device-wide unsigned long in struct stmmac_extra_stats. Every channel's
> NAPI poll updates it with a plain read-modify-write:

This issue has not been introduced in this patch and it needs to be fixed w=
ith
a dedicated patch.

Regards,
Lorenzo

>=20
> stmmac_dispatch_skb_zc()
>     priv->xstats.rx_dropped++;
>=20
> stmmac_rx_zc() and stmmac_rx()
>     priv->xstats.rx_dropped +=3D rx_dropped;
>=20
> stmmac_napi_add() registers a separate rx_napi/rxtx_napi for each channel,
> so these polls can run at the same time on different CPUs. No lock, atomic
> or u64_stats_sync protects the counter.
>=20
> Can drop increments be lost this way? stmmac_get_stats64() also reads the
> field without READ_ONCE().
>=20
> This patch only adds one more site that follows the existing pattern.
>=20
> > +		return;
> > +	}
> > +
> >  	skb->protocol =3D eth_type_trans(skb, priv->dev);
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd%40oss.qualcomm.com

--cZrf2fHhcABm3x1K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauCGwQAKCRA6cBh0uS2t
rNS8AP9vDBU1B16g84NKTu+DGkJz4a9j4jXoPXayJlU+Ccd4hwD/UxCB1EnTG7St
rJuvmD5GPjc+BNjLxoEiuLLIwhYbjQg=
=511R
-----END PGP SIGNATURE-----

--cZrf2fHhcABm3x1K--

