Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5579CF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ix/dJ6lyl8/XETtDZnfBZBdEH945ub+9EdeKziHv6RE=; b=N09qZzsTBxAMCuxgoXhcGejnqT
	+oRS+/Mr8QT4QujPoV7PL1GWyyBw6sRqlyIzYNmW7z0TwQvvBO90SmxJxBL+o/OWsDKNrxSRQWGl4
	bGjxISCQFjMaliZ2cTJg11/fUE6B3c4bDuP/uilpKwHOSLWaRN/y3dangw2RbFoarg9AiM3yEbUyw
	UZPtaEgIOitzTayZGprAlEDIus62FR70a78tkdhKqgNA6PWUDovK+C+Rjvd40w4fRTZAw+FKZPu//
	LzvETc008yG9lGYOFmXEmMcqZzSFzHbCK4VOSW1On/SGoVDkVTWNz0lOBu8ZlM/lrQ8GBGIDj1yaI
	0uGdawyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ0X-0000000E2jP-0h3m;
	Wed, 07 Jan 2026 02:10:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ08-0000000E2KQ-13YY;
	Wed, 07 Jan 2026 02:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6CAD43F7D;
	Wed,  7 Jan 2026 02:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D35C16AAE;
	Wed,  7 Jan 2026 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751819;
	bh=ie60J03v4TX/7GV2V7dobRqaF0Gx1PdanyG9vMdm8xo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JDp8M6T3BxVKPk0PRUQhcUypsxfTQrVdYoPaxvb9y7UxZ3w3cP4l9v0iEUGx/AVwg
	 j2+qJJR0j1Y+knkEXBdMpp/x+dIiaMMYCjpKAVS8mMBvEYMlp/7gyZEGMTcqshgJoF
	 WtXTmlaegoxIq9RZLMoXT+NwsVqJ46W+M8GXMNTEy+pKr6HeFRqxsITCSGHtrRTtXd
	 K9MU2zja1dqYFamBJiZUhIzzXZzO7M+ZXr/h94zSqOT8nAsrKoGembtsr51UdsQ5ts
	 n9CMtQlDZ/MYTlTrVzNFERdbJL6+7uG1pdzayMaPYNuyT/d3/uXm+39fuF6BuSRQcl
	 9ItPQ+bkNnrxQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:52 -0600
Subject: [PATCH 13/13] arm64: dts: broadcom: northstar2: Drop
 "arm,cci-400-pmu" fallback compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-13-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_181020_320467_F5C925F4 
X-CRM114-Status: UNSURE (   9.33  )
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

The "arm,cci-400-pmu" compatible is not documented as a valid fallback
nor is it used, so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 85d997ab57a1..f0374b90f6aa 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -505,8 +505,7 @@ cci@65590000 {
 			ranges = <0 0x65590000 0x10000>;
 
 			pmu@9000 {
-				compatible = "arm,cci-400-pmu,r1",
-					     "arm,cci-400-pmu";
+				compatible = "arm,cci-400-pmu,r1";
 				reg = <0x9000 0x4000>;
 				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.51.0


