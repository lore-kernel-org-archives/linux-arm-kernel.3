Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B28C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c30cFW/Jdw0cb31QGl1jPJwN0K3fYkjWV360hRC2iOI=; b=ms0oM4JgL6PBLYuO8ZhMUFnBGS
	2u9KWiVkcEw4Bj3qMo1oG7wqLLCyQnce20y6M74VrNskHQkf10C8tJLNSmDBhwsRAWUMVsoqZuzYh
	lAgj23nU2Qo6SQHItadTA/1rZLzI4EBSU/tHnMYiFXCNpC5v3pOmLYrEC2Qxvig60F27VCdKqiU4p
	RA7TL9yKChtVOy48D/r1lOodJXg2Y6QK+M/FnKi4RW1vozkeDZXMiVngWyjFcb3yIbqtQbxe65u7U
	+EcaqWeZ2SYygtknko4BRzP2bbj8Xk+48Bp/kGeF+2adXe3EQPDFJcL3lXLsxjCksGy6iPaQN6Vwi
	h9IkFuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyohy-00000000dRN-2Muj;
	Tue, 25 Aug 2026 10:48:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoht-00000000dLg-1jMM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06C4944F55;
	Tue, 25 Aug 2026 10:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBA23C2BCFB;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654920;
	bh=6jOFUYvgMlcmzafj/Ti74phm3e09p8uFSSwu6v757NU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a3cZLascbDxL1ZPivBZ5+d92jyNU9u8kz28ZCtM0E0UzGdYZYlbrUc4bo/q6DR6Qr
	 IA+YswSO7Ea/cMka9/rtuilA7SdOoyL8yUUdbMQOwDkMNtgPnEWYSqq8nhC7r+bhL4
	 O/zw5BIXfy5wCCe4zWF/OR8WDVa30Ho3hnqnzp89Xv8HRJPhjrverB/4W9SO0Jbd3S
	 wVO1UWWvx8htDS1ahpBrN84mTYPHMNCXBSQ83PdrqxVHOwVq89a8obiZAjJr6iWr68
	 4aVfegnGKqHZNZ/Likh/Yhgz1jaXt3fZpYtg7MrCDztYcWGMccBudmHTx5qShW6JHF
	 VJibGegl6sbqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9330C61DC4;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 25 Aug 2026 18:47:51 +0800
Subject: [PATCH v6 10/12] ARM: dts: aspeed: anacapa: Add LPDB fuse monitor
 GPIO expander
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-anacapa-devlop-phase-devicetree-v6-10-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654905; l=3697;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=E531mFcQuSg4vkfS0BrbVzRcV4G9+LgoYtq/R4Xx1MI=;
 b=UjQBhYpkRedPJGHhjHpjBxaA7X7I2AKSg5HvZVfdXO73zjLgpdDG00HVQ0TMRWF2h4ynW5o8K
 giROwDkqboJAqjqasdnTAu8sFudjHh//Uaw8jhZy44wIXQStaTXYPeG
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
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
Reply-To: u8813345@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rex Fu <rex.fu.amd@gmail.com>

Add PCA9554 GPIO expanders for PDB fuse monitor signals on the
Anacapa DVT board.

The patch adds GPIO expander definitions for both the left and
right PDBs under the i2c8 multiplexer and updates the associated
gpio-line-names to reflect the final signal assignments.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
index 975d603ca540..923954cff7a2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
@@ -8,6 +8,98 @@ / {
 	model = "Facebook Anacapa BMC";
 };
 
+// MB - PDB
+&i2c8 {
+	i2c-mux@72 {
+		i2c@0 {
+			gpio@22 {
+				gpio-line-names =
+					"RPDB_FAN_FULL_SPEED_R_N", "RPDB_I2C_TMP432_U8_ALERT_R_N",
+					"RPDB_I2C_TMP432_U29_ALERT_R_N", "RPDB_GLOBAL_WP",
+					"RPDB_FAN_CT_FAN_FAIL_R_N", "RPDB_VERID_A0",
+					"RPDB_VERID_A1", "RPDB_VERID_A2",
+					"RPDB_ALERT_P50V_HSC2_R_N", "RPDB_ALERT_P50V_HSC3_R_N",
+					"RPDB_ALERT_P50V_HSC4_R_N", "RPDB_ALERT_P50V_STBY_R_N",
+					"RPDB_P12V_MB_VRM_ALERT_R_N",
+					"RPDB_P12V_STBY_VRM_ALERT_R_N",
+					"RPDB_PGD_P3V3_STBY_PWRGD_R",
+					"RPDB_P12V_STBY_VRM_PWRGD_BUF_R";
+			};
+
+			gpio@24 {
+				gpio-line-names =
+					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
+					"RPDB_PWRGD_P50V_HSC4_SYS_R",
+					"RPDB_PWRGD_P50V_STBY_SYS_BUF_R",
+					"RPDB_P50V_FAN5_R2_PG", "RPDB_P50V_FAN6_R2_PG",
+					"RPDB_P50V_FAN7_R2_PG", "RPDB_P50V_FAN8_R2_PG",
+					"RPDB_SKU_ID0", "RPDB_FAN5_PRSNT_N_R",
+					"", "RPDB_FAN6_PRSNT_N_R",
+					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
+					"", "";
+			};
+
+			gpio@38 {
+				compatible = "nxp,pca9554";
+				reg = <0x38>;
+				#gpio-cells = <2>;
+				gpio-controller;
+
+				gpio-line-names =
+					"RPDB_P50V_FUSE2_TVS1", "RPDB_P50V_FUSE2_TVS2",
+					"RPDB_P50V_FUSE3_TVS1", "RPDB_P50V_FUSE3_TVS2",
+					"RPDB_P50V_FUSE4_TVS1", "",
+					"", "";
+
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+			};
+		};
+
+		i2c@1 {
+			gpio@22 {
+				gpio-line-names =
+					"LPDB_FAN_FULL_SPEED_R_N", "LPDB_I2C_TEMP75_U8_ALERT_R_N",
+					"LPDB_I2C_TMP432_U29_ALERT_R_N", "LPDB_GLOBAL_WP",
+					"LPDB_FAN_CT_FAN_FAIL_R_N", "LPDB_VERID_A0",
+					"LPDB_VERID_A1", "LPDB_VERID_A2",
+					"LPDB_ALERT_P50V_HSC0_R_N", "LPDB_ALERT_P50V_HSC1_R_N",
+					"LPDB_ALERT_P50V_HSC5_R_N", "LPDB_I2C_P12V_SW_VRM_ALERT_R_N",
+					"LPDB_EAM0_PRSNT_MOS_N_R", "LPDB_EAM1_PRSNT_MOS_N_R",
+					"LPDB_PWRGD_P50V_HSC5_SYS_R", "BARKLIP_PRSNT_N_R3";
+			};
+
+			gpio@24 {
+				gpio-line-names =
+					"LPDB_P50V_FAN0_R2_PG", "LPDB_P50V_FAN1_R2_PG",
+					"LPDB_P50V_FAN2_R2_PG", "LPDB_P50V_FAN3_R2_PG",
+					"LPDB_P50V_FAN4_R2_PG", "LPDB_FAN0_PRSNT_N_R",
+					"LPDB_FAN1_PRSNT_N_R", "LPDB_FAN2_PRSNT_N_R",
+					"LPDB_FAN3_PRSNT_N_R", "LPDB_FAN4_PRSNT_N_R",
+					"LPDB_SKU_ID0", "",
+					"", "",
+					"", "LPDB_PG_P3V3_R";
+			};
+
+			gpio@38 {
+				compatible = "nxp,pca9554";
+				reg = <0x38>;
+				#gpio-cells = <2>;
+				gpio-controller;
+
+				gpio-line-names =
+					"LPDB_P50V_FUSE0_TVS1", "LPDB_P50V_FUSE0_TVS2",
+					"LPDB_P50V_FUSE1_TVS1", "LPDB_P50V_FUSE1_TVS2",
+					"LPDB_P50V_FUSE5_TVS1", "",
+					"", "";
+
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+			};
+		};
+	};
+};
+
 &sgpiom0 {
 	bus-frequency = <2000000>;
 	gpio-line-names =

-- 
2.34.1



