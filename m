Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9D2CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 05:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=INDwu74SUZqMLDFJ75XtVfARPgjTW9Gu5nodYyc+mxU=; b=xY1g1lElmLHdD3yyyWrUuP177H
	/h/M5gf8+ka2MFM5WQg3zl3xQur+u/UT1mrxnEpzC9W2vZOC5i3Tno8crlj2w+m+q2gqbiAGTc9ZE
	dv1wo14IWcPA7OX1TfKSSY14MtFJ3jrmANKhhRl5t3xeXAnLMucdOMMkN7aKVw7N/SNjFSrjPLN4Z
	olvNNrbxAy7hMs8g87CGDeq17F+w/l+BCUySxMy4TRG4jUqJgOo277QMh+/RvbrLKUZCzJau09bfu
	/Qbu95v+IPtMhIHPeqKQly1eDmmFyx7Kk0JRrEp009gDD1BE31bs7Mltl0tYmjEtdjEU31pQRRePh
	i0z4zwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxuU-0000000FtBR-2Miu;
	Thu, 21 Aug 2025 05:32:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxru-0000000FszV-114c;
	Thu, 21 Aug 2025 05:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA8D942B81;
	Thu, 21 Aug 2025 05:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B327C4CEED;
	Thu, 21 Aug 2025 05:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755754185;
	bh=okRW6FFazSlKUnEisFp7x3V8vbljvh2Ty8xEGZtNcDM=;
	h=From:To:Cc:Subject:Date:From;
	b=fUhvOiMV0uLCi8BqtXnIpiPSOVnByxHq+hizLdvyE3gl8E3jsx36yX8KrdLWTqfs5
	 Ro/K2EmyJx5YrK2asUgQlnfATVohbSfivo8s91EwBhzHc0Hm5Hgt3lC34isdy9jGqx
	 3qMFTvDfGO45qv2VHEynRgP6XG/VqPbfCivfPTLtmhmIaZ62ti+ccDUTy3ACD1ZKKO
	 QUeDzqq3HTA/hcxzDkgr5wiaHY0Zm/iOeOKBCsmLga7kLy4b9Ubiff6mKjdE/rm7JK
	 orNdpjf6+1RMfnDf6QX01zZ3mCoNb7j+OlbazBSVp4+WuVCFC972LRQr08AH9b+XU6
	 rxM7XcccZXxLQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 8A9725FE2C; Thu, 21 Aug 2025 13:29:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: rk3588-orangepi-5: Add supplies for eMMC
Date: Thu, 21 Aug 2025 13:29:39 +0800
Message-Id: <20250821052939.1869171-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_222946_300913_1941463D 
X-CRM114-Status: GOOD (  10.97  )
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

From: Chen-Yu Tsai <wens@csie.org>

The eMMC description is missing both vmmc and vqmmc supplies.

Add them to complete the description.

Fixes: 236d225e1ee7 ("arm64: dts: rockchip: Add board device tree for rk3588-orangepi-5-plus")
Fixes: ea63f4666e48 ("arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index 91d56c34a1e4..8a8f3b26754d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -365,6 +365,8 @@ &sdhci {
 	max-frequency = <200000000>;
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
 	status = "okay";
 };
 
-- 
2.39.5


