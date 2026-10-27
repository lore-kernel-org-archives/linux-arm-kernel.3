Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KiQllnSr;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VVaSGVw0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ME7UHioF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cWBn7ZAhYyu9Hdvf/allBo9irsjsdWVIpt+Znd8jRKk=; b=KiQllnSrmjpejc
	uFpysTeUKVjBpF6zPlahYmk9Tw2z89twNafEleLzufYL/sNnkwo+fSoYB9gJolx3N0Py5KUtjOrO8
	DyF6XuoYEFyVni0TFx9I1ijtXIIpTDY+6b7IFvAzwdqgp5jDtU71y7iwO2v8tSQSklug0v8zIU9HR
	4x7VnKC/Jwsy/ZXP4fcFS3o4Rk2yNwZLTFBplh5+1edw0fovXNfpGqGHIg6xFgvMWItO/TKB9sM3X
	yJXHtGJ3pbt5F+sov0QbJvHGSBgCdTxSfbZ46Y9kkM0BmLh1phFpmXW3SGQZp1UUksmdIiaasn6Mr
	VIDfWlPWgp9kks0DyUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhYO-00000004wAb-29h1;
	Tue, 27 Oct 2026 13:49:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhY5-00000004vu6-0Jqp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:49:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeR0q1616150
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWBn7ZAhYyu9Hdvf/allBo9irsjsdWVIpt+Znd8jRKk=; b=VVaSGVw0c/4DeoQe
	FFIo2iPP+suk/zTD0Euu2q8iV5EErkpjwp6/SIV1RJ44OrIJGSBqCOTSqR1t/C9c
	ZWV/DdlNEyF8y1pDyfV+bmyZouDjHgDAAberJIyS4mcXYDKjeySwMFdeJvkXXEcU
	AiPS9/jFR+rR/FIDCvAL19aaCON+Qa1d085jQ+jLB1donLg5CrQb/8mDyEPNf0Hi
	7OHyyCfPzDlEPzBqZagkB2Id8IOLysWyDogpCu+MDIrQ6Ey0/8j2WdLQayoKiEHg
	sr2Nyvra3vYNw/PGs0VDonP7E1CGL15plgnJQmhT7YHa1M/eAioN+5pSLs9Eudgb
	Al/FWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5sg2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:49:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so210099385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108947; x=1793713747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWBn7ZAhYyu9Hdvf/allBo9irsjsdWVIpt+Znd8jRKk=;
        b=ME7UHioF/7o///fStAUz5aX5iie4P1Ec6l9CxBcRYMePd29LOzqM3dReT0oFL4xeOP
         T/nohGCoyCVeDj6mNU5OSLZKEoYkeYnwyRScPOxLZIHagr4SZu4jxkW1BV1uCbh/YyYX
         Xdd3j9C4AO+sw2YpE3drKkWnqAbQBCb3VfCdlvq78t/qkt3dDtyQLnBIR42bZ1u8yKkh
         Od/9JpSo0U/Jfi3R3SW/tD+sPkdoqcV2wyS/3VOpTA0z+CCYga+JXqkUcR0IaT9jn2e0
         usXPIdBiDZ5F1Ts2+vtLSYhCtuYK/zOH36Tzf62OrwK3/iW/NbqRMVzQvZEAxn5D1dg2
         +VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108947; x=1793713747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWBn7ZAhYyu9Hdvf/allBo9irsjsdWVIpt+Znd8jRKk=;
        b=jOvDHNlf97c3vGtMxvBM9tEUoVptiZJuWPoRgKkfKm4/jrWnpCAhySKzMsehe3lqx9
         t5p4FBONiRxQ8FUi4/SAeDw9kE+YCBQUoFX1PjSoOUZY8cJJ2ALeJHzUPqBWxRjEzNgb
         +0JBmBeYac4Kq6+gfXhg2qVIG2A1hVqn9WuJnVzhUe6/h4dsJvCqD77N9zGDgKlGyFuC
         q3c0/HkotU1fPEa1vj+h/I6WshuvVRv1IxVqdbCCxYsqhnXDoc4Se6JckBzQSNgjBlGN
         bPubKlzhuMr8nwwNk59J1MFkWQ+WcvzRSc9VON3AznXGBqaI6yMQartYDjMBCuCvYU0h
         09Og==
X-Forwarded-Encrypted: i=1; AKwUvBzQABDDcr4vQ+2HqtpKsMLPOvMsrc196+VYOuIAGDucO+BOfiQmWkD9DzFrHNrcsYHKO+sYaOz2swOkRYALaEtN@lists.infradead.org
X-Gm-Message-State: AFq9FYKTrnWPHQZ9TmrKP3ABJ1dr/KTU9sxK0qDSlns1C5x/JUI5k4To
	wx/s+p43v0/wDa3jkN61oO09IO5ROyHnrns5+z8X76XuD77Oh1mzB7F1kvo2qRBMrojOGvnzpy0
	pPaX+qaKgDFTiW9mtKqgDt0QEQ1j59IZyfiHtCrMY27wIdRHyD+59uDy53+IEN23i+Xo8r+HzGM
	yiLg==
X-Gm-Gg: AYBFou2DDnReYnKaEKXNa3royQfuJJjitmWdACtbsiEp1b90iIQWGI02prmFLihwHgx
	JUKbdzZfnkaD3OzMRtNBg8T4YI5b7lKX2vBkCxjEs8sJr/kRGgLE9S/9OOrruPMWX84xsl9bLWy
	YN7eJ8YSPH6vPCCA9K8XkfGqaJdQ9p11mObd+Id6c9qVSmCsWggTPcEwW0ZyoJHL2XOoIp46ldQ
	/BHZgUNsIIcGCFtaI9M4c8cIyDxaGcJjIKyjc/o/kiNbkyEsVsTY2zkOGNZvdslVXBsXEEnQbKy
	OQ+uPaR0gvgQ/HDtlaxFvS+bQNSF0nTME0XuTd2FDP3qRok3ZRv6Ke8I/GDpjHaS5IFWtU6ZT2X
	CRCuEHhoRBE4=
X-Received: by 2002:a05:620a:4722:b0:93f:4a02:ed99 with SMTP id af79cd13be357-943f4b8ce2amr420871785a.20.1793108947114;
        Tue, 27 Oct 2026 06:49:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4722:b0:93f:4a02:ed99 with SMTP id af79cd13be357-943f4b8ce2amr420865485a.20.1793108946506;
        Tue, 27 Oct 2026 06:49:06 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm40758a12.19.2026.10.27.06.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:05 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:48:41 +0100
Subject: [PATCH net v2 6/6] net: stmmac: fix XDP RX buffer DMA sync length
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-stmmac-xdp-fixes-v2-6-10eae8a093a8@oss.qualcomm.com>
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
        bpf@vger.kernel.org
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX5PxhGTC8xkmy
 GL3WibNjhlgHxbtC4gil3sbTG5N92oYw5OJ3udSDgzjOVyOtZv20yvD6phKPLtoRTE4d1WSZOiN
 Mg4cpRiXw05VlNgZAOEV/oRkdekoN6c=
X-Proofpoint-ORIG-GUID: QOneXbf4xY5n7hDgQmDfnq-gFkHg9Amm
X-Proofpoint-GUID: QOneXbf4xY5n7hDgQmDfnq-gFkHg9Amm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX7SKS1BoGwKVh
 DSM0pZAXUmVgbeVCIj9Mj6JyJ7yWTZKR3vxty72y/DrAbl05oP2smrqicQhHIkGbrq0u7VwmjG8
 IHCI6yKfEBOM1XZ7Hxpjtf4lPO8aAvO6TtjiA34Sx1OZMVq5Tlyz0K0DwE+8WLQEdUV2w+t/kln
 w7m+jZLoUcr6To4acJENnEkh+uQ+aTYpccNjN4VBbLa9t4Vmi7l/3EOuAR+JrqfFd5nflDHAjdg
 oFhesNMX7zDQ+8KOEMm/be99AVxytm+4GT49S45IwKPGiGIop3o1N7VjnPRXTPG4seJ+E+0xY50
 wVl1GTX34qSwy9am2/ob7ECkMOZrXcWtqkSYJXmlUxR0leClCOVDeGY2NApUKbynp3Rl2jjWZFj
 xWs9mGtn7ju2SbTG/WdOB9C9z9x24aS9TTpjJeCHv354Mi4560jATFF56gK/A+w0mGnM0hGAD+N
 xOKpTfEs/RzMCwn8Tpg==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0abd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xzJaxtAIzuUiCKeOh8cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_064909_241514_7D6EF451 
X-CRM114-Status: GOOD (  18.96  )
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

stmmac_rx() bounded the DMA sync length by the largest data_end seen
before and after the XDP program and passed it to page_pool_put_page()
on the XDP_CONSUMED path. bpf_xdp_adjust_tail() zeroes the grown area,
which dirties the CPU cache, but a later negative adjust only moves
data_end back. If the program grows and then shrinks the tail, both
endpoints miss the zeroed range, so those dirty cache lines are not
written back before the page is reused.

The length was also wrong since commit 88095728511e ("net: stmmac: fix
rx Scatter-Gather support") moved the page_pool DMA window to offset 0
and set max_len to dma_buf_sz + page_offset: the driver still
subtracted buf->page_offset, so it synced [base, data_end - page_offset)
instead of [base, data_end).

On a non-coherent platform those dirty lines can be evicted after the
device has DMA'd the next frame into the recycled page and corrupt it.

Sync the whole page_pool DMA window on the XDP_CONSUMED path with
page_pool_recycle_direct(), as the PASS path and page_pool allocation
already do. The device only writes [page_offset, page_offset +
dma_buf_sz), so syncing [base, base + max_len) covers every cache line
it can touch, regardless of how the program adjusted the packet.

Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
Fixes: 88095728511e ("net: stmmac: fix rx Scatter-Gather support")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fb3b7174599e..b038472b9817 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5970,8 +5970,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			len -= ETH_FCS_LEN;
 
 		if (!skb) {
-			unsigned int pre_len, sync_len;
-
 			/* Each frame starts here: reset the FCS handling */
 			fcs_stripped = false;
 
@@ -5989,29 +5987,18 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
 					 buf->page_offset, buf1_len, true);
 
-			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
-				  buf->page_offset;
-
 			ctx.priv = priv;
 			ctx.desc = p;
 			ctx.ndesc = np;
 
 			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
-			/* Due xdp_adjust_tail: DMA sync for_device
-			 * cover max len CPU touch
-			 */
-			sync_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
-				   buf->page_offset;
-			sync_len = max(sync_len, pre_len);
-
 			/* For Not XDP_PASS verdict */
 			if (IS_ERR(skb)) {
 				unsigned int xdp_res = -PTR_ERR(skb);
 
 				if (xdp_res & STMMAC_XDP_CONSUMED) {
-					page_pool_put_page(rx_q->page_pool,
-							   virt_to_head_page(ctx.xdp.data),
-							   sync_len, true);
+					page_pool_recycle_direct(rx_q->page_pool,
+								 virt_to_head_page(ctx.xdp.data));
 					buf->page = NULL;
 					rx_dropped++;
 					goto next;

-- 
2.56.0


