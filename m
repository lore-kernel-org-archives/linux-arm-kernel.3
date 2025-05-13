Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC901C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eg2RLq5HKtaxZ8TLlhhXyUxGYIdmPjE+5+PbHdsfi00=; b=dRKSOwsWJsilVKoA+TR34F7f7w
	dP3XPkrpWUTuURDm+KRc4VCsmvKFGqFfq0PKtfFqGzcZOV2J86dJkwW7VS+aU+hTLDvqyCkij2AZ4
	u4mtzibxytGzqx29BEBLP2qMvRNjueRqXFHto5r91MvnpUG5/g9IhAXfsOVhZ/bd95u3vA3SyYBbN
	hZNHSKMVBUzCIPvXHFeJmbSdBZC1JDw8iAOk1ZhLNZMCQ8kdqMeprR1NKe6ZqZW2vk+P7uBhhPWIn
	2qAc0fTfzFfzf969YFUzClpXo06P7OoVjuTbiS+ptJtcGfBRjOaIo21jM/ZRMUciR+757401ZpZNI
	plbLFong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExhD-0000000Dclm-3rqC;
	Tue, 13 May 2025 22:01:55 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExf6-0000000DcNg-06FV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:59:45 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxaSb2425891;
	Tue, 13 May 2025 16:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747173576;
	bh=eg2RLq5HKtaxZ8TLlhhXyUxGYIdmPjE+5+PbHdsfi00=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p3Lt/g9G0a88NqAQhNyRc900jqn7/juwG4vqL1a5QKK8GUYbq7PuZFU7gJczi7B7p
	 qmJNbN3TTH3CYnP03w90YQDRjluasJwCTBfDeIVyiLzUQnjLWse+zmB3dcF0fnypkB
	 Gxt7nep74RR/gTXh2YRIQ+TUqXizNF+VdxGbm/uw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54DLxZpw1915694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 16:59:35 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 16:59:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 16:59:35 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxYdH111031;
	Tue, 13 May 2025 16:59:35 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 6/7] DONOTMERGE: arm64: dts: ti: k3-am62-main: Add PRU UART node
Date: Tue, 13 May 2025 16:59:33 -0500
Message-ID: <20250513215934.933807-7-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513215934.933807-1-jm@ti.com>
References: <20250513215934.933807-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145944_148742_76E7824A 
X-CRM114-Status: UNSURE (   9.54  )
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

There is one PRU UART module in the PRU subsystem for am62 SoC.

Add a PRU UART child node in PRUSS node in am62 main voltage
domain .dtsi file for am62x device.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 9e0b6eee9ac7..c012f33f4609 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -1144,6 +1144,15 @@ pruss_intc: interrupt-controller@20000 {
 					  "host_intr6", "host_intr7";
 		};
 
+		pruss_uart: serial@28000 {
+			compatible = "ti,pruss-uart";
+			reg = <0x28000 0x40>;
+			clocks = <&k3_clks 81 13>; /* pruss_uart_clk */
+			interrupt-parent = <&pruss_intc>;
+			interrupts = <6 4 4>;
+			status = "disabled";
+		};
+
 		pru0: pru@34000 {
 			compatible = "ti,am625-pru";
 			reg = <0x34000 0x3000>,
-- 
2.49.0


