Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE6BCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuauHqAYJcl8PxqGK0q+3PiavaDVcWJtRS+LDFPXsAA=; b=cZW1NJP6bpmQcD+rsW57ufPUqK
	RvrTQ55pgHfPZ69m+pAs0O01GMwWJGo3F3jMMLGGBu5QQNNJSasXqOzKiS84+1Rim7XN4bljZF5S1
	Bvv4w2T/+OhXQ3+IMB71b5yjCR4cO4MgboyV50nIkjrii71z0mo/BchPERmataarc8YmXSKV+3y2i
	Mf7w1dz01Jdh903mFm9cfjGuEUZM5ds0ER9NWfk+W1Yr2h/fh0ddIoyApqLsClR8xgLzfyEKpdNTV
	UCXeOwmnRoLtIJdZF8LEy268C0P1B5efecrgnzhi7mOD6b2mES0LJq/ie/cjvVcZXxnsNGEZBI2un
	LHa9pmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGykA-0000000FXXb-023J;
	Wed, 14 Oct 2026 13:10:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyk5-0000000FXVi-465u
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FuauHqAYJcl8PxqGK0q+3PiavaDVcWJtRS+LDFPXsAA=; b=UIjtsdPx35g+HyiFgB3JtQkwUj
	6nDlg8AcM0bQFQG/cg/kowk3EJTR/kN1atMlTzzW+QdlKdD9/jumBEv85kloJowz7jcTlxLGQiLUR
	o8ctmu3vJS6RcW8zhxQoXEpc/ZiRJ+ZMe/5gv/2o2ZE1xjsKgbeEHSPN0Fp8tXkc/x3qKV2Ow2Iuh
	ol8LaDakbdSXTaOOQvPJc45fgYELIGl22D6JVPltVpVPymZ6nLCeecaW4rleC0los3rJtnFjap31w
	k8OnZTo5b3z6H+kVz6JwgcZK+iiBmdR6YRdCSR1v7/9RtsUmnIsj9IomdUnor3NtTIPgcAgrOnjf4
	iv0h8fqA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGyk2-0000000GnWy-2fvM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:10:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBRQQm2516002
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FuauHqAYJcl8PxqGK0q+3PiavaDVcWJtRS+LDFPXsAA=; b=QdMrvq32MuedGw49
	cUwtjRCp/zpa06rkb7rKfPu5yOj1bOD+eN4fKAaHzr6DiT+3bdw/qV/W1iK4jJq9
	6uxSBsY87bA91zyJv1ncWD4p6lwnespSOs6W3plhc1J5O9Lvgy56R4FtOJfvzFE4
	dyzRyodaFT/XnQ8FU9e/YlP239ASklnOh4exLrpwJQwiAZbnJlt50gazBYmc0IEM
	8Tjk1a6Ghi+G8XfddBqZ/5stGUr1xngd/biHVFSgwLOqu/RObyIXcSClH+XJ2lsJ
	+dEssA5cwmd5+s1TJEwMniY5NE8GqO+V7KVxkKi3gGUjMxEoMahWaDNGYEQm4TAN
	5K6wjQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709p14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:09:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso80520e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983396; x=1792588196; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuauHqAYJcl8PxqGK0q+3PiavaDVcWJtRS+LDFPXsAA=;
        b=S6jxpNmHXeXluAlx0sw0QI12p+LF1q1T/5mhAfEl23PzrDS0pptWYhqrqJb+ivZPfX
         HRsCmSNhIW/2V+RY0QjIbj/6lOxvEWGrCmoHBpTok4NGcmKlyzh2EpqvGW2PxMPZ2Tx8
         tMfc/ljyJ/SM4eAwjab2NOlCgzBXQrLIbVZnWrkdge0LXHZRLMouHyTeSKt9MDT8ivaw
         hk1aKflQDH4x2Tih+TkeYhBThCuOYdwPoGTK/l9X70zfQKSnAZixIYwE5DIDjX9CVjNA
         2o6rwwILSlvyyA9DoVb/a/zlljvQCSct0DH+XeneweVnCwofLxe+lQ5W3ca/7thse865
         RP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983396; x=1792588196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuauHqAYJcl8PxqGK0q+3PiavaDVcWJtRS+LDFPXsAA=;
        b=b4WvxlM89wF7Bj2NxLalJOScrFLK7tCZBAQrdLyqBX1HAd2IrQaAmMCzbTAeaWKve4
         2l/53egD7uassO5q5i4Z69gAVh/2rIg5b6BvohpvKH33ULHU8gxVz0hTh0BO1KYv7fEJ
         GFRLsYTP1eA1Hc4hMg6xcLQ+O4439EF9WX6Me/JOAAQHf7oJJDJjDu6E1iWOyJnVAPEI
         bvh9KmLH8eLFYY3q1gUtaeXnajqX7dfduggeXvL2fcvBhuBF2XFZWH/wZHrAod8+MJ+P
         0HbSs4ifwwDQZG+WSRotThdOHCfiuzmSFfKbcqMIdWpXf3BTVpHm0jtnl70qroROE0lf
         Go6g==
X-Forwarded-Encrypted: i=1; AKwUvBwJazAckDWwQ0kEwetmUrW0Bo2CriiqqXbA2Ue0dPGyBU4P5NnZh8vb4LhztxUl7xKfw8mKGXN8w6004MKO0GAk@lists.infradead.org
X-Gm-Message-State: AFq9FYLWtjvecTnUUrBWeHxS3ODZLcLa+SJieFEPubkOjgfC5LOa7nvh
	pzhKYki1lJFmluphPIv9JjqRsS3qckkZldoOJIPJcFG4cje1DZ13EAywbOR/F8yr47hZ8kVkOEZ
	3Pbbm9mDSizucbCTVjBxcOavbKyeKQaS8oKeyfTh5Eqs9EsYASxMzeSrWA6T442Pkit0oBsHuBR
	Ljvw==
X-Gm-Gg: AYBFou0PEdqk+XbgD5psia1ejRpo+QoDNc1ckCqifJIggTI9W8Sji5MmQcQmPV97dnx
	HYzC1Er5SnbTLFCLfEa73ca/rb2bMzgQ/+Ep6oRTW1lVwkmCOntY64sxaTILeEFq+IDCZVCuXFp
	u62so7lXiJ8ejErZxHwt2WOovNQSOP1XOPjYr8UM8QtooTx4WFY3e20ojEkedx8450m23w/62ce
	k5xTroHiJmeqkQNGh7mqIUXpP8Y3XTX7vkl3DP3enwMcDXAcAluys0Rk9wxTKqkYpMlnPllri2C
	90vQA8PJZvJSjnWlxMr63fGqi7wfc3QxgpFhW/Yyz8HI97vYeUBOhQAyYTfxYW8kgHNFmb/xwqC
	VaOr9+6flLriq/Q==
X-Received: by 2002:a05:6122:3286:b0:5ca:fc48:5634 with SMTP id 71dfb90a1353d-5e91f47b6e6mr4751580e0c.11.1791983396093;
        Wed, 14 Oct 2026 06:09:56 -0700 (PDT)
X-Received: by 2002:a05:6122:3286:b0:5ca:fc48:5634 with SMTP id 71dfb90a1353d-5e91f47b6e6mr4751540e0c.11.1791983395431;
        Wed, 14 Oct 2026 06:09:55 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcebf6aesm997105e9.6.2026.10.14.06.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:09:54 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:09:35 +0200
Subject: [PATCH net-next v7 1/4] net: stmmac: take ownership of saved RX
 state at poll entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-stmmac-rx-mb-v7-1-5d2d70f052cd@oss.qualcomm.com>
References: <20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com>
In-Reply-To: <20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com>
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
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX6A82ZEwyxz/L
 +WCNBlJJ9+mYvnsin95tHBp65oTz9S4HrJW5zes3N6twsfvVn5gwJHyQYUK0VQvP5JG3f+vyypv
 IRvvRW64166DVQ7lH27oRhK17p4yPHeW1uIIwEGkA3LjhiA6GcCdqAnZ+B+nPh/d4bjZBf0SpfH
 xmiN8FksXFvePm2REZ/PZYJ4adgs4w0yod5SH2VLRMLab9YzeTDNvV1B5o7yIsS//nPnWC1hvmh
 9Zqj6g+lpiKfZ8iBpFU/g6Efo72erSB6hf3hGCaghJHBm78P0XQ/ulrkiPhfuclYghRiGMgOtyD
 qSwgSUzgU4kyhSFGJBFSsw/LXT5oyW9dWIgdwrNZPNS/LjNOm060RkRTB0xR90Dy0YekB2NftOt
 hYMBjYFmt6ThdhNp0gWF6OkPKsXWWQZuH2xbWZsZ2DiQwLwSktWT2m7FD1Yte4BplrLyYlCtliC
 3YboHn4TmbQJ+8kMhmQ==
X-Proofpoint-GUID: RyGe1MNWw9dBVEfkZ7NlxhalAhD4PU8x
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf7f25 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-gjLCbu4MZEjzEcwt_QA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: RyGe1MNWw9dBVEfkZ7NlxhalAhD4PU8x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX579Z8FO9ml65
 YQSmxLLc0HQzEKceR6x8+hSM7exu2O24ReNO9WEVbxmRnKM30s/KSVw/P7OpnwMceAGRKb1oN9Y
 zXcOSLQS8skt5lEL5tizffWYofXulQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_140959_152868_AE4DC660 
X-CRM114-Status: GOOD (  24.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

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
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 72 +++++++++++++----------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 56d89a696272..f0835be2f65a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2180,6 +2180,9 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		dma_free_rx_skbufs(priv, dma_conf, queue);
 
+	dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = false;
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
 
@@ -5614,12 +5617,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5630,23 +5633,25 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5685,6 +5690,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (!buf->xdp)
 			break;
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats,
 						  rx_q->dma_erx + entry);
@@ -5757,7 +5764,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls) {
+	if (in_progress) {
 		rx_q->state_saved = true;
 		rx_q->state.error = error;
 		rx_q->state.len = len;
@@ -5799,9 +5806,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5821,25 +5829,28 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5868,6 +5879,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
@@ -5880,11 +5893,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
@@ -5958,9 +5970,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -6017,10 +6027,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -6045,14 +6053,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
@@ -8399,6 +8408,9 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
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


