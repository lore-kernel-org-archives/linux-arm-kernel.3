Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035FC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xImr6ntB;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bl9Y6qAB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXYnwHAx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1RqAEfTuGbkvUdAUwAcy8yMPvcz5IhXkDHeJXVKQMg=; b=xImr6ntBnZSxkTma53Q61ZyE6B
	S18uwXRv5Bx+0GiYhEodfAlHusjKvPK01uvDl/BOkIReZYKjoUGVCK3gAzsvmjA1Oqa595GE35kSL
	6KmUILVH+SJnks29kOXl7tkJcUDfNQ//hvcge8ib7M/9AC92F+Iovkq0IQKTMP1MfSsrWBtH03DG5
	2hWNv3A1OF49rOkYaftyL1NyBvtLXId9li6s6MmbEjASGh6+x9PZn8YEgMTBhStDIm0OXkiC8vNN4
	v4p+uZwgMGc0IZu4CfENFLa/FMjhC6i6Io76bqCy4bzAyHbZNBWDGc6e7VBpzLPK2bRY6gmB2gvML
	zlCZro9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9jB-00000009lm3-3pDL;
	Tue, 20 Oct 2026 13:18:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9j9-00000009ljH-1cdF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:18:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA19m2298050
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L1RqAEfTuGbkvUdAUwAcy8yM
	Pvcz5IhXkDHeJXVKQMg=; b=Bl9Y6qABYgqtoQKdJHCs5a8sTn62iZskwg7QMeGc
	GCkh7xI6U9HoZRs+U7tPz9GDgH6zOUeA1Pbi5ysDD+6eaYqL+lcSu7NKK6G/SdSC
	lHGVcfJEW0l/G2f8m2S9z8ZHNWY/fwApnhSoGhVR5p+VDaNO2z+F4vZHkMVpBAnn
	ljXT/lvFInhxPmR6jsHemw/8okDM6Akx8i8e5Xg0s26YLDQgh9JMAUZ0Om2dGPpR
	H8yokCtISbqgiHZgAevMNbdrr0BTms/q59poNlWRNZKT9Abi0ZMctXpA+cSpTXDD
	y+d5uso3qLhrn6/TP4KfkOeEKo2DW+eVOcWglYqtW5FKYQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjmj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:17:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b529a8610so64488486d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502275; x=1793107075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L1RqAEfTuGbkvUdAUwAcy8yMPvcz5IhXkDHeJXVKQMg=;
        b=WXYnwHAx2GWp/NnXidAgeDq+IVbfPKB4Ps5+gpWpEfEm21dTKY4DBSIImWYIFoAg9Z
         REQo19qskQ8zcgw36/F+Qw/01mvrAS2GZk+J9vP0tn8rHXgqUAc33oNOjtBH4sz+fM7Q
         D5/7yrtaFfk9LZoTKDAyVlhEc2H7Axz4NVPbD1IMJO1yKVj+3iJtZLzkXyjH3exC95NK
         r2RqRLWMYcqwSsiWuNn+kBZd6JsDzeuV10S0TDohl52KE3+UwiyX0Lxz9qWSbkPC/I7y
         vCU79qNy8z9AWAIKHNsbb7jU1hBrtb2SmjtFvlvGyXwAnBevTVfHYQvik6fbkzzECy6X
         hooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502275; x=1793107075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1RqAEfTuGbkvUdAUwAcy8yMPvcz5IhXkDHeJXVKQMg=;
        b=jjUF7PyMaVDmZmvYhVgN6I+J5cLrtZg8q3XHft6Bo+oWpuw4xKr9olf52m7k7z9MoI
         X2HEE+VXaWFpbWDS/+wUSgFXyNlfDb3iKi6zbclX6w0ajo4mNZO76mGOPkaLH8MUpM6e
         IatsM+aFNz8A2xRhLhrkZNXLir07LpmMM+IxgNkh0MgLCpgWviAfFuz8+u0ZuTaEEx2b
         obvy8p+4rfqzXj7NMm0kDw7AHV4o6srIhEP0KiH5qaEI7WTWyR591ZnBIT5ffxXv28Tm
         URz9LThxRmrnW0NUQNvFp/vxZackhmbVd/b85gWm2OHLrhrEsd16fMweDEAQjVr3dMHj
         Lfdg==
X-Forwarded-Encrypted: i=1; AKwUvByyFM6Su7DkUiP3Q/sqSDwZFuXBIAQ066uAvFrqkJzNaMt0mh6PTULNU/RvIuIowUy6NpnwGL9RQ0z1GxCQ2yTp@lists.infradead.org
X-Gm-Message-State: AFq9FYIbK5xpMS56PcnVdSKaVlOlvyWf7v0NiS85gkLU0F+LsPAlvuoA
	Fgv/uI1PB9xoEChAihz/tYQ3nBV+GP5/8+FyPxX73sKrEJSesv9rti0ndhVaL11XiyUjameYE6r
	A5bhkgko6QNT6faqLPGiW3tmTNNU3aAzlIvkSzJbaYgCp6HLwQB/GWZtqwwdLRPNbHx5pb11xFm
	Elgg==
X-Gm-Gg: AYBFou12ay0vmSNmxuXJH5/xRURSiMdEr2suhhsUNVqogbQsbtUQpu6VDBlQLU6cVqh
	HezIDGfkreGV5dSMiYFRaliHUWc2AlTgBZ2ng7iK6L9nEnGARRrvrwNZ/PRU7u3kAstOlWGttRp
	iwM+Coq+lOHZVn3Jk001TuOX8quJUUKTB4CE3jjpZKWGl/F2xL4p9rvhxiDpGr9rEM1xuQp6VZ6
	SSRfmqExOGjCjlWTmnSK4JcRBPFgZRuC8W04U8IUNsK8Mdjr/6Jk9gJrlBLRtXkfLkEMXGfIDbV
	ORtLekgl+vNDljTP+2r4NU13HjbZG7jxs8pHiKiATUOQogSwyaTrxZTuuhbkxvTrINWfe/lpu+J
	tRS3ThsvLbI/2Jw==
X-Received: by 2002:a05:620a:280b:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-93f29ceec2bmr1774239185a.17.1792502274672;
        Tue, 20 Oct 2026 06:17:54 -0700 (PDT)
X-Received: by 2002:a05:620a:280b:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-93f29ceec2bmr1774228685a.17.1792502273730;
        Tue, 20 Oct 2026 06:17:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d8bsm5401884f8f.24.2026.10.20.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:17:52 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:17:51 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, maxime.chevallier@bootlin.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, ast@kernel.org, daniel@iogearbox.net,
        hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
        boon.leong.ong@intel.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: disable TX checksum offload
 for jumbo frames on bugged cores
Message-ID: <atdp_0QJfjR_H3U-@lore-desk>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
 <179190522792.434549.2113659711683261245@kernel.org>
 <as5PVATLFOcTHbkV@lore-desk>
 <de6dc65e-04bf-40b2-b5e6-d7035d2f9b7c@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VlBw4mY3Q/Sm2KIC"
Content-Disposition: inline
In-Reply-To: <de6dc65e-04bf-40b2-b5e6-d7035d2f9b7c@redhat.com>
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad76a03 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=xPDQizAfL9ec5cwQt_8A:9
 a=QEXdDO2ut3YA:10 a=cxd64Jjv5Ts7904Sr0EA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: h85huuoVSwAddxU34kuQFRK5viU2VxwG
X-Proofpoint-GUID: h85huuoVSwAddxU34kuQFRK5viU2VxwG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX/+BM5nCqJrwk
 u/89bBaegXbHnl0v87wQPoV2RYJvQt7C/pZXeMJtL6BOw0sn0OcGaaSQsXzjZuWRVkIf3zt8SD3
 72wCj1x4zGvz5FNxgwEHwIFSiIR7cODb9HDMP4+IDPLBGr1zOvkUt8rhF42QFt9YbgqqCx5VSg5
 b5YpPISu3k0bZq+usqDfBFRRHa8bxltPJl9qcg3HOouUbwzOb9l0kFC08VC+BuuQqBbiHN9dMZ+
 CKK43KIis9aKGUQwh5rNgCDn0s6YZyu6CfEZSgL81yNTGcDQ8k3KsC2n+RuOBsdzHqWVRYEbnIq
 OhgwrujFV77w4z49YWQKxbzjGdKMEBorfkGrbvyLvkW+ly3vdAnaoef6A494u+ryESuefFiAJ1Z
 t4xqo0Bw/BfQhP9rQ2ab6NrzCJfJB0Ny09m4zau9hmIl2RKGTc22WC1xao13FWoWoozZb+zyeGA
 vXUE1QhGDVsr9GshXzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX9oIAb8MH88yG
 0Z4U8SmSiNyICIEO4UVQfr8SgvzIYFJQALiAHsCM3Fgt/E8215li2ufYf/XeDF56UMkC/BMurpX
 uC5hzY6R6/kd8MPHXmK7E97pXUgjaOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_061803_542585_575C71E3 
X-CRM114-Status: GOOD (  31.75  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--VlBw4mY3Q/Sm2KIC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 10/13/26 17:33, Lorenzo Bianconi wrote:
> > > Thank you for your contribution! Sashiko AI review found more severe
> > > issue(s) in other patches of this series. This mail is only an FYI, i=
n case
> > > you want to address the nit picks below when you respin.
> > >=20
> > > Low priority / nit picks for your consideration:
> > >=20
> > > - [Low] The commit message's premise doesn't match the tree.
> > >=20
> > > Pre-existing issues:
> > > - [Medium] This problem wasn't introduced by this patch, but
> > >    stmmac_xdp_xmit_xdpf() never looks at priv->plat->tx_coe when deci=
ding=E2=80=A6
> > >=20
> > > --
> > >=20
> > > net: stmmac: disable TX checksum offload for jumbo frames on bugged c=
ores
> > >=20
> > > This patch turns off TX checksum insertion in stmmac_xdp_xmit_xdpf() =
for
> > > frames longer than ETH_FRAME_LEN on bugged_jumbo cores. It is meant to
> > > match the stmmac_fix_features() workaround that the skb path already =
uses.
> > >=20
> > > > The XDP TX
> > > > path bypasses that workaround, so once XDP is allowed at MTU >
> > > > ETH_DATA_LEN, jumbo frames sent via XDP_TX or redirected into the
> > > > device would leave the interface with a full checksum insertion ena=
bled
> > > > on those cores - exactly what the workaround is meant to avoid.
> > >=20
> > > [Severity: Low]
> > > Can this scenario happen in the current tree? XDP still can't be used=
 with
> > > a jumbo MTU. stmmac_xdp_set_prog() refuses to attach a program when t=
he MTU
> > > is above ETH_DATA_LEN:
> >=20
> > This is actually a preliminary fix needed to remove the MTU limitation =
when the
> > device is running in XDP mode.
> The point is that this patch does not address any issues, no it should not
> include a fixes tag. I'll drop it while applying the series.

ack, thx Paolo for fixing it.

Regards,
Lorenzo

>=20
> Also a more explicative cover letter would have helped.
>=20
> No need to repost.
>=20
> Thanks,
>=20
> Paolo
>=20

--VlBw4mY3Q/Sm2KIC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatdp/wAKCRA6cBh0uS2t
rFmoAP414FEDjStL4n4qvHemK+O+WXPITqOkK0QE5TTAxXJutgEA+GNB2i9SNe2P
Jm3Rh13AJigugNCR10M7PsREpZKSwwc=
=zatQ
-----END PGP SIGNATURE-----

--VlBw4mY3Q/Sm2KIC--

