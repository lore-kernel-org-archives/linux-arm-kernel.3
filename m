Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5C4C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 12:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yijT+gdpaYs2r1XU6nJ4ndIOkwOZMdtGf1e/aQOrxU=; b=2YdgoWly7XkkjqsasxWQ05vyO+
	luJ34GeD6saSLponYw+TTW8Vxb8LjHMiN3zRFujv+UttOsPEqaBB/naBrEJGMS4Y52eJON2bflON7
	H4diJ/W+3agINQdWUmoimcdMxQRGXDx+XjkYv+ari6/JuPIiCaRFonf52IupD3hBoVBqg194QpIUP
	GZ5eicbO5kCnvjAR0uTObIgN4svQKLd7Y/1rTKWNu51x/DUyLmcboLVuPV7x2hiNxPLVZxmmAJTWw
	CqYdmlDWG/4UQEV04LgkZpTDqlYove/ZJM28MXvm4yjcIHfjvs6NFbxqJv87s65FcKRKeEh5fO57e
	6qj7z/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u678p-00000001HYq-233O;
	Sat, 19 Apr 2025 12:17:51 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6751-00000001HFp-3AVm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 12:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=7yijT
	+gdpaYs2r1XU6nJ4ndIOkwOZMdtGf1e/aQOrxU=; b=pw8xGmfA246B8PoU43Nkq
	/kWzzId4XKkEVU6HT/eWAGqBru+wsa51ut1jACxiJJiC2uDYLoxrirc9m6E/sDK2
	jdt1yIN0t6Wpf4qu8mgg2RLfG0Fyw39jnkgqlBqijeGaHIp6FqeBKBQIqpqhdoIc
	Cy1pyx+7SptNP0rivelTtE=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBn3XtnkwNoWWZ+BA--.31074S4;
	Sat, 19 Apr 2025 20:13:32 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable HDMI audio outputs for Cool Pi CM5 EVB
Date: Sat, 19 Apr 2025 20:13:18 +0800
Message-ID: <20250419121326.388298-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250419121326.388298-1-andyshrk@163.com>
References: <20250419121326.388298-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBn3XtnkwNoWWZ+BA--.31074S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWxJFy5try3ArW7JFyUtrb_yoWDtrc_ta
	y7W3W0yFWfuF4UG3srJayUJrWxK397WFW5Ja4xZFWDCas5tanrJFWrJFW3Xw1DWFy29F4x
	Aa1qyrn7CwnFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRJEf5UUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAE0XmgDj2JzwgABs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_051356_145707_5ADC229A 
X-CRM114-Status: UNSURE (   8.59  )
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

Enable audio outputs for two HDMI ports on Cool Pi CM5 EVB

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index 4e1b05c698ded..d44c7329ccc73 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -132,6 +132,10 @@ &hdmi0 {
 	status = "okay";
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &hdmi0_in {
 	hdmi0_in_vp0: endpoint {
 		remote-endpoint = <&vp0_out_hdmi0>;
@@ -162,6 +166,10 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -170,6 +178,14 @@ &hdptxphy1 {
 	status = "okay";
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
 /* M.2 E-Key */
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
-- 
2.43.0


