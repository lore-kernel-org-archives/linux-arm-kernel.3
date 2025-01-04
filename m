Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B68CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 20:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJxIM/LR3rNL4/B5PeqX+Pa1K0kId11djXpLSpm8P+8=; b=t470R0dWV02wt3bN3wuitZfAQi
	JBiz2Xzz+6pvzckHzmd21KTnclDlQxDz4/XMm+YyAqhnFyMABeKwSGJIuof3lOjV4KNsSkNLf04I5
	vIuAENOAySCgcw78R5ajO9lrFSrGDLGcZ0NQIHNlHs0JlnmwMRg87qoLFXL4MxSKcMItKKUNnDsKU
	SVTlEr1PM6okPhoBmntLydy7cu/xYefqTYG5qhIyO5bHi/X1SH7ak0n/HD8vtymXhbW9s0CnIXJK+
	ITlxOBj1PmFoWuuPVXR+EU2kZViIMRqxG69sU81iWeej2bkF8YRQz6hC7upIPRAVLQ1+QYeGD42eA
	H0TozXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBDq-0000000FbWC-090X;
	Sat, 04 Jan 2025 20:58:14 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBAN-0000000Faga-0H1Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:54:40 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=KCWzH/NrfDRl0+2n/iVUM9pAtbsVro7gQCLC6SIXHPJjvIZEHSlFkzuolfgmZnZlg7X5vUeVgP5rYh73jHH3ZdiNTZErHhLFc9GF/6FPRvNsySLgbWZLHfW7dQL4mhEOzeP90mQWc3E4sR1CCuXJiTFxNubCVS57VbkMJb9wWSbYnqLbzYZLsucESY/WiCryLYZLoxk5Fz1K3oYO4GZcl8g2jF08d4quoB06nxkng9vf6tUU5A70rNMGYTchNWBIY29UwVWfiWv09DiKpfG7NbZMkDaNWLBRnUu2cQzC4fjTW4IAyjoRVkR2aMf5sKzXFd+vPfWo0k/Vdf+p5QoICw==; s=purelymail3; d=purelymail.com; v=1; bh=y7XGmitoB/d2FvK9oMBRHq/8yp1wqAV+TBRDnbZB5hI=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 166263896;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 04 Jan 2025 20:54:32 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 04 Jan 2025 21:54:17 +0100
Subject: [PATCH 2/2] arm64: dts: exynos990: Add CMU_PERIS and MCT nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-cmu-nodes-v1-2-ae8af253bc25@mentallysanemainliners.org>
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
In-Reply-To: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736024066; l=2006;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=y7XGmitoB/d2FvK9oMBRHq/8yp1wqAV+TBRDnbZB5hI=;
 b=wp2LiSqexkr9nlHacMJNjzsq1rbdxz2rqG+owfiMvUU9d/JnivDj75Gj+YL+MCUHbOd/T6a4R
 ISu+kItYJrcDs1YSZ0vQDqHEwKNs6b49ulHYnfWXL7UGuSX/+cCpHzK
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_125439_180282_C73C0997 
X-CRM114-Status: UNSURE (   8.46  )
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

CMU_PERIS is a new clock controller that clocks the MCT. The MCT has 9
timers (1x count-up global timer, 8x count-down CPU local).
The global timer generates 4 interrupts, and each local timer
generates one interrupt. So, in total 12 interrupts.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 9d017dbed9523e874891f13258d331c3e829ca03..0e18711cbdc98a65cbd2d709cdd53a7680b833f2 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -181,6 +181,36 @@ chipid@10000000 {
 			reg = <0x10000000 0x100>;
 		};
 
+		cmu_peris: clock-controller@10020000 {
+			compatible = "samsung,exynos990-cmu-peris";
+			reg = <0x10020000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIS_BUS>;
+			clock-names = "oscclk", "bus";
+		};
+
+		timer@10040000 {
+			compatible = "samsung,exynos990-mct",
+				     "samsung,exynos4210-mct";
+			reg = <0x10040000 0x800>;
+			clocks = <&oscclk>, <&cmu_peris CLK_GOUT_PERIS_MCT_PCLK>;
+			clock-names = "fin_pll", "mct";
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		gic: interrupt-controller@10101000 {
 			compatible = "arm,gic-400";
 			reg = <0x10101000 0x1000>,

-- 
2.45.2


