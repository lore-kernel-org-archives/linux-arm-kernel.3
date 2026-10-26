Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E86606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VWPFtscg;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TUdJxFiI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U9rQNjF9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1dbgIUcte8kMbY8XrCw2hxgZjhtzXlKiXSbaGDvMmP8=; b=VWPFtscgdz6gJT
	qcfnYOnCPHhQFpBKt8rEZG0GCAa6Z+wjw0cU7iSvTJGjCnSI3TwODfPISKZ3m7g5kq3rooXvM5uc4
	4VvLltw/dMFKTKL0pKkpmsgqUgr5tZ8N2oAb6vCnxRQwiTFppvh0wHz6OPoPcRbLnfqid00I6OPDj
	E5r+o6iz4ah2nJms/Z++DEorNMjK6ZVlGEAsJrx2W5Rbb6HYiG3g8zJbWADS/7IzQlmdViR0/htE1
	EI15bGEHkyVLNbF2vOOccAiiayiO6Ri6Np0MP+JhRedUfrFzweipjPKr3CcfmwgEIzj8zQus8JM76
	EDyMMeYPIjrolr7MQ5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNzv-00000002w8g-0RPF;
	Mon, 26 Oct 2026 16:56:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNzm-00000002w4F-0VbP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:56:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvqmQ4098948
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 16:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dbgIUcte8kMbY8XrCw2hxgZjhtzXlKiXSbaGDvMmP8=; b=TUdJxFiIlAWsphgA
	uDvhoDgUIbWVj5fdbuc/2dkeH9LEzfXM9jDg2peJzXaHI5aKgJ5z0jfCQCO8N90g
	dzc7T4m7B4Bvt8WzQYqxIwj6wzbu5XfXTO4xJa7KUz+vf9L9dPhaEop0TZhPbDzk
	hHfbF1R2DNroE44AOrpbN6EKWaMZNMDRnDOVIBvzymnyAGsufoMpFA5W7D9y7OKF
	nFQOS2UzSitWkHP6qmpOIGkMAJqLiftTsnl3n5PCJHinBdfKqtB57i7DNoH8FQpj
	BI1C7vIGp6xux2yk/5kyh9544oIr4IiXekwMzLVTUCzazJWWSUDBYh8um6ehno7m
	9RVHnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s91me0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 16:56:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so727456785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793033784; x=1793638584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dbgIUcte8kMbY8XrCw2hxgZjhtzXlKiXSbaGDvMmP8=;
        b=U9rQNjF9CxYWDVhkvj/Cca4AV2SmpPCxTvETDl5p51oqEngTkdoD0ZxDzacPNszZZV
         9CUq6O8q2zh0SYw/cDm/UTPXAaHpUXxO98q0ssgBQfhh9yvySaTAj+l0vwzS3IDYs6Rc
         02Zn8Mzb5xzCNdyxRh6qPgumeho0cQhgpSWWNfnQAy8O/ftLtSLiZGXoSk4gVrhCNRUj
         N/31Yf1/44JdyrGxWqMM0fSKUlmQeg/BeCu/9hbZsCGoRQJuD3pUh/yzuO8uJDDMGbfO
         kB8o1PymjlX4mYaT1UWKFRGh9iezxoiWykQ602thfB8LsTlEPPI4aYNMlYbMDdkMieyH
         FmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033784; x=1793638584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dbgIUcte8kMbY8XrCw2hxgZjhtzXlKiXSbaGDvMmP8=;
        b=riiejQNQ99NKlbW3NAstebdUJFXBPb4va9r/7s+O3ScQ6fIuHe5yF14P4Np+yBNO0l
         RwX1T/P82cfQ6+OwwWiiIQwkraXxBa+JD/3j6gg+M7gDhSSWrJIOyqGrLy5SgxG5ZXQO
         b2s8AfMAIZ8whUWHjNOTuYYlsUJNjeu9Jj5T5ZJ6IibnYR0/ml4VNptU3KI6iRNBnXvm
         qEAy/sjYcm3WB6LhozucXBn67TKF9zi+8ZkcWx+qzOwU19t46chkPdGSOGu/UTmnXG+f
         QIdlT+sNPsiIR3cKjwsrSQxjq1X3bAflEXdqmU+LtKpNS1/HStjx603LElvvccx4F/Vg
         XIYA==
X-Forwarded-Encrypted: i=1; AKwUvBym70y1ZAQBMN7N9kSemBjF40K2vrYykCHX6aBL7EJYAN4ysna2gv16DqH9yGT6BGkcKwzQ2L9N2wbHPxef7K/1@lists.infradead.org
X-Gm-Message-State: AFq9FYKkk291GZWbqnExMInX9Z5dkCbucdxzR0aDLDXA8AHc8G8sGdRn
	cb5H2myO3pfuD8Lx/SiZZ8G1A8cohNmawEutIcW7KIl8AHr6VPhMQIKbCQN2cmtWZA4ADmsE8dK
	oBOuKw07Pw3Kc7cMfyBdaFWJj7Bv6XRwtHJ22qcSKSadt5oBdggtfMeJV+PLRTBeyXmF9T2TCWk
	UyLA==
X-Gm-Gg: AYBFou1cqBftyuVYl8pvZsH5SLdKl3J+2vptLALfnRjNMQyXlz6dsAfFtbW/vkF4VWa
	lJD9CKEmi6hwAWub4L1n8MHSCxydwShop+k2tDsWEMGaahWIAZL9DhAHjlmZ7uiCbZvrBuxgXnO
	yz1eH3fL0NlXTPte2PraaCz7T+7bva7YkA6HNYYWWyaVXHqcHI9rG4JlerqB3arzInjUXvXedMa
	iEpBM89GZ3Xa04XKJS6OMTLhJNasiYMu8UkMe0gWk7eX6MVKeRIIue9oV+57kViJWZKokc1SRT2
	oLQyudR3QDY5tNQng1+5n74HYQQdYDlhaKLWOgNOITYzN/s8riNIMhiMikaMdmus5b4dG7/spv6
	udAS1wYxE7eY=
X-Received: by 2002:a05:620a:4150:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-940ef7aad70mr1111741385a.3.1793033784237;
        Mon, 26 Oct 2026 09:56:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-940ef7aad70mr1111734785a.3.1793033783581;
        Mon, 26 Oct 2026 09:56:23 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm17839839f8f.47.2026.10.26.09.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:56:22 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:55:58 +0100
Subject: [PATCH net v4 3/3] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-stmmac-est-fixes-v4-3-999dac4de44f@oss.qualcomm.com>
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX8lT42JZiThQO
 4JkP3LiyvQWs7cxTYRlt3Y/Z3dIDSPVO63A0x95kVCr7VvqNo3sUSMUxnop/GOXn+E92x/nDuPD
 bkw9mtctpdo7dvvihmmS+iElVCKvaoPzqn5KPiKolXgf1PHpmStnzUib1jLlvU/Exu7DBdJzgPL
 B32ey2xZ7IOz8MAaguOGTCg9D5JgE7Q0/MAVCpj+f5fzRKqGxfQvxGaynoAcbMpGm+dG0g3Ajx0
 nopHIGFzAPTtgu4Hh0BLwbZTR1yuONzyg1YwwwN+LWibmUDcJ04hrYoBbZw304cjZ5G4HfmeaEI
 mWR54J+8lHz6Qqg6m6H76YhJqiATiQRWB+DNvx5UfaweKRB7xnY6/AP1Jo8E0IA75xyy5P25E8w
 tqO/Cn8OgD/kPHlZKnaxOxL8UqYO59QiGMr2krDiAoWpi43Qy6Ak2tQ6s/AYU5qjz+EVJA9cPfS
 3M5kQisVBVCcLMZZIqg==
X-Proofpoint-ORIG-GUID: Eu1Uq9CQ5FQF_-F2wlSvDsy5ZGDIErEV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX0ala/iYzeFsC
 jprwT4SolcL67mzu4vqcj9j8kqFFr1MwPFA9oLUhqScyL6bYYMeu8/WzALeFTOhtUrymNc58oFk
 I95wtpvgll5D1eQoZt0zBdh+3PC5bIM=
X-Proofpoint-GUID: Eu1Uq9CQ5FQF_-F2wlSvDsy5ZGDIErEV
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf8639 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JpBpa1p7AAAA:8 a=DNwXZpNFxi9TDD9oO0cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=YCh05so4W2E6r1tszMC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_095626_348975_53796190 
X-CRM114-Status: GOOD (  25.95  )
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

The core soft reset issued by stmmac_init_dma_engine(), called from
stmmac_hw_setup(), clears the MTL_EST registers. Nothing re-applies the
taprio offload afterwards, so priv->est->enable stays true while the
hardware EST block is left disabled: taprio keeps being reported as
offloaded, the TX/XDP paths keep dropping frames larger than
priv->est->max_sdu[], and the programmed base time is stale.

Re-apply the offload from __stmmac_open() and stmmac_resume() after PTP
has been brought up. The base time is recomputed from the reserved base
time and the current PTP time, because the timestamp counter has been
re-initialised and the previously programmed base time cannot be reused.

Factor the recompute-and-program sequence into __stmmac_setup_est(),
which must be called with est_lock held and only marks the offload
enabled once the hardware programming succeeds, and into
stmmac_setup_est(), which takes the lock and re-applies the offload only
when it is currently enabled. Use the same helper in
stmmac_adjust_time() so the PTP adjust path shares the base time
computation.

Since __stmmac_open() and stmmac_resume() now trust priv->est->enable,
also make tc_taprio_configure() consistent: hold est_lock across the
whole validate-and-program sequence, build the gate list in a temporary
buffer, and only commit it and enable EST after validation and hardware
programming succeed. A rejected REPLACE then leaves the currently
installed schedule intact in both software and hardware, while a
hardware or FPE mapping failure disables EST instead of leaving a stale
enable flag behind. Reject cycle times whose seconds field would not fit
in priv->est->ctr[1].

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  | 35 +++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  | 18 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 30 ++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 87 ++++++++++++++---------
 5 files changed, 122 insertions(+), 59 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index f15d4d046aa7..1a89f12f997f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -80,6 +80,41 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 	return 0;
 }
 
+int __stmmac_setup_est(struct stmmac_priv *priv)
+{
+	struct timespec64 current_time, time;
+	ktime_t current_time_ns, basetime;
+	u64 cycle_time;
+	int err;
+
+	lockdep_assert_held(&priv->est_lock);
+
+	priv->ptp_clock_ops.gettimex64(&priv->ptp_clock_ops, &current_time,
+				       NULL);
+	current_time_ns = timespec64_to_ktime(current_time);
+
+	time.tv_nsec = priv->est->btr_reserve[0];
+	time.tv_sec = priv->est->btr_reserve[1];
+	basetime = timespec64_to_ktime(time);
+
+	cycle_time = (u64)priv->est->ctr[1] * NSEC_PER_SEC + priv->est->ctr[0];
+
+	time = stmmac_calc_tas_basetime(basetime, current_time_ns, cycle_time);
+	priv->est->btr[0] = (u32)time.tv_nsec;
+	priv->est->btr[1] = (u32)time.tv_sec;
+
+	err = stmmac_est_configure(priv, priv, priv->est,
+				   priv->plat->clk_ptp_rate, true);
+	if (err) {
+		netdev_err(priv->dev, "failed to re-configure EST\n");
+		return err;
+	}
+
+	priv->est->enable = true;
+
+	return 0;
+}
+
 static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 			   struct stmmac_extra_stats *x, u32 txqcnt)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
index f70221c9c84a..0f0f162794c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
@@ -4,6 +4,9 @@
  * stmmac EST(802.3 Qbv) handling
  */
 
+#ifndef __STMMAC_EST_H__
+#define __STMMAC_EST_H__
+
 #define EST_GMAC4_OFFSET		0x00000c50
 #define EST_XGMAC_OFFSET		0x00001050
 
@@ -65,3 +68,18 @@
 #define EST_GCL_DATA			0x00000034
 
 extern const struct stmmac_est_ops dwmac510_est_ops;
+
+int __stmmac_setup_est(struct stmmac_priv *priv);
+static inline int stmmac_setup_est(struct stmmac_priv *priv)
+{
+	int ret = 0;
+
+	mutex_lock(&priv->est_lock);
+	if (priv->est && priv->est->enable)
+		ret = __stmmac_setup_est(priv);
+	mutex_unlock(&priv->est_lock);
+
+	return ret;
+}
+
+#endif /* __STMMAC_EST_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9e09e11cc35e..a13a3790207d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -48,6 +48,7 @@
 #include "stmmac_ptp.h"
 #include "stmmac_fpe.h"
 #include "stmmac.h"
+#include "stmmac_est.h"
 #include "stmmac_pcs.h"
 #include "stmmac_xdp.h"
 #include <linux/reset.h>
@@ -4201,6 +4202,10 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret)
 		goto ptp_error;
 
+	ret = stmmac_setup_est(priv);
+	if (ret)
+		goto est_error;
+
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
@@ -4224,7 +4229,7 @@ static int __stmmac_open(struct net_device *dev,
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
-
+est_error:
 	stmmac_release_ptp(priv);
 ptp_error:
 	stmmac_stop_all_dma(priv);
@@ -8518,6 +8523,10 @@ int stmmac_resume(struct device *dev)
 		ret = stmmac_init_timestamping(priv);
 		if (ret)
 			goto error_stop_dma;
+
+		ret = stmmac_setup_est(priv);
+		if (ret)
+			goto error_stop_dma;
 	}
 
 init_coalesce:
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 9a32af00d7d2..81ee89669865 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -8,6 +8,7 @@
   Author: Rayagond Kokatanur <rayagond@vayavyalabs.com>
 *******************************************************************************/
 #include "stmmac.h"
+#include "stmmac_est.h"
 #include "stmmac_ptp.h"
 
 #define PTP_SAFE_TIME_OFFSET_NS	500000
@@ -55,7 +56,6 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	u32 quotient, reminder;
 	int neg_adj = 0;
 	bool xmac, est_rst = false;
-	int ret;
 
 	xmac = dwmac_is_xmac(priv->plat->core_type);
 
@@ -69,14 +69,14 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	nsec = reminder;
 
 	/* If EST is enabled, disabled it before adjust ptp time. */
+	mutex_lock(&priv->est_lock);
 	if (priv->est && priv->est->enable) {
 		est_rst = true;
-		mutex_lock(&priv->est_lock);
 		priv->est->enable = false;
 		stmmac_est_configure(priv, priv, priv->est,
 				     priv->plat->clk_ptp_rate, false);
-		mutex_unlock(&priv->est_lock);
 	}
+	mutex_unlock(&priv->est_lock);
 
 	write_lock_irqsave(&priv->ptp_lock, flags);
 	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
@@ -84,31 +84,9 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 
 	/* Calculate new basetime and re-configured EST after PTP time adjust. */
 	if (est_rst) {
-		struct timespec64 current_time, time;
-		ktime_t current_time_ns, basetime;
-		u64 cycle_time;
-
 		mutex_lock(&priv->est_lock);
-		priv->ptp_clock_ops.gettimex64(&priv->ptp_clock_ops,
-					       &current_time, NULL);
-		current_time_ns = timespec64_to_ktime(current_time);
-		time.tv_nsec = priv->est->btr_reserve[0];
-		time.tv_sec = priv->est->btr_reserve[1];
-		basetime = timespec64_to_ktime(time);
-		cycle_time = (u64)priv->est->ctr[1] * NSEC_PER_SEC +
-			     priv->est->ctr[0];
-		time = stmmac_calc_tas_basetime(basetime,
-						current_time_ns,
-						cycle_time);
-
-		priv->est->btr[0] = (u32)time.tv_nsec;
-		priv->est->btr[1] = (u32)time.tv_sec;
-		priv->est->enable = true;
-		ret = stmmac_est_configure(priv, priv, priv->est,
-					   priv->plat->clk_ptp_rate, true);
+		__stmmac_setup_est(priv);
 		mutex_unlock(&priv->est_lock);
-		if (ret)
-			netdev_err(priv->dev, "failed to configure EST\n");
 	}
 
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index ac926c60f9f9..95c5f6100c66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -966,11 +966,12 @@ static void tc_taprio_map_maxsdu_txq(struct stmmac_priv *priv,
 static int tc_taprio_configure(struct stmmac_priv *priv,
 			       struct tc_taprio_qopt_offload *qopt)
 {
-	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
+	u32 wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
 	struct netlink_ext_ack *extack = qopt->mqprio.extack;
 	struct timespec64 time, current_time, qopt_time;
 	ktime_t current_time_ns;
 	int err, i, ret = 0;
+	u32 *gcl = NULL;
 	u64 ctr;
 
 	if (qopt->base_time < 0)
@@ -1013,42 +1014,46 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		return -EOPNOTSUPP;
 	}
 
+	mutex_lock(&priv->est_lock);
+
 	if (qopt->cmd == TAPRIO_CMD_DESTROY)
 		goto disable;
 
-	if (qopt->num_entries > dep)
-		return -EINVAL;
-	if (!qopt->cycle_time)
-		return -ERANGE;
-	if (qopt->cycle_time_extension >= BIT(wid + 7))
-		return -ERANGE;
+	if (qopt->num_entries > dep) {
+		ret = -EINVAL;
+		goto error_unlock;
+	}
 
-	if (!priv->est) {
-		priv->est = devm_kzalloc(priv->device, sizeof(*priv->est),
-					 GFP_KERNEL);
-		if (!priv->est)
-			return -ENOMEM;
-	} else {
-		mutex_lock(&priv->est_lock);
-		memset(priv->est, 0, sizeof(*priv->est));
-		mutex_unlock(&priv->est_lock);
+	if (!qopt->cycle_time ||
+	    qopt->cycle_time > (u64)U32_MAX * NSEC_PER_SEC) {
+		ret = -ERANGE;
+		goto error_unlock;
 	}
 
-	size = qopt->num_entries;
+	if (qopt->cycle_time_extension >= BIT(wid + 7)) {
+		ret = -ERANGE;
+		goto error_unlock;
+	}
 
-	mutex_lock(&priv->est_lock);
-	priv->est->gcl_size = size;
-	priv->est->enable = qopt->cmd == TAPRIO_CMD_REPLACE;
-	mutex_unlock(&priv->est_lock);
+	gcl = kcalloc(qopt->num_entries, sizeof(*gcl), GFP_KERNEL);
+	if (!gcl) {
+		ret = -ENOMEM;
+		goto error_unlock;
+	}
 
-	for (i = 0; i < size; i++) {
+	for (i = 0; i < qopt->num_entries; i++) {
 		s64 delta_ns = qopt->entries[i].interval;
 		u32 gates = qopt->entries[i].gate_mask;
 
-		if (delta_ns > GENMASK(wid - 1, 0))
-			return -ERANGE;
-		if (gates > GENMASK(31 - wid, 0))
-			return -ERANGE;
+		if (delta_ns > GENMASK(wid - 1, 0)) {
+			ret = -ERANGE;
+			goto error_unlock;
+		}
+
+		if (gates > GENMASK(31 - wid, 0)) {
+			ret = -ERANGE;
+			goto error_unlock;
+		}
 
 		switch (qopt->entries[i].command) {
 		case TC_TAPRIO_CMD_SET_GATES:
@@ -1060,13 +1065,26 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			gates &= ~BIT(0);
 			break;
 		default:
-			return -EOPNOTSUPP;
+			ret = -EOPNOTSUPP;
+			goto error_unlock;
 		}
 
-		priv->est->gcl[i] = delta_ns | (gates << wid);
+		gcl[i] = delta_ns | (gates << wid);
 	}
 
-	mutex_lock(&priv->est_lock);
+	if (!priv->est) {
+		priv->est = devm_kzalloc(priv->device, sizeof(*priv->est),
+					 GFP_KERNEL);
+		if (!priv->est) {
+			ret = -ENOMEM;
+			goto error_unlock;
+		}
+	} else {
+		memset(priv->est, 0, sizeof(*priv->est));
+	}
+	memcpy(priv->est->gcl, gcl, sizeof(*gcl) * qopt->num_entries);
+	priv->est->gcl_size = qopt->num_entries;
+
 	/* Adjust for real system time */
 	priv->ptp_clock_ops.gettimex64(&priv->ptp_clock_ops, &current_time,
 				       NULL);
@@ -1091,7 +1109,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	ret = stmmac_est_configure(priv, priv, priv->est,
 				   priv->plat->clk_ptp_rate, true);
-	mutex_unlock(&priv->est_lock);
 	if (ret) {
 		netdev_err(priv->dev, "failed to configure EST\n");
 		goto disable;
@@ -1102,11 +1119,15 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	if (ret)
 		goto disable;
 
+	priv->est->enable = true;
+
+	mutex_unlock(&priv->est_lock);
+	kfree(gcl);
+
 	return 0;
 
 disable:
 	if (priv->est) {
-		mutex_lock(&priv->est_lock);
 		priv->est->enable = false;
 		stmmac_est_configure(priv, priv, priv->est,
 				     priv->plat->clk_ptp_rate, false);
@@ -1116,10 +1137,12 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			priv->xstats.mtl_est_txq_hlbf[i] = 0;
 			priv->xstats.mtl_est_txq_hlbs[i] = 0;
 		}
-		mutex_unlock(&priv->est_lock);
 	}
 
 	err = stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
+error_unlock:
+	mutex_unlock(&priv->est_lock);
+	kfree(gcl);
 
 	return qopt->cmd == TAPRIO_CMD_DESTROY ? err : ret;
 }

-- 
2.56.0


