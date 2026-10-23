Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA03A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tia9pZU+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3xbbkAj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YH06c8dB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1pRFcQEcu8s5P1EJubsYrvBbAclreG07J1NNugAiMfM=; b=tia9pZU+CpV0yS
	uHAhKDT6rFEEDUI8/BGQuK8QxEp75AqsKgzPkjC8JIrXBN0wKIzr0bjIoZodxhBSNKviG7qoJG0yW
	o3+Q+0MEpxRDnNJRbRQrTLIBX6xQhQrIJ0eqx4nkfkYpkTcDau8KJGA2e8rN02YUOIJggtfjt6XKb
	1SW/Ps7u0vkalU0SJHlSE5TcqrKkcIplx4Eg2xnVPhNiMyrKoLimZzsOWuBO9gO8mDMMylZm79dvI
	eG4+TG+Q8sK29n9ty42o0uY9+fv2F5h7bM0saCB9yJsgpR6uqU43wnpf2LV6ySqjgWAlpd9q2LgUq
	YbuteNZTdtWbjXP50xeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMP-0000000FtBg-32vM;
	Fri, 23 Oct 2026 08:10:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMK-0000000Ft7J-0DgS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:10:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FORB2572649
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1pRFcQEcu8s5P1EJubsYrvBbAclreG07J1NNugAiMfM=; b=P3xbbkAjSM6PTpwT
	25b+uEaHBDAV6siqu+2b0KoO3acB7nnNcruCCFiNlszL9xnhNTOIDqnRQCllPR6f
	3epEogKOiDQhNlpAiChTX/PzipfYVVmw4JICO6S7x3iXm2DxuTuyMyW7POXQoNFj
	e+Q2a6LjaBCp2bUfCR0U50dtpcgrNTRluSX+zEhNll71P68RJ6QE5eE7BupSeF/d
	Luygs+q4gOs6okZ4T/UxiHI5i5c4PMuiGxwW8UVYMJUkbZcK5Xltjpi5If2W9K8n
	PJlDnmgSGv8YvAQEbwCXIAqanx9Ry2I5Bxo8N0ZAKC5+fCPqTrytQscaGaQhs1Y8
	4rKPEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0k6th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso135300285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743038; x=1793347838; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pRFcQEcu8s5P1EJubsYrvBbAclreG07J1NNugAiMfM=;
        b=YH06c8dBivWpC+UQTQMLoduwQfGCNFM6+iWAGfgU5NgqF27wsUtqfN4eoAJG+xp6yt
         dgKBrnBqZUQfmFour+i7MQ+sIvXYs5eq6PWeqzrzqYeWO3vOvWVKlcXg6ky1OduW6eXL
         lbtVW9s/I50GaOPTqdmdIPIupRFy72WLr48NzH1+IxT8wZ/mrXk4Q4BCuUUs1nFtniA6
         shJzOVkybTYG7dhdg30JRXaB8vBMP6SOk6/hyUcnokThiP8iOXlhal+SWy4HqASHxuO3
         ny/LZc65Lo/KeWBAkI62+HehucBSRPGBoNganROugSS1wX5dHGDFfvsA78p/tDoLWPZY
         iCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743038; x=1793347838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pRFcQEcu8s5P1EJubsYrvBbAclreG07J1NNugAiMfM=;
        b=LefVyc2qPts92RnqTLEy23chJDHrdzzGzzqkdBSrCBc3HQHSAxTt8lbUzFxTIjfnaD
         Mj26OEnbM0L8RL0+NPWEUCqjTciP6Xe0VFovVOBdVvKmFNiyksz682zh7oJm0Or+9rC8
         l7NJUQik+54FskGO3cQDTLDE1nFhpc97lLawXxaTqKkyH4zXPvZ1Pqe31Bqds1x9cA0g
         TyJykYv/9b0wzFtlf4/FMt2ekCXA8Mtshk7Wpvl/MtbqWcER3iNne+a2NEGZ+39HneY8
         IKWTAM7T4j+7B71gKcU9rJOVLNsmNffcy4fMEuO4PklFzWziwQG9vEnYaZRSBanaWqzn
         aF8A==
X-Forwarded-Encrypted: i=1; AKwUvByM0qqg5pjVg239QPkSQpm3UqzYf9Vb43TzkvITY1Cu/s5KSH0JZo9f3dFfPADPr2FynZ2E5yW+AUAIncFx87RA@lists.infradead.org
X-Gm-Message-State: AFq9FYKpjqH7hk70OuYrjgdaNiCLe7wjjJ9Yx8SmP14qNS3u8RZgGV4o
	E/DEnnvt2kXTKdLyAQbzjZuWHdhIAq8qbtt4X3VJyZWkmzToh6oCaiCpzHmFd0/3awhVCqgGqa9
	YJ3Ffv5K/qGTdki4sP1e4iv3Lw18eaH8ixOHMzuk3GSam+2IBZt4IdLlGa/37LEYSwwmxsLikNj
	D+IHuJqg4LtA==
X-Gm-Gg: AYBFou1rG871jse0y9LnyCMUpP4skfbSggLcRnQePFTX8EOL3pqpqTdlivHIeLOaPCF
	PzE/gM5OHugkY4M9XT176m0Dnl7MNnGe/4AkDm5VbloBJwBqtzxyi5QMP3mn0sqIicsedmXLbS0
	MaeZM7W3625NfDRtzul4IQI1QA0Uy9J4NtRq1uFSsDzk4jBYAAsWiYyR9EuCQ8Ki4TH1Rl4sdQk
	FpIuhQhKdBZsKeOmeOWuejWL25cyoSNCt1X8LHHVwil7s9Ijb7DT7Xz2Aa6JO7u1tOyjbMrzIh2
	YTVX5/2dQTZGvNFceaP/P15sz1DATdySZAGMw9Xtug5ZN92PdbwtNUzQ3f3r2frxxfiVkYyoaqt
	WRXRf++gMMSzSvTRX7t3mr4KkXobFVRycaxqk4vY6wws7H7T2
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr264310385a.39.1792743038160;
        Fri, 23 Oct 2026 01:10:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f6f7c4facmr264306885a.39.1792743037606;
        Fri, 23 Oct 2026 01:10:37 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38062dc6sm3347597f8f.55.2026.10.23.01.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:10:36 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:09:55 +0200
Subject: [PATCH net 3/6] net: stmmac: drop multi-buffer frames in XDP mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-stmmac-xdp-fixes-v1-3-efb37e19f5bd@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: aSdCAp_riu5yLWGMxXvqqKNEs8-TbX0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXzBAfG4wiG6Dh
 SmlMDJXQ37hz5KjMysKxakASEoGgjcFi+q5Mxx65F0QCbElRrpVoRihkJMGIoxQYSaVtNFcnZvw
 fpV55ZAbUnHB2VrCt/GGVBlwDI8AwRgB0WdSqqRwetq8hOPDDIhn2flVj7Vw3Gt3Hx3AjuK3W9G
 w+E0gbtEl4WmSKTCsI1xKVKsiGcSLyXaMcUETB7SIO07KdhPBUXeVHcUQbMv+UYwJEFdrLM55Bp
 TFtbaZqIM6JuFJfHciJ+uPFdRiWK+93fV3VHeBIb4UENg4bmMM7As+ghp1fMJGygBYzPISFeIuc
 R0ELV0NlQAfaX8cT20cejLIga3ydj1MyP3beWfCp16Jf5WcGSvSHZxpOtuOJ2liuQ8qXHUPsx6B
 B94ON+a7ZdS6ivKFiLzhBJjNMdm2Asai++mdbcNscyDqvCcOZPTqXIzN+fbJfvSvwA1O4IRI45R
 /bhI+ZZ7XtSRRb4x/8w==
X-Proofpoint-GUID: aSdCAp_riu5yLWGMxXvqqKNEs8-TbX0H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXxD6i/JylqKL2
 hurfpGe/V2y86OuDX9Cye+0bwbS3YHL2/6gnRjalzAgfo1ZRFLAnbAtFgGiMHEMLuWMeWyNOumc
 2YYm827mzxplyGjKTbTX0iaWZpfg9KY=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb167e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VR_YHCPEGhNri-7XuWcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011040_245198_9AEC782D 
X-CRM114-Status: GOOD (  28.63  )
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

stmmac_rx() runs the XDP program once per descriptor buffer and uses
skb == NULL as the only marker for the start of a frame. A frame larger
than one buffer is split by the hardware across several descriptors;
GMAC4 enables jumbo frames unconditionally (GMAC_CONFIG_JE in
GMAC_CORE_INIT), so an on-link peer can deliver such a frame even when
the interface MTU is left at 1500.

When an XDP verdict ends a non-last descriptor, skb is cleared and the
next descriptor of the same hardware frame is parsed as a new frame.
For XDP_CONSUMED this happens via read_again with len preserved, so
stmmac_rx_buf1_len() then returns min(dma_buf_sz, plen - len) for the
last descriptor, which can be as small as 0-3 bytes. buf1_len -=
ETH_FCS_LEN underflows and xdp_prepare_buff() puts data_end far past
data; on XDP_PASS this produces an skb whose length is close to 4G that
reaches the network stack (skb->tail and skb->len are 32-bit and wrap
below skb->end, so skb_over_panic() does not fire). A 4+ byte tail is
instead offered to the XDP program and delivered as a standalone
mid-payload Ethernet frame on XDP_PASS. XDP_TX/XDP_REDIRECT instead
falls through to the next iteration, resetting the running length, so
the tail is re-parsed as a full-size new frame.

The same fault exists when a single descriptor uses its second buffer:
GMAC4/XGMAC always provide a second data buffer per descriptor, so a
frame up to 2 * dma_buf_sz can land on a single descriptor while the XDP
program still only sees the first buffer. XDP_TX then transmits a
truncated frame, and XDP_PASS appends the second buffer only after the
program has already run over the first one.

XDP does not support scatter-gather frames until the multi-buffer
rework, so drop the whole frame instead. When a non-last descriptor is
seen while an XDP program is attached, mark the frame as errored and
drain the remaining descriptors, including the last. A descriptor that
uses its second buffer is dropped directly before the program runs as
well; in XDP mode it is necessarily the last descriptor of the frame,
so it does not need the error marker. Removing the re-parse lets both
XDP verdict branches simply complete the packet via next.

The buffers consumed by the discard path are no longer returned to the
page pool, and the new SG and second-buffer drops do not return them
either. They stay in rx_q->buf_pool[] and stmmac_rx_refill() reuses them
in place, allocating only when a slot is empty. This is safe because the
drop checks run before the buffer is synced for CPU access or
prefetched. The discard-path change and the in-place reuse apply with or
without an XDP program attached.

The !error guard on the discard check also changes the accounting for
errored multi-descriptor frames on dwmac100/dwmac1000: rx_errors is
incremented once per frame instead of once per descriptor. This too is
independent of XDP mode.

Note: the subsequent "net: stmmac: rework stmmac_rx to support XDP rx
multi-buff" accumulates the whole frame into a single xdp_buff and
supersedes this patch; the fix is kept so the net portion of the series
stands on its own.

Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 35 ++++++++++++-----------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3fa2c15222d8..30a2774d722b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5903,18 +5903,23 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 
-		if (unlikely(status & discard_frame)) {
-			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
-			buf->page = NULL;
+		if (unlikely(!error && (status & discard_frame))) {
 			error = 1;
 			if (!priv->hwts_rx_en)
 				rx_errors++;
 		}
 
-		if (unlikely(error && (status & rx_not_ls)))
-			goto read_again;
+		/* We do not support SG in XDP mode */
+		if (unlikely(!error && (status & rx_not_ls) &&
+			     stmmac_xdp_is_enabled(priv))) {
+			rx_dropped++;
+			error = 1;
+		}
 
 		if (unlikely(error)) {
+			if (status & rx_not_ls)
+				goto read_again;
+
 			dev_kfree_skb(skb);
 			goto next;
 		}
@@ -5926,6 +5931,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
 		len += buf2_len;
 
+		/* Drop the packet if it is split over buf1 and buf2 on a
+		 * single descriptor if the interface is running in XDP mode.
+		 */
+		if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
+			rx_dropped++;
+			goto next;
+		}
+
 		/* ACS is disabled; strip manually. */
 		if (likely(!(status & rx_not_ls)))
 			len -= ETH_FCS_LEN;
@@ -5975,17 +5988,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 							   sync_len, true);
 					buf->page = NULL;
 					rx_dropped++;
-
-					/* Clear skb as it was set as
-					 * status by XDP program.
-					 */
-					skb = NULL;
-
-					if (unlikely((status & rx_not_ls)))
-						goto read_again;
-
-					count++;
-					continue;
+					goto next;
 				} else if (xdp_res & (STMMAC_XDP_TX |
 						      STMMAC_XDP_REDIRECT)) {
 					xdp_status |= xdp_res;

-- 
2.56.0


