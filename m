Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECF8C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=855oi/aHiPaIX6D7ew4EHyshWsVi9Qr95Z7nFCB1Mlw=; b=wBQINT9s7B+IE13kE8/reaNW5a
	GdjZ3eggNkLbZgJvdIYHEH69gCCGFyPoM8ARMUS83+tRU5iczolxLxZbdg7q9gOMWQ1Y7pEHa9tUy
	/AzsITF/clzGSDRIaV20C8rFyNIILEYFC0bW9jbgbeXW+TRBDrYmmL6KKUkv4V1qO2bvDmxX4YhYV
	JqU//QOA1Dxa13/GjX8NA54P8cDZIO973hgaNFG6wXJ5eGqgggDiOC0EoOCzvCEE32BRCuVIgwqAn
	NGfRa94De8H1rvtjrvCisH0vqYG7kI6Jl1zxzW04/TMpBfMfmD39O6vBL0Jqg4iAOv9JxqMS1YWBT
	V94nqDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWto-00000009Bt7-2mz4;
	Wed, 09 Jul 2025 15:39:56 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUly-00000008ltQ-0UN3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 13:23:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1752067419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=855oi/aHiPaIX6D7ew4EHyshWsVi9Qr95Z7nFCB1Mlw=;
	b=aUA/LWlG7S4ZNAnHyf2vWD3JYU2+zqT21rwZCr5w34ibLy/tYK798GZKKw66U+6IXbgOJI
	Yrj/83exQLzNP4+JQNKN/LpiqCDRmdo5qpdxP2SGtn3LRLzZvd80ZD492eVMwrNz6J1K7U
	HXhsR90ZmfKfb326YFzEE47Eg6gjJpqWk1fgSXkfPQItiaILzFOv+D2JPfNgOz12qkdVRh
	vzCYKTlCMafBoeQHrG8EbrgXjO3TWSyP51F5RZF7+SRhsfsnRs3Moqi2+p/0mCYbu1BxxD
	L06ek98uaQrdmgwJOUQC46cj/Z2Cf/l5j1QyCMYW5mnmJX196/wkO6BWewSYFg==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v4 07/10] arm64: dts: rockchip: Move mipi_out node on rk3399 haikou demo dtso
Date: Wed,  9 Jul 2025 15:15:20 +0200
Message-ID: <20250709132323.128757-8-didi.debian@cknow.org>
In-Reply-To: <20250709132323.128757-1-didi.debian@cknow.org>
References: <20250709132323.128757-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_062342_289209_83AC5214 
X-CRM114-Status: UNSURE (   8.59  )
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

According to the DTS coding style [1] referenced nodes should be sorted
alpha-numerically so move mipi_out to be after mipi_in_panel.

[1] https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-nodes

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../dts/rockchip/rk3399-puma-haikou-video-demo.dtso  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
index 0377ec860d35..d28880b8dd44 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
@@ -124,12 +124,6 @@ pca9670: gpio@27 {
 	};
 };
 
-&mipi_out {
-	mipi_out_panel: endpoint {
-		remote-endpoint = <&mipi_in_panel>;
-	};
-};
-
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -151,6 +145,12 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
 &pinctrl {
 	pca9670 {
 		pca9670_resetn: pca9670-resetn {
-- 
2.50.0


