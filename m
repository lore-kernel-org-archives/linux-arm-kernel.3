Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A497BC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QwOM1tCfc7aUCrYv13irNbSwaZxwrLyEf+FrsqVuP9s=; b=g2TjP8Qmin6UbD
	ivUNAda6g+/HJBzvkisJk99faEJtRsaSwAijc7mDf0GAgyiKSvBZFstw+NI+QGDkoYCooOU4nrX6b
	tfjZ6J9u8dMnxaxfIm78pxgNvLWS4ioN0K7vuSaz4+G8BdmFsvNyjpsaD9SUaz34C/0vHkDoTjPrf
	hlRKQNLZ4CWyGZbN/wnazn1gcaALc4b1plbE9r7qD3MV/a7lMYA0GDQgrNViK+1aEOO982w6V9oZj
	N5nVWDmwhTTyq/i52MwlbtTUMa7k7sSV6QkecC7VIKj8A9pcet0GZwiN+hZCwOnx4outQRsrgwFij
	KxWFD3vJFh6vUAM9FbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyHs-0000000BQov-1mj6;
	Fri, 31 Jan 2025 21:10:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyFu-0000000BQEO-2hAB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BF815C597F;
	Fri, 31 Jan 2025 21:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB275C4CED1;
	Fri, 31 Jan 2025 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357729;
	bh=kwRAFNwdHgPKjApGVq1mNUl2Zb/Zs8pER8puJ31Zghs=;
	h=From:Subject:Date:To:Cc:From;
	b=A452QXk0ceURR20sjPDIPDsE4BAQKH71KqakJ9lqLH9Gh0MkR/2NA88eGlRxOoqHD
	 fl4PjJfAV11CrNKqTXWxD/QsNXuID6EENkJc728+wXrmP3TSlE+/FyrKoI0mmonROG
	 6Int9xqYSU+UEAWic5GUeRXmE2Y0c+hHRTjpGabBH4Y9R7l/6GdVo880nqKTotIZR6
	 JE/eDa/Jq2LkSJTqtP6yZEmPJhxo/o7ydo0Reiq9enWPGGWq3WQaxkKxxdxxUP048X
	 jeHt/SugLpaMWM4x5ra+BiGhWHY4NG8VwxQY5tPaJtOghf5TBm7x1ngLjkCGOFATuB
	 R8sfsxv21m+Tg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/6] marvell: DT root compatible fixes
Date: Fri, 31 Jan 2025 15:08:24 -0600
Message-Id: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMg7nWcC/x3LSwqAMAwA0auUrA0k1m68irgoNmrAH60UQXp3i
 8vHMC8kiSoJevNClKxJz6OCGwPT6o9FUEM1tNQ6YssYbtx9zLJtOOsjCdlPnSVyHQlD3a4of6j
 XMJbyAcrcWDpiAAAA
X-Change-ID: 20250131-dt-marvell-fixes-1ac4300540e1
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130850_769757_C90859B0 
X-CRM114-Status: UNSURE (   9.14  )
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

This series adds some missing root node compatibles and fixes some 
errors in dts files for the root node compatibles.

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
---
Rob Herring (Arm) (6):
      dt-bindings: marvell: armada-37xx: Add glinet,gl-mv1000 compatible
      dt-bindings: marvell: armada-7k-8k: Move Armada 8KPlus to schema
      dt-bindings: marvell: armada-7k-8k: Add missing 7040 and 8040 board compatibles
      arm64: dts: marvell: Drop incomplete root compatible/model properties
      arm64: dts: marvell: Fix missing/incorrect "marvell,armada3710" compatible
      arm64: dts: marvell: Add missing board compatible for IEI-Puzzle-M801

 .../bindings/arm/marvell/armada-37xx.yaml          |  1 +
 .../bindings/arm/marvell/armada-7k-8k.yaml         | 25 ++++++++++++++++++++++
 .../devicetree/bindings/arm/marvell/armada-8kp.txt | 15 -------------
 arch/arm64/boot/dts/marvell/armada-371x.dtsi       | 17 ---------------
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |  2 +-
 .../dts/marvell/armada-3720-espressobin-emmc.dts   |  2 +-
 .../dts/marvell/armada-3720-espressobin-ultra.dts  |  2 +-
 .../marvell/armada-3720-espressobin-v7-emmc.dts    |  2 +-
 .../dts/marvell/armada-3720-espressobin-v7.dts     |  2 +-
 .../boot/dts/marvell/armada-3720-espressobin.dts   |  2 +-
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |  2 +-
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  2 +-
 arch/arm64/boot/dts/marvell/armada-372x.dtsi       |  3 ---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |  2 --
 arch/arm64/boot/dts/marvell/armada-7020.dtsi       |  6 ------
 arch/arm64/boot/dts/marvell/armada-7040.dtsi       |  6 ------
 arch/arm64/boot/dts/marvell/armada-8020.dtsi       |  6 ------
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040.dtsi       |  6 ------
 arch/arm64/boot/dts/marvell/armada-8080.dtsi       |  6 ------
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi |  3 ---
 arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi |  3 ---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi      |  5 -----
 arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi |  3 ---
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi      |  5 -----
 .../dts/marvell/armada-ap810-ap0-octa-core.dtsi    |  1 -
 arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi  |  2 --
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |  3 ---
 28 files changed, 35 insertions(+), 101 deletions(-)
---
base-commit: 69b8923f5003664e3ffef102e73333edfa2abdcf
change-id: 20250131-dt-marvell-fixes-1ac4300540e1

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


