Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F21DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84Pcn76Z63L/Hn2mjBRY1USicoufGMqrE0pe5JmE7uQ=; b=Lobogt0gCTRJqkyiHMplEEAc3v
	L4WZ9jWPRFW8rei34nOyGRi/ljWaAJm6Qq0Yffzj+CbnjUP93uu4cyZwu+2DP3pSM/neF4B6lXQ31
	ZOuJ9Jtu+hFBjGKm0WGDDRVv9AAvlvBnJhk4t/gvYVdtisLCqgs+m+/c/Jlkxd+VrEQs0vcZLYua+
	kPg8XlFAXiRq/4hGr+MZgc5XJuz2eBo1yLybbvKIixo/661TAD5NPc+7JaidXNpJ/moDln0gDdCRF
	JydBY3wqPs0SuZLeuN+1OdNBU9uLT6c1JYcwAW21u3V5LtpLvVwo8fkywCDX9dnoBLph4RggL1TBI
	BN7VcgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXQi-00000006Suj-2cmc;
	Fri, 21 Feb 2025 18:07:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXNX-00000006SCs-0KFg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:04:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6567B1CC4;
	Fri, 21 Feb 2025 10:04:16 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90B463F59E;
	Fri, 21 Feb 2025 10:03:56 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v7 01/10] arm64: Kconfig: Update description for CONFIG_ARCH_VEXPRESS
Date: Fri, 21 Feb 2025 18:03:40 +0000
Message-ID: <20250221180349.1413089-2-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_100359_170725_1AFD98F1 
X-CRM114-Status: GOOD (  10.03  )
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

Update the description and contextually the help text of
CONFIG_ARCH_VEXPRESS to reflect the inclusion of all ARM Ltd Platforms.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 arch/arm64/Kconfig.platforms | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..c468c23b2bba 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -374,13 +374,12 @@ config ARCH_UNIPHIER
 	  This enables support for Socionext UniPhier SoC family.
 
 config ARCH_VEXPRESS
-	bool "ARMv8 software model (Versatile Express)"
+	bool "ARM Ltd Platforms"
 	select GPIOLIB
 	select PM
 	select PM_GENERIC_DOMAINS
 	help
-	  This enables support for the ARMv8 software model (Versatile
-	  Express).
+	  This enables support for the ARM Ltd Platforms.
 
 config ARCH_VISCONTI
 	bool "Toshiba Visconti SoC Family"
-- 
2.43.0


