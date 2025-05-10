Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KjN1nBhdxQaGDQyrmYVR1VzvPD+o09XYSFx1g7uAoQo=; b=I62cQB2xYylawd3+xez4r3ttEW
	0HpUHvMAlQwPrJh3ZUdVu/JWHDc+KurMnqCOTPRCKxfUhQR6cGAZVlT6h9QghPbyzTNylHjCHH3po
	lpoPtD0NIrCQn93wOWLyxturPY5eqMWmLG1hIQD/Z1W6hblG7oZaAc6J5IclWiPPXw1M4aaPavS8L
	6XiAEojz8pobpmMJlawN7hJ8vmKVgOCIZdocVSPvtB/hqlVrZYUUvMOVgk6/Yl4QzWlKs2O7Wh9Zf
	q1ZG56Lv/tXZTokKRRLwr7Tdv7WVLipp/0R5MemgqrO/ZgQPZEyqkor+ZJYkOs2jFeQnsZntcDOIq
	n8kzZnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDsIB-00000006Q4w-0W3V;
	Sat, 10 May 2025 22:03:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDsG1-00000006PwC-2kGr;
	Sat, 10 May 2025 22:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=KjN1nBhdxQaGDQyrmYVR1VzvPD+o09XYSFx1g7uAoQo=; b=R83QxQIdH8NYNnrP3EEGoBvw2f
	noLkPoo2eSYooZLrPxk4w5mKdQ0z0ZQC8DpHBpKTgMlkR9RrSjajNU6KKhP8u7fsIOffvtNyCUWJU
	QjaZOPSetUm3vUwJJXRAvKGDuJx5A3debRjRr8ni7b9ECglvtbaJUvBnZNr/4fkVLeFsUa9hxxehR
	1Y2VdjhnuhKQJIK6nQpwXoxdxgW1n2C/pM+k8YC0Uv9XZ8NTm3t1OySTYg3Vo+lN0u9KIB1NG0FP/
	QhOIyBByNTnPIjL7KxkzLazejhqUXXKla+0C6OzDML3TXrn4gQ6ok83pqYHXWcvfDfpbTUthXfpw5
	3ITXQ/hQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDsFy-0007Ay-M3; Sun, 11 May 2025 00:01:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
Date: Sun, 11 May 2025 00:01:06 +0200
Message-ID: <20250510220106.2108414-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_150121_725100_451B5E60 
X-CRM114-Status: GOOD (  12.31  )
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

Even though they will be the same for all boards, i2c and uart aliases
are supposed to live in the individual board files, to not create
aliases for disabled nodes.

So move the newly added aliases for rk3528 over to the Radxa E20C board,
which is the only rk3528 board right now.

Fixes: d3a05f490d04 ("arm64: dts: rockchip: Add I2C controllers for RK3528")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts      |  2 ++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi         | 16 ----------------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 506d54337ece..9f6ccd9dd1f7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -18,8 +18,10 @@ / {
 
 	aliases {
 		ethernet0 = &gmac1;
+		i2c1 = &i2c1;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
+		serial0 = &uart0;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index cd8ef389ccf3..b2724c969a76 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -24,22 +24,6 @@ aliases {
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
 		gpio4 = &gpio4;
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		i2c2 = &i2c2;
-		i2c3 = &i2c3;
-		i2c4 = &i2c4;
-		i2c5 = &i2c5;
-		i2c6 = &i2c6;
-		i2c7 = &i2c7;
-		serial0 = &uart0;
-		serial1 = &uart1;
-		serial2 = &uart2;
-		serial3 = &uart3;
-		serial4 = &uart4;
-		serial5 = &uart5;
-		serial6 = &uart6;
-		serial7 = &uart7;
 	};
 
 	cpus {
-- 
2.47.2


