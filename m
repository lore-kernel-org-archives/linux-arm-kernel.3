Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287A9C36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ecGVu5AVoF8HVxk6RPjIbdDsBLO07wRixjZMEIfJrO4=; b=hoIqewFDHdoAuZc1BCKRTuKfeF
	Xskl6b3bjQEvcjEEiP1FS6xh743wGI2BdFzZTWzttbsukk/PHPOiF5Yt25X12zUu1jf2XLYfQwU8v
	XguwOhJaQ+0LxGG+p0DTgku4FYPQlq8ZwpqaThqiE3R1tdW6lYqJCLrZfFw5wII4CHrpIiLKOI73Q
	R8Yq8+lFWpJQ5MlGrTalFvX9z8VDev2Pu6oHWpsdyBGAICp1UEFxAVyGk0pfK7AAW5lBGGzfkdreH
	SlLK6iWnGW6quIg5IrLRKEcJiYD0kbD+vcA1Jv8K68va3N26DM7Yh82IhKxm6furinF+prK9VjmgM
	ZeekOSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYjs-00000002cDo-3vLQ;
	Tue, 01 Apr 2025 10:21:01 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYQ4-00000002Y4Z-3Drd;
	Tue, 01 Apr 2025 10:00:34 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:430:ae31:3177:4f09:da96])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10501cafb;
	Tue, 1 Apr 2025 18:00:26 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Add DMA controller for RK3528
Date: Tue,  1 Apr 2025 18:00:17 +0800
Message-Id: <20250401100020.944658-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTU1KVh9NQxgeGhkeQ0weTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQU9IS0EaHkhKQUhKTExBTx1LQkEfGkJNWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a95f0cb8c4e03a2kunm10501cafb
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAw6Aio6CTJMDwo9FSwcFEJL
	IywKCT5VSlVKTE9ITktKTUlMSU5MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBT0hLQRoeSEpBSEpMTEFPHUtCQR8aQk1ZV1kIAVlBSk5MTjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_030033_191053_C13F5889 
X-CRM114-Status: UNSURE (   7.36  )
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

First commit adds missing uart3 interrupt for uart3 node.
The next commit adds the DMA controller that can be used
for spi and uart. And add DMA description for uart nodes.

~# dmesg | grep dma
[    0.103466] dma-pl330 ffd60000.dma-controller: Loaded driver for PL330 DMAC-241330
[    0.104212] dma-pl330 ffd60000.dma-controller:       DBUFF-128x8bytes Num_Chans-8 Num_Peri-32 Num_Events-16

Changes in v2:
  Adjust props order
  Collect Reviewed-by

Chukun Pan (3):
  arm64: dts: rockchip: Add missing uart3 interrupt for RK3528
  arm64: dts: rockchip: Add DMA controller for RK3528
  arm64: dts: rockchip: Add UART DMA support for RK3528

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 29 +++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

-- 
2.25.1


