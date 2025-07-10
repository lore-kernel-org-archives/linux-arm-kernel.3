Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FCAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVmdQUZtyTlR3xIdmwpPOSVC80LuTtCS3rq8Y4fDrpE=; b=dWb5r6TwWdFbCLkaSZQkww+6Oq
	Ch5Tzh2e29Jkji99Wm0C4fX8Y4BIsdI2hdmbQ0IDPBCZbdLEF1U97ev0mKmIa8h6qkDFUWlVJfwVi
	RM5HeYDOHCaiue8ica9c6XcaDPZjHGayaqDa3BULsj8YjFWCMO4bKq9j3SYFoZZ067/6xGhGMwjzU
	Yj8W03WFUwNLgg3YQoH+6+wPDBp/VuLCNXQAvQKRAoBLq0aLoxAT1aPAt44YJvBlfhBDMAS+fLQoB
	xH6qbPFXFCYdZD2vFRBAtNBrzrtxxbNyeJl14MXeiJQGOAe4/znnPkTFh5OfHqri0t9JQlF0ELoQV
	0bS2SAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwrL-0000000CoOK-12UT;
	Thu, 10 Jul 2025 19:23:07 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuU7-0000000CVMa-3iVT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:51:01 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=yr1VZsHW5SQCQIIlRD1O/QABdYfwUduqWaeNDoXHCtUPn3jNua3EZ2A1G0q+q7T2xGV7sIqZ8Vyr3WacaJb2ypMEyb3TvmP+LQdlYMzpMieWizKCVtABMsGrS7nj4oqagzkhg/TeduHxiXV5wUpz9wwg5F+5cOZqviL0CvGLLX/qgAPYe9vYj2ljpe/CybKEZk1vYzhMRYlzQLCOi/4NdrCPOifnHv9BSEcXSnMQwKhZrbPMw3740/dyscbzQjxR1xgs8E6730UJSxfZ834nSpJgld1HI4j+EaAbOumz+pVwvqQfJd3ATlviYuTaM0vLi9akwFW0/aIJ9/y1sR/CCw==; s=purelymail3; d=purelymail.com; v=1; bh=qgDOk7ldMzPb3j2kj6nz6o9DIKmpFktmmEBU5U0AflM=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1992400030;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 10 Jul 2025 16:50:38 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 10 Jul 2025 18:50:05 +0200
Subject: [PATCH v2 1/5] arm64: dts: exynos990: Enable watchdog timer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-resends-july-exynos990-dt-v2-1-55033f73d1b0@mentallysanemainliners.org>
References: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
In-Reply-To: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752166235; l=1586;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=qgDOk7ldMzPb3j2kj6nz6o9DIKmpFktmmEBU5U0AflM=;
 b=9qFXpEjI+WZVRilJjhfPmfCZjpMfpoLtD75VFJKNM0oiOQEvFSCenhkoQQn8JIJ64HAbswOBF
 m6SH9JcQNL+AhCaILDvgxnI86mOLokQ6Dbl6s2QlcYjWehE/3l69qGL
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_095100_024794_5B4100C4 
X-CRM114-Status: UNSURE (   7.70  )
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

Enable the two watchdog timer clusters (cl0, cl2) present
on the Exynos990 SoC.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index dd7f99f51a75412f5c3b91c3425a63652546fa5e..4446a1a54ba2de56879353c9c4a898b1d697fc13 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -211,6 +211,30 @@ timer@10040000 {
 				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		watchdog_cl0: watchdog@10050000 {
+			compatible = "samsung,exynos990-wdt";
+			reg = <0x10050000 0x100>;
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peris CLK_GOUT_PERIS_WDT_CLUSTER0_PCLK>,
+				 <&oscclk>;
+			clock-names = "watchdog",
+				      "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <0>;
+		};
+
+		watchdog_cl2: watchdog@10060000 {
+			compatible = "samsung,exynos990-wdt";
+			reg = <0x10060000 0x100>;
+			interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peris CLK_GOUT_PERIS_WDT_CLUSTER2_PCLK>,
+				 <&oscclk>;
+			clock-names = "watchdog",
+				      "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <2>;
+		};
+
 		gic: interrupt-controller@10101000 {
 			compatible = "arm,gic-400";
 			reg = <0x10101000 0x1000>,

-- 
2.47.2


