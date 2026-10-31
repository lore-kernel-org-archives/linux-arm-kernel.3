Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hnqo1O26;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hcnsyZKO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OfB8s4kz59lXGKWlIIVOfEeGW2vmcfTHDgtk/qzATWs=; b=hnqo1O26I6y09G
	c/EVQo53vGzCwnE3mXSuhPg1UZn9IF8pCSpswalJP7KqCe3iBe3ZoETDpDVljYqE7fLgPPD3Ng9HM
	mAAVWcZQy0Y9JMFGyklYBVSuEqdpI/zyj95GCrmjR8jKFsSJE4Z6E5B6XaiCrAtTWWuy+Wq9Ki10b
	GimG4uiWKTP7RQahqDdNoYDNl4l2/Jq+Jy9/tDW/RRaexMDmVnejX8prIx0Y5iTtunzbnzjJNbB/i
	Y/StZ9ZcAe7dMERmeBDc3rKifI+NvuBOriPH+7JuLRTIPasYDiA72cRVHJmAKRr2U6YCNGUBQfqDr
	m7czUUNTdCZWMqwD26Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN3dc-0000000D0bw-41Jh;
	Sat, 31 Oct 2026 07:36:28 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN3da-0000000D0bZ-1meM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 07:36:27 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-36a2551d7b5so3240531eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793432185; x=1794036985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfB8s4kz59lXGKWlIIVOfEeGW2vmcfTHDgtk/qzATWs=;
        b=hcnsyZKOfRfV12dzDqHW5Th9XlMkwPvbZrlWUKin8vv4ZktHYS4n09aEZ9RzFrfOJP
         dkuqMhpr3JpClhhJ8Kr5hywrk5N6Fz2BN/G8IsAYXCWhoJtBV88opxzlINOmIFi42sMm
         CraTYSYjk2FTf4FIzw1580yoYC2tzc6LBLZqn8I76/tOeW0eT25QvOz3VoGUhq0KE7jY
         XyA84u1n3iFzwutC3gNkSBi/c0i1m0o2L6FQOwYtWa7HWEgfrcFGKdYcHhHWrGQcWULM
         fwbD8E8+uucoHN6Yh0rdB7FKO/iMxI5iW76a00hAhLy3M+kPb+/12H/BiKGk8EjtHRjj
         G73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793432185; x=1794036985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfB8s4kz59lXGKWlIIVOfEeGW2vmcfTHDgtk/qzATWs=;
        b=mpkiO3c/uid1o5CI+x0R4shzMxzKMmVQwGb/Xq3xCM7qoNvH/y2MrDqFZHZrFTW2dB
         4ZGUfffCiQHauAPhAr2/n0QROyNYjqMHEC4WStAI04rS0eRiwyAY8Ns5xTLShJs0ZS8N
         3yFbIZB2CAEpTBvV4BYtIe74QpVNbaiEesxIvXfWREUMNnb9wq10zEMOObHpLcXx6uZI
         kA2IduWbXQOfUDGyWAtfKBq9jayyhOBHfBSzDj9Hx2QyizHh5Xa7xkv/hYppfG5PkKaF
         CTmdwAgc4jl0nzL/j3Hx70/4MTpAiIs0fuR2lrMx3g1vShfFIKoFzhrfGJfz8DVCrPlh
         CclA==
X-Forwarded-Encrypted: i=1; AKwUvBye1fIZJNDgdTzqYnYBvEAgu+GMWn9LnPHjLdNk3PJxw+pePtfaimbH5v/MiIbKmQ8y8oU5euts5PW47z7KpdOj@lists.infradead.org
X-Gm-Message-State: AFq9FYK4usqhAUsaZVnLjjEas+YkEQ7iJcKau8j+h3zITa1PAQk5vCBl
	7rqauq+41xT6V8nXSkv3DUTqrXQvOHmMbzZyBjbnQZqoAKbDWgvJMNrU
X-Gm-Gg: AYBFou39pV2VZntupLhfvaP2Z4pPTbFpSO69HjRgfg2YxxdRkPqnSCpDsoG3N4iJOv/
	qinR8WuF4gImOpAFMv3a2V/TZFSR7DSpZVzUyWmIJn43PtdEXLUHzA/40bHBTuOWc/89d+PSG8D
	URFBGq70i+RvkD440qd3G5lKxKt5dDpAfIXal9hS63NGybCnhuU4XHePcZf02sPWcOs4mpbNAwm
	IB/lQCcAt+UOgLHqNX5uiBSVogcqHY+3ADbS/GyiDvvcb6iNXYcRUR0slSB0umHwPQje/4CWi45
	zUXu+kCWW7AyXTSjT/QLgOh5BzJTgmNhqA2JiMoZXE85wCPaMeCg7oSSyPjUeZo/iMcyV7dwFh4
	9A6FFyuJgQqYEL5DJ+/VSKSGuffKfFwz9tk+FSGYnGJ04CG4aNyntxFT6ynXqC3XB4u3UfV6fva
	Nrl2idgl+rWqhyXTOY4l0wZhBeRXskmcQIXEukqDfe5AkYsFDK5itsmEwSkUrjtxl8XR6FPrRZj
	0iP5+Eurfewb/iQ/2QTo/lbJ+Nx/jqbbQ5H+LkhdCkLivBbRJlGE24kT95CUHdgvnI82qSeKVU6
	jU9YqYGwa1mwiM1LAY7ifntyZlNf0RyyFnuPY2G/n26omUZO2Q==
X-Received: by 2002:a05:701b:4549:20b0:143:1bb1:3305 with SMTP id a92af1059eb24-1a94abded94mr9977794c88.22.1793432185124;
        Sat, 31 Oct 2026 00:36:25 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm13303278c88.15.2026.10.31.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:36:24 -0700 (PDT)
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
Subject: [PATCH v8] PCI: exynos: Handle PCIe PHY initialization errors
Date: Sat, 31 Oct 2026 07:35:48 +0000
Message-ID: <20261031073548.3916-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
References: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_003626_475232_C1184F32 
X-CRM114-Status: GOOD (  18.96  )
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
v8:
 - Fix state desynchronization in exynos_pcie_phy_exit() by returning
   early if phy_power_off() fails, preventing calls to phy_exit() on a
   still-powered PHY
 - Prevent PM core desynchronization and orphaned controller states
   during suspend-abort sequences in exynos_pcie_suspend_noirq() by
   logging teardown errors and returning 0 instead of aborting system
   suspend
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

 drivers/pci/controller/dwc/pci-exynos.c | 126 +++++++++++++++++++++---
 1 file changed, 112 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..45163b1dad81 100644
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
@@ -225,13 +252,27 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
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
@@ -314,6 +355,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
 	platform_set_drvdata(pdev, ep);
 
 	ret = exynos_add_pcie_port(ep, pdev);
@@ -323,8 +365,22 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
@@ -332,22 +388,42 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
+
+		ep->supplies_enabled = false;
+	}
 
 	return 0;
 }
@@ -358,13 +434,35 @@ static int exynos_pcie_resume_noirq(struct device *dev)
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


