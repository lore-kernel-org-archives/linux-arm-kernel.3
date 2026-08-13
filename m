Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC4CC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9a20wqiX5jfXMCYHkvvGz0w/Eo1PPQ8K/qd7EvdOyM=; b=3PjfDvVWxGymBH7JAHaYVQYBPV
	IcqljUlYPAhFkUNj5eSZ5pr8J4BvfOJh3TN+L9/HBeMETh9W5YRBDjJIdE5SJtGhiWbUv2IgCoZcE
	XvHr3t+Sk9YUjDrwAU7PDKMxm6wM1t8upth+sCBpUOqlHbh0aFT3+PQNWYmO0bal7DhuHA6FwRxOv
	cvKGvA0pl1fkmkdtNP9J27HRz+KVNF8VxzQ+ZoYkiUO9r0NwjpZCuFZm+JH/orLFLAc2+fLat9UN1
	RUcL/8PUL0XakxR3TDGMuS6e0E8MzSiQdBR587g2b44FFd8VkOFLmvYQO1eiHUctU7IzO/q6f1YTF
	dZXzFLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6M-00000000b85-3LA0;
	Thu, 13 Aug 2026 12:00:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6L-00000000b6W-1UJT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBD4744071;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49E14C2BCFF;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622400;
	bh=TvfqYkcyVz8NemCQfEvCt2KSWTiyYhcCTYK5XdDbYxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SF43Wt9G2vaW2ve2VLnIaF5m8AW+4vSzryi+v3cC0t67AFTR8BGLRs9b1Njobq1Pl
	 5LyJ3KgwcC5mXxQVpyjzuTagF+Nb4IzZMT8USznNZLuTGiEBWWTuUuA0kHre2FK/t8
	 /JrQYZwW/ktDHphHvlTdQOPb/WG3w/BBCZcTwk2mtCWVqYVTubpN1e5rFQDqKodd0T
	 ZLcuKkQYtH2iBVYIEwrrq4X9cvEIdOGGcibAXMip/J1bPLUpTgbWD9DycG369+SzsM
	 z1OWewdfg3Di9NbsbSjfyceP8Irp8PNweRxNjbQCfga274dMFnaDlsJzUQtKiybbe+
	 MrsjkZ6tstlGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ECAC5DF66;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:39 +0800
Subject: [PATCH v5 09/15] ARM: dts: aspeed: anacapa: evt2: Add shunt
 resistor values for HSC monitors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-9-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Peter Shen <peter.shen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=2147;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=WNTfq2afBfA8+J3QozrER71+gm8MPJIV48F5xeH186s=;
 b=523oHOdDWNNkRW7XTPHdzWMnEQ5tIse+VNgOaa8eWqFLogKrRThVuWdrld7oCDY3L8NeG0j/J
 3HRRLnhQlH8AQcnA3yfPRny/BtFO39kPcKvvyRdhbeRq0QuOKvauhYy
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

From: Colin Huang <u8813345@gmail.com>

Add shunt resistor configuration for LTC4287 hot-swap controllers on
Anacapa EVT2 platform.

The resistor values are required for accurate current and power
measurement by the driver. These settings reflect the actual BOM used
on EVT2, where different sense resistor values (150 uOhm and 250 uOhm)
are populated across rails.

Without this configuration, the reported readings would be incorrect.

Signed-off-by: Peter Shen <peter.shen@amd.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index 703284721224..f913fa3f622d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -31,6 +31,26 @@ / {
 &i2c8 {
 	i2c-mux@72 {
 		i2c8mux0ch0: i2c@0 {
+			power-monitor@42 {
+				compatible = "lltc,ltc4287";
+				reg = <0x42>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+			power-monitor@43 {
+				compatible = "lltc,ltc4287";
+				reg = <0x43>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+			power-monitor@44 {
+				compatible = "lltc,ltc4287";
+				reg = <0x44>;
+				shunt-resistor-micro-ohms = <250>;
+			};
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
+			};
 			gpio@24 {
 				gpio-line-names =
 					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
@@ -45,6 +65,21 @@ gpio@24 {
 			};
 		};
 		i2c8mux0ch1: i2c@1 {
+			power-monitor@40 {
+				compatible = "lltc,ltc4287";
+				reg = <0x40>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+			power-monitor@41 {
+				compatible = "lltc,ltc4287";
+				reg = <0x41>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
+			};
 			gpio@24 {
 				gpio-line-names =
 					"LPDB_P50V_FAN0_R2_PG","LPDB_P50V_FAN1_R2_PG",

-- 
2.34.1



