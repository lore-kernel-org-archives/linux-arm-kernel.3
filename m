Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB15C71150
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QieUK+xHcidlkL2MWykqCgFcHhSqRY+UINTKqFCVTOk=; b=Q0OA6rv+rDS0ri1DxSzkw6J0HO
	2FSgPGtNbXhtl4WAzMOohAIc1e/3n6sIhPx84DKWdhZpxyfyCGWzXiS2CKso71/e5/jdhMLpeaCWb
	jCO1HAVn6DSwsP0AS4ASj1L5oLWCRaO6kG/fstrT2PfpuNJI5lkj9wIPCaBvseGEXGhhMlX5CJfTl
	wlULCBCgWRRLi7bB6og0Yq3O2QkNJFOyBL7zlIt6xZW8ILOWl09YtHQykEjtN14gAWKAO0UteiNkM
	nFMoXEGPpiHJ6ebCz5g1JgykXeJwsNW/UuLsSvB2sPs0OWXK8/gZOfT6qwurXcY7vZVCRDH/MAWI0
	Bp7YgJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqLZ-0000000Em5L-13z2;
	Thu, 12 Jun 2025 22:24:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDR-0000000Ed6j-1XB3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 729654A88E;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F47BC4CEED;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762722;
	bh=ruZ9l1GNZAWRjeIQuv4Eiiv8m1R9HWDfcuBW5YhBHWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kKKnAxxq5zYz0hV9jfumVcWaurrvlfcqVwdLcu7/ZykUyNxqWTDMI3s3G60WopsrQ
	 DbgMNySlQQjC8j8kFasyRrpj7n5CCI/bP4fHmO6nmXrWMkCLVpop0eek+UTgQf+g9f
	 dPplwDA6zs0EfU1XHMMB2bsTuabLoiwvjaKiJqsQzhlg9HUFfTGpitt908nxqYJ++9
	 tT5Dfp4nGi78pNhm0N7F9Lco8Vs8XtYSzAmMb5piwGENC7VBdBMBrartd2Pea5ePQ9
	 34G+5vrAPUbwjGb9w/3lIVE4QvMzHgBiQGKU2aRtgbKFRma9d8Llk4vhdHDYsi7atM
	 0yLTi1b7uZUHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D61C7114C;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:33 +0000
Subject: [PATCH 09/11] dmaengine: apple-admac: Drop default ARCH_APPLE in
 Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-9-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=ruZ9l1GNZAWRjeIQuv4Eiiv8m1R9HWDfcuBW5YhBHWM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a30+yvLqee38l/3b2+TeeU+BRuhg/bhM9OmvNhrnPh8
 4Rmc6OmjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEhCcxMmzW9M1cf8np0cE1
 pR9NG5wf8W1dvvb9E2HhRYWqX8+wBn9h+F++lP2HRZOaqvN7Vq9jOYt0H+4X6X/J0LI4dtbFx0f
 e2HADAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_141205_446978_0ADDF8B4 
X-CRM114-Status: GOOD (  10.78  )
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
 drivers/dma/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7606e40dc26ea41d26fcdd1fad979..7f387157e3c57d8c1517b55d86aa6d6e660dcce5 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -89,7 +89,6 @@ config APPLE_ADMAC
 	tristate "Apple ADMAC support"
 	depends on ARCH_APPLE || COMPILE_TEST
 	select DMA_ENGINE
-	default ARCH_APPLE
 	help
 	  Enable support for Audio DMA Controller found on Apple Silicon SoCs.
 

-- 
2.34.1



