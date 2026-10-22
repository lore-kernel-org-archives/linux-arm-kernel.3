Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55442606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 02:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CM64BN4S;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HUsKyqqZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kapioonxhfRQWTN60e84l0FnMPJ/xo6q07mXjt2TXY8=; b=CM64BN4SGCJIMEhP9AhEo+DyWW
	nr5WyQgT1heCW+W2N4x2ajGcUMp7lT6iHjiKF4Xk1alQxdaCakvjstlkE2UspfKONh+qiJYxkLW5U
	Bn841Qzvsnjl3F5aGPr5iVW/Flo5MGEWfoam6tHhTIw61GngqtQXVqtPvEQ97sOh4kqDlesEwHMzI
	XKfMnHcxzSInUg02mG9MXIxy9RKoK02F6AtGXjCWNR1OdUHX3lnPP4/R1FvqpKoXppeueqKxBfu4M
	i20xbqM5SiT/GZfxKfSX1ituaG50xXjHbR9iERo54fkG1UeT8ThI2gbq9c7Dy8CPNT0YBEwxvKOqy
	3nEWJ9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj1N-0000000DFgV-0yMs;
	Thu, 22 Oct 2026 02:59:13 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj1J-0000000DFd6-2yEO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 02:59:11 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-33e48934fa8so493927eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 19:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637949; x=1793242749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kapioonxhfRQWTN60e84l0FnMPJ/xo6q07mXjt2TXY8=;
        b=HUsKyqqZtdh/aYq5Stmd1zvSNSz5YChkOS3Iedz0bKo5VjiBIIwwqWKyJ7sgk1L8Oh
         AsMn/Z262MLH30gM3Iy8/BoSXV/dt3b9JR9fv76S4MI8SFdcRVD2cQD01iZWTdCkv4Af
         VmUzXSR8vvWRX55HNdLfOXBzRrehhgGwfbP9A/Rgu8PL/RwVSRNrHUeY2VM85mO/D2aG
         v4AUR0pVdWu9ZsDENiX3iIoYlHXggS7WbN5CJhchSNh6r2pg/X+vwSua9DTAS7r306Q9
         IfpBMOY9Zvv07XPqLpvOElio49xPDFOGHeQgKvgCY64t1n3UpZkO3qT21xnEl6+3Y2yH
         0oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637949; x=1793242749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kapioonxhfRQWTN60e84l0FnMPJ/xo6q07mXjt2TXY8=;
        b=jFG4KU2zMeVhySqsAETnxNNmOb4F+RTYOjVKuT8cQ+gjaUfU3TUyQhzZ9+3DgeZNyN
         vwJ5owca/yQlAAaWfREmG2sg0ofkMPlImC7gKGNKDsj1fZFu/dt+tF21IyFl4ZqTNcjD
         Ab4ro+ghOTHiT5VAxvLfKRx9oN/Qi9MXynQu7tNXo1WWqG7xfhmbw49Wv6cMEIUFGj77
         v1Swvy+dgjighde7c377tsc0yAKQD+gOR8xOhJiOticAxXy/xWIUf3I81rau7yLl60gz
         Urwr0lBJ+4RIVC810QzlfjbTm2OuYTfcrv1eb3FJytZ6vNJQG1uJxXxfG/p8T/FAwV4z
         OdYg==
X-Forwarded-Encrypted: i=1; AKwUvBzZXFtuuDJtHmLdnB/pwLcbjYegvjWfGfvTD4vDPlFMb6KgT2UlNU7wWjcpKpVz5KubCzK8TyNTV2Zh8OxDnhao@lists.infradead.org
X-Gm-Message-State: AFq9FYKm5sF6NL8R7J2R3BlK4t40rd0GK+Dxlf0Vr5gyIclSkJ35EwdH
	hsNZw81A3PcgS3l/ZNqn76D40rrgiRumuujNyas4ucqvi9au0qjOtxat
X-Gm-Gg: AYBFou3RB7NJ/qkw9NHqa0YbKJ9vLtEYSnPIZGPBqlb+V6/roO/X96VaM+qrO+y39UC
	9j8Jsln8wG/pzasuv2hgSl6+b/cadWerSDzjWSXhmpx0RyWhkC2g/wni5k2t549PB+kxXA8chim
	3yvw7oHKe3fmKlD7r2RC6TSV5MY0U253hk70Ul6cGLcO/cWZxaZHVjgfjXACGroaFmDpcyzOu82
	Os8ereL4O8prxdYZBsdM2LmgNz0cA6ifxSOLtLcxWz/mTc2MdjfvNOWDzua32cSDpV80lK3QL76
	a9PDq/DeJuPwvb942NBELaPqUT3hF3qLU2nfXKh5mM2/Q7uZZBpITrPThF4PpOUI0V0CjxOPI1+
	kmJmWbS6DTwUd0+J8f9yLnq71oIqBEfFL49dLpwHUsgYOb5bGWLH2s/v9nGoAPJheQPxwIzor3z
	GkT2BkkoQIwWDWWidy8hodQp6nvrboNYUqKq4wkYI8ydD7A4YcqFsnQfeEzAjDJiV6BVeeAzXql
	TjhHCyFBjJHx7JmSqXdWeImI5zqGm03SBUViuu9LmZlrgzyD+n6SIM=
X-Received: by 2002:a05:7023:a8b:b0:185:fd0c:4585 with SMTP id a92af1059eb24-190a67f9f08mr5252274c88.33.1792637948939;
        Wed, 21 Oct 2026 19:59:08 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:59:08 -0700 (PDT)
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
Subject: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Thu, 22 Oct 2026 10:58:44 +0800
Message-ID: <20261022025844.150320-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022025844.150320-1-coiaprant@gmail.com>
References: <20261022025844.150320-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_195909_788874_3E7450DB 
X-CRM114-Status: GOOD (  15.08  )
X-Spam-Score: -2.1 (--)
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

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Enable the xpcs node, referencing combphy2 as the SerDes PHY.

The rockchip,sgmii-mac-sel property on combphy2 is not set here.  The
property is tri-state: when absent, the driver leaves the routing
unchanged.  If the bootloader has already routed combphy2 SGMII to
GMAC0, the link works without the explicit property.  A follow-up will
add rockchip,sgmii-mac-sel = <0> once the PHY binding lands in
linux-next, removing the dependency on the bootloader default.

RK3568 has three Combo PHYs that can carry SGMII; which one is wired
to the XPCS is a board-level choice, and Photonicat uses combphy2.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 48 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 12ae9159bea87..d9015dbfb9f5c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -261,9 +261,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
+	managed = "in-band-status";
+	pcs-handle = <&xpcs>;
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -342,6 +351,36 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+		max-speed = <1000>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -606,3 +645,8 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	status = "okay";
+};
-- 
2.47.3


