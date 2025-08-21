Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C88DCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k49Q9vOTVLxJ6PPU53V8G3kIQZ5cJ7/ySiYbJlElx34=; b=c5BViHGHFHoqv37BFB1g+RISvP
	XxYimycX5NuhUGk7loXZT33OctWA2ygnQ83GvPc7oDgc1G1Yvx9W9ZGOFasecfpT6saa6rwJUOvrB
	3dZS+hpX3sXuU7HQA/3uQPeQr9+mSUT/iqTob2WbvACvrJIMGyxoQPzFTWWg6v7bOay6QVxhDZUmH
	+WVFiZbaF1hypVfVlyUM3SXVHPSqNd62KUeTGs93NPb+zT6oErYelIJjCwPEHfdVrxEbUnUf3vE8U
	GnN22X7281cIt3Uc1J4k5cwKg8ubH2NBcJx2d3tj2OzXV3vBWQ58leUQM1fK1aXgKXlQYB23nXlIo
	bH8lRf7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7y-0000000FeBs-3qxh;
	Thu, 21 Aug 2025 03:38:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotRH-0000000FKZa-0uFx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:46:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA2CB1F37;
	Wed, 20 Aug 2025 17:45:50 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E78D13F63F;
	Wed, 20 Aug 2025 17:45:56 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 8/9] pinctrl: sunxi: a523-r: add a733-r compatible string
Date: Thu, 21 Aug 2025 01:42:31 +0100
Message-ID: <20250821004232.8134-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174559_293216_F6E13E87 
X-CRM114-Status: GOOD (  14.82  )
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

The secondary Allwinner A733 pincontroller ("-r") is interestingly not
using the same new MMIO frame layout as the main controller, but is in
fact very similar to the A523-r one: it has two banks, with 14 and 6 pins
each. From the driver's perspective, this is all we care about, so we can
re-use the a523-r pinctrl driver for the a733-r, too.

The individual pinmux settings are different, so we must not use the
a523-r compatible string as a fallback, but we can surely let the same
driver care for both the a523-r and a733-r IP, as the pinmux values will
be provided by the DT.

Add the a733-r compatible string to the match list, without further
distinguishing between the two. Should differences be discovered later,
we can easily split this up then.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 86a12bce0e335..437c955463bac 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -41,6 +41,7 @@ static int a523_r_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
 	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
 	{}
 };
 
-- 
2.46.3


