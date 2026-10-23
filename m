Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jfXzWfv9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZW+3Q0HN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BLDFD6WG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=; b=jfXzWfv9p0/sVo
	RrT4dhY19eS1paLIpekZpf4ObL/n28jajy81W7ROx1laLbdMGgY18R/rHFrxrvUNBB0nymjtcFyRS
	JnK78olkjvGlb104az5dWPObb1CDF8KvgpocTPMdf8jZC7iOu69+XRL2dWkN5INEm9hSN5WnDuMQS
	HfKaAFPZVOgRmYoFbfbl6wipxObVGIelquMCfreSX7PtytxFcv09asU5YQgUOR8VVD4lRnknqVXUN
	0rK9CMmiD3Bd/CcVeuEEhPjrDdpR9pNL+3P+qCl0ruf2NSfIqvhz340DUEa0c5M3Ur/WT54otzxSX
	3FjQg9zpWmxKtPl5IdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7x4-0000000FWxV-31fP;
	Fri, 23 Oct 2026 05:36:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7wx-0000000FWtV-0yUz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 05:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=; b=ZW+3Q0HNDFnsV38/M9f7gB/qgS
	nhYSbI4nsGVfEdR3HSr/xlkMLtIqO220VzcIh+T0t+NM/Y1SGrvS3snltScmBPwUvGCtXNsLKKh15
	xvi4bO2Z1v7qB3Ju+K+IpOrRayIawnxna6xxX+w1YVnOYPXe2SphD8f1j5FitS/Ith56mm7nu5/va
	fpsPukCRDzQToEudNX5X13K139OWJvJcy22KNKM9TiUKdI6vRhbAietoHwjdHYkNvl2IqIik8I9bB
	1N5liRDyCC6+LFKam4Z7bBYgPLwuGpc071xr7pKMRa8jaLA+I5Yo7EeMKTFqIkAfruVfKw4AaTYo+
	lEOdorHg==;
Received: from mail-dy2-x0b.google.com ([2607:f8b0:4864:36::b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7wl-00000008pqQ-2QzL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 05:36:16 +0000
Received: by mail-dy2-x0b.google.com with SMTP id 5a478bee46e88-3535a54c09bso422914eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 22:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733762; x=1793338562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
        b=BLDFD6WGjSaqkqX/aGIom4wVzz2aNgWO+pwm8fazjDLFYmvpS9oxKM/96lKc6z9qq3
         Zahk8mJCRKd0Omt65mC101QDxcGXsrYHwW76PtxcNIjUP2CpN0HDpFMHuBHr+4zQVprb
         X9FBQ4ScOwuBu/SzFKh1O0yE+z5VTqtIB1+i6nyK7GV0yrAtnE8tPmMDcJdLW6Un2/+k
         BBWNLx/BeFE7uW/B9Svqco924Mvt6+F9dMpFqWGLZA62FNeqMz8la4p8aY2i8Ck0yw7C
         5sTSpBl+1OL4JsUaGStmd92PLasHt435leSnwTFRcQ2KboAAFIAzibczgibPOJYynSrQ
         M43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733762; x=1793338562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
        b=eV9mzeYdIKvsy+ovJreuHLImdttcgi49RcoRsDvkT6DnMug2ynsw5X4LS1Oe7GApCk
         TGMecggSPI+J34Z+XSwX9FxPF85IWK9+HoxLF10xZA2PnvAeRG8zH6gGUIWw+wxrYN6Z
         joAeM37uzIoUHozSPViCVdV4/7ycZYKFFOPwulFO4p+V22vQXTN/NYA4TBmzEOS/GTpT
         dM+RBZU84xqVPxK+iSnqxCzPsKb3qi4AOKza6cU5nHud0aB1BhYA4aKIgSth7moWVBAt
         bgElNieOr6U6vz67BgSv/j8JXfeKnyEfC5ZRl3V2tsTyoIuqo29Muot5aLfS/gWJwUYI
         H98A==
X-Forwarded-Encrypted: i=1; AKwUvBzPypXATgsHhPukhflJgaYgy7tHzEFRPi9KiczXnvCl6Vw9QfbJYmvPbKRCJy7wsYzqvrw3i/AYXWRzpg2DwLOE@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+g1WeD/rutLY6JMKUtUwVTpkXejT6d3vSLfd9ZlNYSCgyskSF
	KjONYcpvMFxxnxaORNGtJaR80+c+AqtIDahPT7xYSGnPfi7W8SzxRQWH
X-Gm-Gg: AYBFou2qZ/lsI9yJV2xtnbOJkmvqUWDjO46MtgSNJ8KqbKFxNjTx8b4XqwqEJTZ33jU
	H2gRQykxHN9zQ1B+vlctVOBwX9RG/9JtFgJz+R34ceTO5hiTL0aVkr08fOItv6V/Bgntr5EUxHG
	tgKbw2hFxE6v9YCiiKwluP7/C6eH/yYgTwWfIlGnksNd/7lbK9OgsxxCFcWz3qVhMmDNKqgSlWK
	6IokiYs7EOfi9XHk8by6clRFNMrPHfSU74NnHW3nYftdevYwntX7VkZTOTCAs7nndyQYyhg6Uid
	nEgeYNwWh5CrKIsBm6vDxCEwaahlpdA4+qK5bvndHba9ripyiSAq0lifRTCz7/Liuaeq1pfPeHX
	t4mlV1oBb1aMze729zLKzeTgLCQq53GnfXhmI4qSZ5bMWfEGfw6DXkfGZI5wTjRiQFV0on0uuaG
	H114yvdN41tg5HEHmDYVcqIQo7/2FARzUL31IEmN9xefcQ4dICP29aLh6VorP7ojOY/SrugkDvz
	pp0ieDJiQxakXpGWL0QKmnt9e3qP5JK/4jNmH1rkQ0PwU8SQk98tQ==
X-Received: by 2002:a05:7300:f784:b0:366:7b5c:820e with SMTP id 5a478bee46e88-369d8f4e26cmr1801190eec.0.1792733761680;
        Thu, 22 Oct 2026 22:36:01 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:36:01 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Fri, 23 Oct 2026 13:35:46 +0800
Message-ID: <20261023053548.1595033-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023053548.1595033-1-coiaprant@gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_063615_099373_C89A0561 
X-CRM114-Status: GOOD (  14.67  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports.  Add the XPCS device node to the
SoC device tree.

The XPCS device is accessed via the APB3 bus at 0xfda00000 and
requires the CSR clock (PCLK_XPCS) for register access and the EEE
clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
PD_PIPE power domain must be enabled before any register access.

Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
125 MHz reference clock for the GMACs when operating with XPCS.  Their
clock-output-names match the CRU mux parent names in clk-rk3568.c, so
boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
assigned-clock-parents.

The XPCS node is disabled by default and must be enabled at the board
level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
are always present and do not have a status property, as they are
static clock sources.

The XPCS node requires a reference to the appropriate Naneng Combo PHY
via the phys property.  dtbs_check only validates required properties
for enabled nodes, so the SoC dtsi does not provide phys: boards that
enable the XPCS must supply it, since the SerDes link is a board-level
design choice (combphy1 on some boards, combphy2 on others).

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..20a72785adbc2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -8,6 +8,20 @@
 / {
 	compatible = "rockchip,rk3568";
 
+	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
+	clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac1_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
 	cpu0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -110,6 +124,15 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: ethernet-pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3


