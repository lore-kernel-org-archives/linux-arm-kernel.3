Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97839606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 22:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lxuXq7BT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ab0ESrK0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9tda7KCgHiHf7p60vP6BBaPr59gypHnjN4ebH49SPko=; b=lxuXq7BTMHPS0KyVDETmrAGTCp
	93TTWE7W8V6c/jbDISvSMwzyKGyPX9fxCbyUHljqR5FVQEYe51bn2WZN4n49o2jRsebMuB26FZGax
	Elk1YqZcIGOaEfnUXOFMDVZU6cEb6rRDduAfpZu8iI3y8jhJ0mEaWCM+4b2L/Ne29azZzVkdo/yec
	AOiOBcHMp6VT9cLK9s4FT0qR6vAT1W/AGDjZgWKhmpK3c/PSUMqxWCUPCznpW5q4QD7I01v9jWqlS
	WWzGwOhk0q5VzwWFO/86VNJG/ewx9F/atkeXNdLSubx9amNCkK05BBFPuKIiQkWVIpHr414sL1lqZ
	DM8HCwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfD2-0000000D0Mm-3jbn;
	Wed, 21 Oct 2026 22:55:00 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfD0-0000000D0Lk-3GbR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 22:54:59 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-3535a54bed9so1737936eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623298; x=1793228098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tda7KCgHiHf7p60vP6BBaPr59gypHnjN4ebH49SPko=;
        b=ab0ESrK0ZdJIY+q3STgn3xK6Pu7HOslJYzOCNUbMlN9CKv844PKSKfGfFqDNSIumAz
         nGqFvEGvnYbgXPRYbTu3HFOr0buc8XtEqQtH6iln/76AioezP2PpDG90UI6IG6LHQSlR
         X7t/7CUqdCzdPwLylE6YZCYSf53ToDhtgEBaXjcFctg8AHANyHkpQxbI2CYddgemJGpT
         weykkmCo9Y9oeXf5VTxK9Sf6guqYb8yQChaU9ucNw0wg4kGC8dKwOpp6pqcaPHT6TDbk
         ewd0GNZnBXhOLRSLLi3GERdk/mmqf1kaxg0Hi6icRHXtt30EgREhVZUMWkoQz8vLfkMo
         +z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623298; x=1793228098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tda7KCgHiHf7p60vP6BBaPr59gypHnjN4ebH49SPko=;
        b=0t4t7RplyBLt4vKkI7sxE4NXYXPV11GP0OK6Uls14i4Nv/I4PK90c/IvhCmMMam64S
         RcOnHVJlANFmHfffq2tvw+v3MYncplShi7frcu/nojk5sO/bVpNMke29UWQW1+EVQ7CZ
         8KKweXDi/oUvKkZFfvyWWFZYSJHPtJ6tbYeK2KU/l7vfXXB+Vypmsqq6d+qMID/bhsEC
         7I+RPWKeOpjzYWvKAxP9p1dnDQqWZOXf9ww4YZRmm39qKB95Kr4yab8vlinwfElwYJxG
         kVWOIY4tnkeeeyXxObpzlg5JGnhtRIjucaxl88pg9xHJAUDJ8BL0mGaQmbWsdTaMNarI
         Zbrw==
X-Forwarded-Encrypted: i=1; AKwUvByjBBHqqS2QEU2+ZIuxQEYuC7wZtOqtN5XmETs/l9444kNaZVahfx+t30msA2oYJYdSwPJTjS9wl9br1A5sEiv2@lists.infradead.org
X-Gm-Message-State: AFq9FYIkyjqjw9Q0K2PxNguMygroWAG4MsL87Pr5ad+HsHCdT4VDQsho
	Wl8V0o0eMqD21BdIiGY78hE3cCtWhEMxcsTyrhBytXXDAMnRr1JQFeYS
X-Gm-Gg: AYBFou3N5geiSFk01ftCwnYKVEWJOoRx8EQr/T6v3+F7oBccXx+PsBv9F8oNc8mj0UO
	ehGLE4PLPi0HX+/Kry8sZRt2i7k4otBvt7GwoSqKA5Dp0KQ6x7GeOqc2ePtVlQTyAUXbpLrQomM
	0qmnpgCB5rA4e3tkMmvNoSdYNS918SXbwyg4avjgfecwDdYYTwUywiTglxeE5eFvBVxks8CTzkS
	MfzpznMTnEPN+7EqAEUx94FUoPT1rKdLQAtpKv0MW/cQFCIrSbm97s4tOEvl6xTdNCFhzriQhka
	81VwQ1kAnjnrHqZwjZ3DyGK2fiX/AzCHTJW4Gq7423hToo+ayodSzFclS7yqUTSAHgo6QC7PZPF
	2GpDR1XfGopulIvyLNYis+EdrFNF1LhntTB9JeLjbY/MsGGXAooN+AqNcqk79cwLDzwoQ95b1+f
	3KsyUgWsy0eRtQllCK2GLbnp4a+3uVmC5amAPO5Op6l/e1LEmcwA9m/XlCwHHGtogejNhvysEMm
	a0bc1Hbrrkrou2aeiv+b+YCob37vn8E7kw5qaUfybo3YmnOitrvtTxMz6N1MaJPKeulQuijqb7x
	s+boxXZ/gAYo5zynUkV4mf94pDy1pZ4UaZS4UteIKO8C5lZXYx+vzPIYoek4TjuivSjPl46t5jw
	ZVFYui+4Go6Q=
X-Received: by 2002:a05:7300:d212:b0:328:7033:9b8c with SMTP id 5a478bee46e88-3674c43c208mr4277149eec.6.1792623297862;
        Wed, 21 Oct 2026 15:54:57 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ee692656sm442943eec.28.2026.10.21.15.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:54:57 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: adc: fsl-imx25-gcq: check the return value of the
Date: Thu, 22 Oct 2026 04:24:45 +0530
Message-ID: <20261021225450.628499-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_155458_819126_2DF3C5DA 
X-CRM114-Status: GOOD (  22.85  )
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

The driver ignores the return value of all the regmap accesses. If one
of them fails, e.g. because the memory mapped registers can't be
accessed, the driver just continues with an undefined state.

The most severe case is the read of the FIFO in
mx25_gcq_get_raw_value(): the destination variable is not initialized,
so a failed read leaks uninitialized stack memory to userspace.

Check the return value of all the register accesses and propagate the
errors to the caller. In the interrupt handler, where there is not much
that can be done about a failed access, just don't use the content of
the status register if it can't be read.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/adc/fsl-imx25-gcq.c | 82 ++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/fsl-imx25-gcq.c b/drivers/iio/adc/fsl-imx25-gcq.c
index dc310ed616a1..b6c1ed867177 100644
--- a/drivers/iio/adc/fsl-imx25-gcq.c
+++ b/drivers/iio/adc/fsl-imx25-gcq.c
@@ -83,7 +83,13 @@ static irqreturn_t mx25_gcq_irq(int irq, void *data)
 	struct mx25_gcq_priv *priv = data;
 	u32 stats;
 
-	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
+	/*
+	 * If the status can't be read we don't know whether the conversion
+	 * has finished. The interrupt is still acknowledged below, so just
+	 * skip the completion and let the reader time out.
+	 */
+	if (regmap_read(priv->regs, MX25_ADCQ_SR, &stats))
+		stats = 0;
 
 	if (stats & MX25_ADCQ_SR_EOQ) {
 		regmap_set_bits(priv->regs, MX25_ADCQ_MR,
@@ -109,15 +115,29 @@ static int mx25_gcq_get_raw_value(struct device *dev,
 {
 	long time_left;
 	u32 data;
+	int ret;
 
 	/* Setup the configuration we want to use */
-	regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
-		     MX25_ADCQ_ITEM(0, chan->channel));
+	ret = regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
+			   MX25_ADCQ_ITEM(0, chan->channel));
+	if (ret) {
+		dev_err(dev, "Failed to setup the queue item: %d\n", ret);
+		return ret;
+	}
 
-	regmap_clear_bits(priv->regs, MX25_ADCQ_MR, MX25_ADCQ_MR_EOQ_IRQ);
+	ret = regmap_clear_bits(priv->regs, MX25_ADCQ_MR,
+				MX25_ADCQ_MR_EOQ_IRQ);
+	if (ret) {
+		dev_err(dev, "Failed to clear the EoQ interrupt: %d\n", ret);
+		return ret;
+	}
 
 	/* Trigger queue for one run */
-	regmap_set_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
+	ret = regmap_set_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
+	if (ret) {
+		dev_err(dev, "Failed to trigger the queue: %d\n", ret);
+		return ret;
+	}
 
 	time_left = wait_for_completion_interruptible_timeout(
 		&priv->completed, MX25_GCQ_TIMEOUT);
@@ -129,7 +149,11 @@ static int mx25_gcq_get_raw_value(struct device *dev,
 		return -ETIMEDOUT;
 	}
 
-	regmap_read(priv->regs, MX25_ADCQ_FIFO, &data);
+	ret = regmap_read(priv->regs, MX25_ADCQ_FIFO, &data);
+	if (ret) {
+		dev_err(dev, "Failed to read the FIFO: %d\n", ret);
+		return ret;
+	}
 
 	*val = MX25_ADCQ_FIFO_DATA(data);
 
@@ -204,14 +228,18 @@ static int mx25_gcq_setup_cfgs(struct platform_device *pdev,
 	 * Setup all configurations registers with a default conversion
 	 * configuration for each input
 	 */
-	for (i = 0; i < MX25_NUM_CFGS; ++i)
-		regmap_write(priv->regs, MX25_ADCQ_CFG(i),
-			     MX25_ADCQ_CFG_YPLL_OFF |
-			     MX25_ADCQ_CFG_XNUR_OFF |
-			     MX25_ADCQ_CFG_XPUL_OFF |
-			     MX25_ADCQ_CFG_REFP_INT |
-			     MX25_ADCQ_CFG_IN(i) |
-			     MX25_ADCQ_CFG_REFN_NGND2);
+	for (i = 0; i < MX25_NUM_CFGS; ++i) {
+		ret = regmap_write(priv->regs, MX25_ADCQ_CFG(i),
+				   MX25_ADCQ_CFG_YPLL_OFF |
+				   MX25_ADCQ_CFG_XNUR_OFF |
+				   MX25_ADCQ_CFG_XPUL_OFF |
+				   MX25_ADCQ_CFG_REFP_INT |
+				   MX25_ADCQ_CFG_IN(i) |
+				   MX25_ADCQ_CFG_REFN_NGND2);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to write the configuration register\n");
+	}
 
 	device_for_each_child_node_scoped(dev, child) {
 		u32 reg;
@@ -265,16 +293,26 @@ static int mx25_gcq_setup_cfgs(struct platform_device *pdev,
 			return dev_err_probe(dev, -EINVAL,
 					     "Invalid fsl,adc-refn property value\n");
 
-		regmap_update_bits(priv->regs, MX25_ADCQ_CFG(reg),
-				   MX25_ADCQ_CFG_REFP_MASK |
-				   MX25_ADCQ_CFG_REFN_MASK,
-				   refp | refn);
+		ret = regmap_update_bits(priv->regs, MX25_ADCQ_CFG(reg),
+					 MX25_ADCQ_CFG_REFP_MASK |
+					 MX25_ADCQ_CFG_REFN_MASK,
+					 refp | refn);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to update the configuration register\n");
 	}
-	regmap_set_bits(priv->regs, MX25_ADCQ_CR,
-			MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
 
-	regmap_write(priv->regs, MX25_ADCQ_CR,
-		     MX25_ADCQ_CR_PDMSK | MX25_ADCQ_CR_QSM_FQS);
+	ret = regmap_set_bits(priv->regs, MX25_ADCQ_CR,
+			      MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to reset the conversion queue\n");
+
+	ret = regmap_write(priv->regs, MX25_ADCQ_CR,
+			    MX25_ADCQ_CR_PDMSK | MX25_ADCQ_CR_QSM_FQS);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to configure the conversion queue\n");
 
 	return 0;
 }

