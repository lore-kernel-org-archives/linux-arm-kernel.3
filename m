Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DE9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NAu4SYOm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tadno5dU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XcZ9lbstnk1GTs2qJHkiYVcgAWVuc0rERzcXapVspqI=; b=NAu4SYOmhkxNGK
	NtsAvk9KG9F5FsS0YjDSAa/TMS4iy5LFWNuVDvgkOVMb+TcBqtj7bNLPH1+h26rANKLmkmCxNcFXu
	WaBwxf+R1VOmr1wGAdWIU2T3/G2GxNAJxML8fIHbZ1g1p1EVNfJ2zzpCgMN8xif7fpUyRCV5mZHhC
	hI3JDAzCXnfHNLp6czvpsYFEgVISgAOg9w6PGSOfNmAhzgH/KllWuS6RoxL2TEWDrJb1HkhXQzEe5
	F9Q1R0Y99l8TZW6d/2zIt5OVg8ezfUEug4IXi778dZM3f3rAcUUuJc811x1mVqNOMehYYUR/HQIZ8
	hBpaI0Q7/bmOFNmPT6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpbt-0000000C9HC-2S1I;
	Fri, 30 Oct 2026 16:37:45 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpbi-0000000C9GB-0GoB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:37:44 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3535a54bed9so1478644eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793378253; x=1793983053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcZ9lbstnk1GTs2qJHkiYVcgAWVuc0rERzcXapVspqI=;
        b=Tadno5dURRERyLloBL1XwNJGiaxekgsbbN8gSS1ToyVLm8tnjEqQsvqERDtbUKFyLo
         jzWnjmcwyziHNVQrGlnNtlTikshrI52Q6Sd3cTqHIAPh7YmK5TDMw20Pp9q6TVuGf/yN
         ouAxW75VJTl4WRgTSMCEFe+JBuBzuKRdO83Tmzv1SUp7si8an4WZ6T2XfTetGNK9TlZa
         nxtoIImrAtTYjuICgDtv3fF1YAfD4WLwEap1dyrZ/jKtRTYz0lP6ozQm6dMFZPD+o46o
         XMRkkmGR9p+iRGqRXjVR2jg4oG+An4uypNS0NcRlAQx5ukPiy2+g77S7JF+MwAsb3Z5Z
         aqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378253; x=1793983053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcZ9lbstnk1GTs2qJHkiYVcgAWVuc0rERzcXapVspqI=;
        b=zdtyx1m1zAIjWkMBC7azOJD4depNa58nlnPK9g/SY1o32czdzDVKgvAuGlln/3M/Dz
         PBHgXTvwoPktWOp3ZejeytABFcgYiGrAlMwdQHKvJIpB3MTnYzOo5SxN0e+NgS+10CB5
         +3shSpTf76f8TA3sKAcgEo5w3VexaS0TSI+XpdC6KIi312SzHwaCG1tSmK0eEPjEFrVS
         I9NDg3Ziro5ngX324FeTbiSnfnHuoI3Vl+DUWMzEdTnRRcyN4OG3x49XenXoyK29SthI
         IIcnimHbbMlahKWxoeP57WevXf104+Lx1joE7LiDMrpQsgEP6Fx+b/j+AxTeS7zNDeaz
         GuXg==
X-Forwarded-Encrypted: i=1; AKwUvBxm7MgY4So6hNNSXsSxSOlI2NiGKuxuIWKVY/6zS7ylEveCZe3136RYdrINjGt+ygBOIwCG0aYFjtRpW96MqhUh@lists.infradead.org
X-Gm-Message-State: AFq9FYK3bnvoMVqQa3anazBem93yJWEekAYD9lGhS/X6By7HXHbYrjIh
	ilNsSzsIYaInh93fRiJJIxW3c5lyiUpxIt/MieiUfIfvD7kXA8lXmk6L
X-Gm-Gg: AYBFou3I/HWNlU6K+xUAG3J0VLTgqKjwKtS2DG1lnpf4M/2JZBgAH/DvusupPw4ZDf2
	OPkOPqtVlVspf9x8Co144xKoi01/oljLCDn2tJREILUWXF1TRuYPqEyk+EKp4Y3EEX/XOopuo8j
	MZ7uCOxb8y8BmD2xnH9A5GmjfUrSWTLEAht0MncBhSxsf76sD3GjkYHtOux9Ov11+WNSmFVvmDs
	gpSM1WoexRop6hRen7eK4b+bOpSmacj+iAJlv8RqcJ4f1fKwjHi8WEwI53PH5sUybQ8sx9DwBiD
	gQmE1XljlNWVx90d+rl77/+lt3+OhzEafDmq/SbwWYHl12v60cIaE8PanvS5KJY/woeUckWihPl
	vlMxcBfYZBA6IqbvzGpKpaMUQBHFpBOmg7OioLJWJ+5vY3FLWjtesqwDeYCHde4XpDt/exgfKZC
	x3+1lv6TIxM/i16JDlGok5SLZzf0KBHEZSPVSmaZlqaiQly8h3kkG2LTz9xF0E5xuvp9xzmOzi9
	oYCjbfVHuJBfbvmD09nzjL55EcZrhxQ2UkzGHcxEIHMUMtW0EMFnTt3Oif18F00hjZ1M+GgtESe
	oknMaxKGnSKUllWuK6nqpi0jm5ElCvT0Et2C8bMfIkV6vuLQ1w==
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr3906559eec.7.1793378252415;
        Fri, 30 Oct 2026 09:37:32 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8458708eec.18.2026.10.30.09.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:37:31 -0700 (PDT)
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
Subject: [PATCH v4] PCI: exynos: Handle PCIe PHY initialization errors
Date: Fri, 30 Oct 2026 16:36:54 +0000
Message-ID: <20261030163654.2733-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
References: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093734_135327_3AE1F96D 
X-CRM114-Status: GOOD (  18.56  )
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
index e3c05ade381b..5b8d8f1ce8dc 100644
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
@@ -332,24 +381,48 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
+		goto err_deassert_reset;
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			goto err_deassert_reset;
+
+		ep->supplies_enabled = false;
+	}
 
 	return 0;
+
+err_deassert_reset:
+	exynos_pcie_deassert_core_reset(ep);
+	return ret;
 }
 
 static int exynos_pcie_resume_noirq(struct device *dev)
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


