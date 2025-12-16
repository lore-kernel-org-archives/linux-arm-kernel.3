Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4617FD609D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LanGjolqYb8hc8BjKu4Jl/gae+WUjm+00+uC32wvsUw=; b=nuH+F5Uv0hiYZZIeWYH/DwbwNu
	8g/jQE5wwFkFuMkR9dHt9/6e9icWH9HHH5PFZF4IWzj0wOAFdV5DRAQj9yZ0aMuFrZwl5uvnaKXpC
	vRnrZj4KHBQ2NzQUbH7Zmo33sY6+7MYh6j7+IGZBhTX+fCi5ZujpsWkZ6W3LNSZp85GSQwK7MaQeO
	tbfm5iq8YLRVjQh9LYY9NkJqUbLK/34xn5GN0rJm3iSZNV6n1EzoCxbtaiMmEmyzbricgX2NyXbWt
	MwwExvIxyVT415AT8+e7XtXhbkn38H8NVsRNxbrMcIwktFPhh3X/0ftd239pEDhyvP6rzEDWH4THQ
	Uw3D8LMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZKa-00000005dfO-43U8;
	Tue, 16 Dec 2025 17:59:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZKY-00000005de1-0Am8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CB2C44502;
	Tue, 16 Dec 2025 17:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7DEC2BC87;
	Tue, 16 Dec 2025 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765907965;
	bh=TIgqwdHAusKqb6Pr4Pt95gvNZkar7d/zsw7q3oG2Xo4=;
	h=From:To:Cc:Subject:Date:From;
	b=ZMlFCyv3BDj6luflKEHj1GArdq2KGur9v2jKniD16lg6x/F3R9vBpAFDEJHl/9pEm
	 ZiSKcH7edyFFUF4BbvlHKTKL+QX0Ox0yH1WIPG1UrKiAlFw9GSpOYQy87w9zbhExi6
	 Eq9mLCZtcaBwVe2F5UIa7eew9vGskn3N1MSJm5BbUa4m8nw9Zf9pbHebl7S/w/BmbN
	 SBBLokUutMeZHvfuA+uufUxwKaquBLquD00xE5F13NUQwYu+bKvvu25JSteLekI9W1
	 evWJczk7TPL1sW3r2caVNVIbaV9kxvID+7cQdZafTOjO29rDAAY9nEYxP0Zc31INBi
	 HX86toooUD0xg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: xilinx: Drop "label" property on dlg,slg7xl45106
Date: Tue, 16 Dec 2025 11:59:13 -0600
Message-ID: <20251216175914.2791200-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_095926_099629_26DEAF76 
X-CRM114-Status: UNSURE (   8.71  )
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

The "label" property is not documented for the dlg,slg7xl45106. Nor is
it common to use for GPIO controllers. So drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
index 02be5e1e8686..d0230da47068 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
@@ -75,7 +75,6 @@ u3: ina260@40 { /* u3 */
 	slg7xl45106: gpio@11 { /* u13 - reset logic */
 		compatible = "dlg,slg7xl45106";
 		reg = <0x11>;
-		label = "resetchip";
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-line-names = "USB0_PHY_RESET_B", "",
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
index b92dcb86e87e..5d1f031bbd89 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
@@ -103,7 +103,6 @@ u14: ina260@40 { /* u14 */
 	slg7xl45106: gpio@11 { /* u19 - reset logic */
 		compatible = "dlg,slg7xl45106";
 		reg = <0x11>;
-		label = "resetchip";
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-line-names = "USB0_PHY_RESET_B", "USB1_PHY_RESET_B",
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
index 99ad220d13d6..1d5c95bd6073 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
@@ -104,7 +104,6 @@ u14: ina260@40 { /* u14 */
 	slg7xl45106: gpio@11 { /* u19 - reset logic */
 		compatible = "dlg,slg7xl45106";
 		reg = <0x11>;
-		label = "resetchip";
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-line-names = "USB0_PHY_RESET_B", "USB1_PHY_RESET_B",
-- 
2.51.0


