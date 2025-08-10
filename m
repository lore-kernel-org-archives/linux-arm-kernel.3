Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD63C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43RvWN3jJls5RvD2iI0Ox0DGGnU1sE9sowTITovCGag=; b=a5bZTkxbiJ9rToKSdNuYPI3UeO
	gawVPYpe6dCjszaI/yDR30zcR9fhgWdfOnE3BjorcPCRcPXx1/c2ICpH5tVfPCTueIcrXSoJG+RNC
	jHbbg1GzfnEi0HanteZeibvPSXu+I4H8jMxgcMadcy5x7+7s7SeALgHbHnEj/RoSDhbnGqm60Xjzn
	9kzSjIfipJHYJCzMx8NOc0xAHqhnAb4kzdLodHoJKCkdkTSSPyMt87u0EbaZKUndFMymL1S/RmSMZ
	qNr5BwATPTIX+8imXsFXWj7nACIJP6q/Ky5xvmNgv8tWzjbGzlOrou6UjVvwrXONIhbvt2MDvRAQA
	bpAmPKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul2tW-00000005VtD-1WB5;
	Sun, 10 Aug 2025 10:03:14 +0000
Received: from mail-m60217.netease.com ([210.79.60.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul2qy-00000005Vj3-2yqL;
	Sun, 10 Aug 2025 10:00:38 +0000
Received: from localhost.localdomain (unknown [119.122.215.209])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ede32cf2;
	Sun, 10 Aug 2025 18:00:25 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: rockchip: mark eeprom as read-only for Radxa E52C
Date: Sun, 10 Aug 2025 18:00:19 +0800
Message-Id: <20250810100020.445053-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250810100020.445053-1-amadeus@jmu.edu.cn>
References: <20250810100020.445053-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98936c9d3c03a2kunm8ce533755351c7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQxkaVh9LShpPGUJCTEpKQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJS0JZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_030036_955101_D9EB4EA2 
X-CRM114-Status: UNSURE (   7.92  )
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

The eeprom on the Radxa E52C SBC contains manufacturer data
such as the mac address, so it should be marked as read-only.

Fixes: 9be4171219b6 ("arm64: dts: rockchip: Add Radxa E52C")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
index 3b519be6e1ea..fe48a0942a57 100644
--- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
@@ -254,6 +254,7 @@ eeprom@50 {
 		compatible = "belling,bl24c16a", "atmel,24c16";
 		reg = <0x50>;
 		pagesize = <16>;
+		read-only;
 		vcc-supply = <&vcc_3v3_pmu>;
 	};
 };
-- 
2.25.1


