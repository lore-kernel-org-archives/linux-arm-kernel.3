Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03C5FD004A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oSaLTD96fIVkaCDrdNB7IUOKI7dTu0oUBTQXx8bWYms=; b=2vhGDnXCfmlPN1k6ex+ZV73oAY
	nszEx5saCfAEfTMzlVoi9oLWoYPB9Bj1d5yq3auKMmanCAo+W6l4ElO3gCOKbZcLyQAiUq8uIO8Ul
	JrpmRLlIeo2tX692hp/G800dtQZt1G2wRzz3X0ZmEmhvQwUfyCoYj4ROgpnzl9a+ybcQPa8cbngM4
	33/wqQsEMRLi9ht1mB7cdU8/l6t0EpaGDWocwe9Aih1/FB6KBwWjwlwh5OJ1wFg+pN+PqQBmYXU7t
	2zRYioX4UShvzHTuLpgW//moqHKSXl8K1TG4CnBWkHDJIIUyW3kXQe30asMj5IVFRZcW5hvs0Fkvg
	YwnrZ35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVVi-0000000AVAi-41tM;
	Sun, 01 Mar 2026 01:22:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVVg-0000000AV9M-1LSD;
	Sun, 01 Mar 2026 01:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE4ED405E6;
	Sun,  1 Mar 2026 01:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040D6C19421;
	Sun,  1 Mar 2026 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328135;
	bh=3k7OQsiVcaP5g+1HoaLmipVxH474h+K0lLE9htxoVXU=;
	h=From:To:Cc:Subject:Date:From;
	b=f4bhP5GoUTw4+CHfMm34iAXeBln9EGymb1Vqpb4dpxzeTDmGPRN/z2l4suQm2qFa2
	 DcpvZHHdQ2ZiP2FBIr1rHNcHSD7Cx9MjI9KnrnBz0XUfThNoCmIFaPVhOnMQqCdf9p
	 gf1SbV2hLd2RHXN7OB3J3WXJWedR1Z8WTdDWwz6bekKIzd9LFp9ArPscR7CMsqPDg5
	 UioKbQkDmpbb04Eei470Rz02OjXoLPo/LMiy2yj/ve6+pov/JvAw5/OGVBmdWrCIA4
	 TNsFXv2oPO3LmOKShAPxSR6qFb94s8xOKugpxXFV3bPe+5gTxaZMWCsz+Q6jQi1BhZ
	 XwBQDbiMU+7kQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jerrysteve1101@gmail.com
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: FAILED: Patch "arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:22:13 -0500
Message-ID: <20260301012213.1678405-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_172216_383782_72BAF0E7 
X-CRM114-Status: GOOD (  13.52  )
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From b18247f9dab735c9c2d63823d28edc9011e7a1ad Mon Sep 17 00:00:00 2001
From: Jun Yan <jerrysteve1101@gmail.com>
Date: Fri, 16 Jan 2026 23:12:53 +0800
Subject: [PATCH] arm64: dts: rockchip: Do not enable hdmi_sound node on
 Pinebook Pro

Remove the redundant enabling of the hdmi_sound node in the Pinebook Pro
board dts file, because the HDMI output is unused on this device. [1][2]

This change also eliminates the following kernel log warning, which is
caused by the unenabled dependent node of hdmi_sound that ultimately
results in the node's probe failure:

  platform hdmi-sound: deferred probe pending: asoc-simple-card: parse error

[1] https://files.pine64.org/doc/PinebookPro/pinebookpro_v2.1_mainboard_schematic.pdf
[2] https://files.pine64.org/doc/PinebookPro/pinebookpro_schematic_v21a_20220419.pdf

Cc: stable@vger.kernel.org
Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for Pinebook Pro")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Link: https://patch.msgid.link/20260116151253.9223-1-jerrysteve1101@gmail.com
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index eaaca08a76018..a6ac89567bafe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -421,10 +421,6 @@ &gpu {
 	status = "okay";
 };
 
-&hdmi_sound {
-	status = "okay";
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 	i2c-scl-falling-time-ns = <4>;
-- 
2.51.0





