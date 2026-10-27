Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NgC+sHbJ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPGRtibF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZuCglhLb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iPxat4g+OTXFQwTTu2kUXCx8GCZc+zr3xjEApU2VMJE=; b=NgC+sHbJqiTK2r
	PvhOQMfkuTTIyc5m/t71PTBmGbxvi9t6D6c/TxHN76TYuyD00nUrLjLxzv46YyMMztBFCc03g5b37
	YUwJEG9YLr1rG/gAbnp5zL1mVuTKBaxko7I7R7RXY9yT5ppY1UDSXYnmDr0E2Dy/Hru3gq4B5xdp/
	6Td2lMmLLxyWgFj4sjE5CQYlQXSg7ZAgDMu/FIFIlCfA4VPEGit9OKJHpS9gDScnDHgdOpiFxsqMY
	6YpPyYu+pc8M/WAtcuC416XIlVWDVGeAtsfecSljm4Hhce3IELcuhYDQx5gj1P8jJ8I0+XAbkmQvZ
	pRFiF8ELnfaOHlrFAtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhYO-00000004wAL-1d4l;
	Tue, 27 Oct 2026 13:49:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhY2-00000004vqX-3LXW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:49:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxTD2458143
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPxat4g+OTXFQwTTu2kUXCx8GCZc+zr3xjEApU2VMJE=; b=QPGRtibFU+eibQkc
	NbVSU5xj6r+ZcA+S0wlq5h7OurqFzCKjoRqTJjO3VtsTo6RijKZaaDWOFQVdvJoI
	n+uhadNChPvjboamfMSZrfcRYVYugsNo8mo2krs+wbRki82xRAxgjYRej4Gx3yPx
	IFKkNlYnd0C65G5uUBPPXnrrzcTmqtP0L8y6hxGJ2xJUNdZhvSAc0kXmuKzp4Soj
	PAHUX32Nv5323l+FmGaQfeRMgAdD0/3hQFqPMgK5vMf87NEVYaTplcrpSRnp8deJ
	9PGCTJ4KVF48BlNm7bCaMkHIddn2QUbkwky2p7V0zaS/EBO7pPTV+xLIGMbkoYDz
	7+MWfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtajk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so744292585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108945; x=1793713745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPxat4g+OTXFQwTTu2kUXCx8GCZc+zr3xjEApU2VMJE=;
        b=ZuCglhLbV8GXnxpU5va/RLd9OloQITQfWpKFLyZyRduGNQzhgJNsV5irDEt9/T71Sd
         KBtUpD7cdMfjn830U6IqKZdXiSSZW9l9BV2SQgZ7NkciHPEZpKdvb7VzdbFFuWYDKgKq
         rONaUfjKu3Z3MEZuKaHmUHH3k+Hx2D4jo0JoL1wn9sAGa8Esjmw+/7m627hgmtVTRiwl
         eosIRxlHeH2yeA7sylZio65+cKvTmH54du8Xa/DqsyICZ3UfW+jP7Ro+L/shE2wv+erS
         zQKrH4bPEPhHHiODt41ybGjNXHjlQbkW2t0+Va//blZcFLdohDEJoaVujYWC+t+v0tPb
         Babg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108945; x=1793713745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPxat4g+OTXFQwTTu2kUXCx8GCZc+zr3xjEApU2VMJE=;
        b=tnVh87tBv+RO02veODabKYR9OGTFlJbR+ofDZQSc0mS1dzxUJQvSd23/qGsTD/w988
         s05TeE0yvP4bBPpmuiVNQ1fgNLK+Lu+spcNsY5T2nAA5v7SqCauiWITvL1mECQcSmkhD
         V3GJWt2MHnjvdYYTESsLsoMr5qPOILwEmWXVbadiwdHJu5SJDz8yeEq5w5Kg9D8Q9h95
         sh2Q6OdKielmIkqPv/w3XG6oUSXfQOvCG2flupHFYH/76mt9o0XgYGVKFWY2TBsFzPQQ
         KL+mNJsGqgTXWjTASzfdmfHGdWcn9U3r6vr/7hC3weMcK2CLq2qSsNnZDMnJ7QF/Zgxg
         ar1g==
X-Forwarded-Encrypted: i=1; AKwUvByR2f45riciZiDf96ohrFAaqWzS6/Y3b3Hu5pjpElri9a0uWmSiwWj2iSJofOg0gLR7HTwKs7jK7WpgdjZAFEse@lists.infradead.org
X-Gm-Message-State: AFq9FYLb1+qXefQdk1tqbKSWa7JZAXWaww2XzipXGYPm/4DYGvIcbcX3
	xPGMbZcRMiflbEfDACVCBzwj6IbibwiJIoycpnaiiJnQ6EEe2GNuzSr8PTF7CKcoA0hww0VFYXF
	M8rX9mRGmhXdRAYmxDPYdiTy9o30sphc1dEM3/g9f39OmncD85u2YwaU9DIEw/moec4EriA9Jhl
	TE2g==
X-Gm-Gg: AYBFou2mgXDwtqh5+aF2h2W1Z8o3NBjCIAxJXWH4lGr50zP3Nc2VvONnUYU8ZzmHbsF
	3eNDqysqGzXgprurgA3ZBT8dR7EUwzCFtdkCFp7hS0M8XX4XyD3JI+2PI09uEeHjhzQLHoJI8kh
	xeQH5OyQl2Hkw77Vu+jp/AwtoE/a0wNYBttxAQZApTLqFSse/gH6PfO2EL2YYcWQNeMpfoaSFcc
	xro+yrtX9H4aDvBMSKVXGt8xiAUyCVc0hht8GH0KudFrA/DIt7uVOvM73LhoMoN/B/LiKGF5tBZ
	HvTOHuAEfVSBrakYxtqc2kg9XHZ5UfDgoaLtoJs+ZDm1Kdrv71ENN+EQxcav9zltm+UJGf6GofR
	tjbu6wbRGkzQ=
X-Received: by 2002:a05:620a:198e:b0:939:de6c:cb45 with SMTP id af79cd13be357-940ef94d07fmr1553253285a.47.1793108944900;
        Tue, 27 Oct 2026 06:49:04 -0700 (PDT)
X-Received: by 2002:a05:620a:198e:b0:939:de6c:cb45 with SMTP id af79cd13be357-940ef94d07fmr1553246685a.47.1793108944232;
        Tue, 27 Oct 2026 06:49:04 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79683csm454696566b.69.2026.10.27.06.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:03 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:48:40 +0100
Subject: [PATCH net v2 5/6] net: stmmac: fix VLAN tag stripping on short
 and non-linear RX frames
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-stmmac-xdp-fixes-v2-5-10eae8a093a8@oss.qualcomm.com>
References: <20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8@oss.qualcomm.com>
In-Reply-To: <20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfXxku1Id5N0Pll
 D5k6Hyd9Pk9IViVD1qYSqSxDTmURRd0Vo7v11HD3NxssFQFd9QG3Qvd4sEyrhpRLLpyy7s8JAqT
 1nHOPfQeO50UfnHIfJ67m/7Nmgbk6Bg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX1ClgKCcD7IGC
 IhqsF4mdUlwPRfTGNKPgxG3DENeuc8B+uw7475tbYTBUSnL4fKeojO+zhbM+vuzVbVXM/v29F1w
 oYL6ntcYzUE4gkLawagM4dn1IqxEHMAL2NappFgzTUI1tzF4Q61cxaCnO1yhrw/C/9PmHymVtKa
 wn7HthopRa9imJVjP1fz9kTctgoznRTBJsOd7wNbsb0H5AXM4xQC7ywwSVmzTgsa9ubYBK6DNNi
 hWQTxtAEcZi3n+RGsrR3Lqrp6SJScdKc1SD93QFmM68r62IHhZh8njvLkJT+ARhFbJCQPG1UDmy
 UPp/DlP0l23Om4COnpXSFS9yVBqb6TYDhv9p9GLcBbGL8Z+oSGPNmCg+dxLQ3QmDOu2JM+ErU/2
 FiCXaij96zVwr1y35TJ993igy0iIcp/0lj4U89CsLvdO8Yg9bKztLpCKWD2s+m7DhHl3EQ/jm50
 5bvzLtKvE4jtC1FcAkA==
X-Proofpoint-ORIG-GUID: LdDNgXFtf1ca799A4d8bkvfMiBZMADzs
X-Proofpoint-GUID: LdDNgXFtf1ca799A4d8bkvfMiBZMADzs
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0abd1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hePLJVBFsHslUFHqtFkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_064906_959919_CA3F679A 
X-CRM114-Status: GOOD (  25.56  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stmmac_rx_vlan() reads the VLAN header straight from skb->data and
removes it with skb_pull(), assuming the header is fully present in the
linear part of the skb. XDP can change the frame length and head layout
before the tag is stripped.

An XDP program can use bpf_xdp_adjust_tail() to shrink a frame to as
little as ETH_HLEN while bytes 12-13 still contain a VLAN ethertype. The
driver then reads h_vlan_TCI past skb->len and pops the tag, leaving less
than ETH_HLEN in the skb. eth_type_trans() cannot pull the MAC header, so
a malformed skb is passed up. The TCI is also read from the wrong place
when the tag is not fully in the linear head, e.g. when it spans into a
frag.

Read h_vlan_proto after pulling ETH_HLEN into the linear part, and check
it together with the device features. Only if the tag is actually going
to be popped, pull VLAN_ETH_HLEN and re-derive the header pointer
afterwards, as pskb_may_pull() may reallocate the skb head. Return an
error so the callers can drop a frame that claims a VLAN tag but cannot
provide the full header. This also drops and counts frames shorter than
ETH_HLEN in rx_dropped, even when VLAN RX offload is disabled;
bpf_xdp_adjust_head() and bpf_xdp_adjust_tail() cannot produce such a
frame, so it only affects a runt that reaches the driver, and dropping it
is safer than handing it to eth_type_trans().

Also move the XDP metadata written with bpf_xdp_adjust_meta() together
with the MAC header when the tag is popped, so data_meta still points at
the metadata after eth_type_trans() anchors mac_header, instead of at the
first bytes of the destination MAC.

Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 48 ++++++++++++++++-------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d9fc2464a160..fb3b7174599e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5102,22 +5102,35 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 	return vlan_features_check(skb, features);
 }
 
-static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
+static int stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
 {
-	struct vlan_ethhdr *veth = skb_vlan_eth_hdr(skb);
-	__be16 vlan_proto = veth->h_vlan_proto;
-	u16 vlanid;
+	struct vlan_ethhdr *veth;
 
-	if ((vlan_proto == htons(ETH_P_8021Q) &&
+	if (!pskb_may_pull(skb, ETH_HLEN))
+		return -EINVAL;
+
+	veth = skb_vlan_eth_hdr(skb);
+	if ((veth->h_vlan_proto == htons(ETH_P_8021Q) &&
 	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
-	    (vlan_proto == htons(ETH_P_8021AD) &&
+	    (veth->h_vlan_proto == htons(ETH_P_8021AD) &&
 	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
+		__be16 vlan_proto = veth->h_vlan_proto;
+		u8 meta_len = skb_metadata_len(skb);
+		u16 vlanid;
+
 		/* pop the vlan tag */
+		if (!pskb_may_pull(skb, VLAN_ETH_HLEN))
+			return -EINVAL;
+
+		veth = skb_vlan_eth_hdr(skb);
 		vlanid = ntohs(veth->h_vlan_TCI);
-		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
+		memmove(skb->data - meta_len + VLAN_HLEN,
+			skb->data - meta_len, meta_len + ETH_ALEN * 2);
 		skb_pull(skb, VLAN_HLEN);
 		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
 	}
+
+	return 0;
 }
 
 static bool stmmac_rx_need_ic(struct stmmac_priv *priv,
@@ -5546,12 +5559,15 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	}
 
 	stmmac_get_rx_hwtstamp(priv, p, np, skb);
-	if (priv->hw->hw_vlan_en)
+	if (priv->hw->hw_vlan_en) {
 		/* MAC level stripping. */
 		stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
-	else
-		/* Driver level stripping. */
-		stmmac_rx_vlan(priv->dev, skb);
+	} else if (stmmac_rx_vlan(priv->dev, skb)) {
+		dev_kfree_skb_any(skb);
+		priv->xstats.rx_dropped++;
+		return;
+	}
+
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
 	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
@@ -6066,12 +6082,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		stmmac_get_rx_hwtstamp(priv, p, np, skb);
 
-		if (priv->hw->hw_vlan_en)
+		if (priv->hw->hw_vlan_en) {
 			/* MAC level stripping. */
 			stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
-		else
-			/* Driver level stripping. */
-			stmmac_rx_vlan(priv->dev, skb);
+		} else if (stmmac_rx_vlan(priv->dev, skb)) {
+			dev_kfree_skb_any(skb);
+			rx_dropped++;
+			goto next;
+		}
 
 		skb->protocol = eth_type_trans(skb, priv->dev);
 

-- 
2.56.0


