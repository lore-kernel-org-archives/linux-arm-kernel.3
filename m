Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E582E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K5Yv0672gyBZHd8e/8Q70UYxrPwhUEW60yKl8LReM7U=; b=RC4ndrphIve4pCK31qtkmSiGq9
	i4v3TOxC2AmPlzFsy6/XT3wtHgQ4Ik1d/KO40Ci85nY5KI2reslBWzbNb0L89B6cE6cY0Ur7gW6dU
	P6hnn7QP9fp8M+GG6LmS2ziIuZzWdWPqZV5VVRIDi3T++ypt4yiHQYXUuZcVX2Ca+Ikqzb+IjKeeZ
	LFkTVYV0zV/oz5oJmoyF8hhWNit2fAmj3kuuwngrZofI6E+VWCBNUMSQRqg9Zh9s0m4CE0brgE+iG
	nr3aeBfrDPCPwNSZhnHaRiYBKDa9FW+sZtVYZuoqe7o224DrWGUEWzxbOYN1MUfOKKC6pUsqldG8G
	saMk/+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMk9u-00000007dV1-28qO;
	Sun, 15 Dec 2024 08:39:26 +0000
Received: from mail-m1289.netease.com ([103.209.128.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMk8o-00000007dPi-2ZaR;
	Sun, 15 Dec 2024 08:38:21 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:27b0:7e2c:bf7a:d235:f376])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5c225228;
	Sun, 15 Dec 2024 16:38:09 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] arm64: dts: rockchip: default to host mode for USB on Radxa E25
Date: Sun, 15 Dec 2024 16:38:05 +0800
Message-Id: <20241215083805.1461902-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEkZVhpPGhpJH09OSkNJTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQUlMGUtBTB5JGEEZHUwaQR9JSE5BHUhMTVlXWRYaDx
	IVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1kG
X-HM-Tid: 0a93c977c37403a2kunm5c225228
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NlE6Ejo6CzITLiMtHQsCDBNR
	ERQwCQ5VSlVKTEhPSU5KQ0JLSUtPVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0lBSUwZS0FMHkkYQRkdTBpBH0lITkEdSExNWVdZCAFZQU1CSDcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_003818_882471_B8C6372B 
X-CRM114-Status: UNSURE (   6.54  )
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

The Radxa E25 board has only one USB3.0 Type A connector,
changing it to host mode is more appropriate.

Cc: FUKAUMI Naoki <naoki@radxa.com>
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts b/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
index 98cfa3abb809..90a3cb54fd47 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
@@ -218,6 +218,7 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
+	dr_mode = "host";
 	status = "okay";
 };
 
-- 
2.25.1


