Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E9CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZmgR8hdgtrNlI67KeHYucu9rjYmA/NUmX4FdH8skoWU=; b=SDT4GJbAQBa1ObeJkw3i5ArJr6
	Qc5hozSNeZ2Nm5MXh8avTKEIJWGu8GkLvrBr6uqmvnqUA2ATof6yo9X7nR2fbRUkgeeROyhqd4Q9F
	7aaC/DIZdbvLY+S8D6niGrOGeplxonKsedbCBUSlAa2fopAdjZXLSmTgzhOWsNrlrqv5IcqLV41wn
	px9ly6feMYMs3PU/3n+f17B6i/ei4flh/yuxiIVVa6IaalmiOvATqoPSzMg9NO+wa4lU4nnktkE9M
	xpFuj6qWLYF2bTkeSLFqpL7nV/qpIyZeICK9+/VYuGyrsB1kfqmy6wB4z8/0JoOix7OqyjdY0XKvr
	K7H1xDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uupmg-00000007RP2-1c8y;
	Sat, 06 Sep 2025 10:04:38 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uupjq-00000007Qnd-4Bos;
	Sat, 06 Sep 2025 10:01:44 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1757152893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZmgR8hdgtrNlI67KeHYucu9rjYmA/NUmX4FdH8skoWU=;
	b=Xd3P8MYD2wgVHWudwHHxa2XNU4NbBnpT7XvFAmkF5w3Mp2uHK7uxgbBQ4v7EDxsc/PWN4k
	DAW/EEW4nWw9tl+KpgY98fxqLmTDdMQWAovv0hAE2gQlJ2K8P9xTi7hER9ecAG/ndLT5Qv
	wJx2pYxW5vmWMsGF1CWwkH8miGBTk5+97ZFIwzi15IWdKiqWDEX2876MEwKmWsF/+w/xXQ
	DrxFTZAsqYJWRVLhSsq6/6SgwhC836thHoEz3EQIwOMd6hdSJSPPJzr4QpANOF6Fvivi8n
	P+kQZJjLZGrjcb/4Zp5Aa902R7pcFjzyIX3bwaM2Zb/SA4xO+ADMvl+DgzLOSA==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Make RK3588 GPU OPP table naming uniform
Date: Sat,  6 Sep 2025 12:01:22 +0200
Message-Id: <355c16ab070688fc6285e0d4419eb54a3f699eee.1757152740.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_030143_248999_E0018B66 
X-CRM114-Status: UNSURE (   8.39  )
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

Unify the naming of the existing GPU OPP table nodes found in the RK3588
and RK3588J SoC dtsi files with the other SoC's GPU OPP nodes, following
the more "modern" node naming scheme.

Fixes: a7b2070505a2 ("arm64: dts: rockchip: Split GPU OPPs of RK3588 and RK3588j")
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
index 0f1a77697351..b5d630d2c879 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
@@ -115,7 +115,7 @@ opp-2400000000 {
 		};
 	};
 
-	gpu_opp_table: opp-table {
+	gpu_opp_table: opp-table-gpu {
 		compatible = "operating-points-v2";
 
 		opp-300000000 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
index 9884a5df47df..e1e0e3fc0ca7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
@@ -66,7 +66,7 @@ opp-1608000000 {
 		};
 	};
 
-	gpu_opp_table: opp-table {
+	gpu_opp_table: opp-table-gpu {
 		compatible = "operating-points-v2";
 
 		opp-300000000 {

