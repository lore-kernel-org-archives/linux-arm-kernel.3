Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053C1CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 06:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dCsZ5GabPrZ/cKkHNeHxtMAqgiDoHIBMdGfIGcjzVA=; b=3dFCCkoIaZppcPTC8UcMF56b0a
	vSylwOD9LaYwYJukakfraWRFicoUvP7BkpUft7LII4NwjviwNb8dpVPObTHGK/+y50LH8yAQ5cNQj
	zcQid3zpP4CJ1I3Cr87r0Jz2vQnRl5Ie7170D5aBkpsoM/cHmU1aUcmuS31LfC1vlWJQGIQ1/OHdE
	c8/kC+UXQmqp8B1DXFuLrIPEFNKYebhc5rxseyIBc2imY7ioDNbMG1wN4nQPgBKdTTSAv5YyI4Ixl
	DLDXA6CyAqmjudiwX3UeRa6vOGOqQaDsLEmSIulIOtZSCrvz7x5Z7elxhYB46N8PkFzVZ4Q8tMW5a
	OmNGNSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEr-0000000CWpA-1SMk;
	Tue, 23 Sep 2025 06:10:57 +0000
Received: from mail-m32108.qiye.163.com ([220.197.32.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEe-0000000CWgT-2ii8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 06:10:45 +0000
Received: from [127.0.1.1] (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23bdec011;
	Tue, 23 Sep 2025 14:10:40 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
Date: Tue, 23 Sep 2025 14:10:15 +0800
Subject: [PATCH 9/9] MAINTAINERS: add Black Sesame Technologies (BST) ARM
 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-v4-patch-final-v1-9-2283ad7cbf88@thundersoft.com>
References: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
In-Reply-To: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
 soc@lists.linux.dev, Albert Yang <yangzh0906@thundersoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758607828; l=1495;
 i=yangzh0906@thundersoft.com; s=20250814; h=from:subject:message-id;
 bh=C9eK2SZ98FRgRNTa+1cHqyETU4kzXW2v/DxM1bnpBMU=;
 b=JZsgEBGpVqHN9dEd+7lGflgkQfqMK4YBfK00+eHXuadz1pZZPRk4xJZBcGPPACvibVNTyvaTn
 sOPn6YnH8ZUCn2JLP4dwyhNNFWPnFs6c/3ui4w6sT6pCF7vQN/TId1v
X-Developer-Key: i=yangzh0906@thundersoft.com; a=ed25519;
 pk=bEcgALL9KpUg/m7zH44r50xa/re91dI9SA0vGV1/bu4=
X-HM-Tid: 0a99753214e309cckunmfc27e25b4e0397
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUlIVkwYHh5MTk4ZSEJCQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LbGoyBP0SW2raJk+/UF4YjSKBEDUJgC+wxJdfWpg+teBxYC47z7isIEwIsVGwCtww8/0ieCI3L4T+fhKxSrp8k04FjEA1AbOBKzvHkar/f2k4EIqCZrwPVNKDchTvdl8eFOJDO+mv9zkxrbw/qbgD4GWW6D703UKgYgtWD0mRAI=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=4dCsZ5GabPrZ/cKkHNeHxtMAqgiDoHIBMdGfIGcjzVA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_231044_925239_C7305B32 
X-CRM114-Status: GOOD (  10.96  )
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

Add a MAINTAINERS entry for Black Sesame Technologies (BST) ARM SoC
support. This entry covers device tree bindings, drivers, and board files
for BST SoCs, including MMC and platform support.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Change for v4:
  - Changed file name: sdhci-of-bst-c1200.c to sdhci-of-bst.c
  - Changed title from "add and consolidate" to just "add"
  - Simplified commit message description
  - Removed Signed-off-by line for Ge Gordon

Change for v3:
 - No changes

Change for v2:
 - No changes
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d321752ac44c91d2d7e74de28e08960..685294ef3e2ecf124219b2c5eafb8cad25600652 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2505,6 +2505,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/blaize.yaml
 F:	arch/arm64/boot/dts/blaize/
 
+ARM/BST SOC SUPPORT
+M:	Ge Gordon <gordon.ge@bst.ai>
+R:	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/bst.yaml
+F:	Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
+F:	arch/arm64/boot/dts/bst/
+F:	drivers/mmc/host/sdhci-of-bst.c
+
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Andre Przywara <andre.przywara@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.43.0


