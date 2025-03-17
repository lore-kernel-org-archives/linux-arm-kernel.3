Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983E5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNhLXI+/riZgGlyun993ceq6nIOh5kKXKpw5hxNT8to=; b=agNETb6lCyPyCs9HrBY4YwspAa
	3moH9NL3tHdjg/M53uwMU87k8EwrTL2CMJQNVE4bo/26BD/VyV5Jik4Mw6uroXJYpJ1fpdtCUGGw2
	YcuGnOfWOssIvxUzsdsg8jGBpn3eUuSr3rD5e7xeTyHTgkaCKLoVNG/w7h0LpKqWcWYuIDB5V29Dp
	kv/312qVJwzju5OS4mbJwipue2yx0PmjNWUfTcJa8NPiFGv1S/b61SErNud/KoliP0nd4nhG2UsQo
	UPLZo5oDi2fUFGjP6apnOWtpGA48YLcB2QnrLqdfILiU49ebOCZv0fvQReXes8OAnvO07I/6nUPOW
	SzKEJEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6yP-00000001yVL-0z1t;
	Mon, 17 Mar 2025 09:41:29 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6sE-00000001wtZ-2yPn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:35:09 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 9F7E4A03CE;
	Mon, 17 Mar 2025 10:34:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=kNhLXI+/riZgGlyun993
	ceq6nIOh5kKXKpw5hxNT8to=; b=tFKrITnzbpzNEXu4W5eCBaP/V0hPvuMOE7P4
	RX5s6EqoZIcDfyJovFkfu1oO/Njvf3KkERfUJIxglIB+RMmiiSqNl3GUP/LIWZFV
	aeLNCdwF0mti8rwQG/P3K50tG4QLg7UJh2jWSw3a0BUCeU0LFyYGaxiTdqlE55aE
	f3aYazNQg81NyYhNMKcRsgeuYg6cUxns3uDgKm2uRSt4DiQbDVpKNOCG4Vw0eoib
	AWW5fus1jdLQ3byAvTSx/MZcq9vNn8L/v90h1PSkTKlcsr+wTyChhSuo7A5rh+Hj
	1L16fZanqMlO7YgCCiWQkaGZBR2QeqVudXuDdK9PQeo90+DwlJj6NfhBXSs6B6te
	RLX3xU/XMbNYbgZ8g+TG5kUwW6JGuc5GYnHWhjfeY6WiOUt2/2TVkkZFXmdLltwS
	5Yh/8+gt2Ky2sGujcyd8XQac7rOiuJsrduXlSkzW/DwebIKqMfdooDszIj5LDebb
	XXQB6TSjV2sfql8dqYXpFSLTRHJXRlHDTZruJifEcONPe/pqjeeti5GkqLUxtxCL
	oTg48RqS96mXvGRuCnXXn+UAZQXMDF0OM02kC7kQ/JY3kxvqYtH69ha+2BJM/a3+
	srVxDPvCo9JiMtF6Jwyze6Pqjdpl4mUTzb56IQ8ReJgOmmCvRctMlw6xkJzTTdAm
	hEO0aVs=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>,
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v5 2/2] spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API
Date: Mon, 17 Mar 2025 10:34:43 +0100
Message-ID: <20250317093445.361821-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317093445.361821-1-csokas.bence@prolan.hu>
References: <20250317093445.361821-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1742204096;VERSION=7986;MC=3178520588;ID=162301;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526D7462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_023507_212895_41FB0631 
X-CRM114-Status: GOOD (  10.13  )
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
index d8c9be64d006..ddd12600a6f1 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1439,22 +1439,18 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
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
 		goto dma_release;
 
 	err = spi_register_controller(ctrl);
-	if (err) {
-		pm_runtime_put_noidle(&pdev->dev);
-		pm_runtime_disable(&pdev->dev);
-		pm_runtime_set_suspended(&pdev->dev);
-		pm_runtime_dont_use_autosuspend(&pdev->dev);
+	if (err)
 		goto dma_release;
-	}
+
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
@@ -1533,10 +1529,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
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
2.48.1



