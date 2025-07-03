Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C23C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ij/wngQgVqc+q1UhSev6oK5/U7gn0KTQd7m8t9C7SqQ=; b=ZrR2dGsFCxx6VeIKwVh1y4l+xm
	n6TEQR9B9s/URM5eo3Y4lD5hMVGcW2gCrkTjYmvEKlZPzbCBJcZrGDVZD/SRFjS4LJjqZ3oTL6jI9
	Su0J9v9czsFV+OxMZw4+wD+iye0pKfF3sSs3ESjccMGqcGZZoNk7luIzxDZv+Q/mFjNbnDoz5UQIM
	bPIJo2dt3QGTl1HHsluHR4PIjWv/bcPrttcnGw2495cWTiWWPZ9JF63/zOPpZozHPrr7Cz/2Eo1VA
	pqW+NCN9iTaJmUB37HfLjuF6v4IiVbt66xmzS/LbNHdsv5Hfne0ANXnOMzoLKCJZRQrwxdw5Vg6Bo
	ssjMe0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIM3-0000000BCNW-0blG;
	Thu, 03 Jul 2025 11:43:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHAk-0000000AzVk-0fhr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5FF344FA0;
	Thu,  3 Jul 2025 10:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7968C4CEF3;
	Thu,  3 Jul 2025 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538485;
	bh=W/C4b3BY2gqbZVQ+W28M+ecYH4Ph9mXAsDV/aos0XlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BYiDKkibLsr7oj7tfP/jdvaECF/8F81Uy/9i2B+qpAnJxPYXfnIsDLx4NqEIRwX7A
	 IboCL3ZHok1OqAFcIh1nOQRCR00oAOAFyJsP4PzKxO6NcTp72Q1UYPH0lv55YnJSHc
	 7WnYXWeHvfQlLAjG4OVls66xxXjLpGAdH4RlotAfvyFbVxxck4UKPxn280Bjvx6ZR7
	 fdBYFzE+I62ByCsMK66f73g0ZPBF3PK3+sa9PoRI/p2yWSs+MLGUz18HBQOiQTBl77
	 zjz8QTE3VgxQwpX6FMpbx9euTFaWgXPPGqziLKUjrTWTgsEepktLdWg+3xwp0PzJrO
	 cH9oLSjwlaFgA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:21 +0200
Subject: [PATCH v7 31/31] arm64: Kconfig: Enable GICv5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-31-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_032806_229953_94FECA50 
X-CRM114-Status: UNSURE (   8.89  )
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

Enable GICv5 driver code for the ARM64 architecture.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af337..5ff757cb7cd2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -129,6 +129,7 @@ config ARM64
 	select ARM_GIC_V2M if PCI
 	select ARM_GIC_V3
 	select ARM_GIC_V3_ITS if PCI
+	select ARM_GIC_V5
 	select ARM_PSCI_FW
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS

-- 
2.48.0


