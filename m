Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A166AC71150
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgjWbyRXALjtRuEf50d4igPVh19J0Bh4OW3WaVr0/DA=; b=PjkscZR5ACkKuHgp4F6I+3aOBB
	jOfKhDuXtvO740p2WW0xKDPrUN4phAuSwhNxJfXp5GW+pf29i2iK0QG7ia3hJMWB51HyceCiZk5kv
	RsLYCTrnH1HtE3oVvdmLQajgyc1DOxM9n1ocgCO2FFaTbYgSgN3kTBGH74ANjZLWOt/txpXEwgV1/
	NCh87IaTU2a9Sabtxro/BzR0PP+NnjdOS69yd9OqeEHunC4aVGjfwkbFX78ZNBVFlnGQJXWT/lHAH
	DD51nhm2MafordkUlT5Fniq7Sc+waUun8arG4X57gDnY8MJatsEdQeXZQ7aUDz54EP0xrM+tuaXwI
	fGOM6iWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphU-0000000EfTY-2HSI;
	Thu, 12 Jun 2025 21:43:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDd-0000000Ed87-3Gwl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 21:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QgjWbyRXALjtRuEf50d4igPVh19J0Bh4OW3WaVr0/DA=; b=YDvLiBPhuaTsydfiHPRkTIqryV
	M0YMObDJzLkD2vsZ8kKGzZORuhNUcHNVZIjhvSqaF88H32qfi1ndZG2CGFC14z6fPvrpTzKG+1eqI
	0EuBaFtRkBMQ0ReU3ySPIzQR/XSHzj54ocDKIV2OxHL5mNHovD2pxOTVHLtusyy7xpXXMEzzwW86o
	+Fu6jXe3+3raNs6p1Btlok/i9tHuhtmhuW9mCD4jbciaJDoxjdrJ5/iJoXrVlIFDNR0eVq0P+uVb0
	j33lVCOxvATsC8fg03c7uVTbUknMH6pvz17kyWT6/KrNLBrtDUbC92AW5j5JZHZWK3YA5E7wgZlpm
	jf1QZPBw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDS-00000002hzM-2Ib2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22FDA4A867;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C75B0C4AF1C;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=F/Z4decNsz4B5o9bV+TnqdRPSE6G0uWtE1olsYTJyJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kA5XHzVqJvgGcVKM9DXo7DqZXxZRzPNluPUT67R3nqfpYeewQtfAdlM0Lij/aERAj
	 jqplxG/MYLbXxhcd/DB1QJVt5TT0666VO6gvruTPFZGCpwFDaHL5PUX1KJEwXgyZ8X
	 e4fN4LVfF8DRBJc4YjfCEzGNvxCqrrDs0m8DOqxSdTaVZcFoL6JLaAkrFKKtygAYJs
	 o4TXZKw69sNPcyJLmEwDezwdmY5vZJZUUjw65osYte2zTSUN7AJHBHkrFBIQ1fIB65
	 LLX/jzFuc41sN8JRkSpF1kQNCXhEWgCIP4HfvdzN7Sn/JeQJAmLrzy3hFmBK9PhbKU
	 Rj0DHmAxJ2S1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92EFC71148;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:29 +0000
Subject: [PATCH 05/11] i2c: apple: Drop default ARCH_APPLE in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-5-0e6f9cb512c1@kernel.org>
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
 bh=F/Z4decNsz4B5o9bV+TnqdRPSE6G0uWtE1olsYTJyJw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a309Tjlzsdfh/YrRvMdvlWd/X9b492KIXyqdx64bvnh
 ea2t4u0OkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATMV3G8IfjxgbDMtONC+JW
 vj3Zcn/W0gvHX8tm3fhgcvNZsNPBjuRbjAxL6xJk8nXf2sqf7lvLznvmksb5tFtZEtVWLD1LZf0
 8zJkA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_221207_421156_F94FA0FD 
X-CRM114-Status: GOOD (  10.80  )
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
 drivers/i2c/busses/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 48c5ab8320090cc383cea32337fb391c2b01a904..93440702b8eaf0fba4cca337eb2fd2959801a570 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -992,7 +992,6 @@ config I2C_APPLE
 	tristate "Apple SMBus platform driver"
 	depends on !I2C_PASEMI
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  Say Y here if you want to use the I2C controller present on Apple
 	  Silicon chips such as the M1.

-- 
2.34.1



