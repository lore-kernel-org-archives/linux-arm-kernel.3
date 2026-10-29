Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VW1BVOxV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lp+geSBP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=; b=VW1BVOxVosu+a6
	AnYdMMggxNJN49gHTSWhCO6od5uWCQcccAujK7S7AFUkQFCVKnztEdfQO2cWBRmyZlOB2gkugEDYe
	jPIgkymGgnvV0Bu1TYGEv00FbBHqygvesq97igrTwBzjuusrB1atre7Pa/OzHV8SOqbjJWafgf8ix
	mZw0NG2DNW80RcnQ2fnCDqktYFrZJJv4QMfP14r0Vi9ZvXZb2xM01FxOneAOxn9mHHv7J3T+u/w4s
	PyKTVM9yV4Je2Znlp0Eaft36VvP606jlZuNp2Seo+zU4R+Or2ZBgx0tIiK/K8OkVbllLb7M6A3yWL
	/1cQaIXOFH0T1hD7EjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN2F-00000008vMJ-22d4;
	Thu, 29 Oct 2026 10:07:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN24-00000008vE1-1ygO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:06:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so15157805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268410; x=1793873210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
        b=Lp+geSBPBk4XtWwTOo1t2WWCp78gYv+A/6wjt5YbADXZDQs1Py2ND/mTzb4IadYEoU
         UV2ViL6WN9D3E1EViQuPR/5DtDYrqdtEe89ooo/xr6JsszSivx2Uex7bqDalxNlBc2+G
         1ylJN3XyIhNOLHAorRtBoVPJpRzbYSCL1ERjY7NDUTUtDG9+SbcqkQhR9nfBEUgm+ogL
         PXLTTURzmYgf5sQOnnOncN2vTD8NqDtis6rRTMWvNIxTnx0hP2yPvXTF3q6ES8VfdGMt
         5mHh16OEG3rcsVlWLz8ymQ3EkiDEoYATpZxx87Jcibrm+RbcN2zW7cU1zNuAzD1bjBgN
         /eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268410; x=1793873210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
        b=p1DRWhikUcp3rHHRF1h20ls9bhbL/yHdt2efDODBHZ4KLbHJFZZNLAsZ+/HekoOjYj
         VHNeNxnctQXFoI5yb9AbOdutaMjWMsbgL5NdN5ElF/bdu3GPe1Uz6eb9NOn3hAjtAWK9
         VZAG3vIu4fuDqoojnVQMdk9NrwtuETbOSkizMGU0e88bMvNbkAjWIc1t0GF6nMS4vsOk
         kmO4ov+e308uWzbXeo4WqRxRPmCpBkZCtTFCL7L+OWoKsMMhCpeUYjRllcjCZzEBdgCE
         YxMsfTczOL+JKMTBbFeF00J9CHGrC2z2EDdCwZcg2VDW6QkGyLgEssWVs0YOKHugqg08
         /16Q==
X-Gm-Message-State: AFq9FYK8Uzl8u0u0xJnKFbijwa/viWEZl12Yx4hJujwHAN3Qt44GyV8k
	ANmGG6aqREmon0Uw48y33x+UAsdHGuNV0+R0VpMxNc2b+VxPeJG/H+si
X-Gm-Gg: AYBFou3l18CJwxtd4XM5qAF9u1zEzjNpov7wMIpaksPcKMemxOqsGkk3j+wd9mMRcAB
	anuST7PIyAK7F+SH9q2lXcJRZGF+yW+zjhdNpOSOyomH8tITLEraPkbWrCEhHQli29Lp99ouvvC
	DuL5XKKRHCMK4Qd0/96VmjhS0Q1RGWdlGfuJLh8pqZv32JBS7LoUJTNyHcM+jMH3TPGFD7cj1xO
	zI1ER2HpdJ1upqLKHJ30wMNKIe3x6ZjTaCYMn1tPyCYuQMmAowtk5V4Y0cYy5RvGgt1Glxf5OQn
	2OexelkALBRgmgOZtOynPv0AJL7O5+F3EEGIBTZ8jON58lQHS6qhTAK8FJrIcFGIi6diu3FYAlZ
	QaHUSzWjpOJ8D7TRx8XgCVBlmpb3CEem+lgymgKBcBXRGSr0p01Lf59c9j1jzb+bZKJ9Cn8ft1S
	TKI0dJm/OdgOA5yAhTKGTlLu4bEAEYRe29kFHhJ6UBc0ZotNprLYKSvzYF308cfLrUWSV55ZuHB
	rQYj3U3k+sQBPWg8rzAeGQv5HucnyTPb9JHCqj+7ZvvYZusD4SBzfJaQio04b1vAfV3hD4e4cLS
	vgyWOB1HwJryIoDbYzBJR3nAnKnOonqGKPoEfMrUGMa727kXsAZyGh849KC2HcSW62hwe0nXADK
	LxKZdvg7r
X-Received: by 2002:a05:600c:8184:b0:4a5:1c2a:4bb6 with SMTP id 5b1f17b1804b1-4a967ab15c5mr99622405e9.32.1793268409952;
        Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:24 +0100
Subject: [PATCH 2/4] mfd: rk8xx-core: keep the PMIC interrupt disabled
 during system suspend
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-2-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=2691;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=L2myRTbrcpVngJZXrNjm8FAaUWxZTcJOyBmmVMEVxWs=;
 b=5roX3q8fy0xNI6ewi2I12L2R2JapjPSuuY5TaRN3vlegp1g1Oc3/GfvhvCPzLXeWV3msOj/r3
 ynNr0KDMGwyD0+1RWAD6ZSNcsvIFpjK3KJMTq3YCxA49RRB0C9KieTE
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_030652_540952_2BD00C0F 
X-CRM114-Status: GOOD (  20.47  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

When the system is woken up by the PMIC (e.g. by the power key), the
PMIC interrupt is handled as soon as interrupts are re-enabled on
resume. At that point, the bus to the PMIC may not have resumed yet, so
reading and acking the interrupt status fails. On RK3588 with an RK806
on SPI:

  spi_master spi2: noqueue transfer failed
  rk8xx-spi spi2.0: Failed to ack 0x79: -13

Disable the interrupt at the end of rk8xx_suspend() and re-enable it at
the start of rk8xx_resume(). Both run in the regular suspend/resume
phase, while the parent bus controller is active. If the interrupt is a
wakeup source, it stays armed while disabled, and the pending event is
replayed by enable_irq() on resume.

Store the interrupt number in struct rk808 for this.
---
 drivers/mfd/rk8xx-core.c  | 19 ++++++++++++++++++-
 include/linux/mfd/rk808.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 21182df45d1b6..2ae9107fc5161 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -851,6 +851,8 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (!irq)
 		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
 
+	rk808->irq = irq;
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -929,7 +931,20 @@ int rk8xx_suspend(struct device *dev)
 		break;
 	}
 
-	return ret;
+	if (ret)
+		return ret;
+
+	/*
+	 * Keep the interrupt disabled while the bus to the PMIC may be
+	 * suspended: otherwise a wakeup event (e.g. the power key) is handled
+	 * as soon as interrupts are re-enabled on resume, before the bus has
+	 * resumed, and reading/acking the interrupt status fails. If the
+	 * interrupt is a wakeup source, it stays armed, and the pending event
+	 * is replayed by enable_irq() on resume.
+	 */
+	disable_irq(rk808->irq);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(rk8xx_suspend);
 
@@ -938,6 +953,8 @@ int rk8xx_resume(struct device *dev)
 	struct rk808 *rk808 = dev_get_drvdata(dev);
 	int ret = 0;
 
+	enable_irq(rk808->irq);
+
 	switch (rk808->variant) {
 	case RK809_ID:
 	case RK817_ID:
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904c864c9..1255de484ab51 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1461,6 +1461,7 @@ enum {
 
 struct rk808 {
 	struct device			*dev;
+	unsigned int			irq;
 	struct regmap_irq_chip_data	*irq_data;
 	struct regmap			*regmap;
 	long				variant;

-- 
2.47.3


