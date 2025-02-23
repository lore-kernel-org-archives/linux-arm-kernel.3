Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB936C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qjFPs7F+XO2HKOCjLIfMrNdfI+E1rn21TAwcThQVHuY=; b=04uxZr6ip+duGk+F8dJNpClRfK
	xEInHzI1CBFcOVXse4CYqGSH52PIxJskWnHgwdpW9U3zm+HBOf1Iz4V4ssQJaEDfoAf3HG8XcFyyv
	YlLS7b3b6XyEFxTxkLFDr32gZbUYmaQpNET85rkgfGWXrAQZapWE2VaVaqC+ZqNdJfflK8dcPleyJ
	/kAD7nSqw4YlDxDm4f+RWisaUXIXGKvYzMxJBIu7tqNSm5hoJlCsT8iLRnLJNTgFfC6M+yJZSelbH
	OdGSyB24GFdSqDvc9ZYGte4zIDCoXLBGntHqhQQ5+h8LQ6Ajm0NI1ejFPUoPC0Ai0mVQTRWVUaNil
	TypR1nmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8vp-0000000Aq0l-1M1U;
	Sun, 23 Feb 2025 10:09:53 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8uJ-0000000ApsJ-3jR1;
	Sun, 23 Feb 2025 10:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=qjFPs
	7F+XO2HKOCjLIfMrNdfI+E1rn21TAwcThQVHuY=; b=Sx0V7dpmMVrZUXv0rakZC
	zIjXW0B/u+sl4ab7/wRyY0E+JnewWZ9IHAjKHMth5x5pw41DM2iEbSvmgfgamvar
	srJxuEXRvzGGY8c7yocIc5e2ZiiYsFtPi3c+08riuylQIDzkFZ1pisAftAy7dmkz
	KMi+uoOquINEinH7G2tfq4=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnX7t+87pn0ncQOA--.33463S2;
	Sun, 23 Feb 2025 18:08:02 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH] arm64: dts: rockchip: Enable USB3 OTG on rk3588s Cool Pi 4B
Date: Sun, 23 Feb 2025 18:07:46 +0800
Message-ID: <20250223100757.73531-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnX7t+87pn0ncQOA--.33463S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtryrKr47KF1rZryUtFy3CFg_yoW8JF1fp3
	srCrW3Jrs3Wr4rAas8tr1Skrs3Aws5JFWfArn3A3ZIyF42g34kZr1rG3s3Zr4YqrW3Gayr
	CF1vgFy2gF4DtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi7KIdUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBj8Xme65IDlCwABsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_020820_284481_687B4780 
X-CRM114-Status: UNSURE (   8.01  )
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

Enable USB3 OTG and it's related PHY node. And the PHY will
also be shared with the upcoming DisplayPort controller.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 9c394f733bbf..7faf189c4776 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -803,6 +803,14 @@ &tsadc {
 	status = "okay";
 };
 
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
 &u2phy2 {
 	status = "okay";
 };
@@ -832,6 +840,16 @@ &uart9 {
 	pinctrl-0 = <&uart9m2_xfer &uart9m2_ctsn>;
 };
 
+&usbdp_phy0 {
+	/*
+	 * USBDP PHY0 is wired to a USB3 Type-A OTG connector. Additionally
+	 * the differential pairs 0+1 and the aux channel are wired to a
+	 * mini DP connector.
+	 */
+	rockchip,dp-lane-mux = <0 1>;
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
@@ -840,6 +858,11 @@ &usb_host0_ohci {
 	status = "okay";
 };
 
+&usb_host0_xhci {
+	extcon = <&u2phy0>;
+	status = "okay";
+};
+
 &usb_host1_ehci {
 	status = "okay";
 };
-- 
2.43.0


