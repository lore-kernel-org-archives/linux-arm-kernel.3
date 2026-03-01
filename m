Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD759FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tuWIy4DCooOrYRc/SHhjLAJnv+H6KSvnLcC0yCSn9Kw=; b=kxxiTqw5aaiKaySStmHOYdp/7n
	A0rxxbATEZjrTFYpu0xd8ZuR1ClPKnn43MmykJ5NjHstsJqjn3nY61ikRfv6cTNwemTQnLrenM9/U
	rO/dTdDWX2Y8+vddhi9+qB5DQCCS7aTxDtIP+7mIYEyHjexYGYex8iwweCZetJHhMsNM+x4VFE2cg
	s6Of6vDe2q/e76aDeHUp6DVmY+TbhZbV9EOcoudWpBOXaTpWYqTEOwdzJ/IDJ+MvoqQkp8iKTxeUO
	WqLBcPwzE7Zb8wWLHDWGfBjAoNmfRZA+yrK0Wg10zAW1Azne3RlXjWK2SVG8Wjad0GyEF4njq/+VH
	0iX+7S5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVWa-0000000AVSz-3fXW;
	Sun, 01 Mar 2026 01:23:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVWY-0000000AVS8-486a;
	Sun, 01 Mar 2026 01:23:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B5BF600AE;
	Sun,  1 Mar 2026 01:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A39C19424;
	Sun,  1 Mar 2026 01:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328189;
	bh=m90CLQXYe0lP2Ieo4mdXrBevUl+U4rgL6lH3gYQu9aI=;
	h=From:To:Cc:Subject:Date:From;
	b=hOWJ7Unjnu9JK9AAjzmZpraRoDSIg6T4dF89ntK/M25ScyPRPPJyK73nxW86AIBbR
	 1MIWB6RF1h+F7rXnXDGdlxQS44tBSzxDc6gRw9YEm7WQZW9spKEjlJExW9svSoxImE
	 sx3vyjUHED41BCL68cMcdXfNLiVqhkiK7ezF6Mi7cftXtB8j6E79Ogvk/gJYO972aK
	 yQhNB+egWgpJOVhr+5GCLmtwXkKvrPdJbcgSld9cs4pZFNZEQ1mgC42VjwuevNt4VC
	 9I3EDrbcpPbT2cqLIKOcl6+TKCbPve5A7gMbt2kpbwRfoTqpPoihWrAHnHv+vCFb/P
	 m2Gbe76DdHd2w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	shawn.lin@rock-chips.com
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: FAILED: Patch "arm64: dts: rockchip: Fix rk3588 PCIe range mappings" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:23:07 -0500
Message-ID: <20260301012308.1679779-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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

From 46c56b737161060dfa468f25ae699749047902a2 Mon Sep 17 00:00:00 2001
From: Shawn Lin <shawn.lin@rock-chips.com>
Date: Mon, 5 Jan 2026 16:15:29 +0800
Subject: [PATCH] arm64: dts: rockchip: Fix rk3588 PCIe range mappings

The pcie bus address should be mapped 1:1 to the cpu side MMIO address, so
that there is no same address allocated from normal system memory. Otherwise
it's broken if the same address assigned to the EP for DMA purpose.Fix it to
sync with the vendor BSP.

Fixes: 0acf4fa7f187 ("arm64: dts: rockchip: add PCIe3 support for rk3588")
Fixes: 8d81b77f4c49 ("arm64: dts: rockchip: add rk3588 PCIe2 support")
Cc: stable@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
Link: https://patch.msgid.link/1767600929-195341-2-git-send-email-shawn.lin@rock-chips.com
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa74e8d7b4e95..f79e54c14ff0a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2019,7 +2019,7 @@ pcie2x1l1: pcie@fe180000 {
 		power-domains = <&power RK3588_PD_PCIE>;
 		ranges = <0x01000000 0x0 0xf3100000 0x0 0xf3100000 0x0 0x00100000>,
 			 <0x02000000 0x0 0xf3200000 0x0 0xf3200000 0x0 0x00e00000>,
-			 <0x03000000 0x0 0x40000000 0x9 0xc0000000 0x0 0x40000000>;
+			 <0x03000000 0x9 0xc0000000 0x9 0xc0000000 0x0 0x40000000>;
 		reg = <0xa 0x40c00000 0x0 0x00400000>,
 		      <0x0 0xfe180000 0x0 0x00010000>,
 		      <0x0 0xf3000000 0x0 0x00100000>;
@@ -2071,7 +2071,7 @@ pcie2x1l2: pcie@fe190000 {
 		power-domains = <&power RK3588_PD_PCIE>;
 		ranges = <0x01000000 0x0 0xf4100000 0x0 0xf4100000 0x0 0x00100000>,
 			 <0x02000000 0x0 0xf4200000 0x0 0xf4200000 0x0 0x00e00000>,
-			 <0x03000000 0x0 0x40000000 0xa 0x00000000 0x0 0x40000000>;
+			 <0x03000000 0xa 0x00000000 0xa 0x00000000 0x0 0x40000000>;
 		reg = <0xa 0x41000000 0x0 0x00400000>,
 		      <0x0 0xfe190000 0x0 0x00010000>,
 		      <0x0 0xf4000000 0x0 0x00100000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 6e5a58428bbab..a2640014ee042 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -375,7 +375,7 @@ pcie3x4: pcie@fe150000 {
 		power-domains = <&power RK3588_PD_PCIE>;
 		ranges = <0x01000000 0x0 0xf0100000 0x0 0xf0100000 0x0 0x00100000>,
 			 <0x02000000 0x0 0xf0200000 0x0 0xf0200000 0x0 0x00e00000>,
-			 <0x03000000 0x0 0x40000000 0x9 0x00000000 0x0 0x40000000>;
+			 <0x03000000 0x9 0x00000000 0x9 0x00000000 0x0 0x40000000>;
 		reg = <0xa 0x40000000 0x0 0x00400000>,
 		      <0x0 0xfe150000 0x0 0x00010000>,
 		      <0x0 0xf0000000 0x0 0x00100000>;
@@ -462,7 +462,7 @@ pcie3x2: pcie@fe160000 {
 		power-domains = <&power RK3588_PD_PCIE>;
 		ranges = <0x01000000 0x0 0xf1100000 0x0 0xf1100000 0x0 0x00100000>,
 			 <0x02000000 0x0 0xf1200000 0x0 0xf1200000 0x0 0x00e00000>,
-			 <0x03000000 0x0 0x40000000 0x9 0x40000000 0x0 0x40000000>;
+			 <0x03000000 0x9 0x40000000 0x9 0x40000000 0x0 0x40000000>;
 		reg = <0xa 0x40400000 0x0 0x00400000>,
 		      <0x0 0xfe160000 0x0 0x00010000>,
 		      <0x0 0xf1000000 0x0 0x00100000>;
@@ -512,7 +512,7 @@ pcie2x1l0: pcie@fe170000 {
 		power-domains = <&power RK3588_PD_PCIE>;
 		ranges = <0x01000000 0x0 0xf2100000 0x0 0xf2100000 0x0 0x00100000>,
 			 <0x02000000 0x0 0xf2200000 0x0 0xf2200000 0x0 0x00e00000>,
-			 <0x03000000 0x0 0x40000000 0x9 0x80000000 0x0 0x40000000>;
+			 <0x03000000 0x9 0x80000000 0x9 0x80000000 0x0 0x40000000>;
 		reg = <0xa 0x40800000 0x0 0x00400000>,
 		      <0x0 0xfe170000 0x0 0x00010000>,
 		      <0x0 0xf2000000 0x0 0x00100000>;
-- 
2.51.0





