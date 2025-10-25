Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939E9CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pw0O/7hjHLuZk5A247QTUYY+X5JOMTpl8m7u+MgorxI=; b=i5V7PHcNMMXL2jvxhMLHgq2UiD
	K4yYuR2+89bbk5xOczBGcI6i22mUVuRXOt6lNRjMmiIhEkXui/+SXawAMRS+PyQcvt6Oig7jWmSOT
	saloBEnrFhXE8Ic5ZbBwOY6TlYMEErJTeCNTEEhG1WHbNuFWWoLuGB5ctwpDRFWnEqEQKyn39t/oe
	/vQxDQk4fi8PyTuiAMIahv/2lx9BpeBA2kI1Rvwv2osyMx8Hu+QyvlNCixzqwzLID5otGC7hrh3Cz
	88Dr60l1ym1UwAFKV6X8NfP8gaV8T3D0UZcMfXMXMIOGuvtu7uy/OAOkwvnRxtBdIHla5Ynwa/Xa7
	tw9h48zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgtF-0000000BR10-2X5p;
	Sat, 25 Oct 2025 16:13:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgtD-0000000BR0W-2kEb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5477B44E12;
	Sat, 25 Oct 2025 16:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBAFC116B1;
	Sat, 25 Oct 2025 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408791;
	bh=SA476cL1oEZtSTZZYfW7hLhLpWqlSXC+EvyocnZrNYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ijYrzgNRkubHCKFEYph6jwXWzRMYkcIltW6h7moCuN0O59YPq1nNP+GOs2QSPrlw5
	 XS2HewEbWEaFY+dIiE7whZo3LgIaJ5Q4GhVmqJG9tTX3dBIvqH2Pcu1NkSarVKPQ34
	 C+pDRHteB25EF0+N2yFTcm7rehKgJwC4j+BT6MAS4L/akMXUkxdxv29XtrbvU5PGzd
	 RhFtYBNFuychcwRt0Msrc+hC5tN51+Ha0IfVyvDO5dWRNueH9b/4T8asRndLS9QEuj
	 KgQCV53OFHUW/xc6eUNdXNvZoi1ggSYZZ+4KTyoukUpIUyr5Ejsr4K57sVDoRaGKKK
	 NOQlyAcqKg7Kg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] ASoC: pxa: add GPIOLIB_LEGACY dependency
Date: Sat, 25 Oct 2025 11:55:02 -0400
Message-ID: <20251025160905.3857885-71-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_091311_734651_22938B56 
X-CRM114-Status: GOOD (  18.64  )
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

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 2d86d2585ab929a143d1e6f8963da1499e33bf13 ]

The pxa27x platform uses the legacy gpiolib interfaces, including
in its sound drivers:

sound/arm/pxa2xx-ac97-lib.c: In function 'pxa2xx_ac97_hw_probe':
sound/arm/pxa2xx-ac97-lib.c:374:23: error: implicit declaration of function 'gpio_request_one' [-Wimplicit-function-declaration]
  374 |                 ret = gpio_request_one(reset_gpio, GPIOF_OUT_INIT_HIGH,

Make sure we don't select those drivers for compile-testing unless
we are building for a pxa27x system, or CONFIG_GPIOLIB_LEGACY is
already enabled.

The SND_PXA_SOC_SSP driver accidentally used a dependency on PLAT_PXA,
which includes both ARCH_PXA and ARCH_MMP, but it is only used on
the former.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Link: https://patch.msgid.link/20250808151822.536879-21-arnd@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Rationale
- Fixes a real build failure during COMPILE_TEST when legacy GPIO APIs
  are disabled. The failure stems from `gpio_request_one()` in the PXA
  AC97 support code: `sound/arm/pxa2xx-ac97-lib.c:374` uses legacy GPIO
  (gpio_request_one/`GPIOF_OUT_INIT_HIGH`). When `GPIOLIB_LEGACY` is not
  enabled, these legacy interfaces are not available, leading to the
  implicit declaration error cited in the commit message.
- Targeted Kconfig gating avoids the bad configuration instead of
  changing runtime code:
  - `sound/soc/pxa/Kconfig:2` changes `SND_PXA2XX_SOC` from `depends on
    ARCH_PXA || COMPILE_TEST` to `depends on ARCH_PXA || (COMPILE_TEST
    && GPIOLIB_LEGACY)`. This ensures the PXA SoC audio stack (which
    selects `SND_PXA2XX_LIB_AC97` and builds `pxa2xx-ac97-lib.c`) is not
    compile-tested unless legacy GPIO support is present, eliminating
    the build break.
  - `sound/soc/pxa/Kconfig:27` changes `SND_PXA_SOC_SSP` from `depends
    on PLAT_PXA` to `depends on ARCH_PXA`. `PLAT_PXA` is selected by
    both PXA and MMP (`drivers/soc/pxa/Kconfig:2`, selected in
    `arch/arm/mach-pxa/Kconfig:13` and `arch/arm/mach-mmp/Kconfig:8`),
    which caused the PXA-specific SSP DAI driver (`sound/soc/pxa/pxa-
    ssp.c` includes `<linux/pxa2xx_ssp.h>`) to be selectable on MMP
    inadvertently. Tightening to `ARCH_PXA` corrects that misdependency.

Why this suits stable
- Small, contained Kconfig-only change; no runtime behavior or ABI
  change.
- Fixes a concrete build error affecting users of `COMPILE_TEST`
  configurations without `GPIOLIB_LEGACY`.
- Reduces accidental driver enablement on the wrong SoC family (MMP) by
  replacing `PLAT_PXA` with `ARCH_PXA` for `SND_PXA_SOC_SSP`.
- Minimal regression risk: only affects visibility of options under
  specific Kconfig combinations. It does not introduce new features or
  architectural changes.

Notes on applicability
- This backport is most relevant to stable series that already have the
  `GPIOLIB_LEGACY` split. Older stable trees that predate
  `GPIOLIB_LEGACY` either won’t need this change (no build break) or may
  require adjusting the dependency accordingly.

 sound/soc/pxa/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index e026f9912a6d1..e54abcd39f792 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -3,7 +3,7 @@ menu "PXA"
 
 config SND_PXA2XX_SOC
 	tristate "SoC Audio for the Intel PXA2xx chip"
-	depends on ARCH_PXA || COMPILE_TEST
+	depends on ARCH_PXA || (COMPILE_TEST && GPIOLIB_LEGACY)
 	select SND_PXA2XX_LIB
 	help
 	  Say Y or M if you want to add support for codecs attached to
@@ -26,7 +26,7 @@ config SND_PXA2XX_SOC_I2S
 
 config SND_PXA_SOC_SSP
 	tristate "Soc Audio via PXA2xx/PXA3xx SSP ports"
-	depends on PLAT_PXA
+	depends on ARCH_PXA
 	select PXA_SSP
 	select SND_PXA2XX_LIB
 
-- 
2.51.0


