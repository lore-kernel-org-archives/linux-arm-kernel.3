Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313E7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h1wNZIxAqWJkI8Bzz88+kjjGoUH05jFKvXNWe1iLpcg=; b=oOR+YTf+sWtgYmcQJY5ZmsNP+L
	xfA9/SqKlIGrWwp/lNI1s6WFHsBNxFF3Xdh4g/G9rZuDu4IQIcx3T8bhdAgSLVxyzxM1jPn+bGaT5
	d5A3dPGqqJmbJV+afbyNPukHNktVdJEXulL72qijRKWIcTDC6GS317RDvkVtZxl1Xmr2VX3irG1gq
	Lav/3RlmoFuKm+bPLPbD7HAtVJUdsDT3Z7JNf02i+XpBvFl+KacdBNHEuCrTR6dWXzQBkuBGNnlae
	wq2K680XXzV1dkwW4BrBCRWejiimjFAA3vhwFYQZMrAhXUrLC3grUrytxM0azGWnXXfgHxw+4y6Ea
	e1nBYFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKD6t-0000000CjSK-1tbH;
	Wed, 28 May 2025 09:30:07 +0000
Received: from mail-m49233.qiye.163.com ([45.254.49.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCZ1-0000000Cdhn-0vHE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:55:08 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a650;
	Wed, 28 May 2025 16:55:03 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Eric Biggers <ebiggers@google.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>,
	Ge Gordon <gordon.ge@bst.ai>
Subject: [PATCH v1 8/9] arm64: defconfig: enable BST C1200 DWCMSHC SDHCI controller
Date: Wed, 28 May 2025 16:55:02 +0800
Message-Id: <20250528085502.481476-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGk4ZVk9NSU8fHxofQ0hIQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97161a2dbf09cckunm84ffe6dd397f07
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTo6Cjo6IzE#UUgcEANDAw8B
	C0wwFBlVSlVKTE9DT0lJTktOSUhMVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlLQ0g3Bg++
DKIM-Signature: a=rsa-sha256;
	b=HyRd/gYMuD9hDyqYu2NK1/3JLjy1jI4EpX2O95sBuVnp+0VXrj4r/VY7A9hPhfszpdW5pPk/8GaHNTlkF0U8ykTKoAkoyQ4rdjxjRw73QhchL4O/uPFZoMY+NJO+CVBXMydxot8VxDFWP0MQNBGemGq+o59N8oqyQ/ck5c08qLk=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=h1wNZIxAqWJkI8Bzz88+kjjGoUH05jFKvXNWe1iLpcg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015507_429362_D715B8B5 
X-CRM114-Status: UNSURE (   7.25  )
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

Enable the BST C1200 DWCMSHC SDHCI controller driver
(CONFIG_MMC_SDHCI_BST)
in the ARM64 defconfig to support eMMC/SD card access on Black Sesame
Technologies C1200 series SoCs.

This driver provides hardware-specific implementation for the Synopsys
DesignWare Mobile Storage Host Controller integrated in BST SoCs.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9f072028fb72..81c2b698e37b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1172,6 +1172,7 @@ CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_MMC_SDHCI_TEGRA=y
 CONFIG_MMC_SDHCI_F_SDH30=y
+CONFIG_MMC_SDHCI_BST=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_MMC_SDHCI_MSM=y
 CONFIG_MMC_SPI=y
-- 
2.25.1


