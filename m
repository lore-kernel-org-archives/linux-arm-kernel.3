Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85E4606A319
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 05:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=grgScYPd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gLmnLi2r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jh545y0wDFW183BEmadwWulwvIdvWJn8yox2hQi9PPs=; b=grgScYPdeR1Xd1
	Da0RKzpWCk+2fMqvThi9PAtDO6+dLJGObj51VIq2o1ZOlVa0R7qwJFuTUcA71Jy0DSxh5QaWqxKJU
	++19MAzQWwNXLZhilh0QI932cQ8K9UyFY6uvKBBHZvpIssnYy1BCpZtlzxChIfy9bzYO819ZL7mHi
	A70vNbwKrv/GEX/8Db7dwk7OmY/nJf9gutoN0CTHxoapVW1HOGCa5X0j/28d1U3DqsEvo7g2o+okO
	ZhV0IrZ6iWaqbbn9177BOaAUEWOSnh+j5ZcL7aWOndfdgBc39BwIrmDkB6vTeWrbohUvmIFF3ZI1S
	yk/KSj193o6W1ixuaIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7wv-0000000FWro-24S2;
	Fri, 23 Oct 2026 05:36:17 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7wp-0000000FWnT-1jDK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 05:36:12 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-3663e04e9a8so694879eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 22:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733770; x=1793338570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jh545y0wDFW183BEmadwWulwvIdvWJn8yox2hQi9PPs=;
        b=gLmnLi2r2oTGWJrz9CQfdRVYtrfUhRiDnirJHx+q1qQHXMP7N2zQGS1Pvp8dmjXSJf
         9X6EKOC65qcPdV+iadnJYxP/LRWUd2s9YI01XY8Gy3ZQHEi+gL7XuirtJJrIXNzNmQyB
         tJoqQVfRyYCw/7gEAea7gvglOWNNfDe3bTGI1Dju7zaJE0sg1r+vzFLWrVrov8rE5lxc
         bzvdoc586HSp10nYKmyBtugCIUuV1q+o1LV902Bffr4unnex7LoWmt/lLfPL5QPrDWBf
         TwJHQiECILLgG2K2nmgTv09ldpkyqslXQlhd9+jWGZB0OdCoFtivX3Jvcr6VXOQStcjo
         n4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733770; x=1793338570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jh545y0wDFW183BEmadwWulwvIdvWJn8yox2hQi9PPs=;
        b=vV7jNDXprmNq9nvBUnIPDEW8FyNgAofb3Br4sxGq5eln/80X8piYMKiY3Yx8COCoOO
         cp2xfNNhlhhUxaNoswnEz4iB9KRAFqc3dctMA6gJ5t36x82IKtfUyZGpUWeZOLlP7eLl
         HbvAQcxlPIeYvzr+THWcR1OlBkRSndj4uqziQ0tAxdkFQFtG3JJErQStZrf8khKmbQ+T
         9Rsi7S4x2WMP+R3hh3nm2IYj/6kMcsqgc8hyL/jdwuFqS/iIhDL8TcXU+JUVhltHrUdv
         P82MOMt5wE0DcFwuR/NydOhsOYro20LPez37cjfjS6R+2Z1OHi3WN757ayWFP6EzDVQe
         WBvw==
X-Forwarded-Encrypted: i=1; AKwUvBxkfFiYAF3cgO2Uf1H8/VPDL6eYZQ4IRDcMgvpsuc1n/lwPyNIK94JIxkgaJ2iNqNyAnQmMgeEsvcPieG5EMNxo@lists.infradead.org
X-Gm-Message-State: AFq9FYLvy47Gepdko7s7vORypd53sOV5eaD5pm2d1Ex/HO2EUSaUCG85
	5k6ji+ebeWKymBUFCffR96ZV35I/mHN4n/GZytELcoql7qkHGI03k/nC8mhS5yvUefk=
X-Gm-Gg: AYBFou3YiPeoLxeohkk4+j/nasFyzbk8rCMOG2hiNZ7QJbHhfb+q+6xDqvBmiSZi2pf
	YqLcHgpnYKxVxSqlbQyZ15wbNh4ooy/bGPjhoAeKQgtke6jPSJ002zKD6NvsRkZA5TZF8rsXfCc
	QlfWaaKQIpr2WSIhDbvq7jtqvPU07PCKRDy4zYtZxRSAl3sxZk0Rmoa5DjUuI3usVd3+CKacdz2
	iznhv4tAZui59O7M2EgHTSt1wWCsdRxnEuQ8XZV8u/bWcXRhqxoz1Lhrge7sZ+gYn27fjHNaEXu
	C9fHqPXJIvn9yFechFRiYl7jRT3eEuF5RDQuglzeQAE5eSz/wEdY1c7f+gWZIHjbmaL6OYCEkFx
	P698ZMSmBOY2yJEXqGTQ5QnII21Az2yJxqcRr9DLwPYCSY4T2xj+9fPfvSDnTwUu82nV/p31knR
	u7sZEJcGftvYEU/ORybH4Hnkv237f9L9yLtwijMp+V0Wq9pOHM/rKwvb1ceoAnwo4I+FraI4JKL
	bl3kbvfFtBvaVRVQxOWhDjgzQb1dMGLt+vhkCIksoD5kbPhgGHPAw==
X-Received: by 2002:a05:7300:d0a1:b0:368:74ca:1c5 with SMTP id 5a478bee46e88-369d9858845mr1511194eec.37.1792733770371;
        Thu, 22 Oct 2026 22:36:10 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:36:09 -0700 (PDT)
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
Subject: [PATCH v12 3/3] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Fri, 23 Oct 2026 13:35:48 +0800
Message-ID: <20261023053548.1595033-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023053548.1595033-1-coiaprant@gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_223611_472700_F7D19C46 
X-CRM114-Status: GOOD (  14.38  )
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
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 12ae9159bea87..22cbfc95ff2ce 100644
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
@@ -342,6 +351,35 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
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
@@ -606,3 +644,8 @@ &xin32k {
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


