Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC460E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 10:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5c1RHmM1cAEbY78r+MfYlRCpJaIAWuqFWRnpFbls3KQ=; b=m18QL979fxr2daAFLn3qyl42Uc
	eIJT40PmJRXykVyTwa6fXxVsXmFkNV+NqMDEhbVineuXCqUWL/Mw7hcUO8vvLIFMNnQrZjEckWWnc
	cQA6YL0za5/9IeDLxYNYUsPQTvdcHgl4v1o1bC5tl/1jtTnrWGLqpxd6Ch9cjz/0ftqAiYOSApm/C
	D9dSGlqklXQPFNivdMczieHBquZnloSXoO8kMf69ZIZ9rHpW8BhuOqkZX2VjUZKOTGTZd0Og/9RJ8
	TcGSa6niua3GKOqs8TY8HCLde5wpyYadkKiv2/NK6naJyGnI2BlzTyAdNS/jCS2Lz2BaJdAtJdwKB
	GnTLsjaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXI1O-00000004owF-2yUG;
	Mon, 13 Jan 2025 10:50:14 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXI09-00000004or9-2o3B;
	Mon, 13 Jan 2025 10:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=5c1RH
	mM1cAEbY78r+MfYlRCpJaIAWuqFWRnpFbls3KQ=; b=Zfbkp5MI6rmFx5UBaJKVP
	6ELrl3UVDnJdlamQ37p5b+pdEW0tdNmeVaFgj/oMp5Pia9ZkHFxqRlEWosynsf/g
	209D1pa/+gHCgZNef2pXulNw6lIQ2dOssT3YN988KZwo6wmITFSxzi3SrLXlz5rX
	++ZWGa6yc/LEzHE2yDCtsE=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3_yB874RnnvU5Fw--.18888S2;
	Mon, 13 Jan 2025 18:48:33 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	dsimic@manjaro.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH] arm64: dts: rockchip: Fix lcdpwr_en pin for Cool Pi GenBook
Date: Mon, 13 Jan 2025 18:47:34 +0800
Message-ID: <20250113104825.2390427-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_yB874RnnvU5Fw--.18888S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtr48Kr1rtryUWr4UXFy8uFg_yoW8JrW3pw
	nxC397KF97WryUtF4qg3ZxJrs5Cw4Dtan0kr97XryxtF4fZF1DJ3W2gwn3CF1DXr4Iva1r
	uFsagry7WF1DZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRuHq7UUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hzTXmeE551qTAABs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_024858_147543_4B38215C 
X-CRM114-Status: UNSURE (   9.65  )
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

According to the schematic, the lcdpwr_en pin is GPIO0_C4,
not GPIO1_C4.

Fixes: 4a8c1161b843 ("arm64: dts: rockchip: Add support for rk3588 based Cool Pi CM5 GenBook")
Signed-off-by: Andy Yan <andyshrk@163.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index 92f0ed83c990..bc6b43a77153 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
@@ -113,7 +113,7 @@ vcc3v3_lcd: regulator-vcc3v3-lcd {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_lcd";
 		enable-active-high;
-		gpio = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcdpwr_en>;
 		vin-supply = <&vcc3v3_sys>;
@@ -241,7 +241,7 @@ &pcie3x4 {
 &pinctrl {
 	lcd {
 		lcdpwr_en: lcdpwr-en {
-			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		bl_en: bl-en {
-- 
2.43.0


