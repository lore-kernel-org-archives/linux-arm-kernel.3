Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C806CF8844
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR2x6mG5rwCNyliYbh4ykH5GRMtyinW5jC9luPhY0MU=; b=MfAJ7b86cF/SQq0NiFD7TPCZdS
	3e95nOny8S0iQCwhWGJT8gTlckxSRtahw0XF+6BpwUmRqMApjE5WAVMTTnExbTgVq4Kxb+eV/ZDNk
	fqsNR7bo0mMONaz9486TQVkdZauFE5lnxW+/AZNy8AuzZJrWz414ZBQ4Lb6BABv4VisqoRIU4ShDA
	vX3VgbDzGJv4si7DnyfTLzxL9jyg4+sTV3+JL4iPqv1m8v7AdHNIojKn/qIkNjTrcXIPE9oj2PH4r
	yiB7CdlW7GzZmAbo1Yzzw4Ro4CEWilE35GSX4wCjM0frUoc7UDwKzYHJwSWxnMmoF7wml1T7Px1UZ
	hUVQrZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3LD-00000006cSE-2QwS;
	Thu, 20 Nov 2025 12:00:47 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3L5-00000006cNI-3JOi;
	Thu, 20 Nov 2025 12:00:41 +0000
Received: from localhost.localdomain (unknown [116.25.94.95])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a4b77149;
	Thu, 20 Nov 2025 20:00:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: rockchip: add mmc aliases for 100ASK DshanPi A1
Date: Thu, 20 Nov 2025 20:00:08 +0800
Message-Id: <20251120120011.279104-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251120120011.279104-1-amadeus@jmu.edu.cn>
References: <20251120120011.279104-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aa1234c7503a2kunm2d0ac75b4ab9e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTx9KVkIeSEMfGENDTk8fSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VQk5ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_040039_992412_B7D5B6EF 
X-CRM114-Status: UNSURE (   7.98  )
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

Add missing MMC aliases for 100ASK DshanPi A1 board.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index f9dc4fa39167..815f75e7cd70 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -19,6 +19,8 @@ / {
 	aliases {
 		ethernet0 = &gmac0;
 		ethernet1 = &gmac1;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
 	};
 
 	chosen {
-- 
2.25.1


