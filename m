Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEE7C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xM6fZRSN/byxcnYpSivVxOzd2RcUlkeA8VOVZ+S2Zk=; b=rp5L8VrDUz4r2q14QXomfQFXNv
	s/nHGtwCGq581oyYUkth8bQhBdSCJ87Ia1StSraBLyiMsA16wjP4wh8Kz0x3vnMECBwpJuzLPmbfl
	4XCNT5N7+VDGRzRQW73fzB+efQ+XvRSsrYAvtoTdOjARGAB4XCgS+3ROaoEZmsFCj3ruNob2eTzyI
	/R32AOaZLboK8wu5rZqeXXgetYjydQMSiByr2/T9FceqlCnzVOhvnnDdaOR2Yt7HHpwKmy/lvELpf
	hcSwtpVVE2wo17T2X5pi1vkQeRBgsXCd2sXUbNeRvu5UO0TMTPDIBnybqRryHOBzlJNxqbkjrqtM7
	cFDhy2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XZI-0000000Afug-1oob;
	Fri, 04 Apr 2025 03:18:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHe-0000000AcyQ-0wvy;
	Fri, 04 Apr 2025 02:59:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B32644EC6;
	Fri,  4 Apr 2025 02:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C76AC4CEE3;
	Fri,  4 Apr 2025 02:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735593;
	bh=1W6pnPI2cQreK/3+uRQUHI1ov/YAXvY/bkfHhelXghU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GdLsVFPSPAzYBAvq539ZzBXsdV331WjtxuwM2qUxhzUdt56UPc33KEAtCXWymZboA
	 Xqnktp3sh/XpKkjPwQ3eobyzfRsUtvBVCoQS5qeq/6fsr3BXauJ/ePBcaokzPWlWiy
	 G9iMmBqkj5xkX4YVCwshcoXdrU4KiF7VJnZtxyww2fsu52Fu/eTEx7rax/36xxr7lB
	 th/RHNX1p6qaubojJKCMRYZz+neBX6eJgKCm6pR6/ACSKgrfLr31J+RCRvDXXEI7fo
	 5PBzr7JXyURO63S0RDpJfsN2CzW3IYZC4xYP3ghIso/ijjEJBp1c/zraQoVAZ8ptE9
	 S1lLwK2TnC1fQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:30 -0500
Subject: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_195954_311882_5AB98D35 
X-CRM114-Status: GOOD (  11.74  )
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

"rpmhpd" is not documented nor used anywhere. As the enable-method is
"psci" use "psci" for the power-domain name.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index 39530eb580ea..64d9858b4248 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -57,7 +57,7 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			clocks = <&apcs>;
 			power-domains = <&rpmhpd SDX55_CX>;
-			power-domain-names = "rpmhpd";
+			power-domain-names = "psci";
 			operating-points-v2 = <&cpu_opp_table>;
 		};
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index 6b23ee676c9e..bfd04e53c5a8 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -58,7 +58,7 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			clocks = <&apcs>;
 			power-domains = <&rpmhpd SDX65_CX_AO>;
-			power-domain-names = "rpmhpd";
+			power-domain-names = "psci";
 			operating-points-v2 = <&cpu_opp_table>;
 		};
 	};

-- 
2.47.2


