Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61952C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dWkdisG2pxYEv9hQcZHYeZZNRieJA3Vs0Cp+rC7RGb8=; b=1CqYJRFyv1X2XZIdm4SE+PXbUg
	y6UX4/NjJ8KPcKsyX1ZAPCCavS/iij7QAPV1YbJ0ecBvxosWaEBPgDG+IXpN/PiEGQ+WNY8Gx4RLJ
	AOyEU1ojFmVme9XAwtpCx2FRO1Re1rdBm2fYF7+rxvtuN+Q5nAcX4BPuG56lmtWg9+kkN+1lXaPEL
	CZyh0bFul6+h4K+Abq2ccu//Od8XwZxOvOvVQkKIcaifMzvwj53ABKy6LdpMG5rwW4vLsnT1cP9Az
	bFv4W/KkBAFt1eI2Bv2QOakX73Z37UlQ76J+utCuEAxVJ/7hvDL9WWE7eGRKK6EEMrvwiyTiIje2N
	T7d43Q4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTnf-00000005QLW-401q;
	Tue, 18 Mar 2025 10:03:55 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTkI-00000005Pdi-1SwH;
	Tue, 18 Mar 2025 10:00:28 +0000
Received: from amadeus-Vostro-3710.lan (unknown [116.25.94.202])
	by smtp.qiye.163.com (Hmail) with ESMTP id eac37604;
	Tue, 18 Mar 2025 18:00:15 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add DMA controller for RK3528
Date: Tue, 18 Mar 2025 18:00:07 +0800
Message-Id: <20250318100010.2253408-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGBgeVhhLTBpMSUlNT0saSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUtJWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a95a8b257fa03a2kunmeac37604
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N0k6Mxw4TTJDHEsPAg4XGBEc
	OQgwC05VSlVKTE9JSUJJS0pNSk1LVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCT1VJS0lZV1kIAVlBTEhONwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_030026_574429_DF22B119 
X-CRM114-Status: UNSURE (   7.18  )
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

Chukun Pan (3):
  arm64: dts: rockchip: Add missing uart3 interrupt for RK3528
  arm64: dts: rockchip: Add DMA controller for RK3528
  arm64: dts: rockchip: Add UART DMA support for RK3528

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 29 +++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

-- 
2.25.1


