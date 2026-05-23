Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE44ECD5BC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVYOFKxX2nTK7xBG+dFvf5BN63MQ7IZrJ1lALABuKpI=; b=SdI6LnUAideL/b60KPXUxfKQ9g
	kBwMz6xp3+Io16kyzljpRm+/PMGBjc8pwfQjwCbqEkmO9O1yc0CvVFzgAomQgl5YuL3zbeSYB6dg1
	wHYvR6RInNzWfE+eEl/ryXlQdQcDlOJWMx0mxNQl8HImK1bZKrEc6AZ89Rx4COmumh4OXeXFz2iZG
	zpTdte0nhRcKIdafv+/vGXJ5kgfsf+gvPaP5QYs/wTAg704kGrq+kdikDzaausHZsXspTgDap/H/x
	pn3rUUerHafSfd2MKz0RG2WhPnu00LO6fYrjorogvs6skEL5Z2JWatmik0sr9HC/egbCUCHKmdCy2
	MrK9dLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQmwT-0000000DM27-2E2p;
	Sat, 23 May 2026 14:03:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQmwP-0000000DLvg-3e9J
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 14:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 44A8F6020C;
	Sat, 23 May 2026 14:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB2F1F00A3E;
	Sat, 23 May 2026 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779544981;
	bh=iVYOFKxX2nTK7xBG+dFvf5BN63MQ7IZrJ1lALABuKpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DuSVkzN0d8p3/jyc9iabj4PY0S9LSlmREOfbZtIOZ+2Gyb4RSk5IiKdi/dJ8bMlPd
	 rEVkWlru26pC1jpNdL+AhuXw1eDySOeaz4Z/WXAl8gaCJGeqqBUftcSy2gARk6G4VB
	 vE9wmIwUUV/iPeYdV1cPsmovCZ19UVhvnuT/Yw03ic5Z3QdIx0xv5S3/MGzCeHbGz0
	 LkR5ITQmfoWy8ycG8Xknz8sWjs95FVP8lqFElNQgkHQkI8itgZY7uk7JZgZazeORnX
	 zZmh08Wp33m7eMnGNAG2IGTFhz4CMNRrJQBNtc9j9Kp441IyU8XHn+vfxR3F+P7L2x
	 By1cU8l1XrdaA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wQmwM-00000005YFc-47zB;
	Sat, 23 May 2026 14:02:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ge Gordon <gordon.ge@bst.ai>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	=?UTF-8?q?Yu-Chun=20Lin=20=5B=E6=9E=97=E7=A5=90=E5=90=9B=5D?= <eleanor.lin@realtek.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v3 11/17] arm64: dts: mediatek: Add EL2 virtual timer interrupt
Date: Sat, 23 May 2026 15:02:36 +0100
Message-ID: <20260523140242.586031-12-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260523140242.586031-1-maz@kernel.org>
References: <20260523140242.586031-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kernel.org, afaerber@suse.de, 
 eleanor.lin@realtek.com, heiko@sntech.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The ARMv8.1+ based CPUs used in a number of Mediatek SoCs are missing
the EL2 virtual timer interrupt. Add it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 3 ++-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 3 ++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 3 ++-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 3 ++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 70f3375916e8c..106df7603d533 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -108,7 +108,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 
 	soc {
diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index b91f88ffae0e8..a4621ce370d8e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -815,7 +815,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 
 	soc {
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 75133794cec38..614e75f46c72d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -918,7 +918,8 @@ timer: timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
 		clock-frequency = <13000000>;
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9f8f115edd4cc..873c4fae6afc9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -328,7 +328,8 @@ timer: timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
 		clock-frequency = <13000000>;
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index c72e34c57629d..3c9a7a08612b9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -451,7 +451,8 @@ timer: timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
 	};
 
 	soc {
-- 
2.47.3


