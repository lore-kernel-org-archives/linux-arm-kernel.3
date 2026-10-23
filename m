Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD8D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JvuGAmMB;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CzW6AGf3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jr51MBpl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9KJNqo+cb4atWzlkr/WtQbdQlvV6rs4JVgcVN9uUPgw=; b=JvuGAmMBMsNe6C
	7yVcRVKxrjnOms3jQYdo9ZEfFTq1zDr6zBfU8rQkaT8nOVRlkU3R93U4EA7ZK7x7r6dXxde1+yWsn
	ffYx2br3h+LOq50Fb2Wl/tDnKmJO9oyin0B4cMHIykPqYwabzPD2ela7Tt7vpbJjIIKuxLLtW3gqR
	PwcFNe1hK2jlYGg4IQjnn7Tk2MlIH4wakTqhCMlvprUjy76a0ILkQXFxUcRfsaW2HkcgLYMgRnqWn
	5VL1yE/mQyTU1OuDRtS3qflwJlQUkyDEc5ndDa1LawwCKE2uIf8ha2u5n5caVwaR5StMCpjSKPx6z
	1EuLM56yWm7wEk/MJ/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMp-0000000FtUV-1wZJ;
	Fri, 23 Oct 2026 08:11:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMN-0000000Ft9F-1gdB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:10:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FBDd2092798
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KJNqo+cb4atWzlkr/WtQbdQlvV6rs4JVgcVN9uUPgw=; b=CzW6AGf3CPsjQ3+X
	tK2w9rMlmIjzHFoQV2ls9lGngjkxh9ePJstID6lovQnlgqlu6x5SMP7QKX/qj5f+
	AkDr1X24++AoEVscHBeVeTsQr3V9kH1yhbZQ4rxYJ85PXbvjxmFV9EBpoapWTptI
	hYVFKM3Lsj0shwgVN23FF0btPdVHB6cNLLJghAo4iwbEwqNQdXiyyOwLnAlUbi9E
	s4Kzx+2dClDnP03PHoQeSPtVBZ6jbEEgkolxnm6jayBtnVZKDJQVAhb9geJGuuKX
	Mv7ZIug+QDaoJqB0RxigT7HEtSw4NhO3QcxnqtJGTdBnhdZqnMHikFXOOuQnJpDY
	PgMmVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyg9uyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso310121385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743042; x=1793347842; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KJNqo+cb4atWzlkr/WtQbdQlvV6rs4JVgcVN9uUPgw=;
        b=Jr51MBplkayuoagTvhTSrhGRxqjPNIwAfLqbB88UlbfUG4Sb47fUo6exF+Exe0I/LE
         SIWfBiMjQwyxcy4VgzbyZIVYl1OV7WFTJRWqb4AsJQCrnZxfmL987KnJv5FAIU1yj49Q
         YO3QvjCfJqSKx7Xb6sQTet7dUpXdvJoTH3lirtvx+hxkYxcVWIbu3AKsFaHdVPU22/JA
         pE0gYo9VR/G58Oeg4Q3CBpAM/YFS4cHABAe8zBmVAbQF1XQyxcXrt7DC9YJ8Hrrm5veh
         H0mhRrS1MY4FT3MqZv7thf/hZ1gPyHm9FzVXytePDVTlghYXA6i3fR7FZIWn/Ks+bGlK
         8V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743042; x=1793347842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KJNqo+cb4atWzlkr/WtQbdQlvV6rs4JVgcVN9uUPgw=;
        b=XQYK8WZqpfXq8x1roPt1yJraIgmSQkjmxUAf7DSxm9KXvJsW4VN+MhY+GiHTp9B84E
         ujMSg87SFogMGJIcwrSINkg0utoY0uR0XZPJqbs13KeeOMezaTYvbEy/nV6XFJhO3g6m
         c+6nqmoVsN0KfdBNsy4iaqBJrR68yQ2+2PeWGsNZ4+ih46cXikVv8n9T62bUObKfFgCd
         /aYcPBdPbxR4djrsCMswBWgwwl56q4jc9C/6rl2L4tvnNxMCtxeOyJseLqNCCmZU7jBR
         ILvI+4XSV6B1yqv/LrX4fgFiZHtA471isG2kHPtY+B5Vh1gNTxiqFEc1mqssjUzYhshO
         fpjg==
X-Forwarded-Encrypted: i=1; AKwUvBzBsIo/tlxE5PuZw/T/Wx/iKMwM8PgAh3JAt2vxmdyhwqrsJkErXxUjzmEBcAjGresg8/YIcZvoz3huS4GIV1rK@lists.infradead.org
X-Gm-Message-State: AFq9FYJR1CLuqXbeFxMOoruZGT8mRW8z6M6mlzHT5NWC7GryYVLQ+tTq
	/kyZsvnUhB8fkBvx4Gg0dGQ/LUf80X92rJQyugrK9Y9iD2l+mYj3BP7JLmUwmT81kYu3CQLolMB
	Voaj/jJk9qwqNsZhWC7BIeC0CMK/C3Lz0BogPk25oRNnYRbESjBD8eFrBq+7R+N12spV1SIRvLr
	HsIA==
X-Gm-Gg: AYBFou0K6zu06oo65XwmPNLk9V3X21XfO61s2GI+SYdixzthPAaiFie+M69RdZiUJzD
	oGg+pSPHC1iWvRwJtac03XIWCdjnqJxPi0dxGaUVM2/GBDBnOpTKMENgCTN1RZtKXWz70kReYES
	3g0SPxckbC6kWHf1V7eW38fWi6x+Y59XBXgpfSHkr9SPiFrrBn3LA590tIuMrn9RVRrC0IoEgTx
	gjkfjIPYOpEoXegQSugRAEPhcc8T/FIIhhFNf4i6iMJ/1OBQuYNd44JvZCTrrn1xGy/P/urvhNR
	ZPZIs4LVPjqKD+lpPFUw+Up6lG9G0DMGS6t7yCSnkMvpMynAO9KtveJ+1sh6huL5WicKEyhBLpX
	Odmz0iVdh3ug=
X-Received: by 2002:a05:620a:2620:b0:93e:c12d:4ecc with SMTP id af79cd13be357-93f627ef31fmr720541885a.44.1792743041547;
        Fri, 23 Oct 2026 01:10:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2620:b0:93e:c12d:4ecc with SMTP id af79cd13be357-93f627ef31fmr720539085a.44.1792743040971;
        Fri, 23 Oct 2026 01:10:40 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21046b92esm52603085e9.10.2026.10.23.01.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:10:40 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:09:57 +0200
Subject: [PATCH net 5/6] net: stmmac: fix VLAN tag stripping on short and
 non-linear RX frames
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-stmmac-xdp-fixes-v1-5-efb37e19f5bd@oss.qualcomm.com>
References: <20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd@oss.qualcomm.com>
In-Reply-To: <20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd@oss.qualcomm.com>
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
        Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, Nicolai Buchwitz <nb@tipi-net.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb1682 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hePLJVBFsHslUFHqtFkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX6jSqxiKnbpPG
 e+u90wbd9KlijRucTYKSq24gbs7y+D80koDR+kwVcAamJaFi+5hStJfktoc5zrTVCaZPH9z0a0p
 gVq9/LbdpNH9lGmNU4Ngi0evsLeXMTo=
X-Proofpoint-GUID: mA73tmD5lRxAFWft1fibPQNcR906rYzl
X-Proofpoint-ORIG-GUID: mA73tmD5lRxAFWft1fibPQNcR906rYzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX38aXD4sfrVuy
 r1owI/Z0OH6GKP0FoOLzYgcXMPk+R3x0Hhm5bQIpNP5BYAmdhNY4VxbpuOw7R/+llL14G2dQG2m
 Yu6HLRrEOByF6bjToJtdSNUNDKaHWEx61hTaqhpWyCQC44G6HZPR8JLsW4Chz02Y18Tw/sMJfF3
 rupGbQppRSs69NG18jxDs/VHMqKrL+2kbggTWdsIPi8UYTinRty/TGUTLs3fMEHuNCm0kcV2PLc
 U8xzEFx64p8P+2jdCByWMgWY4i7JgSgf4MBIyepUQkQew8hdhKJ51qVDbvZEWVs2aze0gut0DG+
 2r2nTksoar91FtKmwN0CD+ynj7h35JLxXvMrP5Kbkx4qcKxQjsfAKm7fm2PRTDOr3uShDbxiTAC
 n/O2BFlbcUOSCw2hETHUHzBTvJH0SCp6EwYh19tMaEZODRY2eVKnF367hcxENJVdATOMKCcHAoy
 mXTL/ccOIEefBJ89uXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011043_574162_7EE16391 
X-CRM114-Status: GOOD (  24.22  )
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
provide the full header; untagged frames, including short ones, are left
untouched.

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
index 8a2faf50d695..32b2c5834c34 100644
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
@@ -6057,12 +6073,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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


