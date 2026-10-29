Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4KURP/uI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OgwOx2I7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8cM/p2K3K2tPOM9+U7FKmROE+HQamkMu7RKKZe0hh5U=; b=4KURP/uIxhVGmu
	o77FHe/IYAIxG+Rsdzzhn0luz9OOzv3AL1hlq1zbxAKzWZUg0zfNBkyi1tAfWkaFc85+6Dv0p+ZFO
	E+FFP6s5mJXBNbhD+vPpojuKzN16MS2a4REdWJDhU/wUTaRHJdctlsGRyu29s/ZqqP+w/MnF1Rxmw
	kNUhS9E0twK4NF0ypyhkLhBLmGvZ/PcQN1aCF6N9nd1Z10ttUfRXFasnIKpaTiqVyYNyVRVaNJ3m6
	lYbKEPTg1En7zfLdwH2iyQ6Kn+7pJHTk7LjtHcAssKudNnjZojsHrFOkSX/CI+nGXoEsWU+piP76U
	DGM84cAU89/Z2hDGkjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMULn-0000000A26u-0lFG;
	Thu, 29 Oct 2026 17:55:43 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMULk-0000000A267-172C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:55:41 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-15ea896ddc8so3629296c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793296539; x=1793901339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cM/p2K3K2tPOM9+U7FKmROE+HQamkMu7RKKZe0hh5U=;
        b=OgwOx2I7kRd5mid5eq7gmTT9Q1B7Bq35TbSPuJcQ8Vo/+AUn6WFLOX6VkzavLmXOQP
         U18c76l/D+jXXRGZmt2fQhpjEwO/v4+t/n8+qUNe0DElrx5T1oeXAGJVGGK/q5IRF9uB
         6hntWoyyppzSaa0sqZMPx3xrlp3r/j0vPkxfdz5dgOOCDp6s4xqg6+kgwcRqB7uMET6Z
         bPqy8T5BzVrO8lOEAnJkb2XK629Q+aFO1w4zeC/pSmRwq9PPL2BDR62BICRq8blMtkow
         tBO4FsrGzk0l5OQIur0mSAuHdtJMo1G7MAtJH0adUKxj/Hb3TLYKCgwEK4NzHDTqSkMw
         oJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296539; x=1793901339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cM/p2K3K2tPOM9+U7FKmROE+HQamkMu7RKKZe0hh5U=;
        b=XGTCAEOE1FdfN+IEC6bLNjXFJk2ol8JgKQI7VgBc8pMwipJVxhp0ndUTh02nhyXeg6
         88+QzBSVcT9JhByvNeEK7QtKMFOacWyLzbtNbRkWxA+f964S8uwPqaEpf2IKJmk/U6jl
         56fnE1lh9AFc4MEolDcZBiIOW0xgGNG7PU5ln0X82NEhUh6HyDCBMe6QfdFkvyztjOJI
         ul7X7hw6QBjF5hLHhB6Q4/JBTTDao6R+dgmmJLeog1WrH96hH4QZMMB90wpGYdG2D4rG
         p23YCo9PGuM9e0daU+s/vIojBc0VweqbivJ7403/Pgd7ygFaL02UpE2gWARehY1h9OZ6
         pwRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVZFtGc8aZS59PJCBa3t/ITuWklldnVZ+LpE4gMNsq2gyCjVXwuARyWLZ5WXX1r0F8pwK39Fkp3d9qmJZFoYdk@lists.infradead.org
X-Gm-Message-State: AFq9FYJKQzigGe75V0vdXiF8GIqM3RmynbSW/qI+T84Y+edfBLrKudsl
	466ysGcxP8wOuq2mLLzPtv95TmXvqILvN/Kl0nHt+otdZ2/6BFN5Z0OP
X-Gm-Gg: AYBFou3VzQx1ZR54grBNC3S2AJxc+6gWwwW0EqMlHSuuH1/FhKwzWh5TqEKNcNqbOYK
	I4wApr9HTq5Dbpt+4+WQGzOyZF7ua9qc20fwwWi59Pe78kBUNEAp0AB6zaZ0JbehxonBi08xUJs
	DurdVYQggXZjl4j6HctWTLKuTLL22O+Mqbzqo2FF3xfCZ5s0m+sUR+w8tYVddZNJ8Nh8fky2YKn
	NhluMZqh5zf5UuoUQ3nNG9wcMMr86umDij2JfMwUmpWWICi6XvELOwajL0gUAzruaWjDv3STduW
	fayB4jJhTP5/HAPYwnl2hE527fePmyVuYeYrVkYuEsDU3HvzEIC3vGe8zg3SADlToVbkUXSuTqa
	E5E/1kJZZQ1ceuGF5Sxt7n1yWhxg50yCIgnt7vCCDDDnoanNiXaXAeYClaE3XudhL2dskGQLObo
	uIsfdOGfZBrx0LlwTyd8BzWwwTf8eYlq/KZG7n+CVBtJ+eOv8tf0JV5y0oU6ENlwgEGHKwdnB0J
	HVP4wMJykZnCQnc+F6bRXFjxkLuveDmwOED75UBLw227hZsxfgGSnPU4Gps/Zhcgs0czKhrxVTF
	zV8vM2oYpz5DJtGv9UxM1lVdLkCCmfsl/Be7M4HBQdP89Z+MY04=
X-Received: by 2002:a05:7022:b903:b0:199:4f68:7710 with SMTP id a92af1059eb24-1a6c86c607bmr7367119c88.2.1793296538669;
        Thu, 29 Oct 2026 10:55:38 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm392417c88.0.2026.10.29.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:55:38 -0700 (PDT)
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
Subject: [PATCH v2] PCI: exynos: Handle PCIe PHY initialization errors
Date: Thu, 29 Oct 2026 17:54:39 +0000
Message-ID: <20261029175439.8490-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
References: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_105540_304759_7784E935 
X-CRM114-Status: GOOD (  15.49  )
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
resume and abort the resume sequence if initialization fails,
disabling the regulators before returning the error.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
- Track PHY initialization and power state to prevent duplicate cleanup.
- Handle host initialization failures during resume.

 drivers/pci/controller/dwc/pci-exynos.c | 77 ++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..f6b87c26ab36 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -55,6 +55,8 @@ struct exynos_pcie {
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	supplies[2];
+	bool phy_initialized;
+	bool phy_powered;
 };
 
 static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
@@ -225,13 +227,23 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
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
@@ -323,7 +335,16 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 fail_probe:
-	phy_exit(ep->phy);
+	if (ep->phy_powered) {
+		phy_power_off(ep->phy);
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		phy_exit(ep->phy);
+		ep->phy_initialized = false;
+	}
+
 	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
 
 	return ret;
@@ -335,8 +356,17 @@ static void exynos_pcie_remove(struct platform_device *pdev)
 
 	dw_pcie_host_deinit(&ep->pci.pp);
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
+
+	if (ep->phy_powered) {
+		phy_power_off(ep->phy);
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		phy_exit(ep->phy);
+		ep->phy_initialized = false;
+	}
+
 	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
 }
 
@@ -345,8 +375,17 @@ static int exynos_pcie_suspend_noirq(struct device *dev)
 	struct exynos_pcie *ep = dev_get_drvdata(dev);
 
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
+
+	if (ep->phy_powered) {
+		phy_power_off(ep->phy);
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		phy_exit(ep->phy);
+		ep->phy_initialized = false;
+	}
+
 	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
 
 	return 0;
@@ -364,10 +403,30 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 		return ret;
 
 	/* exynos_pcie_host_init controls ep->phy */
-	exynos_pcie_host_init(pp);
+	ret = exynos_pcie_host_init(pp);
+	if (ret)
+		goto err_cleanup;
+
 	dw_pcie_setup_rc(pp);
 	exynos_pcie_start_link(pci);
-	return dw_pcie_wait_for_link(pci);
+	ret = dw_pcie_wait_for_link(pci);
+	if (ret)
+		goto err_cleanup;
+
+	return 0;
+
+err_cleanup:
+	if (ep->phy_powered) {
+		phy_power_off(ep->phy);
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		phy_exit(ep->phy);
+		ep->phy_initialized = false;
+	}
+	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	return ret;
 }
 
 static const struct dev_pm_ops exynos_pcie_pm_ops = {
-- 
2.55.0


