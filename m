Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5955606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v/3Tk+Xw;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQ19wM3z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URUhLrjs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TZNgKdjNJ7/V7yrbPxsuyxt2ZkRELxHfzEqCxp/307Y=; b=v/3Tk+Xw2yKFGe
	r+kePpADTGUSjKfeFF1pulPB45DgphFkr23qqoey0KNBgc5feUV8okKlLE3u5GlPILT9FHv2NR5QA
	pdeIxu3zHD+l297wAcucg0imt4NQVgC0q2PLdBcwmVm6FkIGA1diGRipAUU7/LRSogHiBlEj3rdO+
	2j9r0117Jy/ir7r9OJ6eBl9KRrFOw+V1w2brFQrr6W+8FENVdx4VJ6AlePtQqxbiPfgpMQa940orZ
	5WxpTNVq1NoJHdF1GGJv2JdRVKHe4EQgiiHpk37JkK0gZchVrGBy9vD3C67DkzoOPU5GzPvwig1uH
	051WQnhDj6UaiZRbGVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMP-0000000FtCU-47It;
	Fri, 23 Oct 2026 08:10:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAML-0000000Ft8d-2ckv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:10:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDHR1767186
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZNgKdjNJ7/V7yrbPxsuyxt2ZkRELxHfzEqCxp/307Y=; b=hQ19wM3zGfqTPoWh
	uxfUM4Wed00n8ocdmOx/GrKbM0W/dI5hem5jEsguz5O5hQEcM8OQLKZ00e/W7YoC
	c2vYstw96n9tx4IwSYzEnJHcbOCj79hhQBRagZZYFCVO9+XG/D/liRAeMyu4Cqxv
	h0IU9MNGutL/3OWO6dFzjuwfIbNyTNC+zv/8QvhG27a43zG4i+yc8HNcbiOWbG9u
	77YATjnXDbCS3JQUjnlnwet/EnTuFBmpBF8thMiR66l6Kqels3XV4w5ge9zr/onm
	zsKaA/c8ErHEsUQf9po2LrBAUIGy1qnEo+DXDfnz9k2pR5eFUBgaU5sgSdz5P7QN
	8/CQEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahu3dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so115078385a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743040; x=1793347840; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZNgKdjNJ7/V7yrbPxsuyxt2ZkRELxHfzEqCxp/307Y=;
        b=URUhLrjsrmOZJ+S0lSe/PhShjfHTKbVAbaQ3Jg6GyCwbS+yvzzDDXDr4wPHsy1OqFe
         I1kbgHWTMMX+Ws1I2RtLiHwRSFzg00ig23+J18kGMppWRwEy+ddqJimQ5OUjQPWcTHMo
         DjSZsd4neSjIL3YpEvkRyj99cdhnZiOdcbi6TdYc53DNL7MJmsIYJ8qWns1XHhURmydD
         MapZPhThRaVh40+jGFg4IGOzNKeQMB0Tg9wK45rX5Xw8CFURCinuwg82ZzCWRkilOwNu
         SSiRnPCBTJ/T7c94vYBfOvgCjOc5Ph09ip/Nxn/IpoRxpfFDQvr4bnQvJMUiHLRw76NX
         n4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743040; x=1793347840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZNgKdjNJ7/V7yrbPxsuyxt2ZkRELxHfzEqCxp/307Y=;
        b=QoggaOr8nBIoCyl48HJabo4yrVPg7FA33hNhwy4sp837Jf24C/SOC8GqfEznmj5V9D
         QyV5pL/8Tq5T8sSGDelw3/ATptnRRCP0kygwNPloRRFQ1HDLOKYc8hRcflwlGOPEQQ+o
         UJBp4lsBXdW/Lf+OCN8acyzCe1tz/HIR85fvGfw1GSQAqLb9wY2bNrvb1kvZN4inoylt
         u9x/n8a8bL5RMbX6zLO3g/XFZT0faDEHW/A8k5xxJ4aihRyY2uJIlGwAKMGWmpoZSCVE
         UGzlOCiG8IAs6dEv71CleLiTnIbqcNUfO+JF3x6gY1MuqUfS8o0PkLC833z4N+fhTUCd
         vxQA==
X-Forwarded-Encrypted: i=1; AKwUvBylZCvxpzEEXupjyQAaFmsuAvEf/C3kYsfnNXeX+Cf9Q9jjzDBiINFoO2GQuDwT4vRcnL4kOf+vYPGao4kf0HeD@lists.infradead.org
X-Gm-Message-State: AFq9FYIEfgYq8cBQyXjhnN3kTmPQTTm4cLt6YQAGY6oYjIJeJ6Db3Dhf
	72ZyOcrKaomDcKwbmqnEJ6/HnaJchHY5yljyxcywyhXwCodVwrTysXxBGcQsRJ7aUqLLABdyTRN
	eGAp9vcmD5V0SF2oqzU/Fa6gHUsM4VGZJ+2XJEqPWWC9cDOI8TCa+6CyfrnBfvadUuODgKKwl73
	NPuA==
X-Gm-Gg: AYBFou3LKlgVvpwvKM7OjgMunFoTCTHmXI5RWqZ0az238FKqMTqAO9RKRckyDq0j29U
	K0IWyFyUSbkBaD/3FzTHyIMT1umaOTbMfB9+8O3HCjbpOSpLaXBk/aeEGCB32MvTNHqK3MN87tt
	ejbYBbxIi71UgabqrDX6VasPdqtYkfDCHKMQrMMZh9afXDZo1Nby2ER77WWn2EpobjzmhNfw5Iq
	tz6PNTyDWwj9gaV8d33AlXEqXMkQqpe/lPJgg5B6nni+GmMtEuhxu+tG8OaRWLCeLF30c0GkbIY
	LGAg2Uhg8cnkWGcun46mJyNHmFfXMvqUPGzUM+ntcepHgxi+cJhD8sEtGEvzMdGg6A59Z8qifyl
	6zrJaDg1P7RPNCMsvjDRwjT8u7bM+ft5mbGdJoLikVvWWNiw2
X-Received: by 2002:a05:620a:1a24:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93f6f7dc7bdmr308621285a.27.1792743039865;
        Fri, 23 Oct 2026 01:10:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93f6f7dc7bdmr308616785a.27.1792743039278;
        Fri, 23 Oct 2026 01:10:39 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edfb3fsm3871572f8f.8.2026.10.23.01.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:10:38 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:09:56 +0200
Subject: [PATCH net 4/6] net: stmmac: copy XDP metadata in AF_XDP zero-copy
 RX
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-stmmac-xdp-fixes-v1-4-efb37e19f5bd@oss.qualcomm.com>
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
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX2v/pkOGiwjro
 3+Gbguo+XFZIbShnuYTSgRAkyKZRZwzkShq2MgeentgNXenetkNZoxTQHpmUU/7V4Kr0bNTog/i
 ygNSB6Hx/qNU2mC6v+rwjVj497Z/z5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX4Zdc0fDfk4+P
 b7QnoDr3FNGe2KTCFD2zfDEyivyXqjCaDsN6VntIouSv+S0qp3CwjH54uJFEnNoPe8np/L1GJ4i
 V8NpkzAWeDXh5JDagCa5bqRx6GmK2tSjM2nMx99GUrietzT3k4e7ohKQc0Dzk9SvWt/7apRqbpl
 wJ7Ak6rG3LkKAZ27FwuDgQLukUYsFQFQ4k6vUMfxAq6VXfevVB3t1f3JQGiFwXsz6+i8KwMKQoQ
 nyxIr1k40053+JFVMIX716S7JJ9DbBnCRRaJugmjDQ1HrdGB5xF8p1SikFf+YGK3KdQRm0B/eUe
 6NKsBQ7wVaIJZ+rDw+SOckUspER88nrlmHdsJ3tfVjRAYjZpEBSO6FZ0CkYOhqN1HMsH4CGP506
 c0ysEmQiGa88P7Duy/e4Xd+ig4FC5hoBaVQyL7LrnD1RM5iPVU6l5vv0Nk4YvMzgoCO2kGa9KoE
 xoQr0KeO7BnBlAuySVA==
X-Proofpoint-GUID: nNJmd4V4yzeeS6dpF-oSk2Y918NF-_cw
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb1680 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9RzD3mWewD2guqUcLtsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: nNJmd4V4yzeeS6dpF-oSk2Y918NF-_cw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011041_789967_CF4FE0BE 
X-CRM114-Status: GOOD (  16.78  )
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

stmmac_construct_skb_zc() reserves headroom for the XDP metadata and
records the length reported by the XDP program, but only copies the
packet data starting at xdp->data. The bytes in
[xdp->data_meta, xdp->data) are never copied into the new skb, so the
skb advertises metadata that is not there: after eth_type_trans()
anchors mac_header, data_meta points at uninitialized headroom instead
of what the program wrote.

Copy the metadata together with the packet data starting at
xdp->data_meta, leaving skb->data at the start of the frame and the
metadata immediately before it, and record its length. This keeps
data_meta valid for the stack and TC BPF, and keeps the metadata aligned
when stmmac_rx_vlan() relocates it with the MAC header while stripping a
tag.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 30a2774d722b..8a2faf50d695 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5519,7 +5519,8 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
 		return NULL;
 
 	skb_reserve(skb, xdp->data - xdp->data_hard_start);
-	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
+	__skb_put(skb, datasize);
+	memcpy(skb->data - metasize, xdp->data_meta, datasize + metasize);
 	if (metasize)
 		skb_metadata_set(skb, metasize);
 

-- 
2.56.0


