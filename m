Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15938EEA87C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 02:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XxmK3HFmssnRdG1OE46jOlrclI9LI/rr1ZSnQt+y304=; b=4vEtyh8ct/tI9QwpMhv/CwoTEH
	Fi8tR+LGQ6sWxt1+Q7r8+NyQvYEnv0Xory9Ml9jWakCoTaKZBEwkd6vi1dy1gYaPXRRiOxkWCIksN
	6GTesMzWA9blMk0FIWirbDY23iYalaNDcEzosEb4Dp7Q7pa/tIWXDHKhBoPp3+JANafDCWYWWQg5Z
	SBvTxLmTQrMemvBcPJMdaXJyVFErhdEP2Izh6i4l26qt7aCEjkgYRtZ+QeJL9qYwNZwlX0g+OXjFF
	hKWPDONFoEquM3MZbVb+k21EmUwvnj6Yektjt3aj393DT2g+KYaqN+YASPnmJGIVznH1DAO9RZ780
	oaE5+rtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqj21-00000002rcz-25nA;
	Fri, 13 Feb 2026 02:35:45 +0000
Received: from mail-m10141.netease.com ([154.81.10.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqj1w-00000002rbM-0c1Q;
	Fri, 13 Feb 2026 02:35:43 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3409df6f7;
	Fri, 13 Feb 2026 10:35:31 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: add node name for RK3588_PD_RKVDEC0/1 and RK3588_PD_VENC0/1
Date: Fri, 13 Feb 2026 10:35:12 +0800
Message-Id: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0a9c54da7c2909cckunm7ce1e19a2549dd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhLS1ZNSkpLT0JPQxkeGEtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ow98jb3en+4ABLKZwDKWCanlnkreYzVQ3QaJjiV6sHDwiUz3uZA601kZJj6VyNDJg/4DxmlAvDKKPdWfb/4Z7TzVxKYaqyoNQF6rP8cgkk/v7uBzxUQdKD4hVTFYM0FhgLCtOMigsAvu6d6wyNkFwVSifIwI8O09TuErd3V6hrA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=XxmK3HFmssnRdG1OE46jOlrclI9LI/rr1ZSnQt+y304=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_183540_729168_73E1EF5A 
X-CRM114-Status: UNSURE (   9.24  )
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

Thus the board dts files could add property for these nodes.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 7fe9593..4fb8888 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -907,7 +907,7 @@
 				#size-cells = <0>;
 				#power-domain-cells = <0>;
 
-				power-domain@RK3588_PD_RKVDEC0 {
+				pd_rkvdec0: power-domain@RK3588_PD_RKVDEC0 {
 					reg = <RK3588_PD_RKVDEC0>;
 					clocks = <&cru HCLK_RKVDEC0>,
 						 <&cru HCLK_VDPU_ROOT>,
@@ -917,7 +917,7 @@
 					pm_qos = <&qos_rkvdec0>;
 					#power-domain-cells = <0>;
 				};
-				power-domain@RK3588_PD_RKVDEC1 {
+				pd_rkvdec1: power-domain@RK3588_PD_RKVDEC1 {
 					reg = <RK3588_PD_RKVDEC1>;
 					clocks = <&cru HCLK_RKVDEC1>,
 						 <&cru HCLK_VDPU_ROOT>,
@@ -926,7 +926,7 @@
 					pm_qos = <&qos_rkvdec1>;
 					#power-domain-cells = <0>;
 				};
-				power-domain@RK3588_PD_VENC0 {
+				pd_venc0: power-domain@RK3588_PD_VENC0 {
 					reg = <RK3588_PD_VENC0>;
 					clocks = <&cru HCLK_RKVENC0>,
 						 <&cru ACLK_RKVENC0>;
@@ -937,7 +937,7 @@
 					#size-cells = <0>;
 					#power-domain-cells = <0>;
 
-					power-domain@RK3588_PD_VENC1 {
+				pd_venc1: power-domain@RK3588_PD_VENC1 {
 						reg = <RK3588_PD_VENC1>;
 						clocks = <&cru HCLK_RKVENC1>,
 							 <&cru HCLK_RKVENC0>,
-- 
2.7.4


