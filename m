Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D370606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PqkmsdfY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3vVEUsN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiZoY4H3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LZ4WRLlBWNlzgKoZ6xjmyCXgKrbMPKnWr5tgehi8fhg=; b=PqkmsdfYoMNo2O
	7OqKHdgRc6vXMWg9puC6T6RwpSTFARulmE+tF10O1uTdbhlOb56OtTnQiXvTbS/CEUOk9oHryTpDH
	35oBGv7PT4xx2h6tK50zwr36/znLIDhlqZYP3eTPAxakV1JWWJKXKSEdXD55XqP70VRQs2sN4D4qy
	p0jb6uKNftzz+xGqfQ0KIe0KJ4hLn/VlreKIgPRJfj7RYyeZOMXh0YnNKfQg5bV7wg48Kt4z6xB7x
	AOsbv4qyzIO5a4o+q7JoK9xlQImXvKz0f1MHgizGJnK9OLGn5C5rnDwUZKBMR431XBM3j2voCn3nv
	lFHNdVyA6PCugaSoZHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhY3-00000004vqy-0dng;
	Tue, 27 Oct 2026 13:49:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhXw-00000004vlW-2pkf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:49:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxGb2458146
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZ4WRLlBWNlzgKoZ6xjmyCXgKrbMPKnWr5tgehi8fhg=; b=Y3vVEUsNC330BLEp
	JM0cQuSacvAwmVnVp/VCR0EEQihekahq5pngYSHdDr9MXc937gqUS5o3kIpBgRns
	lJKWiylUA4bfLfGXugfQOCL8hpYqtlk8PQKPwThLAmePpKf/r9Aj8YA1yTxoNu0Q
	/AfwSNaK9WVfYQzExYDc3hX7CmBPN9l1ls5Yy6D5WJdTDwtroQAOlc0Itoc09Td8
	A0Vzk1TlZ++3Mzm/FcVSczhxYRwEPlJaTFgbts7eJCRFyqpf/8MLclCeW39lYF44
	k81/Nc0rCyS7rr0TVaF+o74VsuS4Ku6Fcwn44zjuxZbH6NBuIl3gIaINGMXdfgps
	b/37hA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtajj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:48:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso554219785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108939; x=1793713739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZ4WRLlBWNlzgKoZ6xjmyCXgKrbMPKnWr5tgehi8fhg=;
        b=AiZoY4H3Nt/ZZUNOll8AW1ccdGvr0QxSA4clJfCTwz5DPyyBlRxdodL+w/eq4coMdU
         qKyjiAZ5MjyloELHnphzcrlgiajyBBuhb6CpiW2ayU0IzFBczvNgzWHHhARbpWhnT2c9
         clCPalpI0PZVIGVc7D/MqDXr6bkDfanzL8k0ynwaD4114DPZwFTNjk2uGpA07rRPQMCV
         i5NKtEct/cILGd8DrIw68zN6J7L+tfA+TtnI3Y8eMrqr/SKdnlLSjCsE6xXTkeb7rXrX
         D0oUxhSPOUh4QqE0O1zp3aP+YUAX5gGpFTs5PgeEfSsi8hYs57CDkq7xZq45tcH+YBN7
         HvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108939; x=1793713739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZ4WRLlBWNlzgKoZ6xjmyCXgKrbMPKnWr5tgehi8fhg=;
        b=dtAIcB2NSXCEU8OXlc8nKkG6qLnz+TcN+4Y0j0jPtA01a15uQUwgnmL1CrDKfObg7L
         1hOTcTdoFQQ2AKs9JKDRJJ+gejeEshOMRv1nba0+m/cszuUtqMcx2ORP2Hu+WWK6FhBp
         ngTSZFGjmAkW5hCqoLZD3XTFjVbcLF8CPBTFRx/ClNmuAacXs/LNcf7gm38ndk4sUnXS
         TnhDeqi1qg/Bd4LdpGLr9yWGHCTfVSOF45iaHtBdCA34RyJvSd9bSf4Ap7Zdj+sApo6y
         1BHQ0I8CWY3Q7cxn7KpSbu/4Vi6ZcLqjn5+BysMW3Z0Rcnj04f7I9mvLK10jFNQSswZI
         isCg==
X-Forwarded-Encrypted: i=1; AKwUvByiRYRNxcdqupbaMH4UZ8giZKi3s+kdAFclEMSBPmODLzZkx1YqKSUe+ybSbLc5dpYObMPQkd7Ne+BH3OixpNkN@lists.infradead.org
X-Gm-Message-State: AFq9FYJ325YhB8J37bvmZhNOX5PJ8o9mIZfyNRvFOcPhps2IwzNaSqjg
	MR3Vl2rKO8MTst2lIOIJuDsYQ3v+jolJ7Fa28LYLHeQD/vO5gND5eNY22VGZDdxnp79bDXLU13D
	C5E4o0P/6r44uaHIREOApIfa/d+9i3dGQouZweDdVXfgz8Y+9kXH3or9WQMZ/Vji2CpQd2jPCI+
	gglw==
X-Gm-Gg: AYBFou3i+1fYOz1Ird7lVyMs60KzMd/VzYjaAwha9aGUTBQM9HO3QpxPohFOkeEpuUu
	X+rjB0qLpRH27kaqRWCh8FQ711KXsYlrc6p/ff4syIRgTnngJUoQCX2AZMMSP0vZSPL8XvaLHRi
	BjI3nCuXewx4GhOldwiCR7I9zJ+xyvyWM88LXp9oVIhdunIvmyLliNAkeSSiXsnn8EXCs+AmROE
	rmCpJGLEu9d39K9cJFzkZqvnDbpvBGS9LjeNqIJEF8OqDZ9d7uBNC2RT6aCKWj+eoFy5QqPZnCJ
	6C6381rR4mBMuTolxfloGvd7+hsgKm90eygNX8cEnmYkqw37XQGdT8XYxEJsWtYTtXcHatY3/dc
	6ifDSeUsNKSY=
X-Received: by 2002:a05:620a:4725:b0:93e:94f2:ada5 with SMTP id af79cd13be357-940ef914f06mr1534342885a.25.1793108938564;
        Tue, 27 Oct 2026 06:48:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93e:94f2:ada5 with SMTP id af79cd13be357-940ef914f06mr1534336485a.25.1793108937851;
        Tue, 27 Oct 2026 06:48:57 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm459291666b.67.2026.10.27.06.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:48:57 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:48:36 +0100
Subject: [PATCH net v2 1/6] net: stmmac: take ownership of saved RX state
 at poll entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-stmmac-xdp-fixes-v2-1-10eae8a093a8@oss.qualcomm.com>
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
        bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX0AwXjmXSS694
 hQoct88SkqjSTffckRAjnYqKzMSjp5sBIn5ElkNjgHAkkP45IgVntyRYsPqFn81AI/ghYHdIRs6
 SLQ/S1gNoG1H3MUJsg24MAPfKiAcVwU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX8PHS4EIAX7ze
 Ehjq1tYc+W2KM1DNJZ8M5v3UP0sfgB8xDCnhcLLXpHR2uxQAx3ILsHdyUHCUAKS1kn9zXJGOxBw
 yUszZ7MvlIinU4GjO3j6GWbE8EU+uZleFsaPEfxTo8AOdZuRWhF5kdQYblMxznnTeVMdaPJAT+i
 US/gMtcsqqFcf6ul5xfrdTe5Yidy+BpjqXtSQ/J6n/E/Y+oHj1z9EMFkPqh+WJ9L5DcrVzo9Axs
 6H3a1GRHJax5MDGi4JVfg5hCv+EX08UOTTg626VkdGSRSqBKh4RbmsMUJIkS4y1zE9cm9ul9p/d
 UUjbzWsbPBQX1+jx4yOQwBL9TgEb2oh/yuD7Ck5AF0hxlvWuyGbTx9KsSH3/qkCSUDwX1UO+rga
 eITh11OqdvDUFTGYXwpq6JZCiyRcaTOB9ZB5AMgjhonpC2HiN87dMv5G5W9Wa4BU3N/ceFn+IPR
 e9XINowqXtqsPcp91Lw==
X-Proofpoint-ORIG-GUID: 1rpKwKloJooaQwpNsGZrzPZTvoDbW4Sv
X-Proofpoint-GUID: 1rpKwKloJooaQwpNsGZrzPZTvoDbW4Sv
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0abcb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-gjLCbu4MZEjzEcwt_QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
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
X-CRM114-CacheID: sfid-20261027_064900_845081_978057C6 
X-CRM114-Status: GOOD (  26.02  )
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
survives while cur_rx and dirty_rx are rewound to zero. On the resume
path the ring is only re-armed in place: stmmac_clear_descriptors()
sets the ownership bits and stmmac_init_dma_engine() restores the tail
pointer, but the RX buffer addresses are not reprogrammed. The first
poll would then resume the stale skb against a ring position that no
longer matches the descriptors it was built from.
__free_dma_rx_desc_resources() releases it on teardown.

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
index 9ded31150fbe..fa7108919e90 100644
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
 		if (priv->extend_desc) {
 			/* Read the extended status after the own bit */
 			dma_rmb();
@@ -5776,7 +5783,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls) {
+	if (in_progress) {
 		rx_q->state_saved = true;
 		rx_q->state.error = error;
 		rx_q->state.len = len;
@@ -5818,9 +5825,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5840,25 +5848,28 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5887,6 +5898,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc) {
 			/* Read the extended status after the own bit */
 			dma_rmb();
@@ -5904,11 +5917,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
@@ -5982,9 +5994,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -6041,10 +6051,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -6069,14 +6077,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
@@ -8421,6 +8430,9 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
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


