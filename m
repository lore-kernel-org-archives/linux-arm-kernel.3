Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1967FD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eH5pMZXHv2xDVgtCrAkhWoknx+04Tgt5b6yw4asjdZM=; b=Ro5v+JU8kkbM85ZotIO9lyKpka
	L9UUkLVzcV4sb0XfINgYjvI1dfgHYKYOrzudzjUpEI2EcsKBz0cGXlJpONAUAcyPZOGbVnujnimua
	2VSLrQN1HXjhQBjTIWxkR390uUxpbt5dCrwrSZGkbVX8Lj5YLHk0NYTSKG01f9G+WhDcFSsSbWakM
	r+n8C9BWJDmPqDbRRQcQL/vh73MuMT5ha/uTgzoW3nILDLUZ3EwWax+jjCf/PWOLkd4Nb3GGGcihW
	g2IHCq6f3TvU0v+SMcBNXmvkd2iBz48CX2Rb0U+4HUTyqLyCJXohKs/HqBhKh7Ev1loMJz8+vC3GA
	RNlw3R0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0id-00000003GFs-0WUY;
	Mon, 01 Dec 2025 10:01:19 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0ia-00000003GEc-1BAm;
	Mon, 01 Dec 2025 10:01:18 +0000
Received: from localhost.localdomain (unknown [119.122.215.79])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b846f22b;
	Mon, 1 Dec 2025 18:01:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: rockchip: Add H28K and M28K
Date: Mon,  1 Dec 2025 18:00:04 +0800
Message-Id: <20251201100008.206524-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ad95bd53203a2kunm919d19c13679d8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGhpOVh1DTE5KHRgZTE5JGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVMQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_020116_486413_9B4C9702 
X-CRM114-Status: UNSURE (   8.92  )
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

Both the HINLINK H28K and MangoPi M28K are development boards based
on the Rockchip RK3528 SoC, and their configurations are similar.

The U-Boot patch will be sent after the kernel device tree is merged.

There is a version that SeeedStudio distributes called LinkStar-H28K.
It's no different from the HINLINK H28K. The schematic can be found here:

https://www.hinlink.cn/wp-content/uploads/2024/03/20240428015024130824.pdf
https://files.seeedstudio.com/wiki/H28K/Open_source/H28K-SCH.zip

Information about the MangoPi M28K is here: https://widora.cn/m28k

MangoPi also has a version called "M28K Pro", which replaces the
RTL8111H with the RTL8125B.

Chukun Pan (4):
  dt-bindings: arm: rockchip: Add HINLINK H28K
  arm64: dts: rockchip: Add HINLINK H28K
  dt-bindings: arm: rockchip: Add MangoPi M28K
  arm64: dts: rockchip: Add MangoPi M28K

 .../devicetree/bindings/arm/rockchip.yaml     |  10 +
 arch/arm64/boot/dts/rockchip/Makefile         |   2 +
 .../boot/dts/rockchip/rk3528-hinlink-h28k.dts | 301 ++++++++++++++
 .../boot/dts/rockchip/rk3528-mangopi-m28k.dts | 381 ++++++++++++++++++
 4 files changed, 694 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dts

-- 
2.25.1


