Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B0606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z8QPbTpg;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l0qPbg8p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XeVZOhHa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+gjHR2ZKnCUDk1zYcm/TGYuZatJkEiYXE35oP4Du0ng=; b=z8QPbTpgNkICzd
	B8HFDk1227eWqbw1abAHksstyE3X59U/JBGKfWuBx/bLdW11f3EXUUWrVx99mkuHf2uyBwMm3p0Gv
	t+b792cON4MzbkbrnyyzU7ECkbtA/qqcmC51giSqN523JiZfSUVK0cgFyEdY0IJqBMly4gucQxI3d
	XKp0Rrlv+q08iQX11mcCunnxFP2CgNP+GfvXXBkvSvz2ZeYW/nUbDRznfR/b2sYuWrzIyU1/O4PNa
	95Sx13aHlItOcPA4sFhV+ZANzqpDQZe3QYqAL9ZTtYm4MI17U+2D31iQO4cAkDM9ocyOIj5d0k96i
	WYeL78/zcvSG9/C6yJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNzu-00000002w8K-40Dg;
	Mon, 26 Oct 2026 16:56:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNzk-00000002w2X-0INh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:56:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvio14098768
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 16:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+gjHR2ZKnCUDk1zYcm/TGYuZatJkEiYXE35oP4Du0ng=; b=l0qPbg8prFitPurr
	FQkVUv5jWEE/eZKDZkwBLh/YeFyHbOPlxI1y7/MdBOKvfF3GfOBgQs2YKPT44FfG
	JWiJ07UsUyKhOTz5mEmoEXQiDXmp6T6v1/iRV+r0eChR8iqzgmtPPN6toK+z9UeS
	PyXuEZ1Ws6o0Hw/lF47ED1xMCCUYpf1uW62S7Us5I3sUsopObWxbpZ4+rUuD9V3G
	n1wT/yTQ8XSV/kfrk940wSVXezQPJVosj4npNQ+HZPf7wSVG1nKXWyB/YK5vsM4t
	H8E7LghK4dP+7/K+aLQJKXEglzIlgwcdNY4sRKGrrxgv/HfYD1jwt/B/+luP7AMJ
	aTXF0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s91mdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 16:56:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so19001785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793033782; x=1793638582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gjHR2ZKnCUDk1zYcm/TGYuZatJkEiYXE35oP4Du0ng=;
        b=XeVZOhHaB7dWS2sAKToaWGOkKC9IlLSX3au6MRhcwR2xP7qIlSLjMrIMEDXvtD3pUk
         1Trbj8FzIBcLbev/ZweDWwyzaWDJ39yxRBcYpn5LWxNcusmpWpgYqhZG9ucKEsjeQjJQ
         DOgFt9HHNn9kqWmOLi3heDo5qzCbDYmwiTBs+flVXymRLfnvYHyurXZ24dzSyighfnl7
         4Z5EYlo4smxu7ZRaPDSC0aJsElQ+3hLf8jzvjS6S53USB0Fw0Ouycj3Hz/irrby+fpG9
         /ZEF3QVaK98g2ZwMz2g1IoH9ZWDbuqqiyT6UtIuWiDVega6K239ZRUAUgTVoLvrNKY78
         Li/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033782; x=1793638582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gjHR2ZKnCUDk1zYcm/TGYuZatJkEiYXE35oP4Du0ng=;
        b=o4UYktKm9sdNyG3/iP4ZfmBXLkiy4V/nWyTUY52kLRhyg0RBzt15qx3l9wySsAQI5G
         yJvRe0b7YQfHqD1KtWnwqaL0IX4J1SIBW3CZPQV75jz6H6B9nqc4hXCzyfeo7NjvPZrH
         +uwDxNG+hJZQ729tSNDoFdBuvyWklh23kzxO/g02tUbuiKZ4LSUtQncND5pU/bD052U8
         xsreATuc5ujKBxbpDbukN68IPuH/r4zoyVHg1PsFm34NLn0VKxmtEFly0phE6Ba3y2mP
         7COpqjS7w1tKsX/viwffCAjpgbzRu0U1CER4trCE+j7ZQfxJX7Se/NENkbDqhXhgdijj
         hAQw==
X-Forwarded-Encrypted: i=1; AKwUvBzeAfQQfi3SDnwt51oiTlGK9HCGbQaqsINpdwSwxt4UJJyJ/Bj7+RGw8FqQA7wLTJFpkwnTuJzYuaMc6iEgiTuV@lists.infradead.org
X-Gm-Message-State: AFq9FYKjDFwXm53UMp3jxjmdvjqiiw2QMIKsLPL59jxqGo8L2XiBYWVx
	KOmxa+pCg+J5m673i7ecVUY0z56J+xffO/AfXChDZzmnb5cUK7ximPvA84i6TkBn4cPvDyDzEoB
	T5YIf+AZu+v1un8h4noGWkWqLfwDc1uAuAq82nZo2QkN8k7vrDE6tEl67xlhHeIhmBV/bhEmdpn
	omvg==
X-Gm-Gg: AYBFou0Tqp30UNVVWrSPrLFhTDT+i8sI0Lj8CSE30+POvJ3H2ytlRlsUrwh7BuTdnal
	RQ1Q2XiNusk8tegKtIQTqnPA9Ti0fSuyiS2Y3hg7MWJsghrnEQxPvuEPrmRB7zmJXv+VtAnlFlq
	CRyw84apveL5/bhj5Mjza5jtQqr/SormuEJ4UjFV/9b3pJZ01XKO6FjaX461+DAvrlluzg9h5jl
	dJjHXCcSojTzptvrNz6NT+Qwps27+V0t6BtjhZIAtE2cQK3CmANbA3SwuJQIF7svfGmIrMrOOHs
	IVpVGxLn6ja44OSuexD4karDgYVcdhXRar+EyfaD+IElwgs0P6OMcyBHpEP3kOhZU58kIXOx1Af
	OdXw4fWwL4m4=
X-Received: by 2002:a05:620a:2626:b0:93f:22af:ccdc with SMTP id af79cd13be357-943f4a05f51mr47916585a.4.1793033782252;
        Mon, 26 Oct 2026 09:56:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2626:b0:93f:22af:ccdc with SMTP id af79cd13be357-943f4a05f51mr47912985a.4.1793033781681;
        Mon, 26 Oct 2026 09:56:21 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm16504747f8f.56.2026.10.26.09.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:56:20 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:55:57 +0100
Subject: [PATCH net v4 2/3] net: stmmac: pass the desired EST enable state
 to est_configure()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-stmmac-est-fixes-v4-2-999dac4de44f@oss.qualcomm.com>
References: <20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com>
In-Reply-To: <20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX10kXDzyW4W0z
 mqFrt1FvX92X5vZLRuap3m3JOHDQGuDR6xGTn896Z4Y42c4fQkyiMe0UOk2RQp2tcxS2G7YAZoa
 kYHCZuBLAICZ9Uu+HoSTgvkk5cB9JrKMTLRVEsjAiA+bH603XyEJx7lhuri1CQeUrFR9zwV11GV
 xMt4k/9oQWbJKdEin0QQE/6mvWtQGptk6RBhJ/M8aa64bXYw5F0Z1j9xiiOhQUiim4HnrnZIU0/
 yiH5vACIus/Ynzn1v1MqvV9M30wXx19KVkl5ng7/MyiYaQJY6Me1eEd/uopcsI0Qp/BYlPXanz1
 RJepj+fO52Wy/euL/pLliEo93aIgprL7tnYm53WVKjpzBhTkT06cMLVV1FMp+a/arKCJP74Izap
 RmepymiMQfnMEAflwDFXgMHyyedf8GBofcbGKwjYK79YFqyHqOOaeR5wiT60rtofv4i38KmzWBl
 GBDi6+f4zr8BIdyRcug==
X-Proofpoint-ORIG-GUID: AsRKT2ik0NnIR0ryiELl4BcXj21xy1R0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX8K20TlfkuYqi
 xiP3V7B0ryndC/1iZvUF1ZWoJMdYJN4es7/dXIZJIcOUKNhPgm0ZjsLtq2jqF9pDLIsuzQp3HHF
 J21AahjaRMbHSgrZmcH9fHmnFsvUcZ0=
X-Proofpoint-GUID: AsRKT2ik0NnIR0ryiELl4BcXj21xy1R0
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf8636 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Lt0KCD4LekEKBd4wozwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_095624_283237_168099FF 
X-CRM114-Status: GOOD (  20.49  )
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

Pass the desired EST enable state explicitly to est_configure() instead
of having it derive from cfg->enable. This decouples the hardware
programming state from the priv->est->enable flag, which records whether
the taprio offload is attached.

No functional change intended: the callers keep toggling
priv->est->enable around the EST programming, as before.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 50b590d67d87..b28509555d81 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -620,7 +620,7 @@ struct stmmac_mmc_ops {
 
 struct stmmac_est_ops {
 	int (*configure)(struct stmmac_priv *priv, struct stmmac_est *cfg,
-			 unsigned int ptp_rate);
+			 unsigned int ptp_rate, bool enable);
 	void (*irq_status)(struct stmmac_priv *priv, struct net_device *dev,
 			   struct stmmac_extra_stats *x, u32 txqcnt);
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index afc516059b89..f15d4d046aa7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -26,7 +26,7 @@ static int est_write(void __iomem *est_addr, u32 reg, u32 val, bool gcl)
 }
 
 static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
-			 unsigned int ptp_rate)
+			 unsigned int ptp_rate, bool enable)
 {
 	void __iomem *est_addr = priv->estaddr;
 	int i, ret = 0;
@@ -62,7 +62,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 		ctrl |= ((NSEC_PER_SEC / ptp_rate) * EST_GMAC5_PTOV_MUL) <<
 			 EST_GMAC5_PTOV_SHIFT;
 	}
-	if (cfg->enable)
+	if (enable)
 		ctrl |= EST_EEST | EST_SSWL | EST_DFBS;
 	else
 		ctrl &= ~EST_EEST;
@@ -70,7 +70,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 	writel(ctrl, est_addr + EST_CONTROL);
 
 	/* Configure EST interrupt */
-	if (cfg->enable)
+	if (enable)
 		ctrl = EST_IECGCE | EST_IEHS | EST_IEHF | EST_IEBE | EST_IECC;
 	else
 		ctrl = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index e54a3c887826..9a32af00d7d2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -74,7 +74,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 		mutex_lock(&priv->est_lock);
 		priv->est->enable = false;
 		stmmac_est_configure(priv, priv, priv->est,
-				     priv->plat->clk_ptp_rate);
+				     priv->plat->clk_ptp_rate, false);
 		mutex_unlock(&priv->est_lock);
 	}
 
@@ -105,7 +105,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 		priv->est->btr[1] = (u32)time.tv_sec;
 		priv->est->enable = true;
 		ret = stmmac_est_configure(priv, priv, priv->est,
-					   priv->plat->clk_ptp_rate);
+					   priv->plat->clk_ptp_rate, true);
 		mutex_unlock(&priv->est_lock);
 		if (ret)
 			netdev_err(priv->dev, "failed to configure EST\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index aea235a69105..ac926c60f9f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1090,7 +1090,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
 	ret = stmmac_est_configure(priv, priv, priv->est,
-				   priv->plat->clk_ptp_rate);
+				   priv->plat->clk_ptp_rate, true);
 	mutex_unlock(&priv->est_lock);
 	if (ret) {
 		netdev_err(priv->dev, "failed to configure EST\n");
@@ -1109,7 +1109,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_lock(&priv->est_lock);
 		priv->est->enable = false;
 		stmmac_est_configure(priv, priv, priv->est,
-				     priv->plat->clk_ptp_rate);
+				     priv->plat->clk_ptp_rate, false);
 		/* Reset taprio status */
 		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
 			priv->xstats.max_sdu_txq_drop[i] = 0;

-- 
2.56.0


