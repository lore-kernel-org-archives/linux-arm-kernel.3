Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB4FC54756
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0joqUCbd9YvfR3Cm4Fm+cClE5ZXyYtYajQTs8EUIyUc=; b=HbSQfG1cb5eihy0iNwihDxFDzC
	HccdZls6TLASTBlIFnIxBkcLe0HP/ep5ZL3MhzFo0qMZ3GYr0UhOczVEtIOMXR8RwCbAJmGvVZGJK
	j+P+c694obVV+m4WPINii0LqSkgEKoZVq/eUAcUSz3BLM/e1M0a3XDmAyfHTOadc1tNyi1WGanaGN
	CoPhEaXp3CipD+ECPGqdZ0L861UfRw8gQbK0tM0hN0kWUXrSFIfG/orWu+86voedzVN4GBwCSW20y
	a3cJyOimQbc6tqAiFXmnEtDMIxTiA9TTHRIO9m3PbAFMbq9MkSY0qbbGeOSFklLOBWkyySbjIHFyW
	dpYER7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwnf-00000003ozT-0dsT;
	Fri, 16 May 2025 15:16:39 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwTy-00000003kFM-3U1H;
	Fri, 16 May 2025 14:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0j
	oqUCbd9YvfR3Cm4Fm+cClE5ZXyYtYajQTs8EUIyUc=; b=Qpn9pmf/PmS+YDPrMB
	1doX8fxFQg+0WijijSwAlEhPPvP2t3sxj+9Ben1ViyNmx1bnK+HU7t/lXiQknnpC
	MJWUwFBuwdaG0Dqm3Ez3r8/MwukETUXNrbPie7KmvQY7lKsXaapU1NaUpixCjN/h
	j9iqXCP1f08WTNUwD+P3dD61E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCXtfDyUSdoaTNOBw--.62835S5;
	Fri, 16 May 2025 22:55:49 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	manivannan.sadhasivam@linaro.org
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 3/3] PCI: rockchip-host: Remove unused header includes
Date: Fri, 16 May 2025 22:55:44 +0800
Message-Id: <20250516145544.110516-4-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250516145544.110516-1-18255117159@163.com>
References: <20250516145544.110516-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXtfDyUSdoaTNOBw--.62835S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF1fWw17JryxuF1DuryUZFb_yoW8GF1UpF
	WqkFWxJrZ5AF1UCFnruF1qkrn0va1DZr47J342ga47Z342yr1vq395Crnxtr1kAFW2gF1U
	Cay3trs5CrW5XrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U1pBhUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOgdPo2gnTU2UZQAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_075619_197827_D8F5C92A 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

Clean up the driver by removing unnecessary header includes
(e.g., <linux/clk.h>, <linux/reset.h>) that are no longer referenced
after refactoring. This improves code readability and build efficiency.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 209eb94ece1b..ba360ed62afa 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -12,26 +12,17 @@
  */
 
 #include <linux/bitrev.h>
-#include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
-#include <linux/kernel.h>
-#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_pci.h>
-#include <linux/pci.h>
-#include <linux/pci_ids.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
-#include <linux/reset.h>
-#include <linux/regmap.h>
 
 #include "../pci.h"
 #include "pcie-rockchip.h"
-- 
2.25.1


