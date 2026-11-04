Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECBC606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1L5GOJJY;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=CBHyxZSC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iq05/Yj1rzuvCwAU0PCj1CRnJwTNnmq7BvvVMNO0EdU=; b=1L5GOJJYbQ8qzR6BsrNVMZgy8C
	HPY2a+fCTOPTgsCLfnrrSkeYXYG3LSt+wF9n56CwL2DPm/tlUBt9wuPcOpa12TWzT0XlT1vn3gsT9
	onR7b2WM9Vdvar72cGlWkRF35bwSAiE1GGf6TMbcdBt+VkjbqIh17fq+Su9WbJGT1WI1jQvVWmJMA
	MH6KPpuGn7SGpSChhbO5Iv/hDHJa/Sg2FQ48VYDNGQoxk7ZdSbHAvJc9txi08WFDl+D/F0EtLzu8h
	OWp6WMX1bfr9ko5TMuSGFGLXffTuUzW3F0wlQxGVjNKEw4jLP4y8cO8DI/WCh0rT0KW5hl7Raobsu
	Nyw5YwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcte-00000005mRV-1lX7;
	Wed, 04 Nov 2026 15:27:30 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOctW-00000005mNK-3wFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:27:26 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4028B240107
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 16:27:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793806037;
	bh=iq05/Yj1rzuvCwAU0PCj1CRnJwTNnmq7BvvVMNO0EdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=CBHyxZSCLmVhF+IEET0yBhJUYCg99wYQhD8qx1LZvJALwMUNYt6kC8+b3K74Q6eyH
	 nsV4WM/QwUAygsa/AlNQZ6I+0kHmDyBum/6t/ScjaKfZytqJ6bpzB7u0V/U9TIa2br
	 22WIZlfPGmRBJ79eTeoCgkahkJmND2m7D+FtoWLtY32ktjELXcJX+w4hvoGgEMiOMu
	 imc4hOUHQv+AiDLj2w3OZ7WQwD5ZiLaCdtnDJ800jgw6lFZseQCVhzn+efK9kTyvic
	 TCA6XPSKpFjZUcCRwCXCxxoCPT+M/OUr27ffF8X/7y7p7YDZl9fYdLP/Mk2BbakogT
	 rYcPfSh42D68g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKTnv22nLz9rxM;
	Wed,  4 Nov 2026 16:27:15 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] mmc: mmci: stm32: silent data corruption and HS200 fixes
Date: Wed, 04 Nov 2026 15:27:16 +0000
Message-ID: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_072723_272298_5B3F8243 
X-CRM114-Status: GOOD (  15.35  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The eMMC of the STM32MP257F-DK in HS200 returned stale data and lost
writes without any error. Patch 1 makes data CRC errors visible to the
core again. Patches 2 and 3 are the fixes of the ST downstream kernel
for the causes seen on the DK, as Christophe pointed out. Patches 4 and
5 move the eMMC of the DK back to the sdmmc2 pins_a groups and remove
the pins_b groups I added for it in 7.4: the corruption came from the
delay block, not from the slew rate, and the slower pins avoid
overshoots on the SDMMC2 clock. Patches 1-3 are for the mmc tree, 4 and
5 for the STM32 device tree, patch 4 needs patch 3.

Tested on the STM32MP257F-DK with a v7.3-rc6 based kernel with the same
changes, each run writing 832 MiB to the eMMC and reading it back:

- SDMMC2 kernel clock 200 MHz, HS200 at 100 MHz as in mainline: without
  patch 3 the writes failed with I/O errors in all 9 runs (sdmmc2 pins_a
  or pins_b, with or without NEGEDGE), with it all 6 runs were correct
  (pins_a and pins_b).
- SDMMC2 kernel clock 150 MHz, HS200 at 150 MHz with the delay block:
  all 6 runs correct (pins_a and pins_b), the tuning picked the same
  phase in all 10 rebinds on each pin group.

Build tested on v7.4-rc1 (arm64 defconfig, W=1). Not tested on
STM32MP1x.

Changes in v2:
- Drop "mmc: mmci: stm32: do not use NEGEDGE in HS200 mode". NEGEDGE
  has no effect with CLKDIV = 0 and is valid with a divider, I misread
  RM0457 (Christophe). The writes at 100 MHz fail because of the delay
  block, not NEGEDGE.
- Replace "mmc: mmci: stm32: lock the STM32MP25 delay block again before
  tuning" with the same change from the ST downstream kernel, "mmc: mmci:
  stm32: release the delay block before enabling it" (Christophe).
- Add "mmc: mmci: stm32: use the delay block above 100 MHz on stm32mp25
  SoC" from the ST downstream kernel (Christophe), with dlyb checked
  before reading min_freq from it.
- Add "arm64: dts: st: use sdmmc2 pins_a on stm32mp257f-dk" and
  "arm64: dts: st: remove sdmmc2 pins_b from stm32mp25" (Christophe).
- Rebase on v7.4-rc1.
- Link to v1: https://lore.kernel.org/r/20261031120700.42576-1-mateusz.nowicki@posteo.net

Christophe Kerello (2):
  mmc: mmci: stm32: release the delay block before enabling it
  mmc: mmci: stm32: use the delay block above 100 MHz on stm32mp25 SoC

Mateusz Nowicki (3):
  mmc: mmci: do not count a data CRC error as a complete transfer
  arm64: dts: st: use sdmmc2 pins_a on stm32mp257f-dk
  arm64: dts: st: remove sdmmc2 pins_b from stm32mp25

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 -------------------
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     |  4 +-
 drivers/mmc/host/mmci.c                       |  5 +-
 drivers/mmc/host/mmci_stm32_sdmmc.c           | 28 +++++++--
 4 files changed, 27 insertions(+), 68 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


