Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562EF606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HW/upr1A;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SNZ1BPHJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=inKyCOcvtNC3vT1cGkkdWGseNrtGnJ7Z96eWpiC61OA=; b=HW/upr1AJ3M38/
	fBSLm8rXzdKdW6vJrSd+H9N0s+IB5p6csuiAYRjD8wEZPoulGTNDeT1TyHjV3kWZUMuP0iCTf5/sr
	23IbkI9fWtWRhVPH5EDsLny/otQn8If+Nwt/8KjxaMWY8swK/AARH4cYEU1CvhX1v6ZpgA4cwC8AT
	Qx39GEpuWd9YLo0mnoevxODn32lfW62cA/oXb1HVEdHtOwF82nsAOD+pdOVXZWSXRARsIh5POsQC3
	N8f0g0HNxGbgyMteEQY4o4okl/dW9cRr9U6racV5tpH4hSed9+Tv8a9oGhXGSZrNW3c35m5lFQCg8
	7J8EDhQBjtIAmvArdiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoN0-0000000Bz74-1hEx;
	Fri, 30 Oct 2026 15:18:18 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoMx-0000000Bz6a-25Uo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:18:16 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so331248c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373493; x=1793978293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inKyCOcvtNC3vT1cGkkdWGseNrtGnJ7Z96eWpiC61OA=;
        b=SNZ1BPHJlVArqQQF5AoZeXWl9F0kIztziUsHrcKtLUICp2JuRt+j9muCbPOonhCA/j
         UyCSckdUsHINEA5f8JOoBPCQxh0YPMdf6OKgCNRMhD8CkDRVhPdE9LD1SXo8HhVf2hiz
         fakVR9WmDUZ1ssHQ6qD1mI2pRB6YfaSqbbUP0ZVMAXEHYcP585MwWRqbSgcpk0QDKQaZ
         NVatYOVMf6SwoqAQZyYZszheszKDrH9OtkoDPSpyI1iQIeVUd63ZTQ4NmWaOn4YAqNFB
         vO78dPj4RUtN9hsaOT8VirHqJNg2XCfsCgaZTtSVo7G1Vv6Uig+sS1I74fuB3HsTsE/k
         kjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373493; x=1793978293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inKyCOcvtNC3vT1cGkkdWGseNrtGnJ7Z96eWpiC61OA=;
        b=kyjH1hdoY+CST3wjnIfoNVQDgVuxg5/UYDG7oHa6pIBGnVk3oQhWtHhEDJCMFJlkPQ
         hUHwtkRf0KIb0YfQogpzVymx9josDVQnMEfSwFH681AWhaOOec2NezgwAWI5nXA+8Dcr
         JDzDzCkhtTchecOOUPLRUcESiFHJ1UcfcxYdXkZPflfLk2D0WVFeC6GWo8ViYlBYqNfv
         Io4ZJnDestdou+GbS2QSJPA9BCRtBbfDLyVwWw4TxgGD+UzFA2xcNRFPqvMNjMyOZlp4
         zjqo20W9aGaEvH/UGUxs7QWSqlzy0mv7aebYtGnDK3Ry3X/zjLR6XRfWcgL+bsaAKJE6
         5zwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLGRTr7+EiiZwU2iDnMLzJ78Op5bax7ag2mBPGkym37Pfv72nRn4fIaFas9cCE7CHH77ZCyN8U6mckL6r/pRvb@lists.infradead.org
X-Gm-Message-State: AFq9FYIplbJSea1dqlSOUW31BA0WFd48GScHsl3RZUoCGpqR9TIpyi20
	cyv9qNGhNUep6NcHQ0SLi8x+p2UcDR1KC3kjoe/gCeqSLPI8uamoP18Q
X-Gm-Gg: AYBFou0YTYvyBKV96/X7Ago275l9NcaszfeKN4M/GNoDM76ydI0AQLG0Aej7g//VlNl
	waDCBrSTefKwGjV6UctiNgLPzsij9N5EeK9364tZ8zJT37XHGjYljbAsU2dpOh74rdtN0s9eKWw
	2RD33V/GK8KNbzHlhxJT+JsQAuBcnDiITbZZziWcRXp/L/ploeEnxZvQSLNXLCeaw+bGszkGL2G
	jqqRdS1xM/zJsUohcvLaVPPMbwu7NBfuyVK5yOha5OWzW1wHLGqqq1HryMHQn0zdvgsrP5j7Wli
	R7Tx9rgi/Jh1mxSAqgUv5sq0iVjbRb4xfaYX3+X4IJTUfjDckPX8X/6OWkGqdisPWpcutYaOqXS
	3wiMT2N7pa3/DYdZGeM6GFIF3yt3qap6fBa1AR/fKPnnnrYhRi7cjVICUoREQoMbAaoxQoB++Dy
	bE6nsW5jdot8KQK7ClSnhn31Pzi3oXV3sL+eDWMAu5TGMRhUDCe3oOR7svHAdN5Qg+2YSN3R/PE
	huiCoG46NIswou7dN5kUozgtpg4LhEgi3xcT8mvM0zieXgC/+ih8PSFHmd1u64GRA5y4Gx/wbCF
	tRinm51oQBvSU/38al/cPv8h6UFYTrMSzlOjWocnly3ATvGnlS9TDmYw7gfE0dRldgPkck4=
X-Received: by 2002:a05:7022:ef07:b0:1a5:8f40:6cb4 with SMTP id a92af1059eb24-1ac5fb18dddmr4578115c88.34.1793373492682;
        Fri, 30 Oct 2026 08:18:12 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm7581645c88.14.2026.10.30.08.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:18:12 -0700 (PDT)
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
Subject: [PATCH v3] PCI: exynos: Handle PCIe PHY initialization errors
Date: Fri, 30 Oct 2026 15:17:01 +0000
Message-ID: <20261030151701.3100-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
References: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081815_539425_C67B24D0 
X-CRM114-Status: GOOD (  17.39  )
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

Check the return values of "phy_init()" and "phy_power_on()" to
avoid continuing PCIe host initialization when PHY setup fails.

Track the PHY initialization and power state to ensure cleanup is
performed only when appropriate, avoiding double calls to
"phy_exit()" on probe failure.

Also check the return value of "exynos_pcie_host_init()" during
resume and abort the resume sequence if PHY initialization fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - Address review feedback on PHY and regulator state tracking
 - Avoid powering down the controller when link detection fails

v2:
 - Track PHY initialization and power state to prevent duplicate cleanup
 - Handle host initialization failures during resume

 drivers/pci/controller/dwc/pci-exynos.c | 111 +++++++++++++++++++++---
 1 file changed, 100 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..d7504b0e5d96 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -55,8 +56,34 @@ struct exynos_pcie {
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	supplies[2];
+	bool phy_initialized;
+	bool phy_powered;
+	bool supplies_enabled;
 };
 
+static int exynos_pcie_phy_exit(struct exynos_pcie *ep)
+{
+	int ret;
+
+	if (ep->phy_powered) {
+		ret = phy_power_off(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		ret = phy_exit(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_initialized = false;
+	}
+
+	return 0;
+}
+
 static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
 {
 	writel(val, base + reg);
@@ -225,13 +252,23 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
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
@@ -314,6 +351,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
 	platform_set_drvdata(pdev, ep);
 
 	ret = exynos_add_pcie_port(ep, pdev);
@@ -323,8 +361,19 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 fail_probe:
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
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
@@ -332,22 +381,42 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
+		return ret;
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
+		return ret;
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			return ret;
+
+		ep->supplies_enabled = false;
+	}
 
 	return 0;
 }
@@ -358,13 +427,33 @@ static int exynos_pcie_resume_noirq(struct device *dev)
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
+			return err;
+
+		if (ep->supplies_enabled) {
+			err = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+			if (err)
+				return err;
+
+			ep->supplies_enabled = false;
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


