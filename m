Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DDBC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzxdbaffCFKBMrC8ccgNGtNecmUFsbYYTFYMikADhvM=; b=WpKqfkCNizjcll55vDw/E4zUmH
	eGerzWvpqKdtCNeH+taard/yQVs4VWlr1k3iQtOMRGE1tTffv2dwhYYaIH+ynUi5Ku1uOMMXc9KoD
	TuhteGiunFYMaLSADw6AcyFSJnx3g3akUi2LF4vaZwXr3vjd9xRFFVl0zg2maEF6KwtEf1Ohm0cuQ
	k9vpeOyVN2hrCUctty661qajVn9N33FugK57OMCg2iRmMPF/wiMc7EHWdBwgTbs9Wwhzp3C0ElQ5H
	EXpPrG1C6wWZppDqdZGo9Bj08PJ4L0yt0bbrobqgLI06+hSDS6oTVYdPPRufh+PvG7A1HypEfCfsU
	4lxdsuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXbJ-00000002Ptk-0K58;
	Tue, 01 Apr 2025 09:08:05 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXTw-00000002Ok0-1ppC;
	Tue, 01 Apr 2025 09:00:30 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:430:ae31:3177:4f09:da96])
	by smtp.qiye.163.com (Hmail) with ESMTP id 104ddcf67;
	Tue, 1 Apr 2025 17:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] arm64: dts: rockchip: rk3588: Move SHMEM memory to reserved memory
Date: Tue,  1 Apr 2025 17:00:09 +0800
Message-Id: <20250401090009.733771-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401090009.733771-1-amadeus@jmu.edu.cn>
References: <20250401090009.733771-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0xOVhkZTEJLHU1DSUNKQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQU9IS0EaHkhKQUhKTExBTx1LQkEfGkJNWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a95f0946ef703a2kunm104ddcf67
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBw6Vhw*DjJJKQoeAxkiNEI0
	F04wChlVSlVKTE9IT0JDS0pOTE5MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBT0hLQRoeSEpBSEpMTEFPHUtCQR8aQk1ZV1kIAVlBSUtISDcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_020028_933619_6BC3125D 
X-CRM114-Status: UNSURE (   9.44  )
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

0x0 to 0xf0000000 are SDRAM memory areas where 0x10f000 is located.
So move the SHMEM memory of arm_scmi to the reserved memory node.

Fixes: c9211fa2602b ("arm64: dts: rockchip: Add base DT for rk3588 SoC")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 1e18ad93ba0e..c52af310c706 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -439,16 +439,15 @@ xin32k: clock-2 {
 		#clock-cells = <0>;
 	};
 
-	pmu_sram: sram@10f000 {
-		compatible = "mmio-sram";
-		reg = <0x0 0x0010f000 0x0 0x100>;
-		ranges = <0 0x0 0x0010f000 0x100>;
-		#address-cells = <1>;
-		#size-cells = <1>;
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
 
-		scmi_shmem: sram@0 {
+		scmi_shmem: shmem@10f000 {
 			compatible = "arm,scmi-shmem";
-			reg = <0x0 0x100>;
+			reg = <0x0 0x0010f000 0x0 0x100>;
+			no-map;
 		};
 	};
 
-- 
2.25.1


