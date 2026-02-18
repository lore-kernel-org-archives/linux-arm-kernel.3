Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2CFE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M8gl++zx6Wi9qor04MjPeYXm2g4GfwnMFuYqKaekPy8=; b=Rewf/KKsTfY9UG
	xiScPhaEYrDyUHgRM9rTEQXbB1t4beD7OCfv99xJ49wO+u+IDiuQCQfExGA70W8Vjti5wqLJYS3Jh
	L6aGOner5xilltRj7S6Xw6Y+1E6GtkT3fNGYu8tUic+Wzblbz4+17Osj/nrhpHZOVIlSTl7FuK2W/
	thSkxfSdXmgNLfbyBB389chuCO/lZo/d3TB8LeWQjVi8/ths35oi4jtv1TZXedkXy1vpJSU1xd2ZP
	yK8JBeYd5jGYsc95O6sdddu7IRMP69xc9sXIH6fPf9vRZbidVdcLasxcDm8RGRdo2nm6h8dsrTZE5
	ZE6Zb0gsWcLwE2db/C6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtX-00000009Y5o-0IuH;
	Wed, 18 Feb 2026 09:30:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtV-00000009Y5Y-3D7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDA5F600AE;
	Wed, 18 Feb 2026 09:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D747C19421;
	Wed, 18 Feb 2026 09:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407052;
	bh=A9agT+60+h6KfnzOp2ZPypY0ktI8OqbBQWL+XMaqyHw=;
	h=From:Subject:Date:To:Cc:From;
	b=l9B13pkpJzuasmA/M4GhY7w1SHfNRcTtjV8fhzntvQ/NkiXoawnNMYu/6kcQ9PePk
	 ePF6ATyFwBVOCkSGp8T8dUfxBU3P2nFWEUeLCCAsiycd8kj7ogXMAIF9CIMnLDLn6+
	 N7YjN0Y2mjYUk5+ClB6njuvC734SsJ2b9JaL9QGV2jFOf5aXfPCcf/BrI/8uXrYe/c
	 W0hUhS8VZ532Awt5n+vQdUmuCGR+HyFx+7fdoEGgU7Pg+7wE/IW/6OCxpOu7vs30qQ
	 xObhBpBqV2AvhZuImcpmBleoNIUSamdrYzzt5/M/AIWgHnUWRMHyGyc3JElIDHXz4y
	 YI43QNFXUPU/A==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/7] ARM: dts: broadcom-bcmbca: Fixes amd I2C buses
Date: Wed, 18 Feb 2026 10:30:47 +0100
Message-Id: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMywrCMBCF4Vcps3Ykk2q8rHwP6SLNpR3QRJISl
 JJ3N3bv8j9wvhWyS+wyXLsVkiucOYYWcteBmXWYHLJtDVLIo7gIwtE8R6ORpUG7ZCTrVW+dNz0
 JaKdXcp7fG3gfWs+cl5g+m1/ot/6lCqFAbc/klbAHeVK3Bwed4j6mCYZa6xf5P1gtrQAAAA==
X-Change-ID: 20250901-bcmbca-i2c-dts-1df63defc310
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

This fixes some of my own errors in assigning IRQs to the
32bit ARM BCMBCA peripherals, and adds the I2C bus to the
32bit BCMBCA machines.

Maybe the first fix patches should be applied separately,
I don't think there are many users so I think these can
just be applied as regular patches for -next.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Went over the bogus IRQ assignments, tried to understand
  properly what IRQ number should be used in each case.
- Removed a patch that fixed things broken.
- Fixed the IRQ numbers everywhere, also tried to explain
  in some commit messages how they are deduced.
- Use the brcm,brcmper compatible for these I2C blocks instead
  of brcm,brcmstb, as they likely have byte-sized FIFOs.
- Link to v1: https://lore.kernel.org/r/20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org

---
Linus Walleij (7):
      ARM: dts: bcm6878: Fix PL081 DMA block IRQ
      ARM: dts: bcm63138: Fix DMA IRQ
      ARM: dts: bcm6846: Add I2C bus block
      ARM: dts: bcm6855: Add I2C bus blocks
      ARM: dts: bcm6878: Add I2C bus block
      ARM: dts: bcm63138: Add I2C block
      ARM: dts: bcm63148: Add I2C block

 arch/arm/boot/dts/broadcom/bcm63138.dtsi | 11 ++++++++++-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi | 11 ++++++++++-
 arch/arm/boot/dts/broadcom/bcm6846.dtsi  |  9 +++++++++
 arch/arm/boot/dts/broadcom/bcm6855.dtsi  | 18 ++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi  | 11 ++++++++++-
 5 files changed, 57 insertions(+), 3 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20250901-bcmbca-i2c-dts-1df63defc310

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


