Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46646EA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsyWkSsYxM+/mlVR1ji3BcDNi6n34FEb78dVbjjc1Ac=; b=XMskY+45W6sdAa3VLXetFGe3Ey
	Bx1A0QcY7ESNBr5Jq5KolKFAGUe+T7nIbiwjmRDqNTSpBmeSoh7NQJM/rgdzfRP4CUO3mz4Nlq29o
	bchzvm8Pg/pzm5zBmG0MW2zsGrCpVVJyl4YNzlFAcAYTPGd3vDTfojPQ/5PPkLXR5qV9+vQ3RxPFE
	qe39yH78k3YiMgWXBTVDUhtODq2YKMOpwNiTwXMZg1rq0UlCSc1zN3j2377E+pOCf0ZcNnaWzshfa
	tkCdmQx7FB07X40Ky9dkVTha/FlMbNU4CcrbA1wlrLiihfpL70hM54n6NenyeXBnK3Ps4Px4SOqtu
	+34u2a4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt8d-000000093B9-1S4D;
	Tue, 10 Mar 2026 09:12:27 +0000
Received: from mail-m3287.qiye.163.com ([220.197.32.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt8a-00000009385-2dRt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:12:25 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36651046b;
	Tue, 10 Mar 2026 17:12:21 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org,
	arnd@arndb.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v7 2/2] arm64: defconfig: enable BST SDHCI controller
Date: Tue, 10 Mar 2026 17:12:11 +0800
Message-ID: <20260310091211.4171307-3-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
References: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd704c9ab09cckunmb723260ce6efc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSx4ZVkNCT01IQ0hOSx0eHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0
	tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=mQIaHtS5KuPCYxAw/kTAdZaeYXidX38l84lPMQD1GdNFzzTl/YTGJWvwL5RlRBmvP2vb2VwQ6vm9wvBRJG3GC+loRk4WjzG6xvcTG7fquj5AidjZFslEIuDi8uHi6XH8yzAfQmypr5ASfSWBRlhed58bl7EafANjzSn416o3q1Y=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=SsyWkSsYxM+/mlVR1ji3BcDNi6n34FEb78dVbjjc1Ac=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_021224_823033_ADFB8EB0 
X-CRM114-Status: UNSURE (   6.11  )
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


