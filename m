Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DADDCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R0u2QtKY6DjdWNtmJWntiw0G2jjWFg+XxMaqxMr4OXM=; b=hSqFn9T8g9w4XEZO+xiw6WJyop
	wDBrHC+XOLwG7HVSQYBSCk8g8dTInbcJ6j1C5rhxGNBXkPu2D3H2SSEjYB54gOjmCbHLC752x2F38
	Eq3y/pSgIB6Lf/RGUdFKnlmQwf5NtkfoZvjz81tM8YfCtunZ5uCCYrefn+QaniYUzxDLNRe077V63
	c/VEtjUXM6ooLJbfRG9swBlwzgfAnie8Sjqe7iqnTRWiFxwh9aKgRIhJVtx0EqkSp409HOYJ0d+EA
	6ygaeABCVFrq1O3zQE/KSIQxVnExPnjbPwhuBrodCiE8QYxruVaKo0kxsiCMhArJs2mem0q55Gnde
	3eVd16iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxNRJ-0000000EIS8-1FKR;
	Sat, 13 Sep 2025 10:25:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxNRG-0000000EIQ2-0UGv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 10:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49BA3445D8;
	Sat, 13 Sep 2025 10:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A6FC4AF0B;
	Sat, 13 Sep 2025 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757759101;
	bh=F1Bd2arcxbTkCF48WNm4VUaJPRpk9xfWUd6LNWgngaA=;
	h=From:To:Cc:Subject:Date:From;
	b=txXKhMAAMyPNO2QN8sEOlhqm/B0jycwB+TpbbHXDCOAHEF1XJ2hpharCoYFO223kx
	 nNUDHubMapubYHp9/sme7sUiS43RtYSBfFYqIXSpcI+vgfwAfVjJG3/SNDXgN3JnRR
	 Q1v3L6u+Pt+9eVCQxkpgR2CXl0NXn3R2ZUQZqSUHegNeN8XnqrM11BzGgYLEBqK1d7
	 ODfsqR6ojyC3nXmXeTOeW2vg+l4bP97f3BL9eEsrXGQCxymtzQUJ9yvn0qPsm3aCEb
	 AcQjmGdl1QErVvN1vreOykTbur2X6KUMsjXoECz5AIbHDBk3Yhwg6sRYZvuuQwxnmu
	 VT6+12u0MmMCQ==
Received: by wens.tw (Postfix, from userid 1000)
	id A193C5FC8D; Sat, 13 Sep 2025 18:24:58 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: allwinner: a527: cubie-a5e: Drop external 32.768 KHz crystal
Date: Sat, 13 Sep 2025 18:24:48 +0800
Message-Id: <20250913102450.3935943-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_032502_192871_A6624B1A 
X-CRM114-Status: UNSURE (   9.64  )
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

From: Chen-Yu Tsai <wens@csie.org>

The Radxa Cubie A5E has empty pads for a 32.768 KHz crystal, but it is
left unpopulated, as per the schematics and seen on board images. A dead
give away is the RTC's LOSC auto switch register showing the external
OSC to be abnormal.

Drop the external crystal from the device tree. It was not referenced
anyway.

Fixes: c2520cd032ae ("arm64: dts: allwinner: a523: add Radxa A5E support")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 71074b072184..e333bbaf01d3 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -24,13 +24,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	ext_osc32k: ext-osc32k-clk {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <32768>;
-		clock-output-names = "ext_osc32k";
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.39.5


