Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C730C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWSztViPqdKr7S8pdiVILgmqXIuB8IOWVgCpwivvfjs=; b=ToabBT3aQZ+nRhjNnKi6QmsptV
	v7iR270WDNCIN+ZG1ZuNe2Yc9a1TtbFkzALzuGsXJY8EmMI8Nh2ECxZQPW82QMpJXUVA37+Ykfs/F
	mI37kmPvcCXJbFcOFFkuOJWsiHUb1w/I8dWwA9s0i4/QAuIKniB6xVFVVmFgRvEnmeYUyB/CTZkjH
	U/xyJ5aVNmgsBAw6BIO2JBfR2cb++t9iLHrG92ifY0g5u2y/LVI3F7RpbmwdYyh7zvEf1thIYIOfv
	kX7c+2T0HekRsY4/KBKt9KEQ4QpbWOBB9RTaFlSzUefq2VvDkuHyLNX5ASPbRwuka/BEx+tlBZppV
	TnHCVcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CKv-000000072mp-02Zx;
	Tue, 22 Apr 2025 12:02:49 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BoH-00000006wVO-3wY3;
	Tue, 22 Apr 2025 11:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VWSzt
	ViPqdKr7S8pdiVILgmqXIuB8IOWVgCpwivvfjs=; b=FvaKoOE9clFUjj1xqwHP9
	4EgdZdjMwiJWuZjYRoR1ccZoUitNhW/WDpLdVCKD/ya+vwIF2aOe0U95z3j3SnPl
	L72jFhmA1PGfR7EuQzvoGbGFh0ousUIgD1db9VDyED8L1hjajDd15u7LKWGIe9mQ
	nfdu3IM7rSjVJl7gX8x208=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCXbK1gfQdoRW2NBg--.44191S3;
	Tue, 22 Apr 2025 19:28:36 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de
Cc: manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/3] PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
Date: Tue, 22 Apr 2025 19:28:28 +0800
Message-Id: <20250422112830.204374-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422112830.204374-1-18255117159@163.com>
References: <20250422112830.204374-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXbK1gfQdoRW2NBg--.44191S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1kCw48Gw15WrykXrW8WFg_yoWDtrbE9r
	yUuF4xXryDKrWSk392yw4xZFn0yas7ur1xGFZYgF4ava47Kr4rXry8ZrWrXa1DGr43JFWx
	t34vyF4rua4xJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_vtCUUUUUU==
X-Originating-IP: [61.171.199.116]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwE3o2gHegppMQAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_042906_367737_22DDCF5C 
X-CRM114-Status: UNSURE (   9.35  )
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

The PCIE_CLIENT_GENERAL_DEBUG register offset is defined but never
used in the driver. Its presence adds noise to the register map and
may mislead future developers.

Remove this redundant definition to keep the register list minimal
and aligned with actual hardware usage.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 0e0c09bafd63..fd5827bbfae3 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -54,7 +54,6 @@
 #define PCIE_CLIENT_GENERAL_CONTROL	0x0
 #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
 #define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
-#define PCIE_CLIENT_GENERAL_DEBUG	0x104
 #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
 #define PCIE_CLIENT_LTSSM_STATUS	0x300
 #define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
-- 
2.25.1


