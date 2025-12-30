Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4662FEE4990
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VwHoODTyidimK5eRZYLaY6HsTe516N3NHiznaE55uLI=; b=alNhyV2poVR/nhRNuvYbkLdepi
	kM4Zo+4NFhmQbpPM85ZYbr8OlM18Nr9vp+yfB6kZ7ycnIst3XNIAdMLDcdQyVj0d16gN+jE7dQn+U
	GzrjGAnPkGtR8tCovsoxgzAyfNc0ENQTa1dnSWJA9/0EWnA+1nQ7pH2UgePseLSP/4QDJn9aDev2I
	1Wi3OGhFEwu2FItDlSsls9jhi50oxN5fB5yOwB+5A3oXUDcnojtXWuRxM9lXv/yQAp1sKWZ423AeU
	w1MghD0VwQrL9w/ToHhz72VVLNlBlXko6LDkm3al82NDpBwMYdZ11ANMQOn8JpqALAlyQ1sIA1Wso
	Ret0/2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeEp-00000005AjO-2uRg;
	Tue, 30 Dec 2025 18:14:31 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeEo-00000005AjB-0gI8;
	Tue, 30 Dec 2025 18:14:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] arm64: STM32: drop an undefined Kconfig symbol
Date: Tue, 30 Dec 2025 10:14:29 -0800
Message-ID: <20251230181429.3429404-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Drop ARM_SMC_MBOX since it is not defined or used anywhere else
in the kernel source tree.

Fixes: 9e4e24414cc6 ("arm64: introduce STM32 family on Armv8 architecture")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>

 arch/arm64/Kconfig.platforms |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/arch/arm64/Kconfig.platforms
+++ linux-next-20251219/arch/arm64/Kconfig.platforms
@@ -372,7 +372,6 @@ config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
 	select PINCTRL
-	select ARM_SMC_MBOX
 	select ARM_SCMI_PROTOCOL
 	select REGULATOR
 	select REGULATOR_ARM_SCMI

