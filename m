Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42832C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY9gGG+ynYNdnB1j3/6lY26zStHwpPSt9Msjmy1Whvk=; b=PkCrrEqa+GLQe8AS2nih2liq5K
	ZS35r3mUoPxIl5kDxpcOOwzyqydDgDvcHDaTgcB1bpnnHMNC1MthFlZZELltg8z0GOJ7w1TdYShLa
	X80OvWU/IXPj5TPbfiis9o+8tWTSVqv+L/F3yTUG6folmfoS/MZ+4tOGsTqclHUyGuCDzeLamfGEq
	FX+N0W+s98B7gv6VovEjc9g5UDw7ITmjIwxENS2TzRZvYdyORilbXRGZxMaA8a7ECNfBRunPICzG/
	fR9R7wa3ausyEwpM2Zcf0c5agFvH8f0C9X1kpsDCVDzHSs/iwBZRXXawXMeFIGdUtmzOLg0tNQGNQ
	OtbeidxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8G-0000000BN1P-0EfW;
	Wed, 23 Apr 2025 17:43:36 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7c6X-0000000AyyC-4BHO;
	Wed, 23 Apr 2025 15:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=EY9gG
	G+ynYNdnB1j3/6lY26zStHwpPSt9Msjmy1Whvk=; b=ncaZrwL59hzIp0+ge+E0O
	21ImkguoI3jiNwf6M03zCOVeA1Qr2/j03j49kF53eQc5Y95yKEN0tyND4Nso5iwW
	O6WaIetY+zY1U4VcCxKcPmvaNkSb+xWD7BzvwQqpR2bEnrD4lOTfidVZ2giP6dSW
	uInkZC3qjQJfWEHQVvc7ko=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCnosAACAlogeYfCA--.9428S3;
	Wed, 23 Apr 2025 23:32:19 +0800 (CST)
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
	Hans Zhang <18255117159@163.com>,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v3 1/3] PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
Date: Wed, 23 Apr 2025 23:32:12 +0800
Message-Id: <20250423153214.16405-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250423153214.16405-1-18255117159@163.com>
References: <20250423153214.16405-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnosAACAlogeYfCA--.9428S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1kCw48Gw15WrykXrW8WFg_yoWkXrXE9r
	yUuF4xXryDKrWSk392yw4xZFn0yas7ur1xGFZYgFsIva47Kr4rXry8ZrWrX3WDGr43JFyf
	t34vyF4ruayxtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_66wJUUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxg4o2gJAM7G6gAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_083342_464548_48BE4270 
X-CRM114-Status: UNSURE (   9.05  )
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
Reviewed-by: Niklas Cassel <cassel@kernel.org>
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


