Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19A5C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=egCUu3HTqrsn7eQkpEjxXZvLWBaQva+luRds8de5Z0U=; b=Q+G1oY7bJ9FPV7enoE3OIxESFy
	qa87gEu+ExBM7GEip5dKpG2zXIUfG/YtRxR7r3NDazVoYiF2opRK5cHv2TCo5O3hMIIQQXLLYNecr
	Bu9CBNkHSFHmXf4RdP+/XLC/1kilHn8mQg3UAYyXcazR8ZwKFZ58nqmH+IZlsQeGrzKXFaWItFewp
	yaSoYjY9e8ceIx+2YET5jh+v0+Q1XwcA8sgzex+VOr52aMijIMCkO5Rv5UtGbHnHduCD6NNPDAQfa
	DivtzVJBRn1CPzwZdVxgLBwzSHTD0UsjS/R7yd1DD6LlRlYEqihktxkD20gomgkyQniz0pWsAoGXi
	5k8mPS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jli-00000007pnj-1s2F;
	Wed, 23 Sep 2026 10:00:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jlh-00000007pnE-2Nsh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 10:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=egCUu3HTqrsn7eQkpEjxXZvLWBaQva+luRds8de5Z0U=; b=AeC0lvaZaELVvdX0nnBe34H5Kx
	GwC7kuzCEW0bgLjlPB1fpzFz4UWv12a0R+oTOcB2HPdJB33IST6ED1j79t7VlTYbEf8GJLv0cmaWe
	8Y05gD7D/iwAwoGg7UW+4WRBKfW4WBNOu6tKT2TgWQVpe2ffump2HEZDPm3uz4UK4AiCXR34/rgE/
	88/DN88lfmoY6pHUPYvixVMYV7bSYLqKQXKJIzqVbZWjgByMr4ta0fYx+K+XQqn44bFTPCsXOJqfk
	0+zeO3JA3jnhtEhtsIns6lio0828O3V40913DLl2UOK5FCmXFVB92zZVOjm8/dDyNhn3y8axARQTk
	4CvoRk0Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jld-0000000CeDJ-3GaL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:00:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jfgc3332812
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=egCUu3HTqrsn7eQkpEjxXZ
	vLWBaQva+luRds8de5Z0U=; b=pULr+Xd8XAVBz/sdE5twh4HNRw+ebJzrrThyMZ
	pLNHlC5/5hqCICWIM81lHUCQtuPXFBFqVvWBgp9UXQnu2MjZjSd9ojDhht8sHWOL
	6hZ7nvf6JDbu2ow0+RBko8FVnhHcUTCox1RPxU/8Q0Q7J8lZfT3ZuojeHyI2+o5o
	dGJjbPDdZxTKenjWWQLk1tv3enPkROH0Z6grTlrXLBBSWFhARco+ieEoddI0pBPI
	80QR8LhuEhYZ61prP1DDmw2ihAtQJtooHlIMeZZR9zWJC6Aa8jc3JQvThhzgBcVY
	LpoR8QyDaCTLuR7CVUcjSCf680HGzTsCnYH76z62NdfMueOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xus5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:59:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1e564fd5so145050785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790157568; x=1790762368; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=egCUu3HTqrsn7eQkpEjxXZvLWBaQva+luRds8de5Z0U=;
        b=aLyGjgMDkdNvw2/t2mxIlCe/IOS7InSqeaIX0Fk+B33iSnjE+Lg4q9X6nMiHvp2lbx
         wyQbsMRiM60ipVtEob5c/vznZb+cSHKdi7x0pNteuRBz7FJpBcAp4kyD8JReyHSo1UHS
         Cr6pK82DvYxJ+YLmHysVQDpJt/26WdFiXZRtP7T5xoqSBTrSDvxGnC0dR7r6P8GJv485
         YGaPFr5lxnO5YRi2C/k28bWU//3eOJaIIsBpOixAg9eHhEvsYMyioMCPLsMk/fDPLg8R
         khV1trpNnarbqnzuAKchN1DgtvWsduoS+es9/sMekwaLi+NWyEsL0BU88CKKEICyvWDg
         6BEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157568; x=1790762368;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=egCUu3HTqrsn7eQkpEjxXZvLWBaQva+luRds8de5Z0U=;
        b=ixyMdyJtDo0FuxTR/yErf/vR7PW5hp6b7mTTD6CsnN828BurL5jtkrGx9jyVB4DAbb
         Ko47RER4+Y+hRljqPQEqJdkvI0ianoMF6igtEz4jldCcZlQzQ8pdpf88/PJuKqCgKMEN
         dyHliOqKKJEvTH4N3mn5MMepGF6D1AVSO9qw0MiZnE2c1ep7A0CMXMmwSLFecH3u60Am
         IfGZ6bmXImMozNSTcWss6d2inEnAqDDDStW5EC4Zbmq0P8dL4Xv5dTSVSZQmmJJ/IkmZ
         AeizSz8wk5kavuEPfsk0iuHbi2BHR14ekbVzlTdMkHJDlTJ/N7xaPnT2r68JAOeIuctK
         oUAw==
X-Forwarded-Encrypted: i=1; AKwUvByyTJTx5ld7dumSoVw5clylmDJ3rBN0opBg8sxYjly5n+gkvurQK4gg2WZBo9mZE+0ptdlosjYoA0IbMpOFVloV@lists.infradead.org
X-Gm-Message-State: AFuF++kGB8qUaPp4R2pGoQFcCzNwdR86SYJiO9ciSPOBKnrtJhFe4fNb
	NqsShRzWAPtHmFSAQZdYtqHOjelDC+TMGLJjPm+THfJ+064JcGYPVqULiewXcaHZcm2mQIisa47
	NiYfHoJqnhqFOsF9iH/IZ5x+ivHsDnZI6QWkIAS5/mTpcp+c2KgVDHDW3vo08iD6KXIqENrFCXC
	Zgmg==
X-Gm-Gg: AYBFou27wHMWG8Vo3bIF69xqoXvoYR272Ku1j393PPWgnbqhe/qEvy0WvSXJIMbQhya
	sYS7vGxu55RMHiY2JNGn/5nfJEyWcO+R18i5DzqaEpIqMUzcGeMsC8x/5zoWDZRHQrf3PG4/6v1
	+HvO95lz4AuAn5YQi0onBSXhNG/j/Xc8X+Wazxyd+jXxyAvZNpBy44tg9ZIrpF0qcByJLRACVOu
	hJqgvzXYSj7YaL3qaizMEd4BHT+LFAceu+ezah2GIkd3MFhDjAHvKpL1FcihPCa9n1N14n+hsak
	zpueiHYzgsa8zpn0scQdt+kKkfuT46vRoTXeCXoEBOIsb8oLJNz7nnR+qH/2s4bxeK7pwrhB0wH
	QerJMAFVgtQJLXA==
X-Received: by 2002:a05:620a:269b:b0:93b:d7a2:83cf with SMTP id af79cd13be357-93c2528273emr274070485a.62.1790157567797;
        Wed, 23 Sep 2026 02:59:27 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:93b:d7a2:83cf with SMTP id af79cd13be357-93c2528273emr274067585a.62.1790157567272;
        Wed, 23 Sep 2026 02:59:27 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e596sm1310754a12.7.2026.09.23.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:59:26 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:58:48 +0200
Subject: [PATCH net-next] net: stmmac: add XDP multi-buff support for TX
 side
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-b4-stmmac-xmit-mb-v1-1-a71a1c522142@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswkbKuEi3SppqFFiohSHdPW
 r7F/wUiBaYIU1Mg0MORL1/RtQ3Yc/UHIW/VIIXsxSglGoUxObdazI4TOoPGDJpEr5XdFdTuDrR
 z/p8zeEroKSdY3vcDU8QwMm0AAAA=
X-Change-ID: 20260922-b4-stmmac-xmit-mb-bb78e0684cf4
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: MutyWET2FrbXXQUwVL2S6AoOqknzi5NI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXz/87hPHVOwZT
 Af2Cuxp/T6NZxNUCgH7zUIk3KiXaFr9aEJUblkAXhhrnTxCNf2ngrQFvkOejxZJu3al+yQ/v245
 Gs0+oTtJoppkh4QkW6MHMmqHZxQHOcfDMfTdPloqjn74I1MKmYPFq+Cs5EcfEWTEBx3fo9KGk+I
 xxxy8xPpLGeDIhOLZhaaiigV/KvmZ4916oa20JhSXj+Z++I/wAr1LYe1+o6s46t94/qMlXqSP/b
 eVQPMv52fo4nMgMD2I25h4X116L/vjQnqQ08YSu3IU0BCMZPW4JJc4MJ6/kAkE4ve6AGA1F4bPk
 TKcri+OcAtDCXvoQXb/tUx/N0iDSAIl8lJPD9iBDqpKw9337luLEFYB5UgREOyCCcSvCdCVq8dM
 FAZYqC7i6EyBZdpAa3q2ddERoPYjKb3jTEnvrME/Farp9MYYlj6h1vsaZPfTyWfdcOzI2eq/WsH
 F9yZHUvLzxWZtLXFt6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXxELuIJPhdWfH
 66ZAGl7WaPeoeCntqX6P/cDMR1I2EUFDGzjYYJx6FO/bt1FhCIdSa04n2nxBmaYm9nS5MGmBP2k
 P/eIidvQrkp+w5KlpfcfA8UUnOGeFeg=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab3a300 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kSU5s68tBFIkprDc3QkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: MutyWET2FrbXXQUwVL2S6AoOqknzi5NI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_105958_131603_AFC87578 
X-CRM114-Status: GOOD (  19.62  )
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

Extend stmmac_xdp_xmit_xdpf() to transmit XDP frames with fragments
(multi-buff). Each buffer, i.e. the frame head and every frag, is mapped
and programmed into a dedicated TX descriptor.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 123 ++++++++++++++--------
 1 file changed, 80 insertions(+), 43 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bf9e7e4cb1c3..41ccde6371ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5239,77 +5239,114 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 				struct xdp_frame *xdpf, bool dma_map)
 {
-	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_frame(xdpf);
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
+	unsigned int first_entry = tx_q->cur_tx;
 	unsigned int entry = tx_q->cur_tx;
-	enum stmmac_txbuf_type buf_type;
-	struct dma_desc *tx_desc;
-	dma_addr_t dma_addr;
-	bool set_ic;
+	int i = 0, num_frames = 1;
+	struct dma_desc *desc;
 
-	if (stmmac_tx_avail(priv, queue) < STMMAC_TX_THRESH(priv))
+	if (unlikely(xdp_frame_has_frags(xdpf)))
+		num_frames += sinfo->nr_frags;
+
+	if (stmmac_tx_avail(priv, queue) < num_frames)
 		return STMMAC_XDP_CONSUMED;
 
 	if (priv->est && priv->est->enable &&
 	    priv->est->max_sdu[queue] &&
-	    xdpf->len > priv->est->max_sdu[queue]) {
+	    xdp_get_frame_len(xdpf) > priv->est->max_sdu[queue]) {
 		priv->xstats.max_sdu_txq_drop[queue]++;
 		return STMMAC_XDP_CONSUMED;
 	}
 
-	tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
-	if (dma_map) {
-		dma_addr = dma_map_single(priv->device, xdpf->data,
-					  xdpf->len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
-			return STMMAC_XDP_CONSUMED;
-
-		buf_type = STMMAC_TXBUF_T_XDP_NDO;
-	} else {
-		struct page *page = virt_to_page(xdpf->data);
-
-		dma_addr = page_pool_get_dma_addr(page) + sizeof(*xdpf) +
-			   xdpf->headroom;
-		dma_sync_single_for_device(priv->device, dma_addr,
-					   xdpf->len, DMA_BIDIRECTIONAL);
+	while (true) {
+		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
+		int len = frag ? skb_frag_size(frag) : xdpf->len;
+		bool last_frame = i == num_frames - 1;
+		enum stmmac_txbuf_type buf_type;
+		dma_addr_t dma_addr;
 
-		buf_type = STMMAC_TXBUF_T_XDP_TX;
-	}
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
+		if (dma_map) {
+			if (frag)
+				dma_addr = skb_frag_dma_map(priv->device,
+							    frag, 0, len,
+							    DMA_TO_DEVICE);
+			else
+				dma_addr = dma_map_single(priv->device,
+							  xdpf->data, len,
+							  DMA_TO_DEVICE);
+			if (dma_mapping_error(priv->device, dma_addr))
+				goto error_dma_unmap;
 
-	stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, xdpf->len,
-				false);
-	stmmac_set_tx_dma_last_segment(tx_q, entry);
+			buf_type = STMMAC_TXBUF_T_XDP_NDO;
+		} else {
+			struct page *page;
 
-	tx_q->xdpf[entry] = xdpf;
+			page = frag ? skb_frag_page(frag)
+				    : virt_to_page(xdpf->data);
+			dma_addr = page_pool_get_dma_addr(page);
+			if (frag)
+				dma_addr += skb_frag_off(frag);
+			else
+				dma_addr += sizeof(*xdpf) + xdpf->headroom;
+			dma_sync_single_for_device(priv->device, dma_addr,
+						   len, DMA_BIDIRECTIONAL);
+			buf_type = STMMAC_TXBUF_T_XDP_TX;
+		}
 
-	stmmac_set_desc_addr(priv, tx_desc, dma_addr);
+		stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, len,
+					dma_map && frag);
+		stmmac_set_desc_addr(priv, desc, dma_addr);
+		stmmac_prepare_tx_desc(priv, desc, !i, len, csum,
+				       priv->descriptor_mode, !!i, last_frame,
+				       xdp_get_frame_len(xdpf));
+		tx_q->xdpf[entry] = last_frame ? xdpf : NULL;
+		if (last_frame) {
+			stmmac_set_tx_dma_last_segment(tx_q, entry);
+			break;
+		}
 
-	stmmac_prepare_tx_desc(priv, tx_desc, 1, xdpf->len,
-			       csum, priv->descriptor_mode, true, true,
-			       xdpf->len);
+		entry = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
+		i++;
+	}
+	tx_q->tx_count_frames += num_frames;
 
-	tx_q->tx_count_frames++;
+	if (!(tx_q->tx_count_frames % priv->tx_coal_frames[queue])) {
+		struct stmmac_txq_stats *txq_stats;
 
-	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
-		set_ic = true;
-	else
-		set_ic = false;
-
-	if (set_ic) {
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
+		stmmac_set_tx_ic(priv, desc);
 		tx_q->tx_count_frames = 0;
-		stmmac_set_tx_ic(priv, tx_desc);
+
+		txq_stats = &priv->xstats.txq_stats[queue];
 		u64_stats_update_begin(&txq_stats->q_syncp);
 		u64_stats_inc(&txq_stats->q.tx_set_ic_bit);
 		u64_stats_update_end(&txq_stats->q_syncp);
 	}
 
+	/* Set the OWN bit on the first descriptor now that all descriptors
+	 * for this skb are populated.
+	 */
+	desc = stmmac_get_tx_desc(priv, tx_q, first_entry);
+	stmmac_set_tx_owner(priv, desc);
+	tx_q->cur_tx = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
 	stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
 
-	entry = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
-	tx_q->cur_tx = entry;
-
 	return STMMAC_XDP_TX;
+
+error_dma_unmap:
+	while (first_entry != entry) {
+		desc = stmmac_get_tx_desc(priv, tx_q, first_entry);
+		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
+		stmmac_free_tx_buffer(priv, &priv->dma_conf, queue,
+				      first_entry);
+		first_entry = STMMAC_NEXT_ENTRY(first_entry,
+						priv->dma_conf.dma_tx_size);
+	}
+
+	return STMMAC_XDP_CONSUMED;
 }
 
 static int stmmac_xdp_get_tx_queue(struct stmmac_priv *priv,

---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260922-b4-stmmac-xmit-mb-bb78e0684cf4

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


