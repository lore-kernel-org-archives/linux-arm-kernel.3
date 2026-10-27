Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E36E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJq1gx4P;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M4Vi62mK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ed7TUKjk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TAHG93Jw5WBCEkJju41yzTkSNHwNbIhjwuxHHKNfrho=; b=aJq1gx4PoUq6o6
	WnftdHqHgXThJ77PQ9uS3t/0zPyEPC3v5UCtsux/JzRK6jELmx+5cTTm+D5OMV9votvxSLMsnw7wL
	mBx+DY5cBYilH5Wpxq9R9hzEBA5aRCE/Lo+C74tFpPXLbhumza4ZKav9feRi9BWfCNBzGvxKhpqHu
	7emrOmgsM2r88ayQxYs2n2y1+jouv0+i3jVO3LaV/PYZqIOl1DH7z7ClVf0qwxFvkxns7LP2WFNY6
	ba46gxgXejDojR3fmt7c42xfp+WGztHPh+sjMDbeITZp5V5oH/t/qR8QvrVorb2qehfohe9l5AKQB
	I6g69LxENhvvA0qr6itw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhY3-00000004vs0-2jOd;
	Tue, 27 Oct 2026 13:49:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhXz-00000004vn9-2Ii7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:49:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RCO8u01124843
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TAHG93Jw5WBCEkJju41yzTkSNHwNbIhjwuxHHKNfrho=; b=M4Vi62mKIIbm663A
	ixdkIjmwTdD4Iu25W02GjjE28zo0PebNlAP0MH3MNk6wqyAnu+AJsPpx277lTEEg
	yKHZNzbXiw9muelIlPwjLSRCD95CmkicaCf7fooypNSyRY4DvubCe4T7MEczJUOx
	EqibN65+s1b7VvWRCi8B8egNHovG7YNJtd9p+Az+SPqkNBOTCdSyYW8xtvAAeWVY
	qZHYSgudtrW7UzIuHlS5atQ8YPj2f6nT4/Kvmw9On+A9vGDOlUW/E7EV2Sv1LnZO
	0dGv54UY0DOAuJqCPvBxhCIcLmyWr4UdJitAHY69T4PPWUMjeTbV7b2TbdPf5XOJ
	vWfBJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux98aye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so443501985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108942; x=1793713742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAHG93Jw5WBCEkJju41yzTkSNHwNbIhjwuxHHKNfrho=;
        b=Ed7TUKjk4DAoQZ5UG/cYvT/t34BI+qk9snV3K75eH/3p6XHbisRONtPlyKxHmSG1nw
         05Hdqhpr21G9AOMnfCy51BoNhAFbukNxH6geRHOF9rshAWzQVj5GPAVrxXL8YF4oNGa8
         5KkqF5tT6Nc9ula6tAvsxx8itPyTwf6/2IXOTz1zTQNCrkKW/1tNUHm9w7cit+eX7emk
         c9hrZvsnC0AUj8lBdP62Ai6erxTtnF+X1+G6abqkMg/HPA0lF/qJhu0wVtQrWtQC9tzP
         qozaWxTOy7fXUwKyANKjxLg6b3GiqSycLuOct0nUw0+I5JDaA3S6ITHhGIlxca5pSsUi
         xkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108942; x=1793713742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAHG93Jw5WBCEkJju41yzTkSNHwNbIhjwuxHHKNfrho=;
        b=v85ZzPFssyeqsIry59DasoNDhPxEZtXWbL3fRSQNHQbhgTplBZgMovzcWe5SZVrTPe
         mRCnk7wYeDWEELACkxw4P+PJDVUzaaa5H6kvIdx1tvP21ohnoy9kapGdYJt+Nbl0umUM
         l0+1ypEwxyYB6ayAZL/p/C5FV4z5clpHzXzJ+hqV9wAv8OoqO45hwfAyalcxvaxJFeky
         /ByBAEMZf+m48urV1jkd7Y1ZHurrxeuJdFvmiCqB4cquryYaKqexp2pZ1DjLY98sOKOq
         V/yf+3Vo9o/p2ZNBe5SUYWLuU1VI0mmbZ1TLb3uy8RjSgOxvlvEm4XZAxn26GpSt816f
         /4qg==
X-Forwarded-Encrypted: i=1; AKwUvBz0GGMtsyY9jdkxbEYdeu0Boa8VfhoBHM7v5FYM471kuO0I+/GU/BrDHazZFamBHOMFwncQP8xxQUAGwehwDLtU@lists.infradead.org
X-Gm-Message-State: AFq9FYLbizZCOeahK1muP+AFq15rVmLM0M6GcGW7r9axwOln/sb3dqxp
	sVH74fVwEmC+SDSBq+vtIN7yI2x139x8KfoFPT+8KkNaM3dkFAHQedCU8ZoayFpa4rxQCroFLXH
	S07yM5T1g79Y0RUlEnvufX4/hZjGF/5bhpLzDz34GGGGfjUrZ1HrOEamqcJtm7ztbgl464xPO20
	HNmQ==
X-Gm-Gg: AYBFou0BW8UBgxrASdZo+wYrLK+rawcEHiBBnUX68aibCTc2+bo/WEl/tmCVsqNOnOD
	n/4g2vISle017/gbh0a5eJ0A9v+tIWNSjkRp+OgxlPDTSeulw1fyjmTg78fuy4R4KFs2I/NKrS9
	ODT9h7ottNxeDH1QO41J1i9GBq/cLCTgas8JYfAPICmoUewAyEaJOPoo5UKvTpeljfeGV9Hxi+/
	hSWo157zcXxytHWiSdIiV9uFPDW7oL8JbaqQrufUtdAPzeuOU6vASEV3ac5VL17Kn5kTlfG7LyL
	ZpPDHEIHz9GUKEkwmXkpIwd+qu5Mzf3kbLw4D8sCbQB5QZKcarjH5V8m4+aJ2L2pM29DqvqwNEs
	4htiJQRUVg+U=
X-Received: by 2002:a05:620a:6288:b0:93f:2f37:2e5f with SMTP id af79cd13be357-940ef93965bmr1460193185a.30.1793108941608;
        Tue, 27 Oct 2026 06:49:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6288:b0:93f:2f37:2e5f with SMTP id af79cd13be357-940ef93965bmr1460185685a.30.1793108940951;
        Tue, 27 Oct 2026 06:49:00 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea0ccsm463830566b.16.2026.10.27.06.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:00 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:48:38 +0100
Subject: [PATCH net v2 3/6] net: stmmac: drop multi-buffer frames in XDP
 mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-stmmac-xdp-fixes-v2-3-10eae8a093a8@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0abce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VR_YHCPEGhNri-7XuWcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: pA7X68K9UmU9z7K18Nzv_nB6jHopcT65
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX39rfek4DUVzc
 sTPxLuF4yjLv0aEw5SZc7GbbbfS1vImuAs3XOZLWdHtWzUkCVLuQTiePeJbdoWyBXeBVgUf1eBO
 ldn+jwDnLvHq7un3ARg6XY3TQ7uQlq8prETlAxIOf8rM7+JIw+E07wmUo8LCnCdNOHdlt6pQ5jD
 Tz5C/ZXFz4wQ+GdsHffHutj7VXcKozObXrQKHiUTdFtihesMdgZMdISBvah/h4BxvvgRUbuDRqR
 mxeozV3nMv8CrgNpQWFHsr8HiWovsoWJKbWepTHWNOwjeonZV/xyAdq6bEHGlkxL5yHncxe9+BT
 SMUFQka4IHK8Ss9UpUnseXuKg1H4hHcaqIchRsnbIdOIrzFcUbyDpfu8n/WV4cHwrg6uaoYJ8Jx
 caMmnFXwJTJKpmRg48YKW/7ZEfVHNr/VfY/53QiuWAbff/aCcGZGbfV5pQMbsZuip4maOsdZ3nt
 bGFyUwrbFrPXUof7aqw==
X-Proofpoint-GUID: pA7X68K9UmU9z7K18Nzv_nB6jHopcT65
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfXxun1lBynXITw
 DWLTwEtfoAIE7+knoVGbNhOI3XqnoSAoUHxKav7BAAbSHCXlkv1xC/S6obqMJaxj/hGK5k7ImSm
 ws6pjPZZCIUVux8mUAEp7OZzSQuoo1I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_064903_768845_E5D5033F 
X-CRM114-Status: GOOD (  30.06  )
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
buffer2 is now handed to the hardware for non-SPH frames on GMAC4/XGMAC,
so a frame up to 2 * dma_buf_sz can land on a single descriptor while the
XDP program still only sees the first buffer. XDP_TX then transmits a
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
Fixes: 88095728511e ("net: stmmac: fix rx Scatter-Gather support")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 35 ++++++++++++-----------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 33814672c842..71858af6fd66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5912,18 +5912,23 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 							   status);
 		}
 
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
@@ -5935,6 +5940,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
@@ -5984,17 +5997,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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


