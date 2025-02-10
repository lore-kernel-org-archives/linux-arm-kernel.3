Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C22C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtwooEUXJqbc+gp6GlVVSdw12M9QnNlfkv2N7dQ+dOw=; b=SdenExsHcVpF/2E53Yrp+7Zy15
	x1vk4U/TilyoU940wwShqqcT7TeqgmSrY0CvyLb1SgAP0sDDCWV7zpJiqPyKIc+2eykN4PVu5wWsE
	wpYHQcC/Ff8In5lBhB3aTi2tXOU0nbQFKw80xmZoqvpsOPf3OosT9yy9onPu49pCn6aUT7pnTCy5M
	yoawWEkOrwVZaMADZUK7Hcwo7j0U3YYatU/g72BBiuwsdSGo2wcJ6W9NA1GDvNCgGx7AVuxWchMrq
	XEEOhQJd0emgmLFKbLufiqqPVa5XJyKIWpCeW4p6VIYZAaqHsIm2Z/LlZ463sbF+HMd+gA43OVFV1
	vXDYPhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKj-00000001fQF-3Arw;
	Mon, 10 Feb 2025 22:32:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc4C-00000001cTg-0WUU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 22:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rtwooEUXJqbc+gp6GlVVSdw12M9QnNlfkv2N7dQ+dOw=; b=HXWZYCzJF7S93soQhh3laHLhSr
	JifuXZqrigcOwyW4SMAwg5H5scGENIQPar8rXbge62TVxlQcQBmFWa1mMrTEa2oJDUeAH7BQZaaN1
	9J89OEAzl/EFzVPibSjjB1FheF2SbE/FfBvjneVYvo/bMTFs3smDT33a5BCGCzeBB4ayheSZYT7Hb
	UctJEhEX4Z6nRtMd/86hy1GEK28KqkviKvnHQFKpxoLsU1HZPP+Wyk7pkK3prOG43bhFp120RFRic
	V5bOdO4CYaHW97lUHcy0Bhzp/cC9bKhNpbojkve2i3NqKdgeuENLOauFXgeWnZjqnH23MmK3rUB8n
	Oa9MIIsw==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc45-00000000JUE-3Nyu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:15:46 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVoB121123
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:15:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739225731;
	bh=rtwooEUXJqbc+gp6GlVVSdw12M9QnNlfkv2N7dQ+dOw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Gg2PL2f5wODScub8A9bFewGw/TW/jHrolRFjgp4fSwcXiNdNA7eEtiLuF1VhxjYxZ
	 xrTh/o5Il+gosn6WnpxSOuYzpvSrBn9oVGqTKB7q1CyUUhn00GZg1206XJIrJOUyLe
	 +6L9bRYYM/OpNrJrFJzmVzVar1MwUYL5PJdvvtYA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVqJ016612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:15:31 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:15:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:15:30 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMFUZC112628;
	Mon, 10 Feb 2025 16:15:30 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v5 10/10] arm64: dts: ti: k3-am64: Reserve timers used by MCU FW
Date: Mon, 10 Feb 2025 16:15:30 -0600
Message-ID: <20250210221530.1234009-11-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250210221530.1234009-1-jm@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_221542_408390_966A0978 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Hari Nagalla <hnagalla@ti.com>

AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
main domain timers as tick timers in these firmwares. Hence keep them
as reserved in the Linux device tree.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v4:
- Reserve timers for AM64 MCU FW, patch 10/10
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index f8ec40523254b..68bd6b806f8f0 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -796,6 +796,23 @@ &mcu_m4fss {
 	status = "okay";
 };
 
+/* main_timers 8-11 are used by TI MCU FW */
+&main_timer8 {
+	status = "reserved";
+};
+
+&main_timer9 {
+	status = "reserved";
+};
+
+&main_timer10 {
+	status = "reserved";
+};
+
+&main_timer11 {
+	status = "reserved";
+};
+
 &serdes_ln_ctrl {
 	idle-states = <AM64_SERDES0_LANE0_PCIE0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 33e421ec18abb..07fbdf2400d23 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -710,6 +710,23 @@ &mcu_m4fss {
 	status = "okay";
 };
 
+/* main_timers 8-11 are used by TI MCU FW */
+&main_timer8 {
+	status = "reserved";
+};
+
+&main_timer9 {
+	status = "reserved";
+};
+
+&main_timer10 {
+	status = "reserved";
+};
+
+&main_timer11 {
+	status = "reserved";
+};
+
 &ecap0 {
 	status = "okay";
 	/* PWM is available on Pin 1 of header J3 */
-- 
2.48.0


