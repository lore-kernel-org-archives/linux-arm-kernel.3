Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4A4D7832E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSE1oYmswp4nZQvrKL5VAYP4YbLQSL+PfB27DrayTI4=; b=FslGQsbbXFOGx9Rt4K4DSrKAiz
	4rHGU6IO7lL3VAOOqbVd/4FY+tQohvlofJWIJLwTCPsbl0GvxETPCZ+Vn1aHyoTzV2cDLFAOebBqZ
	wluIBU9lJOaPSvYxLTPazaAb0+dn5QCcI+zr36vN3ukAnYGTJbvSawWDmRlAMxmko3qfzMW37I0AP
	oznUIzkqj7Qe8XZHESNMGfflK8q5lySr5aYqA24fVQuWhRzrZHvZkU2JrC90UWxYjG9DNcHEdLIgw
	PWBmWaGvcvArZKzyBrZUpsa1cOpQZPMHa4pd52ElsjXhh+hqmX5ai9MuNIbhD+btqB2QzE+SnLAXO
	tZA7jCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI86t-00000006b5I-0Ftu;
	Mon, 02 Dec 2024 15:13:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI85s-00000006ato-3TFu;
	Mon, 02 Dec 2024 15:12:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-215936688aeso10765635ad.1;
        Mon, 02 Dec 2024 07:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733152332; x=1733757132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSE1oYmswp4nZQvrKL5VAYP4YbLQSL+PfB27DrayTI4=;
        b=OXdGcBhJzEe2CCFj8f3wzd4F6z/4VIaFkhbmxTzwoQohED1j+Cpbt1vC5VReoLHcNh
         +V6AHw5DR58BLQ3/yFizO2xg7DDzJNpcjKMPNPwCleXdlYePP5Ni451b653JwDOweCVR
         4oU9dzm3Gqp8oSDcdUhxcMQnjQLyQ7xz6CokkDRyTCTaWFka/q5qQSuAHsU54QE18moQ
         fCgeQ+HNS99+4Xg+B6mC33MFE99m/EcmX2D0MzxApcohH/Cq7hDE7jDr8wFAlBCU4mvL
         NSU2J62pSe/AWDb7KJ9wd2Bs5AnhDe8R254+X/QQn5x00E5XBTYvs5IY3zZD5UbLMstt
         rJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733152332; x=1733757132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSE1oYmswp4nZQvrKL5VAYP4YbLQSL+PfB27DrayTI4=;
        b=h4UcHB7XuystHww2lnP2bi+haNCwr0s9i1rknxF8XBz5L4OUcaW9dlSnrKMA5YcTiU
         vHPC5/ymXb8RF7OZ/x4ToTXP9uBqVONyUQtUai2KBJvOOQV0jLLbhAj2qL0D7GgFWVyf
         yxhhy1Fy75rpTtOsk0l2uUTCbJTHedINvbJOiCopoCpAg+jx+fA6zfcJKqxtQrXht0Ua
         1kEGZMx2aHSXf8kPQm0UizqJp1nsKUdRBKQlJHWY1YNWdqDdxwuAURL+pTIJSIYVpuKK
         UrQmbpaMgvrHeqvkLtdES5Eskj9vqCsKlXdYsKxbJd1kscJauvZS+jGJ7GECvh3fcpWl
         2vAw==
X-Forwarded-Encrypted: i=1; AJvYcCWI3NGbRJj46YCCRSPgmAvsidb1rTjg2MCTR+Cwobps02QkefF0lbXICu51vitqJLKHpooBIC/1iQf23TFgQsjj@lists.infradead.org, AJvYcCWSFg+CVrH9/eq/GaSA5KhU9Ghdi3wa2r9om6tD+cqFZvnTh4AQg0daBDgrQfkoCFejhzQwbSicoDp0jTtwqU0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjBaN7RfwMTlAIosBq+z+sC8ODab1cMLS6r5y4LJSAPF+oCqy1
	Ap+zDTDN+Iv2z/BQ3DA4Jcc1DYf+xMukIXX9xbjLpJTZV4pQyaVx
X-Gm-Gg: ASbGnctxjQeGu6tzTxUecOJyXjsmnwC2wifrQeAwVTD+17RwO27Rp9wZAtIwjgnqIFD
	Pn+PUUJRCGNJVMiGpPEbMrIvM4KXrkTMdGA6XlHTS7JbSjksuSslfTqk28Ek8ndcw2uybHuyOV+
	5x3d+M694JEb/oBRb9fulGdm85vTsFp0zdZ/RMHQWsXvymnvgGptI3pMdkg0oXvzJTACwoDJeQM
	TlmVbgEa+T5k95+HkOhoMmTTOMZQqIeF7PgvtumNk2QvXVZOOrP3g5GudwfZ+RvEA==
X-Google-Smtp-Source: AGHT+IGJGsBN5Bz9z/jmVRFG5EPn8EbineRclxV2mlzSvVxPBgKVWQ30c1kjlQPr/eERQsBmU2EONA==
X-Received: by 2002:a17:903:440f:b0:215:a7e4:8475 with SMTP id d9443c01a7336-215a7e48795mr33777685ad.24.1733152331602;
        Mon, 02 Dec 2024 07:12:11 -0800 (PST)
Received: from localhost.localdomain ([113.30.217.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215218f1da4sm78524955ad.12.2024.12.02.07.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:12:10 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/3] PCI: rockchip: Simplify clock handling by using clk_bulk*() function
Date: Mon,  2 Dec 2024 20:41:42 +0530
Message-ID: <20241202151150.7393-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241202151150.7393-1-linux.amoon@gmail.com>
References: <20241202151150.7393-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_071212_863733_1BE53807 
X-CRM114-Status: GOOD (  18.19  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently, the driver acquires clks and prepare enable/disable unprepare
the clks individually thereby making the driver complex to read.
But this can be simplified by using the clk_bulk*() APIs.
Use devm_clk_bulk_get_all() API to acquire all the clks and use
clk_bulk_prepare_enable() to prepare enable clks
and clk_bulk_disable_unprepare() APIs disable unprepare them in bulk.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V11: None
V10: None
v9: Re write the commmit message.
v8: Improve the description of the code changes in commit messagee.
    Add Rb: Manivannan
v7: Update the functional change in commmit message.
v6: None.
v5: switch to use use devm_clk_bulk_get_all()? gets rid of hardcoding the
       clock names in driver.
v4: use dev_err_probe for error patch.
v3: Fix typo in commit message, dropped reported by.
v2: Fix compilation error reported by Intel test robot.
---
 drivers/pci/controller/pcie-rockchip.c | 65 +++-----------------------
 drivers/pci/controller/pcie-rockchip.h |  7 ++-
 2 files changed, 10 insertions(+), 62 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index b9ade7632e11..53aaba03aca6 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -129,29 +129,9 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 		return dev_err_probe(dev, PTR_ERR(rockchip->perst_gpio),
 				     "failed to get PERST# GPIO\n");
 
-	rockchip->aclk_pcie = devm_clk_get(dev, "aclk");
-	if (IS_ERR(rockchip->aclk_pcie)) {
-		dev_err(dev, "aclk clock not found\n");
-		return PTR_ERR(rockchip->aclk_pcie);
-	}
-
-	rockchip->aclk_perf_pcie = devm_clk_get(dev, "aclk-perf");
-	if (IS_ERR(rockchip->aclk_perf_pcie)) {
-		dev_err(dev, "aclk_perf clock not found\n");
-		return PTR_ERR(rockchip->aclk_perf_pcie);
-	}
-
-	rockchip->hclk_pcie = devm_clk_get(dev, "hclk");
-	if (IS_ERR(rockchip->hclk_pcie)) {
-		dev_err(dev, "hclk clock not found\n");
-		return PTR_ERR(rockchip->hclk_pcie);
-	}
-
-	rockchip->clk_pcie_pm = devm_clk_get(dev, "pm");
-	if (IS_ERR(rockchip->clk_pcie_pm)) {
-		dev_err(dev, "pm clock not found\n");
-		return PTR_ERR(rockchip->clk_pcie_pm);
-	}
+	rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
+	if (rockchip->num_clks < 0)
+		return dev_err_probe(dev, err, "failed to get clocks\n");
 
 	return 0;
 }
@@ -375,39 +355,11 @@ int rockchip_pcie_enable_clocks(struct rockchip_pcie *rockchip)
 	struct device *dev = rockchip->dev;
 	int err;
 
-	err = clk_prepare_enable(rockchip->aclk_pcie);
-	if (err) {
-		dev_err(dev, "unable to enable aclk_pcie clock\n");
-		return err;
-	}
-
-	err = clk_prepare_enable(rockchip->aclk_perf_pcie);
-	if (err) {
-		dev_err(dev, "unable to enable aclk_perf_pcie clock\n");
-		goto err_aclk_perf_pcie;
-	}
-
-	err = clk_prepare_enable(rockchip->hclk_pcie);
-	if (err) {
-		dev_err(dev, "unable to enable hclk_pcie clock\n");
-		goto err_hclk_pcie;
-	}
-
-	err = clk_prepare_enable(rockchip->clk_pcie_pm);
-	if (err) {
-		dev_err(dev, "unable to enable clk_pcie_pm clock\n");
-		goto err_clk_pcie_pm;
-	}
+	err = clk_bulk_prepare_enable(rockchip->num_clks, rockchip->clks);
+	if (err)
+		return dev_err_probe(dev, err, "failed to enable clocks\n");
 
 	return 0;
-
-err_clk_pcie_pm:
-	clk_disable_unprepare(rockchip->hclk_pcie);
-err_hclk_pcie:
-	clk_disable_unprepare(rockchip->aclk_perf_pcie);
-err_aclk_perf_pcie:
-	clk_disable_unprepare(rockchip->aclk_pcie);
-	return err;
 }
 EXPORT_SYMBOL_GPL(rockchip_pcie_enable_clocks);
 
@@ -415,10 +367,7 @@ void rockchip_pcie_disable_clocks(void *data)
 {
 	struct rockchip_pcie *rockchip = data;
 
-	clk_disable_unprepare(rockchip->clk_pcie_pm);
-	clk_disable_unprepare(rockchip->hclk_pcie);
-	clk_disable_unprepare(rockchip->aclk_perf_pcie);
-	clk_disable_unprepare(rockchip->aclk_pcie);
+	clk_bulk_disable_unprepare(rockchip->num_clks, rockchip->clks);
 }
 EXPORT_SYMBOL_GPL(rockchip_pcie_disable_clocks);
 
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index a51b087ce878..f79c0a1cbbd0 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -11,6 +11,7 @@
 #ifndef _PCIE_ROCKCHIP_H
 #define _PCIE_ROCKCHIP_H
 
+#include <linux/clk.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
@@ -321,10 +322,8 @@ struct rockchip_pcie {
 	struct	reset_control *pm_rst;
 	struct	reset_control *aclk_rst;
 	struct	reset_control *pclk_rst;
-	struct	clk *aclk_pcie;
-	struct	clk *aclk_perf_pcie;
-	struct	clk *hclk_pcie;
-	struct	clk *clk_pcie_pm;
+	struct  clk_bulk_data *clks;
+	int	num_clks;
 	struct	regulator *vpcie12v; /* 12V power supply */
 	struct	regulator *vpcie3v3; /* 3.3V power supply */
 	struct	regulator *vpcie1v8; /* 1.8V power supply */
-- 
2.47.0


