Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5C2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHp0hAIPwncbIvnUuxLRjYVLy2qo4bmSYLVRIiBRxYo=; b=m4TMNOVOUs9lKDaiDBOqIWg7Em
	Py/4GOdCAJLhq7Tph+PK5rpxActwDgje9fSyqcw8yu2sXFNNyijm1mczj6HXXhozZxdiQVwnlwQ3V
	7SyoZAQqtZLhoWY+puU5adj2pnhjYZtfwGTaLjtKoXyB6Kj4OF+xAHT8Q7Bn7Xpv8WwKnrjSEx+FA
	ZZu0NSxGjbLiJYs5hyohJLUeudZcUCss9PD2DIJQv1UGS6jGY3L/28CmXoVsouO1n4kgTuFJFaIg/
	bN7JWDG2Esmgg1QPXcw3TH8zAVFLJlRALWXjvLFRMNOSbVabSNHfKfs32kdRMoalZ0oZi2AoOHMD6
	NGSf2t6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpLt-0000000EdxV-23iw;
	Thu, 12 Jun 2025 21:20:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDP-0000000Ed64-3hGn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48DF74A844;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22CBBC4CEEA;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762722;
	bh=YLmWDKsoMcAj1FZaEwVkOxK9EAmBzZd5KoPvpjLJcOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ILb+w7src221ykDUIlgdnxftZvH7pDzQLP/oP119e29bcKTtc3Dyd/Vj2ALFMPc4j
	 dCH6K4e/wNt9AV6XUJPr0ALhcpnOG/VRmFarkc28P2/z9mQRwvhHLx6QLcfrSn7NN7
	 saoQKx8o1dzj/SMkzddTg+5pxgdmn2dHmzSoKPdd1tfsvLooxysXBeq8TCPNagpoim
	 2jEawWZX6uNd5Iwl/nMY+gS4dHUSlWWPv56RifRy+CosSDi9wFTk6laOTUKf3if8E0
	 1z5LBYVFXX9NXXPwwbHBsXerkIRaNVI9G6iWjElrpBx8BQOe9EBbh3WpATYN0s383D
	 0njfal/862z+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BC0C61CE8;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:32 +0000
Subject: [PATCH 08/11] Input: apple_z2: Drop default ARCH_APPLE in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-8-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=YLmWDKsoMcAj1FZaEwVkOxK9EAmBzZd5KoPvpjLJcOY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a308x5ms0KdxX5tjYJ+Vj+5Z5Y0a+jEJPxyPLHDGfmt
 WoFV1d0lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACayJYDhn5p5R+rBA11SHwMi
 Nsu6Gr/++XbFTaMtTNlxm/kPzgiKFWT4719YvrYm885Mtqi0lv7rPbL+R2V+MDMtXcYevXvGWll
 LFgA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_141203_966739_015C7FD6 
X-CRM114-Status: GOOD (  10.72  )
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
 drivers/input/touchscreen/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 91a2b584dab1469a3c907c0f1accfa10c4c4a3ca..196905162945d59e775c3e0bff6540a82842229a 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -105,7 +105,6 @@ config TOUCHSCREEN_ADC
 
 config TOUCHSCREEN_APPLE_Z2
 	tristate "Apple Z2 touchscreens"
-	default ARCH_APPLE
 	depends on SPI && (ARCH_APPLE || COMPILE_TEST)
 	help
 	  Say Y here if you have an ARM Apple device with

-- 
2.34.1



