Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BCC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UdaK5o3s;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cgfg+4WL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kjHtQijG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zuYvl9RTPGfpKJSHddHmzLZeYj09elzQOBQVTivLk3E=; b=UdaK5o3sC9Y/AK
	puo77dR0t9CWwwzrZpTJfKgkxoU1BLWjSggVaPinIxLdWiNzYRRmhCFftCr2phB1zLtPPEYB14/fj
	YEtupmJcdsJKZIDBh0tpKnpR2HeEXdWlXt42In7QfFXViWQdfE/IraLHnV2T+NfAwXgIpn+ViPWA8
	PWMtAsHd/UcmVNzFDVVBgTQG5hO2HsD4E5iE6FE8IBa4aIswPpbla5OBKapv0NtvzJtCB7fsISFUw
	j4onXiw08pqpp7LD2xL4z5dWjIx9ZPhDGySwGWyoL4Dwx7y+hlU9xZunITbUs8JkKl5AqqqhKmcvw
	Vy5hgZxCYAvNd6vVp43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNSj-00000008zJ8-1shL;
	Thu, 29 Oct 2026 10:34:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNSh-00000008zIU-2wvE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:34:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vDSl3824980
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuYvl9RTPGfpKJSHddHmzLZeYj09elzQOBQVTivLk3E=; b=Cgfg+4WL7srhGpoK
	mGLled2a+KpGn0JBvWA4rJyoWfeLWheEO3PxAvIvcP3xD+r6Zgc6DdT7jtW5IOIS
	r9/10S5NpnUvJf/jfwB4iJr1cH+YCOukWt+GOZ3XtIGlesg34Et5byYr/5VHxSvO
	NLdn444O9WJbGnL3xF09/KTppNYl3oYHeCfImS2CmBSv8G0s93CI9BQDer0fAZHD
	2FiwzNkBHqM2Io5KQFcQpDnqbu2IdM84mYU8ZO7KeRCtmwnBIqZig+s+bzC5clHG
	BBgJKy4oJTe9i3VWb3w3BvH6tp/7UGSZjFzC9n85Q3iTxtDbelRmOzNa0ZPWQMH7
	+nJB/Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3hy28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:34:23 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec3e192929so525648e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793270062; x=1793874862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zuYvl9RTPGfpKJSHddHmzLZeYj09elzQOBQVTivLk3E=;
        b=kjHtQijGUUaVNFa0/TOfQ2m5ZH0zpsmdsc2vRO0sdPLaOmpG5khKnA/W7hOmMu2Hg8
         3DKqbyH1Dfw+8pvuOAm442EvIg4hMUprDyCXWbIiHIGVcbIXAMgil8bt4NWN8VijyxKz
         QBuV9MwnIeFSJCR/x0Hw/xI4BHkLD5FJC7BF4uSayUvNrPJZHATyCZiXDjk8KW0GpPbA
         DKH1FX/RcergIBLr0wgJMLLUL9QOAzQ/fgU303SQgQqCX7Pt7hOQ1Q6VPe0TjDQ1xgH1
         7QVujpOh9HSKdBtWybvrdRGzn6lZdiGRO3iQErZtdhmS35td/8PPQjX8L6suuDNv7hGx
         o3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270062; x=1793874862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuYvl9RTPGfpKJSHddHmzLZeYj09elzQOBQVTivLk3E=;
        b=caZ9LYuK6uB3F6yQZPP+imGJ0aDxrRvAkwa0MuD3nZMWmLR9+LWOg+e/G0ddKVN5cR
         jUzCDkBCYk4aHxqhqQ+qqs4ATA0tMYH8Twm8vHyVJf2N9JHXtOPiA6Gvchc0eFBv/9x8
         MBJQjtiisWsmJHUpkgTb6Mvia6lFMQqPNybMD6DaZSyvJEaoyuy+2XVC71sL76BriMxM
         wAnTnQhS5RtoAvAp8yiXItFPz7NUUHTTyUghM5M/76rk58zs8gTBb493wMcohsjT5uxI
         TEQqo7G4yVRPgjqLpywbrbUVFoLCj0k5LIhlHc88h0IrdAB499y5umpMSGigVXyE0xQA
         Kt+w==
X-Forwarded-Encrypted: i=1; AKwUvBzQADIkgi2lI/WMyYJPVi1bpLcnrOKX+eSD1Bikqx9arsRNU4wOZapJi0VPy7WXjfbsS4l72xms92l4o0SSw9/7@lists.infradead.org
X-Gm-Message-State: AFq9FYIMycfnboHKluEfL/iT+OI4EAgbTZrDyk1Lldo3L+yDXh/DAmiw
	/EWe4NKdC+N+tXxu2wTnusitzgY8j8/K76vomJibJR1YV2K1WA8NMkmOqGaqmeYqX1M9jQeTJ55
	2+5+d000yVUzPUEJAmBvzJJUhk88PaMUYXI1vEYv6ORKoFW4CRcBH1kjMRB9seHwJcP1RgfaNkX
	8M7w==
X-Gm-Gg: AYBFou0krTfYkNnUfTVJrfp7zfkOkAt6ZA/SfYejG/RT67doOad9Jy4z4iCXpepdBHe
	GuDm7xGfIGnRx6+IYu8AAwzZE/3JASQUtLRpR3V0AEXsQ40QghcYs6pjH/n/R3uTSfmK+LlLyaz
	4JIVoLQK8YKHEWKmvFCt74FD9/TCmq1yDlaGcuA4mWrIWOZaajOtNiMq60s2OU8vwobAjX2mzyw
	6krGXOne1Elsd/59Ho8YriB8I9pYB8Zjgdqs4RQWRfrVrGGgtJIFT1auCDBUjs5uE0r0782mX5V
	JOdGYEytT4yIRi+cb/PGgaVMYVY6HJy+urgAFDTrCQgjI7oQgcApHjefZ3zU30KNBUEmy7kRHv5
	WW694FNu9/8EPwuGHVz8ph86ttY8p8uk3hzIvWXhvmgY2e9dLrshsxnWLkRzo+2zKC9dlzDAnLm
	IP83dbUiAU4QTMaTEfUE5Iyw==
X-Received: by 2002:a05:6102:c4b:b0:7b3:8f0a:f76c with SMTP id ada2fe7eead31-7d03a50d0c9mr2037790137.13.1793270062096;
        Thu, 29 Oct 2026 03:34:22 -0700 (PDT)
X-Received: by 2002:a05:6102:c4b:b0:7b3:8f0a:f76c with SMTP id ada2fe7eead31-7d03a50d0c9mr2037769137.13.1793270061508;
        Thu, 29 Oct 2026 03:34:21 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm32219567f8f.55.2026.10.29.03.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:34:17 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:33:56 +0100
Subject: [PATCH net v5 2/3] net: stmmac: pass the desired EST enable state
 to est_configure()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-stmmac-est-fixes-v5-2-85b830a795a9@oss.qualcomm.com>
References: <20261029-stmmac-est-fixes-v5-0-85b830a795a9@oss.qualcomm.com>
In-Reply-To: <20261029-stmmac-est-fixes-v5-0-85b830a795a9@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfXwSpFrnlxrjOb
 Ff18JlwuPZAgSvHKP9XHPK4nwBOv3T/zAwyavAIGvrtzKpbyRlWMXgOsmsPnJLC06fS76qWdX4f
 Y6eFALzhXQGjwVqZFVzq5FknKC0YbGE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX416aCbGvI0S9
 lV4Ky36f406r4d9AxPZ2lQ+lxvfSjNBv0+o9b0lN/es2UnAFlt6pCaYEXeg96v5WH2WGm+SuLOm
 Cc+XVoaXej5wsLdWvIC13jvlMfjA6rvmjVIm7JsZLxGaOiXOihuAv1RCUlqeskO4I5EGgqGhJuM
 xAooGbzaKr2aITDooyjfNeiMtTd8zC+r55jM1XwtHdT0NLja3IjrbccJGOed/eO4XmwTlBDFTYp
 scsfEdcgtIJU/46KwQFInnI5K+VrK7hbPnURVsEZhczYrYhK4vnYOWFiAFBuJd2CteWSBatLclf
 5OMg0LX77n+23ZpjI/UEqLqFXAdmNVNJug/9MQ980Ws7VXXSe6u6aV6SeKuaqasZWqitHLUrIGX
 tcx5mM5g8eWkvMXcuRkGoNPRxbBBUqGvXO7i1bOsmdJ+hGt+W+SMprbW0p+de1mljZM1sRbM/Pc
 +IkqpyV2hBXSQYxG4Lg==
X-Proofpoint-ORIG-GUID: BhxbnsI8nY7IaDQ_EGeWG9vuLL1rJRWE
X-Proofpoint-GUID: BhxbnsI8nY7IaDQ_EGeWG9vuLL1rJRWE
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae3212f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Lt0KCD4LekEKBd4wozwA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_033423_775702_929FE5B0 
X-CRM114-Status: GOOD (  19.67  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index b2e557788803..8ae95e91a36a 100644
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


