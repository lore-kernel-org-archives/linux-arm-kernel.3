Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D462C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R5x2K8JF;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWf80ssf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fX/I8wK+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t1HGN9k89SSRdYCs5v027mAthueeDnZ3FtFBWpQLM/E=; b=R5x2K8JFqm9K0c
	P2oGlkWcFILbR/sj4Xk2cE6mZaT99rs1gU7mFuAg+IFvwEOqrH0TwXCe+BrWj8Lfxebc+RTsQRP/X
	TNFI7YNCZ4280ObDb9vOkTe2Ffma4qVf957LZtNi/QxSvDaPD/LAG9obJmgBvGueWzo1eKwao5ZH0
	Fhgx2dvIz0NCmLVXGV19WF6kn6XD1EK3lwrfSttsCixGwVEygT4FMYqZP1obp/NrpiJod4eUUgtCv
	ni+vYV7wNLp6zZhHnBmT3yW2EDwV1agKxp3JKiVbqB28hlktdMGadm5EUFHJA3ulFnayrvNPi9fV2
	Di8u4ZBoy3u0T3FU6ZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMP-0000000FtAm-04Aa;
	Fri, 23 Oct 2026 08:10:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAMH-0000000Ft5s-47j1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:10:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FNAb1048304
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1HGN9k89SSRdYCs5v027mAthueeDnZ3FtFBWpQLM/E=; b=iWf80ssfOvmVKlnI
	cab6ohzn3GukSbD5s8FwmdyjPD+fTRMpwXCweGlzIIJ9rSAKATSoCYpfAT7f8ht4
	U2l0sX8iIdtCxHJjUxyfYmsWqp5SyCb2CdFCWkaNfC8urzOZhQQdz6sfiHOttEL/
	u1CGNmWGmZNPtYyWSTnImsCa7CeiFnia2CEIUg18Kf9wa2w3FiyNFwj3mmO/XGad
	R+w1kLJdIjlV4uYXmr07orj1jUY+sVHd1HbRnlFlZDI2FuOe6aJKPH55GkYcSeEG
	8jCZ+jCTVnQr+AsTYBnxvRItjh7aPhLK4kWmKsb+JY6XQ8lTKdKIhwT1xXcvye4N
	drkLjw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbjpv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:10:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so114980985a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743036; x=1793347836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1HGN9k89SSRdYCs5v027mAthueeDnZ3FtFBWpQLM/E=;
        b=fX/I8wK+O6/QxwFUuIRvL+IPgzyJO5fNUvDM/K8maaYseh8uhgSMVgMDGypajkkkDk
         egEv0T4jyihtta7hIapfdpTgiPB7rgix+3g+IHiU312XAtxez1N99bicdgDiO/Q5KgtY
         dONsnnHEU9+wHu/idTgAsRYuRyG0ZnVSkMkaes5646GDX77TSa3UbR7a9rM6byz3j6OO
         HsXJf56Oxwk+W+NsBHHwFymS4ZcdZNYYwxb3jZoo/gKm3Rq0CrnCRU9R/bqcRhBc9AQ9
         BhHPn4BDPxUUHo+z9zy/gVou3pPo5lN5IXx2t1DW9WiLswsnZTXkBaEZgNB7c02b/Rd4
         r2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743036; x=1793347836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1HGN9k89SSRdYCs5v027mAthueeDnZ3FtFBWpQLM/E=;
        b=Hb5Lhb/9WuwwJlEziV9VtzyRISKvLuEq1nrALRVbka28YZ/0tCXajld5ZT2jtjYak9
         XS6S89PRXlhEqfM2SM+4e/V2IYmduWHteHQ8Dj5oVUySWpHA30zXeZSB7GI2xA5Do9Bv
         xcSTWyZQDXhs6J1RXLSwhlBg+JIVZt/jJZBrg/wm2WUHd34TZIlqdifvsnXDEWGJFrGq
         K8M00IKjJpiYQeXviJ1Gf+9WpAmz6tzy7gbg+BVjrEFOuxNExZUWtNVEzLhARhbms9hE
         4hwPvWtoTXA+jKKLudbkt4o4UJpUrF9sSuEO1yKiF2cv9px5SiX2t92Gt6E67AqSnKGY
         muOg==
X-Forwarded-Encrypted: i=1; AKwUvBy6fXQSPfoPvWJDY6sgSZANCadNQF9/SwGZODfKay7I3jP7Ofgok789Qlzk9bIvIO0LgMszewERDcWzfvMF1sxm@lists.infradead.org
X-Gm-Message-State: AFq9FYIvrrUCnqOKbS3nlpBfb/hczNWVgQ5ZC/hnWHUp1gqVHRdDYseo
	GQlGUyGqGFNqtA0LWs7Tv8hqDI9lSAZAQGHSZa6dFVQSjfVgEyicvOIrIYj2VU3TnySpDrRs8y+
	rflzfrkBHCmLxBxxTiRjsMPbmENaJcF8aIZGbeDkKiZp4P7nO7l/QoA6tViRdEozzcLlp4Dl1Xs
	em3Q==
X-Gm-Gg: AYBFou1weqFb8/3RYezPM1P19kh9lhfvAC+ar+ZSt54GM14wMlMdG6JEWmghQIDus4s
	p+tLUEtavUp5rSkIZ9KPf15PvEzyDeiAP4ddJUK/bwAIQWa6FfWoehult6aI22ElEfN4uWEXR71
	rCJmRr/QhGMODjnDBrFx99riHdZ8ASmFqWgcGI3yPo684jKs+/JnuNh5Bbq7G41C06rd/o6KZmV
	bXQAcHYDZ+fcnnZFuxIMWL/VAF7yMxtuCz00IgvrrpaB8MdIFQYp/D3CXv7TYg0MSodqqenpCH3
	AQIAGUPyER11tUkCddirDHD9oUKG8OtUMZLh0e4sG7iArRzNpzCATyN8LGkFvBLVrUHrK4GOlLh
	46usj2hqu0ohjqlYRjCOEEQcqdMn8W4hrpC8GM7ibsGGe3f53
X-Received: by 2002:a05:620a:4109:b0:93e:c12c:4412 with SMTP id af79cd13be357-93f6f8ce27cmr271338085a.78.1792743036217;
        Fri, 23 Oct 2026 01:10:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:93e:c12c:4412 with SMTP id af79cd13be357-93f6f8ce27cmr271336785a.78.1792743035688;
        Fri, 23 Oct 2026 01:10:35 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38063e62sm3172727f8f.57.2026.10.23.01.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:10:34 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:09:54 +0200
Subject: [PATCH net 2/6] net: stmmac: drop split frames on AF_XDP zero-copy
 RX
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-stmmac-xdp-fixes-v1-2-efb37e19f5bd@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXzKttJX+voAqf
 OkRQ3JJIsNonpVFe7FsLz1n1Gg4gkWMJIBWsjqe3HDFBDL469dO8wyjbTwI64EGyF08k/Kod1qO
 fjGgNF39T/kcMGMaRBmzcLB+LhjMvGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX7YhLKBLe/elG
 14qwWtIYsw8486amtXNUJutOeDEN1RJAVZSWP3rAik1S4puUpx7c4WAlEuXeRRnu4dOVvYb5KKO
 OnBNxlHwJDbC2oNPy9osigd1idvYQOVprSXgVLk5gjJYHgAjrWIlcEZUr87Eff5ugheExa1NEc9
 0TkKcpainQyrEBKMXAytvH8ncz90tfRLj+TNArBwqu4PbLYRhIyOer3qAM0MivsXcFca9M8nIdu
 EeoI2UiilNW6+P1u9TdDcSYRreVE8tmEeAppAAL9s7k8TmV5mnNFzeqeFvsBv7JRHe8zud14Dj+
 PODqUxiYD9MzeKRCWPPHAAFTpyBz95GIluEajQr0RGSGce/7nJKZLVWw/nRjw+si21MJnF5U/4Z
 01NCShi92zNOzCqnWyHbKwlO2yQuq2PocYaI8uN0Z5y9NB4d5xNmGcFeVuWrDd7kbQqsdaLmIWI
 /Q994cr9fyqFMqC3Htw==
X-Proofpoint-ORIG-GUID: TKNVXz8mzrN-oto6ScZbe083WnE0d4Gu
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb167c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6POjKhNZmwZEydtLWKIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TKNVXz8mzrN-oto6ScZbe083WnE0d4Gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011038_185770_A11C18EF 
X-CRM114-Status: GOOD (  23.76  )
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
index 051253601225..297e2428a8f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -184,7 +184,7 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 
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
index fba21599a5e1..3fa2c15222d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5710,18 +5710,21 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats,
 						  rx_q->dma_erx + entry);
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
@@ -5730,8 +5733,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (likely(status & rx_not_ls)) {
 			xsk_buff_free(buf->xdp);
 			buf->xdp = NULL;
+			rx_dropped++;
+			error = 1;
 			dirty++;
-			count++;
 			goto read_again;
 		}
 
@@ -5898,7 +5902,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
-		if (unlikely(status == discard_frame)) {
+
+		if (unlikely(status & discard_frame)) {
 			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
 			buf->page = NULL;
 			error = 1;

-- 
2.56.0


