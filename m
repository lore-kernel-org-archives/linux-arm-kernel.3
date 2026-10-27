Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A3E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DFpCRptn;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0OQ0ueG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bScYgMVt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AmQqM/FOqOqOLJNrO9V4EKVQvKZuNX4OQLoiG1lHBVQ=; b=DFpCRptnJu1anG
	mMMUDi6jkjJjswwTraxgH1mUISrj8lIf7ScmxQEf9qPKRKmRU1M8vXZtPb3jRRxz7C++K5hIcUo8W
	w1qSwTYsrjq/Bh5qBv0MIRB8QKeOoWEh3YV5sAxTkR5uLzxFyw6guVWORG4PQyMyZ+XnDR4/GNAc9
	n39WXG/weEsiSLVsJrBq0/HarPKgjzgHxqYvjsDEtDN5FSiUdBMXwl3EU+TRB2UrEFyyXQWPJJH2u
	r9+DRnh2QwGI5dGHzQH14Uany6Ox4FVJgYk+FgtsRxe0IYmvV5l77K3OFExcqkvMS4P8TCp8L3p5O
	w05ilwvkBMCsJmniUrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhY3-00000004vrE-179U;
	Tue, 27 Oct 2026 13:49:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhXy-00000004vma-0DRg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:49:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe47r1922071
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmQqM/FOqOqOLJNrO9V4EKVQvKZuNX4OQLoiG1lHBVQ=; b=c0OQ0ueGVcdWzglE
	IF1UIuArvMziDXsKE8kJBLLUw79fGM2gk1iwYg/t9ARtp//FuZy9iAgxlOpLvU9h
	exgmrU8P+85NaiUI0al8fZBTBzO2SnoBTft2cw/JgJSo7DQoyW0JeKlqU8ITFQsL
	3dKth69mKMlV+h+bn+wgPI0X/SsN14orv4DE87fuX11kkayyts5nucNSI97Ibp7G
	VXDWcIMBSfK9/+qGzhXrXErw9d36OmVdmqUluiJ2jHpEY+fzFrJ6BWv0To3mx/tq
	LlmTc+Q8cenPaORezymRRDjpCxBUo15YMyVomS9zSZ7RTgMLojnUW+eeokIMZRyo
	COOAnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq695hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso987156485a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108940; x=1793713740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmQqM/FOqOqOLJNrO9V4EKVQvKZuNX4OQLoiG1lHBVQ=;
        b=bScYgMVt/SUb4GFE6swo1009MgIxhrqS+3pU8RY4U8l/nKbnO2Cvp907IbOCXz6LaN
         kSQZc5l8h6pYlXiudM7xVW+UzCuEzj0dO9G2ztIMKGFQwaVW0b7b1s71Ysq/22ODm4aP
         /KmI23baALNFsSe2Fd/G4EtnwyCr9P71cidFoI1f8rbf0tVed+XybkdDa11jsjZGySQ+
         uSsgpsve9J/bj8W5WsiEEsk3ui6aSLCocIJBcY/2r69Cr6scsXiU4RfwJ0NIf/WlQ9na
         o/v6cqVIhvKG7rz81V+yqSW3icRD5yiVlCzFAcFUvan9o/uLRRrUX1M/5Iehre51pPcB
         M/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108940; x=1793713740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmQqM/FOqOqOLJNrO9V4EKVQvKZuNX4OQLoiG1lHBVQ=;
        b=tMXjzLZcIdqQOUEdbUZrZQqGN0jHzDFCdpL6xuLoCh/xe1eHqBsD2x8CqGQJsj9YhN
         La0XWGaodDPUdlrlK+MAMrrFJTWcnl0R7OYLiNrFimiIcP4q6qBXrQDXwxyWBtU5aqtr
         e27pv2qHImp6q0wNl6+orE6HUqOFBlP489gPvKjjRg9iU/F9GJzlS2mXA+T2Z43SfcOZ
         viZMXTT9GSGQeV1WrTOemZC3QMs7bI2kGsebB+1JutiNmlhw6Y9ERrcgvSoryDpnvGiM
         +I9MY2FT6s1+oO5kYp+RqwZhULa1FogaDLjOok2wR53z9LCi7hmQmC/B2rA6U7RuG7do
         cjpw==
X-Forwarded-Encrypted: i=1; AKwUvBzIbx5dKHKh8UNgQKqfJFCx56Lu+oAbuU510ckxVy18i7597XMKPYx9zsCGWBQxCi2Kq61/FPQwdkLVSGiac274@lists.infradead.org
X-Gm-Message-State: AFq9FYLsBnxQxlhUnASEGN4t22pqqExEi34LYb/8yC29d1nLYaDsGgvZ
	fHH7eyRcbYtDQ2vAgeL1aX8PIaSNoqt9FhsqaM67WcrdcI9pSnUaUvXX5Wr/W2sPmqQJH++EdxR
	qEemhdczV393oc9vwg6GSsVh8zf2Cd9CnIlagG+hRLKP4yXSsAhWdZICySMTEr6ujAmVhHv6rU9
	cNrQ==
X-Gm-Gg: AYBFou0Gv/c10yRnP/vezy4P7PaiDPKbfsN2UV7kxopVttS5zk7TUv/sGJ0NVnpIPDJ
	+m8mRa/x0Ne4Lc5I/A7Dosm1Dk/i+WyXngyxO98U/bmaLlGWl8478otpzHaE8TBrJZTw+CboWnQ
	EWQ/QwmSehDbHgFqRW7cJBKyDogAR9mwlhfQA3VM4L/i3WxLu5dA1W9Wm2QdK+KvRmX8yUZLkPT
	pzO5jfpyniTraEmpgxyBzaLJcXvvOdPvhnXnmlJ+IqERCwVXepi+3Q/0BOTzBsNONoLaqCnqFOx
	WQAI3gNxX5/nBy8oajaSrKuFaZwhhX3nkLlbm9OJ6Sh3pvnnZLh9ZLjBG4M15/Y6FzO950bHEnL
	Jukmd4yDE0NQ=
X-Received: by 2002:a05:620a:a895:20b0:943:b019:f011 with SMTP id af79cd13be357-943b019f025mr869449385a.28.1793108939970;
        Tue, 27 Oct 2026 06:48:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a895:20b0:943:b019:f011 with SMTP id af79cd13be357-943b019f025mr869445885a.28.1793108939391;
        Tue, 27 Oct 2026 06:48:59 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e995dsm455982266b.25.2026.10.27.06.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:48:58 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:48:37 +0100
Subject: [PATCH net v2 2/6] net: stmmac: drop split frames on AF_XDP
 zero-copy RX
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-stmmac-xdp-fixes-v2-2-10eae8a093a8@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0abcc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6POjKhNZmwZEydtLWKIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Km20vRP8DiUYDudeqyPTsBdCCjDxmD9a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX5dzO2sSx2ESM
 6NVw+9p/XoQZY8TfCrlQDZyC6b4e05wAVj7UnwFxY5GZUYfaAVp4XVWsyZskWwMY6ykAslcyjii
 m6hN4k+/L52n/dd7EYDYySbQh5gR0fY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfXw/cnIGuP/Qdn
 8NaWOkvSy82SpK8Xn30vfM/ipE+9nbJD+38/DSzrupTauZLD46m/EBX65acgR1RbpTpa4+tNosV
 a+QdINsUOEo3uv+n/SC9qXQy2psfBADCTHGRr4KXbyUj2BCmSiOywqOsYJkRfLn5wffIbT8s7bD
 MvrhK7cGQXgp4JVDm951DJkx8ikc5zv1fgsnzPZf6XkswDtTLOvY2rW5iSee4LlaDK4HCydpQHA
 b6fDD1RRUir+yV9FzBGTsrrapfsCvE5dMVZxRg/RNY4iZmsrECQ+bXjDuwrs1Bthumpe0uW9lOG
 yG3st2GLkmyCm2BeEVzITWYNsEGNJsOf0eH8uwMcAr5zlw4z7jCBxkiokVhytSYt2B14Zooq7Ob
 BiagiRqKtzoo+g+4hNFaTpru2KHlYG0pfW9hetjTvzJTnuLJaj6snQB6zq9hQklNjvkkTqXXAqQ
 gDlL1boDq4XexhI8NQw==
X-Proofpoint-ORIG-GUID: Km20vRP8DiUYDudeqyPTsBdCCjDxmD9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_064903_009598_EEE9927E 
X-CRM114-Status: GOOD (  26.62  )
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

stmmac_rx_zc() assumes a 1:1 mapping between a received frame and an
XSK pool buffer and drops any frame that spans more than one RX
descriptor:

        /* XSK pool expects RX frame 1:1 mapped to XSK buffer */
        if (likely(status & rx_not_ls)) {
                xsk_buff_free(buf->xdp);
                buf->xdp = NULL;
                dirty++;
                count++;
                goto read_again;
        }

The non-last descriptors are freed and dropped, but the frame is not
marked as errored. When the poll reaches the last descriptor of the
same frame, error is still 0, so the fragment is handled as a complete
frame: it is passed to the XDP program, copied into an skb on XDP_PASS,
or converted for XDP_TX. The tail starts in the middle of the original
payload at a predictable offset and, parsed as a fresh frame (len == 0),
stmmac_rx_buf1_len() reports the full dma_buf_sz length for it even
though the DMA engine only wrote the tail remainder into that buffer, so
the reads extend past the received bytes and can reach beyond the end of
the XSK pool buffer. GMAC4 always enables jumbo frames (GMAC_CONFIG_JE
in GMAC_CORE_INIT), so an on-link peer can trigger such a split even
when the interface MTU is left at 1500.

Set error when the 1:1 mapping check drops a descriptor, so the
remaining descriptors of the frame - including the last one - are
drained and released with xsk_buff_free() instead of being processed as
a new frame. Account every freed buffer with dirty and count the
dropped frame once in the poll budget / rx_pkt_n. The direct 1:1
mapping drop also increments rx_dropped.

Use a bit test instead of an equality test for discard_frame.
Commit 644b8437ccef9e ("net: stmmac: dwmac4: report Rx checksum errors
in status") made dwmac4_wrback_get_rx_status() set discard_frame on
RDES3_ERROR_SUMMARY and OR in csum_none on RDES1_IP_HDR_ERROR or
RDES1_IP_PAYLOAD_ERROR, so it can return discard_frame | csum_none.
The old "status == discard_frame" test missed that value and delivered
frames with CRC, overflow, watchdog or giant errors to the stack in
stmmac_rx() - or to XDP/XSK in stmmac_rx_zc() - when they also failed
the IP checksum. The change therefore affects the regular RX path, not
only zero-copy. The bit test is also required for the
discard_frame | rx_not_ls value returned for non-last legacy
descriptors below.

Normalize the legacy normal and enhanced descriptor callbacks to report
rx_not_ls together with discard_frame for non-last descriptors. This
allows both stmmac_rx_zc() and stmmac_rx() to drain split frames on
dwmac100 and dwmac1000 instead of reparsing the final fragment as a new
packet.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Fixes: 644b8437ccef9e ("net: stmmac: dwmac4: report Rx checksum errors in status")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++++++++--------
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 023b54b72478..7ece8d4157a8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -205,7 +205,7 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 
 	if (unlikely(!(rdes0 & RDES0_LAST_DESCRIPTOR))) {
 		x->rx_length++;
-		return discard_frame;
+		return discard_frame | rx_not_ls;
 	}
 
 	if (unlikely(rdes0 & RDES0_ERROR_SUMMARY)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index c4b613564f87..d19bf7ca4db3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -70,7 +70,7 @@ static int ndesc_get_rx_status(struct stmmac_extra_stats *x,
 
 	if (unlikely(!(rdes0 & RDES0_LAST_DESCRIPTOR))) {
 		x->rx_length++;
-		return discard_frame;
+		return discard_frame | rx_not_ls;
 	}
 
 	if (unlikely(rdes0 & RDES0_ERROR_SUMMARY)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fa7108919e90..33814672c842 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5714,18 +5714,21 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 							   &rx_q->dma_erx[entry],
 							   status);
 		}
-		if (unlikely(status == discard_frame)) {
-			xsk_buff_free(buf->xdp);
-			buf->xdp = NULL;
-			dirty++;
+
+		if (unlikely(!error && (status & discard_frame))) {
 			error = 1;
 			if (!priv->hwts_rx_en)
 				rx_errors++;
 		}
 
-		if (unlikely(error && (status & rx_not_ls)))
-			goto read_again;
 		if (unlikely(error)) {
+			xsk_buff_free(buf->xdp);
+			buf->xdp = NULL;
+			dirty++;
+
+			if (status & rx_not_ls)
+				goto read_again;
+
 			count++;
 			continue;
 		}
@@ -5734,8 +5737,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (likely(status & rx_not_ls)) {
 			xsk_buff_free(buf->xdp);
 			buf->xdp = NULL;
+			rx_dropped++;
+			error = 1;
 			dirty++;
-			count++;
 			goto read_again;
 		}
 
@@ -5907,7 +5911,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 							   &rx_q->dma_erx[entry],
 							   status);
 		}
-		if (unlikely(status == discard_frame)) {
+
+		if (unlikely(status & discard_frame)) {
 			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
 			buf->page = NULL;
 			error = 1;

-- 
2.56.0


