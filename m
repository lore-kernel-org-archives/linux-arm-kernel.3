Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7BFFF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=77u5SnqzYB1kLOAl7anj33qdv0Ahp9BFyG5sDgjr5/w=; b=2Dx+DXgRgIKFl42/00qlV9Nkm7
	onvDQowaERJ5+p028Vx46QeAxarJ16LW4ocMXkmR67UWJd8tNSTB3hEGQ0VrSnzeKlJQobvIHN83m
	Z34V2C5jDO0CBAZHbI8omqyXzm92auh3tSeAILbLcZG/qfoE/mPMj6oAZOui3AccVgPCuXy2sA3VC
	Ev62Now/vf8OiVr7TJDpVMJrlJj8Qb0LsCNIoCwGs6qh3ygZzaxfMS0jgR/f92dNDrmVqO/mnRjLh
	lipeiwiBe5UkuJDxYuGyR/iqZ1nQW5Ip6u0OA8A01WpF54elVskWUsL9/lykwo88JG6laNhLA9OWR
	oTRXvvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFNd-0000000GFp1-0u5e;
	Mon, 27 Apr 2026 06:23:41 +0000
Received: from mail-m1973199.qiye.163.com ([220.197.31.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFNW-0000000GFlt-10kn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:23:35 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c40fa9fc;
	Mon, 27 Apr 2026 14:23:29 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: gordon.ge@bst.ai,
	krzk@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Mon, 27 Apr 2026 14:23:27 +0800
Message-ID: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dcd9b729209cckunmcd249b321a30c8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaS0pMVkhOHkhCHU9KTE9NTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=DKA68PBru2D4eT/6NocWZbaGuxh8T116UNor2n8Jq1iy5xLaJNMKiTrSdffbeC58cNmNTn4cOQAzPBUVCpM2jCd5/OEWl1bRkf6rr1OrBrWp8iPnHoGYyi+ur+V2ug06NFOgbshM1voDdECTSn12M5MHXsiDJP+TUyw+Gd6mJHM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=77u5SnqzYB1kLOAl7anj33qdv0Ahp9BFyG5sDgjr5/w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_232334_465261_80606D0D 
X-CRM114-Status: UNSURE (   8.04  )
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

This series adds DTS and defconfig support for the eMMC controller on
Black Sesame Technologies C1200 SoC, split from the v5 MMC series [1].

The MMC driver patches (dt-bindings, sdhci bounce buffer, BST SDHCI
driver, and MAINTAINERS update) were merged via mmc-next during the
v7.1 merge window and are now in mainline as of Linux 7.1-rc1 [2].
These remaining DTS and defconfig patches are submitted to the mailing
lists for review (per Krzysztof's feedback on v6 [3])

Both patches now carry Acked-by: Gordon Ge <gordon.ge@bst.ai> (BST
maintainer), collected from the v7 thread [4][5].

Changes since v7 [6]:
- Collected Acked-by: Gordon Ge <gordon.ge@bst.ai> on patch 1/2 [4]
- Collected Acked-by: Gordon Ge <gordon.ge@bst.ai> on patch 2/2 [5]
- Rebased onto v7.1-rc1
- No code changes

Changes since v6:
- Resend with corrected recipients: send to mailing lists for review
  first, not directly to soc@ (BST has a platform maintainer in
  MAINTAINERS), per Krzysztof's feedback [3].

Changes since v5:
- Patch 2 (defconfig): fix CONFIG_MMC_SDHCI_BST ordering to match
  Kconfig position (between CONFIG_MMC_SDHCI_TEGRA and
  CONFIG_MMC_SDHCI_F_SDH30), as pointed out by Krzysztof Kozlowski.
  Confirmed via savedefconfig.

Build/check on v7.1-rc1:
- arch/arm64 defconfig: clean (savedefconfig keeps CONFIG_MMC_SDHCI_BST
  at its Kconfig-ordered position; no diff in the MMC_SDHCI section)
- arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dtb: builds clean
  with W=1 and CHECK_DTBS=y (no new warnings)
- checkpatch.pl --strict: 0 errors, 0 warnings, 0 checks on both patches

[1] https://lore.kernel.org/lkml/20260123095342.272505-1-yangzh0906@thundersoft.com/
[2] https://lore.kernel.org/lkml/CAPDyKFrcXFAiYouOpjDx3NN-xWACU9jAzEfTU2m_-yvQ9SpC_A@mail.gmail.com/
[3] https://lore.kernel.org/lkml/12058c14-67c7-4b43-bbbc-ef0ccb813e61@kernel.org/
[4] https://lore.kernel.org/lkml/20260417.164709-gordon.ge@bst.ai/
[5] https://lore.kernel.org/lkml/20260417.163754-gordon.ge@bst.ai/
[6] https://lore.kernel.org/lkml/20260310091211.4171307-1-yangzh0906@thundersoft.com/

Albert Yang (2):
  arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
  arm64: defconfig: enable BST SDHCI controller

 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    | 19 +++++++++++++++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 18 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 38 insertions(+)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.43.0


