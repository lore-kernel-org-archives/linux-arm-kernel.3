Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F483606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MXwkw8rX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EPmLs9Xt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OZxg3UOO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vqkl7ANx1lNN2+P4c0UcTgWL5h2sI3titmgKVx7tV7s=; b=MXwkw8rXvTijI8
	zGSeXYVsagIMhvrLqeGqzoI0Yqqta5mdMlvejhv4gtnDsqLFUxinR7Y/dG0nIlJ0S6ZKllVs1bFxW
	8V8RDqPunbraHvNWnbSUWpMdlSCnnAfrOP9nyF4cmj1atBSnoW3FoFdik380fV8Xw5UN5aAwHITgE
	TFk5mWmW3wzpVDM7951in8n90bb2oxZzSTeir+/h7S8s9eG4oSzzSaGLwbJ7O1IzXenO4PCNvzpiV
	dIPKSAoR9xOtKGIryQo+g1YviuAlI4Lq0BQ2gqB97S+N9ZBmT4YoErcWqNLSaFtC5lo6pgTS0oHmf
	ptU4vmmFQgwGwOQHTRNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr3A-0000000CNBf-2EDF;
	Fri, 30 Oct 2026 18:10:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr39-0000000CNBN-0UXL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 30 Oct 2026 18:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vqkl7ANx1lNN2+P4c0UcTgWL5h2sI3titmgKVx7tV7s=; b=EPmLs9XtXphfHFRurkklykHxMA
	La0FCsMAZr1DNQtTm5AvDbGF+/E9NAPR90vYzvPWAX/fKJHERn/0bt/0EmOVA423oBXZk0WeGFas2
	NHax1zHG38OnjGjFZ2vXrU+J5OyPtFFmTU2ml16ZbSEtPl+HK4UUXm/3xKTXonB/xNgPApYtCt7Lp
	Rswz8jQnvtD09E3qwUm/DoHMzrrXfrdvBax6XVOQF8guOBfRUV2DPKqf0E1kUfjaBuG2FY/ueyAGY
	Vsk5hKidW1VH7fkhkSvwjcyXv3PPKZ/wtnHaCKFfA7GheNCws5P6XSGHbrn1L6NtNH/3YaCziy7as
	edBJAcwQ==;
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr30-00000000dAM-0h88
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 18:09:58 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1a2af4c8d00so14787c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793383787; x=1793988587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqkl7ANx1lNN2+P4c0UcTgWL5h2sI3titmgKVx7tV7s=;
        b=OZxg3UOOo3PAH16UV/hJhoFJPFxEerubg2yA2i4uHbFqVsLh3UknOUPR5q0MYJ/mpj
         n+T9MdwKRNN6W37uBoGU99/9VW13pOHX6IVD0WezH6Lgx6JTjPbd3OV+P6alIVsJFH8I
         DVN/cotmk82CggPc+SVcv0Gai5DkTF4bjPj6OQLInRHFsLNidD2rgnYHh+mgNZNQ4Xjs
         B6XGjUJJtpS+xx29xO/2Xba/Mx+xqhV1zgi56c7Kk85mHYw/rV0KbZSEeX+Q7/AXif9f
         VAi8arJNh6ChoS6q91Yil+wyn04itXTus1y9f6J5PjSSyKjwueZG4/dH3Vte/ozjv7Kc
         AE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383787; x=1793988587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqkl7ANx1lNN2+P4c0UcTgWL5h2sI3titmgKVx7tV7s=;
        b=U8Kb1m6SenP8FCo9ObitsPU1EQz/lewO6p9wQYWNk/myePtg7pFeD+D2C6RHF6i1ui
         vrqlfAxGznkaAMqNCyc+zjkBL20eC6jC9xE/KfBJN3TF4wyuFRtiAxBGfRTDWKf4UvlY
         Af/XitAky5ldWl+Pt7+r10VAfvDr1Qxtc+/oEFp+iVM632RgELZsyzqEw2whyn6aSq4H
         pEEbWHEYiJUVg0KxnO2QMUeBOx1XHlKEnvnOjUi1BVM97Ki4TR2Op66TJlfGDirv/6ee
         Pnzi1++D6yEKLX8J8Rb3gXj7S0j3rtFm15Hz3uIpFT3zrVVR7HcKt+SLqRgz9aVEfeF5
         5D5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzqiWD4qSxAtU1BMtlh7eNgxor8ak+NJFTfyrNcSh/mrU6PUgXAlZWP7M+xa3/C3xnSVHRmp/8YypdCe+d11czX@lists.infradead.org
X-Gm-Message-State: AFq9FYIeBvWqqWnaiXOu68v2z1NHAMsmPCf1IaX2zus4WF6TKzbZh783
	zCzR7zr9qbDCDJK2yU1aeS15qMqvO/B8I/K8MIQCxu5X8lkjN+44LLA0
X-Gm-Gg: AYBFou0a46OCspWNOKZfDqvoGxVhJIHt9KAPLqAL1GZcCnCuQZMs59JsgGRDU/FDSsv
	TXN3NBkakD/rGQ3To6LWeQkEdZXm87pdwvxEErQyAKlHk0V6aSp3tlidWvMoG92rgRq/PLJKs+y
	JoIt1O0emKpCdZ08h2tNRBhHlShubxDwSGMzKFGNWHe4GZUNMskZZAcO3eUJ8uN6yd3bLBLn4uK
	yUsk1piEluyr3QvpVZNnsjXGW8Pb0a2B9Vn0qfL/B2vpe/T3sFej/iZNj/FrJX3V0dThxZmXzp8
	nfryHfeVwZdKCr6hRWbAGqlnKBnfC8HLZlzR6d4PfuiCDcIevfJO0pB8ZVF4mD45A5/UdzEwN7N
	7ckvdv10ZzlmREa/cZMNkEgsP3ofJG5kmduC/9gNaMlXHWbtrOB10cVGsdMdCkewetMHSymAWDG
	C+hvqsgadRNtXI8AcQ4ZAOov/rXCbhwPYSjkH0j8/pC1dnMDAZATaSQU4fQz0iJQtQ4YILiYpBm
	wInt8zttH+qeU2weGwSPywYlGrQAPD8XeImXFudfsNWp87g5abF+C2WBg+JzB+WZjIrwLrl40T0
	Hh5sIzVgTGQGyxvrqaFekJQmpUT9OU6cooUm+q642wQY9IdjnXS3XK3Wd/Zn8n7lArO85Eg=
X-Received: by 2002:a05:701b:42d1:10b0:188:9ae5:162e with SMTP id a92af1059eb24-1ac5cdf9ae0mr4451889c88.40.1793383787373;
        Fri, 30 Oct 2026 11:09:47 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458fa3sm9695510c88.4.2026.10.30.11.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:09:46 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: alim.akhtar@samsung.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	krzk@kernel.org,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org
Subject: [PATCH v6] PCI: exynos: Handle PCIe PHY initialization errors
Date: Fri, 30 Oct 2026 18:09:01 +0000
Message-ID: <20261030180902.2589-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
References: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_180950_320322_99A5E8A4 
X-CRM114-Status: GOOD (  20.16  )
X-Spam-Score: 0.1 (/)
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

Check the return values of "phy_init()" and "phy_power_on()" to
avoid continuing PCIe host initialization when PHY setup fails.

Track the PHY initialization and power state to ensure cleanup is
performed only when appropriate, avoiding double calls to
"phy_exit()" on probe failure.

Also check the return value of "exynos_pcie_host_init()" during
resume and abort the resume sequence if PHY initialization fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v6:
 - Prevent state/reference count desynchronization in exynos_pcie_phy_exit()
 by ensuring both phy_power_off() and phy_exit() attempt cleanup even if one
 fails
 - Assert core reset on post-init probe failures in fail_probe if PHY/host
 initialization was reached
v5:
 - Avoid PM core state desynchronization in exynos_pcie_suspend_noirq()
 by logging teardown errors and returning 0 instead of aborting suspend
 on teardown failure
v4:
 - Fix invalid return in void exynos_pcie_remove() and ensure regulator cleanup
 - Add core reset deassertion on error in exynos_pcie_suspend_noirq()
 - Prevent regulator leaks in exynos_pcie_resume_noirq() error recovery path
v3:
 - Address review feedback on PHY and regulator state tracking
 - Avoid powering down the controller when link detection fails
v2:
 - Track PHY initialization and power state to prevent duplicate cleanup
 - Handle host initialization failures during resume

 drivers/pci/controller/dwc/pci-exynos.c | 115 +++++++++++++++++++++---
 1 file changed, 104 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..0085c3ed0c2f 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -55,8 +56,35 @@ struct exynos_pcie {
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	supplies[2];
+	bool phy_initialized;
+	bool phy_powered;
+	bool supplies_enabled;
 };
 
+static int exynos_pcie_phy_exit(struct exynos_pcie *ep)
+{
+	int ret = 0;
+	int err;
+
+	if (ep->phy_powered) {
+		err = phy_power_off(ep->phy);
+		if (err)
+			ret = err;
+		else
+			ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		err = phy_exit(ep->phy);
+		if (err)
+			ret = err;
+		else
+			ep->phy_initialized = false;
+	}
+
+	return ret;
+}
+
 static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
 {
 	writel(val, base + reg);
@@ -225,13 +253,23 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
+	int ret;
 
 	pp->bridge->ops = &exynos_pci_ops;
 
 	exynos_pcie_assert_core_reset(ep);
 
-	phy_init(ep->phy);
-	phy_power_on(ep->phy);
+	ret = phy_init(ep->phy);
+	if (ret)
+		return ret;
+
+	ep->phy_initialized = true;
+
+	ret = phy_power_on(ep->phy);
+	if (ret)
+		return ret;
+
+	ep->phy_powered = true;
 
 	exynos_pcie_deassert_core_reset(ep);
 	exynos_pcie_enable_irq_pulse(ep);
@@ -314,6 +352,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
 	platform_set_drvdata(pdev, ep);
 
 	ret = exynos_add_pcie_port(ep, pdev);
@@ -323,8 +362,22 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 fail_probe:
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	if (ep->phy_initialized || ep->phy_powered)
+		exynos_pcie_assert_core_reset(ep);
+
+	if (exynos_pcie_phy_exit(ep))
+		dev_err(&pdev->dev, "failed to exit PCIe PHY\n");
+
+	if (ep->supplies_enabled) {
+		int err;
+
+		err = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (err)
+			dev_err(&pdev->dev, "failed to disable regulators: %d\n", err);
+		else
+			ep->supplies_enabled = false;
+
+	}
 
 	return ret;
 }
@@ -332,22 +385,42 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 static void exynos_pcie_remove(struct platform_device *pdev)
 {
 	struct exynos_pcie *ep = platform_get_drvdata(pdev);
+	int ret;
 
 	dw_pcie_host_deinit(&ep->pci.pp);
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+
+	ret = exynos_pcie_phy_exit(ep);
+	if (ret)
+		dev_err(&pdev->dev, "failed to exit PCIe PHY: %d\n", ret);
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			dev_err(&pdev->dev, "failed to disable regulators: %d\n", ret);
+		else
+			ep->supplies_enabled = false;
+	}
 }
 
 static int exynos_pcie_suspend_noirq(struct device *dev)
 {
 	struct exynos_pcie *ep = dev_get_drvdata(dev);
+	int ret;
 
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+
+	ret = exynos_pcie_phy_exit(ep);
+	if (ret)
+		dev_err(dev, "failed to exit PCIe PHY during suspend: %d\n", ret);
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			dev_err(dev, "failed to disable regulators during suspend: %d\n", ret);
+		else
+			ep->supplies_enabled = false;
+	}
 
 	return 0;
 }
@@ -358,13 +431,33 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 	struct dw_pcie *pci = &ep->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
+	int err;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
+
 	/* exynos_pcie_host_init controls ep->phy */
-	exynos_pcie_host_init(pp);
+	ret = exynos_pcie_host_init(pp);
+	if (ret) {
+		err = exynos_pcie_phy_exit(ep);
+		if (err)
+			dev_err(dev, "failed to exit PCIe PHY during resume error: %d\n", err);
+
+		if (ep->supplies_enabled) {
+			err = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+			if (err)
+				dev_err(dev, "failed to disable regulators: %d\n", err);
+			else
+				ep->supplies_enabled = false;
+		}
+
+		return ret;
+
+	}
+
 	dw_pcie_setup_rc(pp);
 	exynos_pcie_start_link(pci);
 	return dw_pcie_wait_for_link(pci);
-- 
2.55.0


