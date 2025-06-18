Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A334C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ZhHWlPyrnIZmL0QyMk5OQugV/JVI5bUO66h15i++Os=; b=tgqk+RoRSNFE/Qc7mcg3i2nzGh
	qWiVWVpxSLplSji13DQVWUUj1o/jFGLdXReXyDGPvHBj8WCU8HQXFXL7As/oVAx/rvEwOJDjs7+Q9
	WzRp/PLmPbf/DSV/CPWwvgBiwNN4Jj8bUSaayvTDND/fJszji8IDIGXmuPPqplUfpz1GhepH3sTag
	I1jGa6/3QOIc2JXAumU7y6uOLtBHRUnQjSzsDVL7SpDsW/8tFrkvkFOrGw83mMvDmWK40gDkhhki4
	BxWMvPXIqdNe9uGbHi/iVJ8tAmt7z91YbilO/2V5unUWx7TsAGbZtYwnreViGegD7fLaXlSYVu+I7
	fPLcdrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouN-00000009VpJ-0Gnf;
	Wed, 18 Jun 2025 09:16:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRolZ-00000009UoF-3HjC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:07:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6B1E6112A;
	Wed, 18 Jun 2025 09:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D81DC4CEE7;
	Wed, 18 Jun 2025 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750237652;
	bh=Mewybbtg4tGrzCWqNUg4G/7zv5ffcJGfE57Fi5US1cw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZlawaGk8wiRL0yI3g7KpUNuVnnOmwWkNKipVx5+AIEwzspLR0aEiAv8dZ4FBACFZR
	 6hNyEVHFAxfG4wI6Kz6yOvmrMbAql7QOFvOQ4qFHyHdfSZr+DPloDVK1aqai6IobCY
	 Q0SLemwPN4H7JFulVSnyppqnJbHGH5Vu8L8HnuZ0SxBtObs5L0P3wSbtMa9LxJopFw
	 j+IQA6F88ffu6F974nOKOzSfAucFaL7PkEQ1R2y3wzG4Ogqank1xbA5lP+Rg/9hAfL
	 VTNWh1XT2q3/jKEK8r6tLl65jmvMkKXrd7jKq9TuYcygog5Y8rY+NBzqMzyFiyiN5f
	 3xQFc7LbW8k6g==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-j722s-main: Add audio-refclk0 node
Date: Wed, 18 Jun 2025 11:07:24 +0200
Message-Id: <20250618090724.1917731-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add the node for the AUDIO_EXT_REFCLK0 clock output.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index f6aca9fad25d..38c9a47a4838 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -430,6 +430,15 @@ serdes_ln_ctrl: mux-controller@4080 {
 				<0x10 0x3>; /* SERDES1 lane0 select */
 	};
 
+	audio_refclk0: clock@82e0 {
+		compatible = "ti,am62-audio-refclk";
+		reg = <0x82e0 0x4>;
+		clocks = <&k3_clks 157 0>;
+		assigned-clocks = <&k3_clks 157 0>;
+		assigned-clock-parents = <&k3_clks 157 15>;
+		#clock-cells = <0>;
+	};
+
 	audio_refclk1: clock@82e4 {
 		compatible = "ti,am62-audio-refclk";
 		reg = <0x82e4 0x4>;
-- 
2.39.5


