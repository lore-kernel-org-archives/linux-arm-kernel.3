Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4884B606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TEqZtApZ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6C4hTMN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOyecEF2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hjsj/Qn6cco0asQU0YaZXGiDQnlGG6v8Jw6AH2fRivQ=; b=TEqZtApZBL4ODD
	W7namKcVeSdV9ngrCbXQAAxJz6ZKVwmjdCJ5k//b7uGZYez+AgHdUjY6S4Vo3Fgj2QPQI3dy6zUqU
	OjEEy5ouKlGmZFYlD1S6U2nhkXDYhMvIQ6vnQo2AzG2BppNrEjXhJvaTF9ZPZISmK4C8YOMULHPKC
	TMw34sfZw1OnzmTONZfdoThsNzLlAlHYkWmQ9RCzE3GTD3M8kv3QoD5F5qomK7e9ge0imzirlZ6F4
	MqnQwm/VtOTj9KR3DTMQj47dPe6qJaIaMHDeV01fk+sspZ+qpdu0NpwBxcipgpeMhuQShGKKLZyJg
	pNE852NKInwo+QdZkWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMO-0000000FtAQ-3crV;
	Fri, 23 Oct 2026 08:10:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMG-0000000Ft5B-1dbG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:10:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDmV1767178
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hjsj/Qn6cco0asQU0YaZXGiDQnlGG6v8Jw6AH2fRivQ=; b=d6C4hTMNpEtUC447
	unNLVYCVe7XrfP+HPlZXXy4woRtzXQ8SC52PiAW29aKYJ4nhQhdYmkrA/XXuTItT
	oZY4EW6qKxcGOsSKM+wcttT6RCQT/uyiKBzvNwqDrZyOJ/4YY/qCrBwAbnZqv2qe
	+1wXM+OErzJIFFNEbCEG52yH2IQWDs65RXDMeoNcnNPdX2h1fRUB9oj5UhUizY2Z
	MU68g6lzWXnwjemKCplsSAjS16mx0OLwrfC7WE5AHNydU4fzOQrHDbAlUu4KDcxL
	HoEAmopwGaHyrwzoAse4yOKqtmZPl0RgpYwcE+x/84Hyc0ZH95I1oNew2ndSDQeI
	BDZWJw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahu3d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91becce058aso18825756d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743035; x=1793347835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hjsj/Qn6cco0asQU0YaZXGiDQnlGG6v8Jw6AH2fRivQ=;
        b=TOyecEF2/ljU6QUb1TCOWfei8z+QK4Ytog8jhc9uweZTTJ4BPnHEljIAkyEYzFaKvg
         aP1l3VBUshjzBBPEzXsvzOioGZUL25oLnrUYoB0DtyrV2yQnqFlzJ5W6G5gPEToMjc4L
         R1qoaxgnrx3+Olr1RsEHlVxLUL7uoF4sVyjcisBdOfoYnWQeQ7n2fg2R5abe9x6lpEZO
         a1+Toqtn/gr8f0pPSdahi9yijNGxIY3gssYsAA0iI/wgdI7XugDW5L3alFGSK8fomXS1
         QCR7Cyd03JaCUzY1O8Ch6qY844EFZysr6BhGc8V425ee77g2P7aXtFvwx9+/JRbYsfhe
         8OXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743035; x=1793347835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hjsj/Qn6cco0asQU0YaZXGiDQnlGG6v8Jw6AH2fRivQ=;
        b=zvtbzm2075h2BWy6Vfh9IO5d2HywWmtf1Hh8bZuPM6Kd6Gxii01boLIQrdiZiT7Am+
         j3ouDIN4wj99IOICin2mZ8Jfv1hjcYTW5stJub4vhk+RHAZx2BRyATFiMB03RAzIo76c
         wVr5OQWIrMoLS6t5JMRTn5OacK1DhyfOqtan9Z0OwquJHdjwymw8ctU8JEN1NoldT4fm
         tukNJIVp7KrCv3YPMaOc3z8EE9pyh9tCj8fztTIyC4vj+eYw1hlRD56KlRDkRC0QJa/Z
         mjzVoHoUiepxf9s11HJXzZ20x/KMydSpIU6tQHg3JIi/cYuziujwRdg5OXbFZoKlh/O7
         SKyQ==
X-Forwarded-Encrypted: i=1; AKwUvByM2VXiyMA0dKYPpHtzh+cgifxFSJQSOjSvfzAq/kEgt90Dp0GqXyaeSyZnTNC3wiOlALLceVdWRqLNuPyB1AqV@lists.infradead.org
X-Gm-Message-State: AFq9FYKN9gNOJxjxc2Gfv8LFdQrLNC6stsfuHiRNzQHbgvwj7SFX8TZj
	wFcZygmlwlHUTv/Qbjsw/TeKSAMIRsLsT37EpIxBUSAlOLlwmB7pWZVBUoiOJV05FWoUOVHfScE
	aQ4MVcbZnOkeSqSTZWxnZ9PNSCF/XXZl8D+WorP3QPAOHvd8LVUBtJtU2asDUAt9JGxKE7j0Y4g
	F1dF598dIyAg==
X-Gm-Gg: AYBFou0nYBf2sV/YBlWte1ogsfsTymO4q9hSip+cPlGvDESXdYDH3toV0PlZ01iAVPr
	bfEB76eYHfY2F5vc8DdOprnVbFoRfPOLsc+1NOS9FjGFvHAMGSqk/7eEFCyttqvYM3loAWhGgX0
	FPrSAW1Wxshg52bZyIut1Ophi2jJBl+ZyFzQdUDcZJlyj8h+OXDYW+sT5sG28bJw4OkB5F4FBoW
	OgamIRAe/FBJCMgJnVw6nOHX/10FEJ6ZRvhM2ZDu4EzW5L3dghqJLW4gVHqxq+JA2V4vM8vJR8x
	CfH83kI8KDFS2lFIhKwR9TFv+53G9hPP/wzc/CREilAG9mKVHyk8kDERZkEsu0kgbtnXGNNhSOb
	ki5MvMoH7l58=
X-Received: by 2002:a05:620a:6f01:b0:93f:322b:2209 with SMTP id af79cd13be357-93f6f7dc507mr282689285a.28.1792743034504;
        Fri, 23 Oct 2026 01:10:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:93f:322b:2209 with SMTP id af79cd13be357-93f6f7dc507mr282686485a.28.1792743033886;
        Fri, 23 Oct 2026 01:10:33 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210361ad6sm55148055e9.7.2026.10.23.01.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:10:33 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:09:53 +0200
Subject: [PATCH net 1/6] net: stmmac: take ownership of saved RX state at
 poll entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-stmmac-xdp-fixes-v1-1-efb37e19f5bd@oss.qualcomm.com>
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
        bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXxo1HUaFrMAOd
 yNCog4KJjwIERfWIcqOt6vgI6jbYNoIXMO+dlI9Z4WoGI/K875L3Gn3zx8XRDC2OVDLCcH5kifl
 nenczFJgWTUmXj1a0gHmQk5TBtNGubY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX9gOxU8dUnJpU
 AI3228sbhQNghLTgbwTpEL2eyj2G3Qt0hzQXO/YhPCdW0wuvyAjju/1vRxduzWQkVEcM760hEw3
 P9+/JEa6oJffheGNh/V9T/fj1k7K5Z4yvFlij2mnL+PSUCOc4bPJQS11ncbeJF2LOuXW3T1TlNH
 ZG3Fi/DUDnNqmzdwISi9iIUEqgHRK4sEZ8UJ4ycagGNXs4N6RVGHIKSpT07c22j4YjaMd7Qm/yh
 Ynh2PDMSPIMKAPc+Q/kBxNg2c+z/+D5bpLv130iSKEHwa8y+q4Jz4JOIMOapgJFIKeYK893nQAu
 VOSK4b7ImTy4UFNd6swGN+R1CAiEx89ZUBtQ0RIPYZ8TN35VQ6tnB/oplYEzaxCPrcaZf+2EqRE
 vnVCwA2RqLtKu4yCqqvro/Cao2b9GNAM6eMvDMfs2GCUAn5SiWhmtoxjn7UdCsf+9TOEDsV1vXH
 7uCY3qUoxW5cbKOfXAg==
X-Proofpoint-GUID: cZNuUqs3Gvm9PS_ZJX_gQjawZNn9ZBa5
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb167b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-gjLCbu4MZEjzEcwt_QA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: cZNuUqs3Gvm9PS_ZJX_gQjawZNn9ZBa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011036_567504_7D498554 
X-CRM114-Status: GOOD (  23.59  )
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

From: James Hilliard <james.hilliard1@gmail.com>

When a saved partial packet completes with a poll budget of one, the
old loop can leave state_saved and state.skb pointing at an skb that
has already been delivered or freed. The next poll then reuses that
pointer, causing a use-after-free or double free.

Take the saved state at poll entry and clear the stored ownership
immediately. Save it again only if the packet remains incomplete,
including when the next descriptor is still DMA-owned.

Track the frame-in-progress flag independently of the status read from
the next descriptor. The old code keyed the save on the status of the
last descriptor looked at, so a loop stopped at a DMA-owned descriptor
(rx status not yet valid) could drop the saved error/length bookkeeping
in stmmac_rx_zc().

Drop the saved state both when the queue parameters are reset and when
the ring is destroyed. stmmac_reset_rx_queue() is reached from
__stmmac_open(), stmmac_xdp_open(), stmmac_resume() and
stmmac_enable_rx_queue(); without draining it there, a partial frame
saved before suspend (or before a queue is disabled and re-enabled)
survives while cur_rx and dirty_rx are re-armed, and the first poll
resumes that stale skb with descriptors from the freshly initialized
ring. __free_dma_rx_desc_resources() releases it on teardown.

Apply the same state handling to stmmac_rx_zc(), which also leaves
state_saved set when a saved frame finishes at the budget boundary.
That path saves only error and length bookkeeping, not an skb pointer.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 72 +++++++++++++----------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b20e5038eead..fba21599a5e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2182,6 +2182,9 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		dma_free_rx_skbufs(priv, dma_conf, queue);
 
+	dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = false;
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
 
@@ -5629,12 +5632,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int count = 0, error = 0, len = 0;
 	int dirty = stmmac_rx_dirty(priv, queue);
 	unsigned int next_entry = rx_q->cur_rx;
+	bool in_progress = rx_q->state_saved;
 	u32 rx_errors = 0, rx_dropped = 0;
 	unsigned int desc_size;
 	struct bpf_prog *prog;
 	bool failure = false;
 	int xdp_status = 0;
-	int status = 0;
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
@@ -5645,23 +5648,25 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
 	}
+
+	if (rx_q->state_saved) {
+		error = rx_q->state.error;
+		len = rx_q->state.len;
+		rx_q->state_saved = false;
+	}
+
 	while (count < limit) {
 		struct stmmac_rx_buffer *buf;
 		struct stmmac_xdp_buff *ctx;
 		unsigned int buf1_len = 0;
 		struct dma_desc *np, *p;
-		int entry;
+		int entry, status;
 		int res;
 
-		if (!count && rx_q->state_saved) {
-			error = rx_q->state.error;
-			len = rx_q->state.len;
-		} else {
-			rx_q->state_saved = false;
+		if (!in_progress) {
 			error = 0;
 			len = 0;
 		}
-
 read_again:
 		if (count >= limit)
 			break;
@@ -5700,6 +5705,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (!buf->xdp)
 			break;
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats,
 						  rx_q->dma_erx + entry);
@@ -5772,7 +5779,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls) {
+	if (in_progress) {
 		rx_q->state_saved = true;
 		rx_q->state.error = error;
 		rx_q->state.len = len;
@@ -5814,9 +5821,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned int count = 0, error = 0, len = 0;
-	int status = 0, coe = priv->hw->rx_csum;
 	unsigned int next_entry = rx_q->cur_rx;
+	bool in_progress = rx_q->state_saved;
 	enum dma_data_direction dma_dir;
+	int coe = priv->hw->rx_csum;
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
@@ -5836,25 +5844,28 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
 	}
+
+	if (rx_q->state_saved) {
+		skb = rx_q->state.skb;
+		error = rx_q->state.error;
+		len = rx_q->state.len;
+		rx_q->state.skb = NULL;
+		rx_q->state_saved = false;
+	}
+
 	while (count < limit) {
 		unsigned int buf1_len = 0, buf2_len = 0;
 		enum pkt_hash_types hash_type;
 		struct stmmac_rx_buffer *buf;
 		struct dma_desc *np, *p;
-		int entry;
+		int entry, status;
 		u32 hash;
 
-		if (!count && rx_q->state_saved) {
-			skb = rx_q->state.skb;
-			error = rx_q->state.error;
-			len = rx_q->state.len;
-		} else {
-			rx_q->state_saved = false;
+		if (!in_progress) {
 			skb = NULL;
 			error = 0;
 			len = 0;
 		}
-
 read_again:
 		if (count >= limit)
 			break;
@@ -5883,6 +5894,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
@@ -5895,11 +5908,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		if (unlikely(error && (status & rx_not_ls)))
 			goto read_again;
+
 		if (unlikely(error)) {
 			dev_kfree_skb(skb);
-			skb = NULL;
-			count++;
-			continue;
+			goto next;
 		}
 
 		/* Buffer is good. Go on. */
@@ -5973,9 +5985,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 						      STMMAC_XDP_REDIRECT)) {
 					xdp_status |= xdp_res;
 					buf->page = NULL;
-					skb = NULL;
-					count++;
-					continue;
+					goto next;
 				}
 			}
 		}
@@ -6032,10 +6042,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		/* Remove FCS if needed */
 		if (!fcs_stripped && pskb_trim(skb, len)) {
 			dev_kfree_skb_any(skb);
-			skb = NULL;
 			rx_dropped++;
-			count++;
-			continue;
+			goto next;
 		}
 
 		stmmac_get_rx_hwtstamp(priv, p, np, skb);
@@ -6060,14 +6068,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		skb_record_rx_queue(skb, queue);
 		napi_gro_receive(&ch->rx_napi, skb);
-		skb = NULL;
-
 		rx_packets++;
 		rx_bytes += len;
+next:
+		in_progress = false;
+		skb = NULL;
 		count++;
 	}
 
-	if (status & rx_not_ls || skb) {
+	if (in_progress || skb) {
 		rx_q->state_saved = true;
 		rx_q->state.skb = skb;
 		rx_q->state.error = error;
@@ -8412,6 +8421,9 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 
+	dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = false;
 	rx_q->cur_rx = 0;
 	rx_q->dirty_rx = 0;
 }

-- 
2.56.0


