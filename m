Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082F5C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AP2ZJ8lX7rjvH1moWpuOMtPTfzrXU1f6x/jsrt9JHRY=; b=o8idv8H2IuF9MFrV7tcOhxYCl1
	YJf2EcFDB5dr9VNzUTzYuztyPW+unOkysSxQY6bI1oI9ugAQA1AKvI270kwo2l9CpupVJ1K4fGJr4
	iSd7T1CaRZr0uWfHTXnJAhdUk+jcP/cE1KyaMN4s5KsgacEP0kTR6iUU5uxRIAx3JupfGs0l+ATRz
	HisMo3AApvnZMzVQ6jJY6HpIJ2mxPX/mr5BjjHJvkf+JfW7Rr5LOepgpj4SmOjwO07X9U6gfIslJu
	GtUSJZ7A/dqOPAxGi3TCvvYSXl8SgotHFz/uAQCzah6WOg/MpyAbqHgke+v5kdimwHKFB9liAkJvy
	YGF+k76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x545I-0000000HDKV-2j25;
	Fri, 11 Sep 2026 16:26:40 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x545D-0000000HDIg-3cen;
	Fri, 11 Sep 2026 16:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AP
	2ZJ8lX7rjvH1moWpuOMtPTfzrXU1f6x/jsrt9JHRY=; b=I1JbfeIqmOhC6zPCKA
	3VgmaHpx0x08GFT2XDhXIJiXyFC7db7GVo+zleDFwnqG+mPgp81Uxc038TtS5oIf
	MZh6zzdsoWjUqoUN237vuGDNQqxcYah1qdGLxann68zVKU9zSXc2B+pxNiG4itiJ
	/5oIEgLBdGZNjbHPfdAeNmn0U=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnDy6JK6RqMNRdAA--.33660S4;
	Sat, 12 Sep 2026 00:25:49 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	heiko@sntech.de,
	mani@kernel.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	cassel@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 2/2] PCI: dwc: Remove unused PCIE_ATU_UNR_* register definitions
Date: Sat, 12 Sep 2026 00:25:37 +0800
Message-Id: <20260911162537.469018-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911162537.469018-1-18255117159@163.com>
References: <20260911162537.469018-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnDy6JK6RqMNRdAA--.33660S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1rWr17uw4kXFWxZFWDurg_yoW8Gw4kpa
	45XFWIyFn8Ja17uw4rtrn5CF13tFsrGrWUG39xKwsru3Wavw18Jry0vF4Sgry2qrW8Kw4a
	v3W3X347WrWkCrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMg4SnUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:8f8f:b76e:3756:1454]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCww6xVWqkK45HcwAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_092636_284140_6415B663 
X-CRM114-Status: UNSURE (   8.25  )
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

The PCIE_ATU_UNR_* macros are not used anywhere in the kernel.  They
were presumably intended for unrolled iATU register access, but the
driver now uses the ATU_* macros and computes unrolled offsets via
ATU_UNROLL_BASE().

Remove these unused definitions. No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-designware.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 10bf06427e41..89cb809e056b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -257,18 +257,6 @@
 #define MARGINING_MAXLANES			GENMASK(20, 16)
 #define MARGINING_SAMPLE_RATE_TIMING		GENMASK(13, 8)
 #define MARGINING_SAMPLE_RATE_VOLTAGE		GENMASK(5, 0)
-/*
- * iATU Unroll-specific register definitions
- * From 4.80 core version the address translation will be made by unroll
- */
-#define PCIE_ATU_UNR_REGION_CTRL1	0x00
-#define PCIE_ATU_UNR_REGION_CTRL2	0x04
-#define PCIE_ATU_UNR_LOWER_BASE		0x08
-#define PCIE_ATU_UNR_UPPER_BASE		0x0C
-#define PCIE_ATU_UNR_LOWER_LIMIT	0x10
-#define PCIE_ATU_UNR_LOWER_TARGET	0x14
-#define PCIE_ATU_UNR_UPPER_TARGET	0x18
-#define PCIE_ATU_UNR_UPPER_LIMIT	0x20
 
 /*
  * RAS-DES register definitions
-- 
2.34.1


