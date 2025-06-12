Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ED2C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvXatvlC5B2FicBVLNkr/77l8ALJ3fRD9tJmEAByinQ=; b=XXQnblaYDgc3w8BuOp3hUMPHHV
	Ylb9Fo11rDPfsGa1yUeh7n5eulON43EdK6OM8pIzkC/ZNnJ3ULJTPWV786MtjoIqzgzIpTqr4Av+L
	Sr+R4IcXjbG2k+qqRyX8IdGzyJoeCtj1nMnMdd3+BLaxeQ9UbX7SXFWVlIpNFDHg3X697NrLGMav6
	IuLO9xrFnOSO5KpxMSEq/i5V0HkM+O2omNLprdTkxBnnpSkRtG6VDApSYDP+foV9iV7bmxr5ABfjG
	KM2HvlWJ6lWBRJ/PqnfGcQZQADBTautnJkTm1mF54VTvw9ZsMyqqQr1n9XzbIkO2Ni6cAohM8S99G
	+Rd2Q1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqLY-0000000Em51-33PX;
	Thu, 12 Jun 2025 22:24:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDQ-0000000Ed68-0OXi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F9AB62A17;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD166C4AF51;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=f2vJ1VzynNUJ83xEH0r0BrVBF2l+dxGM7bRjxCpAZXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OB0F4K/L7lc/PtRHOqI0eRMdaNRq0kctxOUqZjpE9Q/Ps6RKplVUuMsSH6glkpqey
	 BYaiDbzKmrvuB/bYB4e3A2c25FTWW+fj5N73AzJm5MOowKsQ9sJiNQbyd68LveCi/T
	 xnEAtBRvqAti5YljKNAEUH13Qx/bkYUrC1+VmVVczsTBBrHLYgtkEdEZKz3z381AuT
	 6yDlvO/kfw0+/VWD9lnedqe1z+FIZqxYNi6QRQvs+tB4wvsqdluhxFVQAzugPVOuuR
	 d+b7wzV63Ezmi8qfK1zpvx3jLw20KVda26PhF0f2ZJkBiYfXdJE32HcIJm6sFOQ46N
	 e8G/H+IsbT/8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED25C71136;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:30 +0000
Subject: [PATCH 06/11] cpufreq: apple: drop default ARCH_APPLE in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=f2vJ1VzynNUJ83xEH0r0BrVBF2l+dxGM7bRjxCpAZXQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a30/RTmaqcaVp+85SlLPYmb9cKfWvcKHVPJTr4cH+58
 Mba8jsdpSwMYhwMsmKKLNv325s+efhGcOmmS+9h5rAygQxh4OIUgIksnMXwT9dFNZKh4Volw7T5
 31edEetf94fJrK262MdAxKtred/8ywz/g0s5NPudk45vitnnr2a0/OUfpcTCHwrH94ke2XC/4qQ
 xIwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

When the first driver for Apple Silicon was upstreamed we accidentally
included `default ARCH_APPLE` in its Kconfig which then spread to almost
every subsequent driver. As soon as ARCH_APPLE is set to y this will
pull in many drivers as built-ins which is not what we want.
Thus, drop `default ARCH_APPLE` from Kconfig.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/cpufreq/Kconfig.arm | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 0d46402e30942e3d15e9aae757d27895c2568fe1..4346629d3bc094cb3317ddff8b45e12ae5c5ca09 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -28,7 +28,6 @@ config ARM_APPLE_SOC_CPUFREQ
 	tristate "Apple Silicon SoC CPUFreq support"
 	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
 	select PM_OPP
-	default ARCH_APPLE
 	help
 	  This adds the CPUFreq driver for Apple Silicon machines
 	  (e.g. Apple M1).

-- 
2.34.1



