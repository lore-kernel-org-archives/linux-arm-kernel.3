Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4256AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PHrUgg6TPckoR3HMVBubFO+cUwHMqrSzz8aD0/+NxR4=; b=IMO1rfeB2MMTSoIXckxFNvQd2D
	TuS3ZUPXKXo21bwfsweUQao/eHddQ4PA83tnyQzGeL//vUKW+qRL8I9GyVR1W0ZAWvITWKzYROB7N
	evMSxPWzKrbM9zxyAhKHAyP9EtZPK9VejE3cf8LtfvYuLovXRnru+ibvU5LX5VbDMfXfLvjtZL7Le
	CGqHM1Ondu65kLeofxelEUzCaJon1RQtiTFIVQrzfIgAYu+8Jd7BJthoC6CaZb8bFLgHHCMjZ2POA
	AbSpzsubxTwlJEisBlal6zYCoEbBjELarzYsDU0zH7Q65PskOHaDq0wHRSJlq7TLRXD+p/pQ5opgQ
	92Lje+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78XL-00000006D6t-3wzV;
	Tue, 22 Apr 2025 07:59:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77oA-0000000657b-1n0n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:12:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u77o8-0002Zv-NA; Tue, 22 Apr 2025 09:12:40 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u77o8-001Va5-1K;
	Tue, 22 Apr 2025 09:12:40 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u77o8-000iPF-16;
	Tue, 22 Apr 2025 09:12:40 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 22 Apr 2025 09:12:35 +0200
Subject: [PATCH] arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-imx8m-nominal-noc-v1-1-889592ff65a5@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAGJBB2gC/x2MywqAIBAAfyX2nKCL0uNXooPVVgupoRBC+O9Jp
 2EOMy8kikwJxuaFSA8nDr6KahtYT+sPErxVB5RopEYU7HLvhA+Ovb0qV9GT2hYjcTCdhtrdkXb
 O/3OaS/kAzJCKomMAAAA=
X-Change-ID: 20250422-imx8m-nominal-noc-8e1db5029574
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_001242_469570_DEE5E450 
X-CRM114-Status: GOOD (  12.69  )
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

When running in nominal drive mode, the maximum allowed frequency for
the NoC is 800MHz, but the OPP table for the i.MX8MP interconnect device
listed the 1GHz operating point for the NoC, regardless of the active
mode.

The newly introduced imx8mp-nominal.dtsi header reconfigures the clock
controller to observe nominal drive mode limits, so have it modify the
maximum NoC OPP as well.

Fixes: 255fbd9eabe7 ("arm64: dts: imx8mp: Add optional nominal drive mode DTSI")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Support for &{label/node} syntax was first vendored into Linux with
v6.2. It's useful here to avoid one-off labels while still ensuring
that a compile error results when the original node disappears.
---
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index a1b75c9068b288a2fba73bbd96b1519a50df85a3..115a6da08643bc1b23731c146df9c9dc36b4e85c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -62,3 +62,5 @@ &media_blk_ctrl {
 			       <0>, <0>, <400000000>,
 			       <1039500000>;
 };
+
+/delete-node/ &{noc_opp_table/opp-1000000000};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57eef9489645f498a89f4bd8f3388d5..7c1c87eab54cc632643f206bd80ce7b7b49505de 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1645,6 +1645,12 @@ opp-200000000 {
 					opp-hz = /bits/ 64 <200000000>;
 				};
 
+				/* Nominal drive mode maximum */
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+				};
+
+				/* Overdrive mode maximum */
 				opp-1000000000 {
 					opp-hz = /bits/ 64 <1000000000>;
 				};

---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250422-imx8m-nominal-noc-8e1db5029574

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


