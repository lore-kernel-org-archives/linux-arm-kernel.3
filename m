Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93D5606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DrlIyLRf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=joYhGPpA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7ROzI5pFKC1DlvyH7PwbH3PaOSQ+SHEt5iuezD/Lo1w=; b=DrlIyLRfHfiw1x
	TDnXMYSyrnE2LMyIm9MGD4hK2/z0PWc4iG1IvsP3Z4yigTcJw7mBtVOPZhWOWE+RJtHPC5SKjPy1s
	0UFYJzxTYUzGBEm+nLcPsv6B1LLPdVoovUibWFzUtZ6AYNirRabR+CZj4TDk2mOTq0rLiKJqF+kko
	QmNJaxopkyeDeaLXCrYCbTOs6/ubVSrSQj6FhTXWdGeZ9kqTu75pV0BV8tpgSaF9T0beV8nZQjPyG
	X5hrNhaqi08Q3YPkq4bQYGoNBHD9LDVhmrsPVE/tUlXJGNWDWSWWMptu0cMR/GZwQXdYyHQeHxEYd
	qpUSGjhGcdYm7yEd/7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaS6-00000005OEO-1A5E;
	Wed, 04 Nov 2026 12:50:54 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRv-00000005Nzl-3ZSB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:45 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so464440a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 04:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796643; x=1794401443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ROzI5pFKC1DlvyH7PwbH3PaOSQ+SHEt5iuezD/Lo1w=;
        b=joYhGPpAMa3yH4I4baOrO4LWCermhPmiF05wy6LVGngbmaSF5yrRHtj5bSyK22FFvk
         iI4OSbo08fNkVTUI57OYiq+eWHrnPBAnzt3Kq9l3Wh78BTl4Tua5DekNbQg/yvc+Murs
         oHe4W9QqHDYUOqYGiQn2OgCl8lJ6bZgL/CFpq9DZEE5dYqnK+kFG9Evljkc7AuV+B1JV
         /1N8+wI+YJOyLXCT5ieb1L45wJ3w+3FUDQkf/GO2LGbMsHtrj1JBweQ6l3HVtazePanW
         yf/o6Xva7e6OS/hnNyoO6PbhkWSA4E3WTCG/XglusrqmeldTfgujzp/1F9Yam9YoeYbH
         YTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796643; x=1794401443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ROzI5pFKC1DlvyH7PwbH3PaOSQ+SHEt5iuezD/Lo1w=;
        b=xlPfCxGduWV5ZXyUi2Qumq9XuHCj96nniVt54U3IHTsaUtkcqOouAUAKYRSrDD0EFY
         cKAOSLcd4OqhkIcsvzFmdPHzN0Jd4i1gYSE9gTr7kwUomGdA9YEJZeS1ReG0zhxSbAco
         xYJW/MNS0UccOaFBaJoN8p5Wmiuq7KjOPvnfN9VhXeH5s7i5IG0kRRmbEChtmAnhXg9c
         hftUH+bL1RV/+GbfJTIEDaw5jYOcZMJDouHTsybjFtF7G5LeO56chZiplLa46FQIoTRQ
         YhSfWUpOUSly+QQaJBzEneVDuP/tDFJK4alal9XjNpLh99SuVLBvSDnWrBxHyc/0R7oX
         dwNA==
X-Forwarded-Encrypted: i=1; AKwUvBwsp6hKeHU4VXw4M4dfudfdB6Nn+hXitU9rqqIWWBoi65FbXzJu+IMSR9a43kKW5w+iyTaZmXEhdesH0CdqbfcL@lists.infradead.org
X-Gm-Message-State: APuU4Z+Uc3g0Ud1VRbmyktZh8WDfaUa8ey7X3Qgqh/dhKuoU22xzLah5
	EX+uLUGgswBag8aGH7Sj9vaDG0Kd5OrH+Gn8fIrCw5KFVN9Rf73eXI/w
X-Gm-Gg: AYBFou1Sv4AqJowWNn2QwtjKNrx0JgBQmWeR8GljjUYfhc+KYPv2vfegP1PbGbMDfVu
	RtGljqu9N1BKKWvzM58sU1D7et9MraVPOuv3Dr1xkp1iekk71/NrMTQDQEHEQMjPzyxBUoKROdQ
	znDr5zgnupf6eBsmOupCR5WXNc5Wxy2nXzXXEFa4R2DHlmodTeEWvIDkKBTBRrJMZ7LGFxzVoCS
	mdqhmya/YmL9QFTaC7NDcJOfFR+EfzEktErIxZ6E6bfY0FhyHSqFps2AhIzdZwt8TpzoavDv/mK
	CgR2+JvlF3fUBbylrC3wcRy13sm7Y7ESqCz3oXr2Li4LP3Yz04egiCPIdbV29AUFKYtMnZ9xk8/
	9D2RjMnccryirsf2wZD8Dinnw2W/hRXx8plwDM3wurDoPiSAKjhfADzS/Zx+1ksYHmN7ODXIZp6
	WIZJgR8gxcOArWonpxXBPp/5V2hNX4MXXm3ILqK9mU5HP1qC/mQOFn1eQSHFl/vOt3XEUgcliy9
	qgwY92hpYYTOW211qzXdnjHq6AGGJedVeIHCPCREJrTOfGPRSuscw8c4OnNOmnN52o+vu1JXvdQ
	DDGD/YV8SME9S0gfZ2faaYvqpCLt
X-Received: by 2002:a17:90b:17cd:b0:3ac:9e5e:d195 with SMTP id 98e67ed59e1d1-3ae89851212mr12650512a91.61.1793796642926;
        Wed, 04 Nov 2026 04:50:42 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09449bff2sm3920799a91.9.2026.11.04.04.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:50:42 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v9 1/3] net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
Date: Wed,  4 Nov 2026 20:50:28 +0800
Message-Id: <20261104125030.1183146-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104125030.1183146-1-zxyan0222@gmail.com>
References: <20261104125030.1183146-1-zxyan0222@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045043_903714_A9C145B7 
X-CRM114-Status: GOOD (  22.10  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Agilex5 smtg_crosststamp() handler polls XGMAC_INT_STATUS for TSIS
to learn that the auxiliary snapshot is latched.  TSIS is a transient,
read-to-clear status bit, so the poll is racy in two ways: a stale TSIS
from an unrelated event satisfies it before the snapshot is latched,
leaving *device unwritten while the call reports success, and a
concurrent reader of XGMAC_TIMESTAMP_STATUS can clear it and make the
poll time out.

The FIFO level is also reported by the ATSNS count in
XGMAC_TIMESTAMP_STATUS, which reading the register does not disturb.
Poll ATSNS instead of TSIS, after waiting for the PTP_ACR_ATSFC FIFO
clear, so a stale ATSNS cannot satisfy the poll before the new snapshot
is latched.

Hold aux_ts_lock across the whole sequence, and refuse the request
with -EBUSY while a channel is enabled, so the PTP_ACR mask
programming cannot disarm it and a concurrent request cannot flush the
FIFO between the poll and the drain loop.  The lock is held across the
SMTG register reads as well, so a concurrent PTP_SYS_OFFSET_PRECISE
cannot retrigger GPO0 while they run.  The internal snapshot trigger
is disarmed on the way out, including the error paths, so it does not
stay armed in PTP_ACR after the cross-timestamp.

Fixes: fd8c4f645496 ("net: stmmac: socfpga: Add hardware supported cross-timestamp")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 52 +++++++++++++++----
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 6d4bc1fe8f75..2d3c6702e203 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -304,13 +304,15 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	int i, ret;
 	u32 v;
 
+	mutex_lock(&priv->aux_ts_lock);
 	/* Both internal crosstimestamping and external triggered event
-	 * timestamping cannot be run concurrently.
+	 * timestamping cannot be run concurrently: the PTP_ACR mask
+	 * programming below would disarm an external channel.
 	 */
-	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN) {
+		mutex_unlock(&priv->aux_ts_lock);
 		return -EBUSY;
-
-	mutex_lock(&priv->aux_ts_lock);
+	}
 	/* Enable Internal snapshot trigger */
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value &= ~PTP_ACR_MASK;
@@ -337,8 +339,21 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value |= PTP_ACR_ATSFC;
 	writel(acr_value, ptpaddr + PTP_ACR);
-	/* Release the mutex */
-	mutex_unlock(&priv->aux_ts_lock);
+
+	/* Wait for the FIFO clear, so the poll only sees snapshots from
+	 * this trigger.
+	 */
+	ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
+				 !(acr_value & PTP_ACR_ATSFC), 10, 10000);
+	if (ret) {
+		acr_value = readl(ptpaddr + PTP_ACR);
+		acr_value &= ~PTP_ACR_MASK;
+		writel(acr_value, ptpaddr + PTP_ACR);
+		mutex_unlock(&priv->aux_ts_lock);
+		netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\n",
+			   __func__);
+		return ret;
+	}
 
 	/* Trigger Internal snapshot signal. Create a rising edge by just toggle
 	 * the GPO0 to low and back to high.
@@ -349,10 +364,17 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	gpio_value |= XGMAC_GPIO_GPO0;
 	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
 
-	/* Poll for time sync operation done */
-	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
-				 (v & XGMAC_INT_TSIS), 100, 10000);
+	/* Poll ATSNS instead of the transient TSIS: the ATSNS count is
+	 * the FIFO level and is not cleared by reading the register.
+	 */
+	ret = readl_poll_timeout(ioaddr + XGMAC_TIMESTAMP_STATUS, v,
+				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
+				 100, 10000);
 	if (ret) {
+		acr_value = readl(ptpaddr + PTP_ACR);
+		acr_value &= ~PTP_ACR_MASK;
+		writel(acr_value, ptpaddr + PTP_ACR);
+		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
 		return ret;
@@ -364,8 +386,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		.use_nsecs = false,
 	};
 
-	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
-				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
+	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v);
 
 	/* Repeat until the timestamps are from the FIFO last segment */
 	for (i = 0; i < num_snapshot; i++) {
@@ -375,9 +396,18 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	/* Disarm the internal snapshot trigger, so the PTP_ACR mask does
+	 * not stay armed behind the software state.
+	 */
+	acr_value = readl(ptpaddr + PTP_ACR);
+	acr_value &= ~PTP_ACR_MASK;
+	writel(acr_value, ptpaddr + PTP_ACR);
+
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
 	system->cycles = smtg_time;
 
+	mutex_unlock(&priv->aux_ts_lock);
+
 	return 0;
 }
 
-- 
2.34.1


