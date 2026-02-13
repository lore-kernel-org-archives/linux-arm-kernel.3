Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57363ECD6F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 02:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHYlgiH8FK2sQyxWKQp/tla3kzwN+Y1FZr+Gzky8x+Y=; b=HOiFlE6chPrECliXCVdI39ummH
	VkWIcfYymws5OPwDSocgO5bUor1u8kaCwmUxPwV+xunVPecMwu9yPFCfOKUq1dymyewRmmwlSe1e5
	EbuNmQdhYAhGAC3H5X1+1buPFvB7Qh0vXP8dkpJ7AH01w9Ml0X/oRz0y1y1SxWQ3JeaotQ2hbLlaJ
	HdARqdYQmGH119UkqFNrWP0QixrMVJumlLt4a1+e1AVBSukGFXxtDXso+6Nq+VfsPgv0vcNcIoQEL
	/A8KY9TES1xtHMyBJNczwiHNI6pfrZaKVYgSjuN5o/1X5sY1gVU6cMRtavNRlWOo5u0dHmSgzZYdy
	RYF/Rt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqj20-00000002rcf-436O;
	Fri, 13 Feb 2026 02:35:44 +0000
Received: from mail-m10141.netease.com ([154.81.10.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqj1w-00000002rbO-0ZiV;
	Fri, 13 Feb 2026 02:35:42 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3409df705;
	Fri, 13 Feb 2026 10:35:33 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add domain-supply for pd_rkvdec0/1 and pd_venc0/1
Date: Fri, 13 Feb 2026 10:35:13 +0800
Message-Id: <1770950113-19802-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9c54da869209cckunm7ce1e19a254a04
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5MQlZDTU8dSRpDSkkZQklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ijxpvO8+87+eAZ7JpjpXkBnSccKqfa7dpLXdA1Kvkbh5kLUAE7N0la1cMcj1QT0q+b+yprGkb5SkUqFIs03w/w0NJqlNRd8/0YqsmUtivGt2uGrjt6fQd+bFlhwz5M9k+8+X1BXj+Tx+hkVVw9Uuips1b5Fa+DtoA99iXd2OHqk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=DHYlgiH8FK2sQyxWKQp/tla3kzwN+Y1FZr+Gzky8x+Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_183540_727017_EE00721E 
X-CRM114-Status: GOOD (  12.38  )
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

The power domains pd_rkvdec0/1 and pd_venc0/1 depend on two voltage supplies,
vdd_vdenc_s0 and vdd_vdenc_mem_s0. These supplies might be missing or cause probe
deferral. Since the Rockchip power domain management code currently supports managing
only one power supply, and both supplies belong to the same PMIC (making it highly
unlikely for one to be available while the other is not), a practical solution is
implemented.

Both supplies are configured with the boot-on and always-on properties. Only one
of them is assigned as the domain-supply for pd_rkvdec0/1 and pd_venc0/1. This allows
the power domain code to perform a nominal enable operation on this single supply,
thereby successfully acquiring a reference to both supplies (as they are from the same
PMIC). The system then relies on their boot-on and always-on flags to maintain the
correct state.

Crucially, this approach handles cases like probe deferral correctly:
if the PMIC is not yet ready, enabling the power domain will be deferred until the
necessary supplies become available.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts  | 16 ++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index c9d284c..09bc7b6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -568,6 +568,22 @@
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_rkvdec0 {
+	domain-supply = <&vdd_vdenc_s0>;
+};
+
+&pd_rkvdec1 {
+	domain-supply = <&vdd_vdenc_s0>;
+};
+
+&pd_venc0 {
+	domain-supply = <&vdd_vdenc_s0>;
+};
+
+&pd_venc1 {
+	domain-supply = <&vdd_vdenc_s0>;
+};
+
 &pinctrl {
 	audio {
 		hp_detect: headphone-detect {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
index f820505..25d80b6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
@@ -381,6 +381,22 @@
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_rkvdec0 {
+	domain-supply = <&vdd_vdenc_s0>;
+};
+
+&pd_rkvdec1 {
+	domain-supply = <&vdd_vdenc_s0>;
+};
+
+&pd_venc0 {
+	domain-supply = <&vdd_vdenc_s0>;
+};
+
+&pd_venc1 {
+	domain-supply = <&vdd_vdenc_s0>;
+};
+
 &pinctrl {
 	audio {
 		hp_detect: headphone-detect {
@@ -580,6 +596,7 @@
 			vdd_gpu_mem_s0: dcdc-reg5 {
 				regulator-name = "vdd_gpu_mem_s0";
 				regulator-boot-on;
+				regulator-always-on;
 				regulator-min-microvolt = <675000>;
 				regulator-max-microvolt = <950000>;
 				regulator-ramp-delay = <12500>;
-- 
2.7.4


