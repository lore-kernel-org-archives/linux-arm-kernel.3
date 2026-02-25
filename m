Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCAAEFD239
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6i6YHWbS70atz74nPkc4FhQ7yekh7SIze6KRm1M4GHc=; b=elpBaoYimk2wrDL6hJLrdW0EYK
	LEGazjph9gt7p5mvHTn/lmYh3DI8zTvJJdtCzqOo7TqmORESczZ170kf5PffNr3GCiMJAKPt0G1M2
	HEwSov/SCspd90OBK2GJ1CHoaj98/egON42cg42OjCVLoe4iJowaWckmf7xxrbR5/9BQQx0qJu3Ky
	Dl77SVWgQlzQ86bWFqhJjObh9tBmbdP5pHp4Hoeu+0TJ71JInbgnTFf0wJgb/j28YBpHx9Xnmkrwi
	Wv/fFH4fA9vUh0O+CrWZmxU9piwmhOSg93NXHLm4vACJer8dOaY5gt7HRAkwR1YWspB0eE7ORky98
	mbnUqSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBmo-00000003k2z-2Co3;
	Wed, 25 Feb 2026 10:06:30 +0000
Received: from mail-m49205.qiye.163.com ([45.254.49.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBmk-00000003k1f-3RQ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:06:28 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34ea9e547;
	Wed, 25 Feb 2026 18:06:20 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de,
	soc@kernel.org,
	krzk@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yangzh0906@thundersoft.com
Subject: [PATCH v6 2/2] arm64: defconfig: enable BST SDHCI controller
Date: Wed, 25 Feb 2026 18:06:13 +0800
Message-ID: <20260225100613.3791261-3-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225100613.3791261-1-yangzh0906@thundersoft.com>
References: <20260225100613.3791261-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c94438d3e09cckunm3fc0fc0ab1afef
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHU8dVhkZGE4dT0pJT05OS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktISkxDSlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=JSEUhPBVD6hKkRnOG45ELt6vl7vdvQ3THFNVDWlYAwK3wmld7QAWCrGo2AKiHJjYRT2FGDCDDo6EKUi30aow1xtOBfp96UckMsSQSIOoy8y+PqrAf5i3+UWLlLdwQR7AWBxkW9e5pv2brM+HwATxfCbd2rmdid7AdDa2y9U+YH4=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=6i6YHWbS70atz74nPkc4FhQ7yekh7SIze6KRm1M4GHc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_020627_209409_FDECCF3B 
X-CRM114-Status: UNSURE (   7.65  )
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

Enable CONFIG_MMC_SDHCI_BST to support eMMC on Black Sesame
Technologies C1200 boards.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>

---
Changes for v6:
- Fix CONFIG_MMC_SDHCI_BST ordering to match Kconfig position
  (between CONFIG_MMC_SDHCI_TEGRA and CONFIG_MMC_SDHCI_F_SDH30)
  as pointed out by Krzysztof Kozlowski. Confirmed via savedefconfig.

Changes for v5:
- Split from platform series per Arnd's feedback

Changes for v4:
- Move CONFIG_MMC_SDHCI_BST before CONFIG_MMC_SDHCI_F_SDH30

Changes for v3:
- Split from arm64: dts patch

Changes for v2:
- Initial defconfig change included in DTS patch
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..7b054da42fa9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1230,6 +1230,7 @@ CONFIG_MMC_SDHCI_OF_SPARX5=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_MMC_SDHCI_TEGRA=y
+CONFIG_MMC_SDHCI_BST=y
 CONFIG_MMC_SDHCI_F_SDH30=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_MMC_SDHCI_MSM=y
-- 
2.43.0


