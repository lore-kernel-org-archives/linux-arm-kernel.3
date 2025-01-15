Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18745C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtKelQz/78A8bo8Vg0JkYpThHcAAeYRmgdNPVPZFl4g=; b=K5y3Iwbh0KdL4A
	k8RmshQMdgT6GlbxNvwOnlEz7VD78rOkVCUIERXzozRlpROjE1yb6vWOzEFuCxVL5ZzQNQ9ylaCWH
	yC0kAuVlEjbcAWDQRaddvM5IKQNtzOmM0vSdAQhH92cJZT1QACQRQJ87Nt8sdUnP2TsStu//jcHZa
	IN1k2aAvGTtMnH19bkANYgY5stJV9f3tU3MroHzlIpstuFUqSbddvDJbBlrZvMU6sh0XGfy+O7U/6
	bmsfGBe+FABRFao0lyKc/FqitEPdRw0cG3328z/EaCGHhITSFiyDkKWEuL0aQq0NaIrKEnaT9f2Pi
	TlYEzyRxzKNZFfVEEe5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5tk-0000000CMxy-2aHb;
	Wed, 15 Jan 2025 16:05:40 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5rB-0000000CMQJ-2xHl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:03:03 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id D7E9FA099A;
	Wed, 15 Jan 2025 17:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=VtKelQz/78A8bo8Vg0Jk
	YpThHcAAeYRmgdNPVPZFl4g=; b=iJxIkM7HY0Tv8C0GXViAA/y5NpP4ovq3qhom
	YPdXfZbhsQIaIBngULnL2S0ZtmTVWl9ETazZhmOKbSNlV74ZvhcfK+liDNBh0V58
	KbXJZndvj8wv1NaW6pZpdgQBQEmoY6UWxANrpMFMk+u9/wn/UHnsiyboEmuL2Rhr
	1/nvTbRd1YUT7id87nerGAhui88rJVOhnTJ1IqmfddgotpfJtnom8ZjDOriq5R09
	RDL4Dc1ezQg2yQYPoOyWZ1rPJ6IPA7KLy9Slv1wjeDxvQPdIwuVNZ8+Ak+X6lYFE
	RDdlpMKnHI0VFgXE2AAaghcARwfp/XVKejf/l5rv+l6M3XLkrDUiMt93pxSHzHuG
	fmBS874EBAaw/CnMcE1fiN7i8a7/kUSlhtg4cbb33ftITg3khLQidf+0KMlzD85I
	V5j9eABen5hdXpliVtcrVqgain3exWnvXgLjoNjUj7ry4cNompGmYoZfjiKPQtYr
	EZiYNrjhHP56T8Ma/ceIB4y7B4U6UJLgMnlPp68SZUzF8mvz/Yr5FQUo3dS9Id6h
	N3jXCFiN0HMc4SgXCPXsPxUBPy/i0fZ+bk0Q3HUwDEtYzteYxeDuVMEpiUWvZ4uU
	nC6ocTv+ETgYiaWoOxn3Qn4Kms3eLDsMgrMgT3IdiSYB3eC2/VNPzdIQi/jClzxY
	5oCVR04=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API
Date: Wed, 15 Jan 2025 17:02:41 +0100
Message-ID: <20250115160244.1102881-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250115160244.1102881-1-csokas.bence@prolan.hu>
References: <20250115160244.1102881-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1736956969;VERSION=7983;MC=3460317179;ID=287150;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852647067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_080302_204875_7AB437A6 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Fix unbalanced PM in error path of `atmel_qspi_probe()`
by using `devm_pm_runtime_*()` functions.

Reported-by: Alexander Dahl <ada@thorsis.com>
Closes: https://lore.kernel.org/linux-spi/20250110-paycheck-irregular-bcddab1276c7@thorsis.com/
Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index b1fb4426c78d..f2164685d3d5 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1426,22 +1426,18 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
+	devm_pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_get_noresume(&pdev->dev);
 
 	err = atmel_qspi_init(aq);
 	if (err)
 		return err;
 
 	err = spi_register_controller(ctrl);
-	if (err) {
-		pm_runtime_put_noidle(&pdev->dev);
-		pm_runtime_disable(&pdev->dev);
-		pm_runtime_set_suspended(&pdev->dev);
-		pm_runtime_dont_use_autosuspend(&pdev->dev);
+	if (err)
 		return err;
-	}
+
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
@@ -1511,10 +1507,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 		 */
 		dev_warn(&pdev->dev, "Failed to resume device on remove\n");
 	}
-
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static int __maybe_unused atmel_qspi_suspend(struct device *dev)
-- 
2.48.0



