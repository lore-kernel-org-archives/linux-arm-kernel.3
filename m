Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A38C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iEZLHnOAnC5Fjxf5PftzrFh1zmB57EKpYCQRLtF1988=; b=tD9oyCpS3xr6Ij9Ak1jEj4RKjb
	2Q2TSQWXgpXZ30+jPRf7jBcPupJ99+/mTxfVo2VRU/feNFrWAburpvxi0w9ooe9QFsxF8hw+Vs77X
	y6U+TUnQ/+ps8ZK3GBS/e/3Iz2UhSVhhQ9FRqgUN+9z/edgTbVvV4aen7JezeeHU6TqpEgV/pUC9I
	kx/zdM6rmXe6Fw2Q67e7ctQlL4wz0jj/jGXi3VBETSssr9v/SrBtNoU+yzYkq6yShzc6K4kNOJYB6
	YDhw738C/AoYj7h6ODjS0ccSC5FZixE9dYaMTJOpR1Dzx6t4ncSbZXzvy9Mt+sBcpf6uVvXOsXNC6
	/2f2yXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCwL-0000000Chhq-1E9l;
	Wed, 28 May 2025 09:19:13 +0000
Received: from mail-m1973185.qiye.163.com ([220.197.31.85])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCYo-0000000Cdd0-49A1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:54:56 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a600;
	Wed, 28 May 2025 16:54:50 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>,
	Ge Gordon <gordon.ge@bst.ai>
Subject: [PATCH v1 3/9] arm64: Kconfig: add ARCH_BST for bst silicons
Date: Wed, 28 May 2025 16:54:48 +0800
Message-Id: <20250528085448.481215-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTkweVkxIHk5NQ0odGEtIHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a971619f7fb09cckunm1df45544397d65
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQg6Tww*ATE9SUgaUQ4eOTwo
	ARYaCTBVSlVKTE9DT0lJT0JKSUtCVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlKS0M3Bg++
DKIM-Signature: a=rsa-sha256;
	b=fzbcvMbEvlYVr0wt5EPNZgCA5rXTs2U7dhvQJAbRtzgVHAsCS5Cvg4hOxwgBUrd8CRJFibFzto2IjKmYqN17IH0V3JMwBpxiv2grOGxbBOt0m/+FqMUYNtmj+wdxTOpqbcI5g1knbQfesXvU6BJVdwYe9EIxfwM/+h+jFSX9NlM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=iEZLHnOAnC5Fjxf5PftzrFh1zmB57EKpYCQRLtF1988=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015455_205696_2BFFEDF6 
X-CRM114-Status: UNSURE (   6.16  )
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

Add ARCH_BST for bst SoC series support.
Add ARCH_BSTC1200 for BSTC1200 platform.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 arch/arm64/Kconfig.platforms | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..b94c8c5d038c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -402,4 +402,23 @@ config ARCH_ZYNQMP
 	help
 	  This enables support for Xilinx ZynqMP Family
 
+config ARCH_BSTC1200
+	bool "BSTC1200 Platforms"
+	select SOC_NONCOHERENT
+	help
+	  This enables support for Black Sesame Technologies C1200 series SoCs.
+	  The BST C1200 is an automotive-grade SoC designed for ADAS and
+	  autonomous driving applications. It features ARM Cortex-A78 cores,
+	  dedicated AI accelerators, and various automotive interfaces.
+
+config ARCH_BST
+	bool "BST Platforms"
+	select SOC_NONCOHERENT
+	help
+	  This enables support for Black Sesame Technologies (BST) SoC family.
+	  BST is a leading provider of automotive-grade AI chips and solutions.
+	  Their SoC products integrate high-performance CPU cores, AI accelerators,
+	  and comprehensive automotive interfaces for ADAS and autonomous driving
+	  applications.
+
 endmenu # "Platform selection"
-- 
2.25.1


