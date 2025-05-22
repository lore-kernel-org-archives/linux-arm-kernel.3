Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC04C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 02:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=igD6iNSl2PbIyX8QHiw/SyrEi2EknX4FvWxMHnc6wpg=; b=ATIX3vpXxBbIPybNgiiMnnylDH
	eHFedC02gsKvXV5IrBGfqqnFhvxY5MCuVuRsSELH9OgkDxdvgJQJgmRro/9JTqzL+WLhe6jNLNvqv
	P/2L+Q2Kht6q50WpWg5xN5lSzfwtWw6MQCGbalyD8Adf5iUT/1MjtsIb7qpXDgPtkplCPreUEKBXc
	CWi7V48y15FwRf+e9DTsGHUvWe5b+AZXy3EOz09/zgI0KJ4D32JItuIsqo9s5QMkiSfcC4pKEwwu6
	HQvkYUtZ3CZo7xbr6u0d+HN/02Qu6lyqoq4OQmYiOPjq/YeiojnkrbBwOdDnsnb5r8T3DoWoO0TsH
	IqgC6xtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHvM4-0000000HEyc-2eRF;
	Thu, 22 May 2025 02:08:20 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHvJu-0000000HEnd-0Nv4;
	Thu, 22 May 2025 02:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ig
	D6iNSl2PbIyX8QHiw/SyrEi2EknX4FvWxMHnc6wpg=; b=ZB/cFUMf/jiZkibH7q
	9Dq4/Q+emcVRSC9b5bEFPfPhYVgJ6I06bkYrUoaWI41aLZRf6vrL/sBCMj1PW1vu
	oNDbS7OMwiwe0OSl2wNnT5+nkModI+Yu1fJy807oBZrBEzN/UwX27aP1c3xW4G+R
	TbDQqkgv2kUk81snQbDiIW7uE=
Received: from ProDesk.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgA3oo90hi5oAIjgAA--.31473S2;
	Thu, 22 May 2025 10:05:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: simic@manjaro.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	algea.cao@rock-chips.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2] arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength for rk3588
Date: Thu, 22 May 2025 10:05:24 +0800
Message-ID: <20250522020537.1884771-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgA3oo90hi5oAIjgAA--.31473S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFWDuF17uryDAw4rXF4xZwb_yoW7Zr4kpa
	s7urZI9rykGr1qgFZ5Arn5JF43t39rWwsF93s3J34xXw12qF12ga4xCrsagF98ur48JrWS
	9rs0qFy09r4YvFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jY_M3UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkApVXmgug2FhlAABsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_190606_495790_FF054A4A 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Andy Yan <andy.yan@rock-chips.com>

For the RK3588 HDMI controller, the falling edge of DDC SDA and SCL
almost coincide and cannot be adjusted by HDMI registrer, resulting
in poor compatibility of DDC communication.

An improvement of the compatibility of DDC can be done by increasing
the driver strength of SCL and decreasing the driver strength of SDA
to increase the slope of the falling edge.

It should be noted that the maximum driving strength of hdmim0_tx1_scl
is only 3, which is different from that of the other IOs.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- Correct the max drive level of hdmim0_tx1_scl.

 .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 20 +++++------
 .../dts/rockchip/rk3588-extra-pinctrl.dtsi    |  5 +--
 .../boot/dts/rockchip/rockchip-pinconf.dtsi   | 35 +++++++++++++++++++
 3 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
index 7f874c77410c..6584d73660f6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
@@ -578,14 +578,14 @@ hdmim0_tx0_hpd: hdmim0-tx0-hpd {
 		hdmim0_tx0_scl: hdmim0-tx0-scl {
 			rockchip,pins =
 				/* hdmim0_tx0_scl */
-				<4 RK_PB7 5 &pcfg_pull_none>;
+				<4 RK_PB7 5 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim0_tx0_sda: hdmim0-tx0-sda {
 			rockchip,pins =
 				/* hdmim0_tx0_sda */
-				<4 RK_PC0 5 &pcfg_pull_none>;
+				<4 RK_PC0 5 &pcfg_pull_none_drv_level_1_smt>;
 		};
 
 		/omit-if-no-ref/
@@ -640,14 +640,14 @@ hdmim1_tx0_hpd: hdmim1-tx0-hpd {
 		hdmim1_tx0_scl: hdmim1-tx0-scl {
 			rockchip,pins =
 				/* hdmim1_tx0_scl */
-				<0 RK_PD5 11 &pcfg_pull_none>;
+				<0 RK_PD5 11 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim1_tx0_sda: hdmim1-tx0-sda {
 			rockchip,pins =
 				/* hdmim1_tx0_sda */
-				<0 RK_PD4 11 &pcfg_pull_none>;
+				<0 RK_PD4 11 &pcfg_pull_none_drv_level_1_smt>;
 		};
 
 		/omit-if-no-ref/
@@ -668,14 +668,14 @@ hdmim1_tx1_hpd: hdmim1-tx1-hpd {
 		hdmim1_tx1_scl: hdmim1-tx1-scl {
 			rockchip,pins =
 				/* hdmim1_tx1_scl */
-				<3 RK_PC6 5 &pcfg_pull_none>;
+				<3 RK_PC6 5 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim1_tx1_sda: hdmim1-tx1-sda {
 			rockchip,pins =
 				/* hdmim1_tx1_sda */
-				<3 RK_PC5 5 &pcfg_pull_none>;
+				<3 RK_PC5 5 &pcfg_pull_none_drv_level_1_smt>;
 		};
 		/omit-if-no-ref/
 		hdmim2_rx_cec: hdmim2-rx-cec {
@@ -709,14 +709,14 @@ hdmim2_rx_sda: hdmim2-rx-sda {
 		hdmim2_tx0_scl: hdmim2-tx0-scl {
 			rockchip,pins =
 				/* hdmim2_tx0_scl */
-				<3 RK_PC7 5 &pcfg_pull_none>;
+				<3 RK_PC7 5 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim2_tx0_sda: hdmim2-tx0-sda {
 			rockchip,pins =
 				/* hdmim2_tx0_sda */
-				<3 RK_PD0 5 &pcfg_pull_none>;
+				<3 RK_PD0 5 &pcfg_pull_none_drv_level_1_smt>;
 		};
 
 		/omit-if-no-ref/
@@ -730,14 +730,14 @@ hdmim2_tx1_cec: hdmim2-tx1-cec {
 		hdmim2_tx1_scl: hdmim2-tx1-scl {
 			rockchip,pins =
 				/* hdmim2_tx1_scl */
-				<1 RK_PA4 5 &pcfg_pull_none>;
+				<1 RK_PA4 5 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim2_tx1_sda: hdmim2-tx1-sda {
 			rockchip,pins =
 				/* hdmim2_tx1_sda */
-				<1 RK_PA3 5 &pcfg_pull_none>;
+				<1 RK_PA3 5 &pcfg_pull_none_drv_level_1_smt>;
 		};
 
 		/omit-if-no-ref/
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra-pinctrl.dtsi
index 244c66faa161..fb48ddc04bcb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra-pinctrl.dtsi
@@ -160,14 +160,15 @@ hdmim0_tx1_cec: hdmim0-tx1-cec {
 		hdmim0_tx1_scl: hdmim0-tx1-scl {
 			rockchip,pins =
 				/* hdmim0_tx1_scl */
-				<2 RK_PB5 4 &pcfg_pull_none>;
+				<2 RK_PB5 4 &pcfg_pull_none_drv_level_3_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim0_tx1_sda: hdmim0-tx1-sda {
 			rockchip,pins =
 				/* hdmim0_tx1_sda */
-				<2 RK_PB4 4 &pcfg_pull_none>;
+				<2 RK_PB4 4 &pcfg_pull_none_drv_level_1_smt>;
+
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi b/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
index 5c645437b507..b0475b7c655a 100644
--- a/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
@@ -332,6 +332,41 @@ pcfg_pull_none_drv_level_0_smt: pcfg-pull-none-drv-level-0-smt {
 		input-schmitt-enable;
 	};
 
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_1_smt: pcfg-pull-none-drv-level-1-smt {
+		bias-disable;
+		drive-strength = <1>;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_2_smt: pcfg-pull-none-drv-level-2-smt {
+		bias-disable;
+		drive-strength = <2>;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_3_smt: pcfg-pull-none-drv-level-3-smt {
+		bias-disable;
+		drive-strength = <3>;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_4_smt: pcfg-pull-none-drv-level-4-smt {
+		bias-disable;
+		drive-strength = <4>;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_5_smt: pcfg-pull-none-drv-level-5-smt {
+		bias-disable;
+		drive-strength = <5>;
+		input-schmitt-enable;
+	};
+
 	/omit-if-no-ref/
 	pcfg_output_high: pcfg-output-high {
 		output-high;
-- 
2.43.0

base-commit: 897af18e5d75e7ebf137044d57fed6522c46ae74
branch: linux-rockchip-next


