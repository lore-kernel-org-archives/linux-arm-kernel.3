Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C5BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SCVFvE+0aCV815j3Mi3WbiNx63axYW383HrgjWVn7Rg=; b=a83Ugh4MwnZCjAbg5zS3wSf/YX
	SGh76ywPwPYCML9OtRSkXLpUBRC4HrGvWmjW6gDil8Ndh6FnBOcbiUZTT8UTMew0yvXeI4Nm8q/K8
	8Y2aJjvVPFZ6c0aX7x0+JLhdsmKTgTrdCLNQV8BuyBUH9ewltwttf/qSa9UK09X5Ggw28QtRtpsJG
	TrO42ZWbqJ/CMYorYIC6dTYTzwAJkjH5GxS+s4PlMp2ZplMFPCeq3MkjDH6ysiMr+87/pFO/FXkUj
	fWQ5pigZdq01HWHk3nMQ+YdMeqaYgGdcb4tY7qQlouK+V59sHbmx8imFNTIYEEwoGVPQNOxkU5Jiz
	GmyO4p9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKD8z-0000000Cjee-0lvJ;
	Wed, 28 May 2025 09:32:17 +0000
Received: from mail-m49203.qiye.163.com ([45.254.49.203])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCZ4-0000000CdjK-18FG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:55:11 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a660;
	Wed, 28 May 2025 16:55:06 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Ge Gordon <gordon.ge@bst.ai>,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v1 9/9] MAINTAINERS: add and consolidate Black Sesame Technologies (BST) ARM SoC support
Date: Wed, 28 May 2025 16:55:05 +0800
Message-Id: <20250528085505.481528-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSx9MVkhISEwaShlCGEMfGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97161a390a09cckunm659b5889397f80
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxQ6Tio6SDErUUhJUQEaA006
	Nj8KFA1VSlVKTE9DT0lJTktDS09OVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlLSEI3Bg++
DKIM-Signature: a=rsa-sha256;
	b=RWZpBAh1fGfLMJpoYTt6PtSpELwzLBsjUcJeeW26Ih/RUg/yH4ehq4TnoAsYRitc5c2pwtsACcrssFpQDe1P6JjpFK6JcgyvWSSDNrdzZ7ue1tQJzWf+b1N6gzXArVEBYnbHYKs9grlGA1e6qfghLZ2cOWYvogBYbNke81y/O8k=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=SCVFvE+0aCV815j3Mi3WbiNx63axYW383HrgjWVn7Rg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015510_522043_B13ECC00 
X-CRM114-Status: UNSURE (   8.06  )
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

Add and consolidate the MAINTAINERS entry for Black Sesame Technologies
ARM SoC support. This entry covers device tree bindings, drivers, and board
files for BST SoCs, including MMC, and platform support.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d48dd6726fe6..05df62c40021 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2373,6 +2373,16 @@ S:	Maintained
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
+F:	drivers/mmc/host/sdhci-of-bst-c1200.c
+
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Andre Przywara <andre.przywara@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1


