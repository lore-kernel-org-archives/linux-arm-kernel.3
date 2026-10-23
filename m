Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E826606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vr8sODST;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y+Kzydqg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DD1gFeJo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jY4VkvVIYr6et0hnvUEcfNLa0BLx4p3BFPFF8mFr3Fo=; b=Vr8sODSTNVLfJx
	DjOLfDU/8QAyTdzmAwyesxZdsXCuiFKci5iuKG2EBDQZbVdzW7h1C9fDWdwq0hCp54vYIsiH46bWl
	a6POzQAfHk0V+ejr2ELnFaz54BLUwfLOt9WTIPKXyUPy8CFmRSafSUjD2IlUWHu8Tj3r8xmdQh4qK
	+/FoRE0/Q64TKI8yVCc0tbtftUKOT1K/xonUeT921dSIwklmzqFuqU2Z+d5psdGqJ5RjcKSR9vSsM
	6BevPgRDu/Oh/APwpo5AF3WxA3C7ExhT1wqWqiT5z+un/180R+3GQb3iU9CFszgd6ww7TevUL59ZS
	cPRhtipfmtuYG8aE4V0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMq-0000000FtUy-0DhG;
	Fri, 23 Oct 2026 08:11:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMP-0000000FtAH-1J40
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:10:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDmc1767178
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jY4VkvVIYr6et0hnvUEcfNLa0BLx4p3BFPFF8mFr3Fo=; b=Y+KzydqgVm57vbKr
	1/4d5clgmk1xev0MNqnpDNtziAEKpwB1nQJZkd8szBg4V+CjP4WTmYxp5vOn7Lge
	+TXrUpFF/fmSLPJGmFAgZrMn/cpbG1x8fiC1hkTuovsFnQR98Snyvfvv4GPMW2kz
	KLXIuGf3LZBbvaCwWLfJkf2zuP3w8if36oaGS3tEVCOhg+LjUAFJ/CwziPVvmkhJ
	xyVntjFJstKtf/ZVHxiFVsESr8EL+MM8K0oMGXskMn1qINktXxvmuhAIRLGuSlvE
	BmZtx6iJIWilwhPwNrfFyq1Hl7dfdVPdvXn07HEnIyfIk3wZ/VNx12bpH15lp0/W
	y1hWQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahu3e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so121041685a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743044; x=1793347844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY4VkvVIYr6et0hnvUEcfNLa0BLx4p3BFPFF8mFr3Fo=;
        b=DD1gFeJo+bTv5RhnENMFUTtANa7KzCR0yK3SE1/A87mQSoUp2Tdnjg7GCjcpOlP/iV
         JG7WzsFyci6McfXLsA1+pulEj9YtnfFCfem0TcFDmOyKfmj50o5FwvmwGnuVGB6kRVoX
         bnZE4xieWi+WnRJbT5HKbSCYYWgT01xFvfNyzUo3wq7buUqHMlaeJTl1mMsd0CwvZpoR
         +ERBWqi9ueEHF+ZOpruDkd/aKqJApYrsPNCD+Mt8+RSVpyOE1zmAWXJ9HdbkFqNMhs3R
         HPers77EYCAhWU+JUiRAmMhPosfQwnp9mxQg704hTRIc0EdqwOYUc33QOcSc5Q8xcrRv
         NykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743044; x=1793347844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY4VkvVIYr6et0hnvUEcfNLa0BLx4p3BFPFF8mFr3Fo=;
        b=XyFhXQm/arkR8VkIMHa5/wbpdogvIlqyUNMbRU2MxgmywMPBumnfEQUfJdjy96aMfI
         FBqdpZnao5CiNXwitpvdQ24Rxpusb1+knJkKpEAgZmNFccx2Bgis+a1SGhn1r+qZkCBy
         J3Xns7zvd/lVQtYllLFVlsImtsJmJX6BaLCuZopMNSJXuc9939FF8q3ZuDH2DCx4L6eM
         pnVOETa/Lg/jr9RoaTQ5TgAQvr0nDiH27HwFtS1kYEcUPDcpo/bcc+xTPNSYDTusS22q
         Us+NBv6ur4YOja96EAPrDb6ObOe3BwptTImbUdKAxMEVQWcc3pOpkFNANWrYWhLSI+IL
         GzEw==
X-Forwarded-Encrypted: i=1; AKwUvByi8OYnmx2MN/6gzCNWckTuCrGvGXY4wBDiyJdcH44yX6mkrYmqtaSwLgwkUmDBQg+Pqq/sVz+PX7thvCAJYXYw@lists.infradead.org
X-Gm-Message-State: AFq9FYLrL2HI9GFFrpGGB+zJ+mqrOmgg5p5sxRfZdcnxuyZQFvHTcYbR
	Ta3fvT/B8DlgExAkPvbxu+whFf+i2025Ka5lqx1K9hZQhy4D8TYLRjERVhAvs4BSRhD5Qi3885w
	ld/8P9RHezg6SU3zB0ACLRAklBN/ZHPO6WPhjcNOU5oPvJG897Rx0/8LOjUUs+VHnRwAyLMUmLv
	nBPQ==
X-Gm-Gg: AYBFou3CtjyS7rTV8klj5+gvfbkw4bYKEObRQj7LoWUV8H2qn7NSe2A8QCilNIzYTvT
	Ot9cmO1xFJtCUS1FW06q4urdCcBNVE7zhdKaoaGcRJodq2CyCMMQN1nAb2+spxGmQu6Ox4VOzDV
	3jjc2zFXr85oOjGLOCvK3KQX4PmAp+3oeXxS9IoB/k/ldgA1IWGSpvc3E41iJZTCVhWwDgaM3mt
	tqHP51eZOUrwMDRvDbvYYk3iD5kEnqNfUazmU90U8Jc8/FxesfrZxU5pkRO9u9PC7d36Wkl1Hlp
	QB8ao4+juSSPInpsrH1G3+TnuNefemfgFMreOuD4N1vNBD0cxChDxTvqnNYXhi9iXxr/TtCvHg/
	FbdJvG5zvUnM=
X-Received: by 2002:a05:620a:a888:10b0:93e:b0c3:388d with SMTP id af79cd13be357-93f6f54c958mr203884985a.11.1792743043624;
        Fri, 23 Oct 2026 01:10:43 -0700 (PDT)
X-Received: by 2002:a05:620a:a888:10b0:93e:b0c3:388d with SMTP id af79cd13be357-93f6f54c958mr203882485a.11.1792743043078;
        Fri, 23 Oct 2026 01:10:43 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210299910sm57399365e9.1.2026.10.23.01.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:10:41 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:09:58 +0200
Subject: [PATCH net 6/6] net: stmmac: fix XDP RX buffer DMA sync length
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-stmmac-xdp-fixes-v1-6-efb37e19f5bd@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX0105D1dkS40e
 Maq+i25spvEfgkKTcufMulaF1tYtbadT89hC+24MslE8xFUCMp0lCSzwSuQdVa5edI63PQBGNeB
 eRWO8I4UIvKjDo9DiklzJxr/rZmsMo8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXzEq0HZACc3f0
 LoZGmizgDxZc8+UTStMUfupOL/Hhie0w3gxcuj0w7WpMbtc68jx+fyolkwxsGW/x2K2g2qhyO8e
 WKuX1JfLEuIXUuPGbZAYcijcp5TwJ8ob5Hf0iU1Cm8GrmndK4+7Yf1z4AvCL3vNOUtGsbwzeyho
 /DrtPvGwK4/JX+PeA0jFLfnozeyTy4ai9hmOZjDtS1nEkv9riBXxFQe2oGkgtxQO5IODrfQ0bMc
 SnwJkFDEjItoSm4qJd8MJwu7Xdbvxpb0u2ppLjIOxzY2uNY7haLIg8W53sF5i+7cPugUBSpPhf0
 3nC/2gNpBGpJ7pYdfixj1wC4MSujyvzbrQj/Lv47Q+/bEcXGS2qEotj0gYa/4Bvt2mtg1OwBOYw
 wyNiB0JLS568LUPn0ySpGc+m809p4nHg09lbB8vVcXMoEXjriYE3Bf1l4fkLoXpB6rZ8PV9xWuC
 joOL9bwqKG41fYfgvWQ==
X-Proofpoint-GUID: auEhjATCZ9fwvx7-w7czQX2cKAidzXke
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb1684 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LaBVFg8F59WyocPVFFMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: auEhjATCZ9fwvx7-w7czQX2cKAidzXke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011045_498534_2E76BA7A 
X-CRM114-Status: GOOD (  16.29  )
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

Since commit 88095728511e ("net: stmmac: fix rx Scatter-Gather support")
moved the page_pool DMA window to offset 0, the sync range no longer
starts at the XDP headroom. The XDP path still computed sync_len as

        data_end - data_hard_start - buf->page_offset

so page_pool_dma_sync_for_device() synced [base, base + len) instead of
[base + page_offset, base + page_offset + len).

On a non-coherent platform an XDP program can write packet data, write
metadata or grow the tail. If the program then returns XDP_DROP/ABORTED,
or a redirect fails, the driver recycles the head page with an incomplete
sync. Dirty cache lines in the tail of the frame can be written back
after the device has DMA'd a new frame into that page.

Include buf->page_offset in the sync length so the whole CPU-touched
window is synced before the page is reused.

Fixes: 88095728511e ("net: stmmac: fix rx Scatter-Gather support")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 32b2c5834c34..c51358c51fae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5980,8 +5980,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
 					 buf->page_offset, buf1_len, true);
 
-			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
-				  buf->page_offset;
+			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start;
 
 			ctx.priv = priv;
 			ctx.desc = p;
@@ -5991,8 +5990,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			/* Due xdp_adjust_tail: DMA sync for_device
 			 * cover max len CPU touch
 			 */
-			sync_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
-				   buf->page_offset;
+			sync_len = ctx.xdp.data_end - ctx.xdp.data_hard_start;
 			sync_len = max(sync_len, pre_len);
 
 			/* For Not XDP_PASS verdict */

-- 
2.56.0


