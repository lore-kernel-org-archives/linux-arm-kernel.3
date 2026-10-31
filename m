Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p45IUk6X;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBat11kq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ADQcrm8YvdoyGGOqaxYX7L9xoyUfoiCcnIaPiCNu+Wc=; b=p45IUk6XYt3nBY
	8TQgofJg1/yngFVYhN+4HWjiRVQwGTXPN9ptwBiGi/lRbE1fKq+XVc6ZqJ0LpopXtlIWWsjLIcAyi
	i3hR3AwDY/b/Z/N2+g5G9/nYF+G/NcX/Iqy4AqZS/fXwvmsAPkV06fhskESs9G7OMabDe4MV0+d68
	Ewl3lMxE5URzr6WHMjXucvpoNoXlkmEqJeAqUrMPveBRHFIawrR5lA1tH3Wd3LQV0qq6IZwgi1NKd
	FwJsNWVPSHEtnBtUqIwQFYmciafMgdjoZrYFUFrB7EpM1yWBqE14yc5+HGc8JOUBP6yGbvwJIMneS
	fQHlzIhxpVYZCH5Ks+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN366-0000000CzvH-1SZ1;
	Sat, 31 Oct 2026 07:01:50 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN363-0000000Czuw-3Bwz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 07:01:49 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1931ff67a29so1050523c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 00:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793430107; x=1794034907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADQcrm8YvdoyGGOqaxYX7L9xoyUfoiCcnIaPiCNu+Wc=;
        b=EBat11kqRrpMmPl2OtFzYvi/fHrnfMyX8/a32M20brZyIvTwDoGpAkKkj6sGeyST3l
         UrqZj385S4lJ98Qexg/60NymG9puLpDHlesi9azZIU9xFshY55g7ASyZu1/btgGU+yhA
         QiMZRLWZW1XFc/HTaxj5P39jXA+YVcvYbeHDKtxwhmWMF1nkD3dnOTYS6wNmGI/+iG2S
         u/Q6/UFG1nxR77d0woIA0pIg7lmLpY5uE/DlCq+bdOw/Lr7F+bLDm4KRsEh2XPZvX6YQ
         t1wUZK4dHgqZduzq5jNeKy03hvIcq5DuATpziayFD0jzGDRXnbGgLeJAH6Cn8gVNZkzT
         bAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793430107; x=1794034907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADQcrm8YvdoyGGOqaxYX7L9xoyUfoiCcnIaPiCNu+Wc=;
        b=Pjf5UMQTZWf9y5Wt7dxYUArecoyBRN4ASrJiwCAUjsTPXTIYVxl70mWWDRjXEHwu3Z
         53D1KusPhsdAOWvLUDxEMtuyWMKE8FRF0iK2r8X6fRU5VklXLuIRnygV9OCFhHf0EKk2
         Ew3fFHkffbQ6xz0n3+8BQwbQoPZIA+dVdu4pnsWcDINejUNjtkTBTy1h+F8cgE+DAPe1
         k+9nxePzpY6aBJImJBkt7ku2DSJpPxfi/bMCFTLGlc/DS3xhwSzTe/UBj2grJFBxjLM/
         6zo13qVRQSpiYajGYBmSKPOgRhqholMdAqAOO4iqwCy0WkBgM/3J8TNrhHRMVJ+R5iz4
         D4GA==
X-Forwarded-Encrypted: i=1; AKwUvByAR4N2jlrBtDjIbGtPUVe+qG5mlMkx0l9+vwRsfPBsnBLbsftVvGow6euKKk36P6TfdIdsNYCbRjdFfupmhmAR@lists.infradead.org
X-Gm-Message-State: AFq9FYL2ZFq3DG9bPmbP2lpPZBLGpUWpy/g9CVF6iNeA74T00YQlEWWU
	6u4AtDvedYmQU0vQS+G3V4wKLfzmxFuhdtAwF3dYFn0DERJ95CQmYDOz
X-Gm-Gg: AYBFou1neVe0GvdPTzQRMjFVHtkLIwa8JaeQLzmAwGrk6z8TmI2esTKN5mTC9Komv5h
	phdKhekBS/Pz5Kv6KK+PTqaXSMk1ix74eskkyMmB2XKjdIvIQrLVVe1omTqPxnJw/WvRwSRsgRe
	ksWnl+CM6VbxKSegqVnMXIkpS/QVZH2Dsi4nWxeiTm3gLdJVFwJgG1wjwP/yiLYScHxv+0WFJEX
	I1ddZXe8fs+A3Jm8aGFvh/LOnu+McjsD660PbcRuz7VwYChkYdCRFDE+tE/dKk3PyHEOGcwbqW3
	A+Hg9SxEREp+ZAM6eWix1O4DMdRJ/Gv0boCZatTKj974jjo7awoIAueSwZd8GuIh0NawMuCTDLE
	yZUuy75+AEOAY10ZFJSDFqRf4L2MxVBH/ndae2VdqT/hKXcHChdR0qBYQGzDy1FCEWnkMYIaQPO
	7TXxS2vFEQI5pKxheZIpdOVHl2hColZejVpLP4t6V/FrV0WSOqNG93h1iO+9HnkN89rJPb3IPp6
	rYTxgvsgyCLMgA3BBVkU3hgpmdB1VMX060x8iNBpqUyxC3MRjj3XEurQ3TTtNMhfZY18YjLeJkR
	rmkyQbp+5BQBSeNcVbu6yem26LQDW04WJx+JGE9+LEjya/MBZQ==
X-Received: by 2002:a05:7022:68a1:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1ac5a0b5af5mr8832094c88.9.1793430106458;
        Sat, 31 Oct 2026 00:01:46 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm5185987c88.12.2026.10.31.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:01:45 -0700 (PDT)
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
Subject: [PATCH v7] PCI: exynos: Handle PCIe PHY initialization errors
Date: Sat, 31 Oct 2026 07:01:11 +0000
Message-ID: <20261031070111.3130-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
References: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_000147_809844_5AEA9A2D 
X-CRM114-Status: GOOD (  19.13  )
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

Check the return values of phy_init() and phy_power_on() to avoid
continuing PCIe host initialization when PHY setup fails.

Track PHY initialization, PHY power, and regulator enable state
across probe, remove, suspend, and resume to ensure cleanup is
performed only when appropriate and to prevent unbalanced
reference counts.

Assert core reset on probe failure after PHY initialization has
been reached, and handle cleanup errors during teardown and
suspend.

Also check the return value of exynos_pcie_host_init() during
resume and abort the resume sequence if PHY initialization fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v7:
 - Guard PHY initialization and power-on against duplicate calls
 - Guard regulator enable against duplicate calls during resume
 - Preserve PHY and regulator state when cleanup operations fail
 - Update commit message to describe regulator tracking and core
  reset handling
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

 drivers/pci/controller/dwc/pci-exynos.c | 131 +++++++++++++++++++++---
 1 file changed, 117 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..3e76a818a45c 100644
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
@@ -225,13 +253,27 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
+	int ret;
 
 	pp->bridge->ops = &exynos_pci_ops;
 
 	exynos_pcie_assert_core_reset(ep);
 
-	phy_init(ep->phy);
-	phy_power_on(ep->phy);
+	if (!ep->phy_initialized) {
+		ret = phy_init(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_initialized = true;
+	}
+
+	if (!ep->phy_powered) {
+		ret = phy_power_on(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_powered = true;
+	}
 
 	exynos_pcie_deassert_core_reset(ep);
 	exynos_pcie_enable_irq_pulse(ep);
@@ -314,6 +356,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
 	platform_set_drvdata(pdev, ep);
 
 	ret = exynos_add_pcie_port(ep, pdev);
@@ -323,8 +366,22 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
@@ -332,22 +389,46 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
+	if (ret) {
+		dev_err(dev, "failed to exit PCIe PHY during suspend: %d\n", ret);
+		return ret;
+	}
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret) {
+			dev_err(dev, "failed to disable regulators during suspend: %d\n", ret);
+			return ret;
+		}
+
+		ep->supplies_enabled = false;
+	}
 
 	return 0;
 }
@@ -358,13 +439,35 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 	struct dw_pcie *pci = &ep->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
+	int err;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
-	if (ret)
-		return ret;
+	if (!ep->supplies_enabled) {
+		ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			return ret;
+
+		ep->supplies_enabled = true;
+	}
 
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


