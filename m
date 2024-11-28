Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC17D69113
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbd0uGgDzZOpstd465xtGy3xnW1Im7GM852bz7mrUmw=; b=mPm5i1RL8Y41f+sKe+4acVoQsZ
	2XNkaHBjjuF39d05uczMDF9kbG78haXU2Ii99QXa2bee8psKgGlHw67w8hqQ3L1fWfPSNfWcEGB+h
	GVyFUWd8EfFcdeJ2wbeGl5Q52a95mTdUxa5AYVcRAENJ4hGHNz4Zcy1xKcFEfk5J9TJbgI2lwLLGD
	ZBHD2ceFZyEgDXsQjlLLrEqEZhVIg7McO5pTdAX/34voJYIUbkSZhra5rCSAs/wjBO7QU3ar26wYV
	HVw/PoiogRq61KMLzlUs9Mz+rKNOjBDTQdhyQIKRxC1aELP1MRrgKVvkas5rXI5uBWTUrC0Fd91BF
	yiExgw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfF1-0000000Fj2L-2m5O;
	Thu, 28 Nov 2024 14:11:35 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfCI-0000000FiUe-0W8l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 14:08:47 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ASE8bFC113001;
	Thu, 28 Nov 2024 08:08:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732802917;
	bh=jbd0uGgDzZOpstd465xtGy3xnW1Im7GM852bz7mrUmw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HbtA2dhIJgxO5N2vzq9b8vKYMCJvo/4eGlLNUbRKVzn/sSxobAiK/OgXRiOuvOJ+R
	 s0RgZ6P1pV0zpfSRpPBVHz3EdyXgEcDKcMnpU/ooFxzO6qC2mktJ6XmMRERkXO0ZhY
	 /bz28N0uJLP1WE/MULNaqBVxv80H+Xm26SpifhQI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ASE8b5U022141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Nov 2024 08:08:37 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Nov 2024 08:08:36 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Nov 2024 08:08:36 -0600
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ASE8Qcf019782;
	Thu, 28 Nov 2024 08:08:34 -0600
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j784s4-main: Add PBIST_14 node
Date: Thu, 28 Nov 2024 19:38:25 +0530
Message-ID: <20241128140825.263216-3-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128140825.263216-1-n-francis@ti.com>
References: <20241128140825.263216-1-n-francis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_060846_206719_D6C9019A 
X-CRM114-Status: UNSURE (   9.34  )
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

Add DT node for PBIST_14 that is responsible for triggering the PBIST
self-tests for the MAIN_R5_2_x cores.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 0160fe0da983..f96113d8db22 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -113,6 +113,17 @@ serdes2: serdes@5020000 {
 			status = "disabled";
 		};
 	};
+
+	bist_main14: bist@33c0000 {
+		compatible = "ti,j784s4-bist";
+		reg = <0x00 0x033c0000 0x00 0x400>,
+		      <0x00 0x0010c1a0 0x00 0x01c>;
+		reg-names = "cfg", "ctrl_mmr";
+		clocks = <&k3_clks 237 7>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>;
+		bootph-pre-ram;
+		ti,bist-instance = <14>;
+	};
 };
 
 &scm_conf {
-- 
2.34.1


