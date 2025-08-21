Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F54FCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oihZ0gkhAeN4FC+tmYiLbF2KAXhytmeGm9k4fwMae2U=; b=l9rpAsEMweQ9HAtTT0rxL19iW5
	k/NsK58pzVhZfzFPUSkY2W3xHqaFMptnK8Q53KUWwVPvsqcS5dGMxVXRaeyss+w1aJuFevnXpdw7Z
	BZP16RR0/Qcslg+obARy5NcDD/5orusMNW/PzELsRnIFj52DDC5Vx+tZImsd3/mxG7kKV5CRwU+67
	WljtUr8ezAFS7HM7zxiSeCkKKWf43SgbLnuQXT3wDzCky0W7uhiCiVMIiJD2Y4xlvg8HiWWgWvFUB
	Pl4M6JdkvzmowFTwfjEm3z8Lm8faJn2VWEEf2Wu2pACTBYFBoMtoikn9/j2S8IfMkf8HxMmIfR3yL
	PFpZkJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDwG-00000000oU2-0D98;
	Thu, 21 Aug 2025 22:39:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7jg-0000000HUnT-2AeJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 16:01:57 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1up7jR-0000Iw-4B; Thu, 21 Aug 2025 18:01:41 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx8mp: add interconnect for lcdif-hdmi
Date: Thu, 21 Aug 2025 18:01:37 +0200
Message-Id: <20250821160137.108735-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_090156_551601_2C353328 
X-CRM114-Status: UNSURE (   9.70  )
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

Add the missing interconnect for the lcdif-hdmi.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
- align the list with the dt-bindings list

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 948b88cf5e9d..ca7ec1bb4be5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2046,6 +2046,10 @@ hdmi_blk_ctrl: blk-ctrl@32fc0000 {
 						     "pai", "pvi", "trng",
 						     "hdmi-tx", "hdmi-tx-phy",
 						     "hdcp", "hrv";
+				interconnects = <&noc IMX8MP_ICM_HRV &noc IMX8MP_ICN_HDMI>,
+						<&noc IMX8MP_ICM_LCDIF_HDMI &noc IMX8MP_ICN_HDMI>,
+						<&noc IMX8MP_ICM_HDCP &noc IMX8MP_ICN_HDMI>;
+				interconnect-names = "hrv", "lcdif-hdmi", "hdcp";
 				#power-domain-cells = <1>;
 			};
 
-- 
2.39.5


