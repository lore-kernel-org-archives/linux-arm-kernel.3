Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9F1CF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McZTEZhdHjyBFrzP29j2kxrCSYlrzvY1+u2omx8oKR8=; b=wCI1oV8bFoitcy7vCaQ8ikv9+7
	6kk8reIQlFXUDdhGieapuakPcnGD5JxIRVVhvSCwxFfTODcZVrQ7qXn9nRadYLmeXyZafb2hxAvXp
	2d81HTtBEE7hGMusB5R4yA75PKBjcI+blpBH8Zx5EJpYL6ZROXdTvW15tjFDuALN0IYMzoi0DalX5
	+t26azEV+jfwM6jr6y8EqpEu6MmI4fbP4GzaoeC3oB0oEQ4DuNVx7ZkSqFduFtBoUO1gdNV3mLTFW
	FBWrQYHuXI5NQwsw13Alb8JtM49wVpLMNozSszOjqDDShCjiLVvdHvGs4GcMx0BUm3h4WFR6CSEmf
	lL1PpZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ0V-0000000E2hl-1sF2;
	Wed, 07 Jan 2026 02:10:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ08-0000000E2JZ-03fG;
	Wed, 07 Jan 2026 02:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28B6260141;
	Wed,  7 Jan 2026 02:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40D4C2BC9E;
	Wed,  7 Jan 2026 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751818;
	bh=fhg08yqc+4EARqb1gGn/pjIKfMLRt+25G01eZEiyKh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sc0uJRVf/6sOheJQL0VHRXuDKD+pU7ao1Y1vxeGcY0pQbq5hPihbc+7ZX5At3vxfl
	 iJzgNx6QMbhhGBVBlI+nVrEpoUXBOveBUkp0Hn+MzJxlcukGsee1p36WzGGBHqqXJ0
	 o2n7WtuzUx1eIIsBBzW4chdu+PW9tXS3KC2I/jfHVTirTu9q3kZvu1ObETGkhyFAlC
	 LRvvZJG6SNVBP/T9B3RqXGTk2UHlhE1+ljmxba0RL/Sw0mLRlMp+qvKsg6MMIiKLab
	 5HqRHAD1wZkLaJTIl4G9FmHjh5xzTf2NUixXZEYg6w9oMvZ5kSQmwgthU0IqgEuaqo
	 t0RMud7zUV5ag==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:51 -0600
Subject: [PATCH 12/13] arm64: dts: broadcom: northstar2: Drop QSPI
 "clock-names"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-12-ba45874e4553@kernel.org>
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

The "clock-names" property is not documented for the "brcm,spi-bcm-qspi"
binding nor in use by the kernel driver, so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index a187c8e788dd..85d997ab57a1 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -813,7 +813,6 @@ qspi: spi@66470200 {
 			interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "spi_l1_intr";
 			clocks = <&iprocmed>;
-			clock-names = "iprocmed";
 			num-cs = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.51.0


