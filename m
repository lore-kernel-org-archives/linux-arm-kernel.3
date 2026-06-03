Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA059CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Iy25HyOMbi8GMjtwcB0qyVLeFk88niKy9DGvc6zF00=; b=TzM9tWfGLapzbPCuWwdvo1WM5X
	JzxeiP1Ht4CkU09dOnnkudXiR24vwqvWHkTd/dZR/QufWh97MIAkvwIrirofzN4zIz5SlIccSK+kD
	GjIh4yXI1DocXb/Ojmt3Ee7Qyg4CPaNzC8LelVrTaa8HY3XeQN9D+kQ8pOjBoCk19clyxD11zIOSH
	eZcuaySqJ8QF8417+UhTSi+LRSKChBuCnrnQxyd2ejiiMoMkEWrOyTq4Uc1uu49mK2YT9XTegRlwL
	GR1hXKDqGfXqHOTWyhLaD58u9rJ1Yyka7dc02th0ruY5eonkzAmaRw+fUW4DtSNLdpWBsyNbqtuP8
	lLTwuC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMt-0000000FMdj-2aes;
	Wed, 03 Jun 2026 15:18:55 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMr-0000000FMak-0WPz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5Iy25HyOMbi8GMjtwcB0qyVLeFk88niKy9DGvc6zF00=; b=CfACNgs8T5zm9F+masKwTpdblT
	fmE5kqRbVNZCH4w8u4M5kpz+mfQN3Eu8i7NqnxOUkybiO+xa2e1ZYJ7znS/RaKoiEEMUYCRl6vDAR
	g8Ynpjuxv+pw3d9xsivfTZ++D7YpbevxL4bq4kXu4zLcEiEVJ3limxUpbRdZ4HZXb5C5t/t6gCHW3
	Wbtxy/i+CUb9dDkqVnbc9rn3VA5IiUvNBXbWIMbtyuUdGZ2x0ABKSIJLxNfQPQO0fBVHwEGlxyBaJ
	yn6ZTIhNoJPUM0wACnYme3cxYLfCOvaKcwDlXezyH0zqgB+wMlSCq22oTM/J0em4vkmhL7XnZFNPl
	XLtBT5iQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnMo-0000000CXaY-1Poa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:18:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BA1044589;
	Wed,  3 Jun 2026 15:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9AB1F00899;
	Wed,  3 Jun 2026 15:18:45 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pmdomain: arm: Grammar s/may needed/may be needed/
Date: Wed,  3 Jun 2026 17:18:43 +0200
Message-ID: <a9a082c25e4bda4d73b261eee951efecab20612d.1780499882.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161850_581056_A537A790 
X-CRM114-Status: GOOD (  11.73  )
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

Fix grammar in the help text for the ARM_SCMI_POWER_DOMAIN symbol.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pmdomain/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
index afed10d382ad7f66..ba0b190a63d6bb18 100644
--- a/drivers/pmdomain/arm/Kconfig
+++ b/drivers/pmdomain/arm/Kconfig
@@ -21,7 +21,7 @@ config ARM_SCMI_POWER_DOMAIN
 	  enabled or disabled via the SCP firmware
 
 	  This driver can also be built as a module. If so, the module
-	  will be called scmi_pm_domain. Note this may needed early in boot
+	  will be called scmi_pm_domain. Note this may be needed early in boot
 	  before rootfs may be available.
 
 config ARM_SCPI_POWER_DOMAIN
-- 
2.43.0


