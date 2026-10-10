Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6D2CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 21:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F8h9caa03+mAXDRTltG3HpBxyhzOfOEpM5VIdPbmS6A=; b=oHhLcT7/Pxht2LzYgENFqB/BPw
	N8zLyHp/roIjIdhAFOUoMSgyaqB1nJMo93VfC5Wo2PX2UWXi6R7jM5d4M30KzOw589dlnbNY0YQNH
	uctuJFR45iyO58rqoKUjeHMT7hndd0Mk0u+LDCm+6vxEnN8umiBfABWoJB9rP2Xz8obD2Ik0O2AzY
	cWIEXMGasmklu5iiedR2d5KNP1cgF51xBjzPpJtoaTWS97I1uQc5TWWpSOZYt7Aft5NFVzGN+IpFt
	pMs0dPfF6uMMtmQ303F7n58mscffijj4YIhADnOUW9nSMdKAfyNh5xUQkwcvEWrBwYAtCQByJ2kmd
	ul4bwrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFezl-00000008T90-28hN;
	Sat, 10 Oct 2026 21:52:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFezk-00000008T8m-2qpO;
	Sat, 10 Oct 2026 21:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75DB64395D;
	Sat, 10 Oct 2026 21:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 547F0C2BCB9;
	Sat, 10 Oct 2026 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791669163;
	bh=Jt9lrBGcJBOCbR0/BQca+PmH5rou2oQfF7483YIkgk8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QG8LxyBrpbIixDBBGR/PFjkasgqHlKi3zumJcZqFHFAjZaMU8kM+b8ekN7MiDMsh+
	 BR1nyGiyaFPt7Tz1AombZje58t7vbev6lrYUGQarPBQbv/TLX8dXR8y4qhFCxqYkBZ
	 u2zPb+2EieIJQtSiYj1V0JaFbSuiPOa88mCApqa8KlvnTBhJ3ei+zTSEgLpAjoB5e0
	 mJXoJzKv+4otbhQTnL8ufNBCcHKlKZCpJJsEXnLY9JjdWQwsqlRR7CGRj3HEMjnz9y
	 W13ZXcEbfd1/ony2eyxPjDTao1SaJJpxo8MtXwjs7JPYKxnPo2jUQD2aSBl2IsK+9y
	 TKBZbLHqkiMBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C40CA9EC5;
	Sat, 10 Oct 2026 21:52:43 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 11 Oct 2026 00:52:37 +0300
Subject: [PATCH] arm64: dts: rockchip: Enable HS400 enhanced strobe on
 Kobol Helios64 eMMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
X-B4-Tracking: v=1; b=H4sIAKWzymoC/x3MSQqAMAxA0atI1gZareNVxIW20QacaECE4t0tL
 t/i/whCgUmgzyIEuln4PBJ0noH107ESskuGQhW1VlrjbNDTxqfUBmnfLXoxSmFnm9YsZeVa5yD
 FV6CFn388jO/7AYMeeiVoAAAA
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=aUbqlnQGl5qV5hXARJBMfnnwJzS8qvfPcSClzVZ69Co=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmnNq881tJuwHt9EyfLvruOpdqcDfvdVeuiflXl/ktc8
 2rFQi+DjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjCRbfcY/gquX/Z359py5Ymr
 5X72q/Mvij4WlXK9+NzhgFV/zoisFTnC8D9W/unuafM1JZ4u7lc8aLNuWhVnouzOq8tPqN5vvhk
 izskCAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The eMMC of Helios64 runs in HS200. Run it in HS400 enhanced strobe at
150 MHz, as on Gru. The strobe line goes straight from the SoC to the
DS pin of the eMMC with no pull-down on the board, so enable the one
in the eMMC PHY.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Schematic, sheet 14:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Tested on mainline with three 2 GiB write and read-back passes, no
errors. Raw reads go from 180 MB/s in HS200 to 247 MB/s. Without the
pull-down, writes dropped to about 1 MB/s with repeated
"mmc1: running CQE recovery".
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..f78482c4c285 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -320,6 +320,7 @@ &cpu_l3 {
 };
 
 &emmc_phy {
+	rockchip,enable-strobe-pulldown;
 	status = "okay";
 };
 
@@ -586,8 +587,11 @@ &saradc {
 };
 
 &sdhci {
+	assigned-clock-rates = <150000000>;
 	bus-width = <8>;
 	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
 	non-removable;
 	vqmmc-supply = <&vcc1v8_sys_s0>;
 	status = "okay";

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261011-b4-helios64-emmc-hs400-9c784f35d8dd

Best regards,
-- 
Igor Velkov <iav@iav.lv>



