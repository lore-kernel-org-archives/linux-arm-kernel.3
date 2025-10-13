Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F980CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uDDLy97KRncYr0keeDpVgzvm9n2KqzdF0fqDBZD8pkA=; b=gHKz4vQeOyQzg7FVlBD7DfQKRl
	Qm/+K4I10GEX32UYDA0uLtTlVI0T10oxAB/vQ0ckmvP/8XXAbcEi79Rxed53IeTUQbWxT142uRSAq
	ewTkxDmU716XmbhLKpr16Qa8UwnzT8InM7s9u4G5sMqGqeYKl8MnMyNvGzUCzqBtmv2uAjqblqmcL
	h+bcbpyUtXAGU+0lfhnle38KGN95Ty9oBjB7rVDBZS2LfdKJf1E+TNVYzNsJC0xB+DtFDrjp2IUQ4
	Ap2L52O4ja06krEjMLyDq+z2Kvv+CKbQivKe+3x+I6yHrtZMBQE9WStSTjnPQtxYy0V3WTkd0TUqP
	0y9dTemw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CWo-0000000CRTn-0AnL;
	Mon, 13 Oct 2025 06:59:30 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CWk-0000000CRRs-3HVQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:59:28 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 77B3D240103
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:59:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760338761; bh=uDDLy97KRncYr0keeDpVgzvm9n2KqzdF0fqDBZD8pkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=dxvQSPWOASxImW1hmju0Nn5f3cKNTEe7+et/pWf+QbyW/huJ14NvX/lcbITWZtsKr
	 3mzHxwhlWWCwA6G6ltWFtJ3B0tqe5oWA09kNZas+dsVtD/i3QQjLNMaP+dDyAh/GbA
	 p5dOzUpC3RRHMo6ivFbvyu4GXJtp3H1S+VSbIJUrjqwD2WTwCv7GQbFHZ0aKjYkEsy
	 n5gJpogXI/TVnrGYrffjapE5aSfUpZo3IgdvCnRZQt/kMBlsS1z+HmgOo7e99Sc31P
	 1sSP0gJyAsaIxqiZ5PKrqKRytrJWc4M8mpOB9XnA5Pj/AHedMxuJCeMrfAEajcvMlM
	 yOSkPe3ysb/Ww==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4clSrQ2dVRz6twZ;
	Mon, 13 Oct 2025 08:59:18 +0200 (CEST)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH v2 1/2] arm64: dts: imx8mp: add idle cooling devices to cpu core
Date: Mon, 13 Oct 2025 06:59:19 +0000
Message-ID: <20251013065903.35216-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_235926_959666_F6CD2A0B 
X-CRM114-Status: UNSURE (   9.70  )
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

The thermal framework can use the cpu-idle-states as
described for imx8mp as an alternative or in parallel to
cpufreq.

Add the DT node to the cpu so the cooling devices will be present
and the thermal zone descriptions can use them.

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
---

hi Shawn and all,

SoCs rarely describe and enable the idle-inject mechanism. IMO it is
desired if only in order to have an example of it merged.

revision history:

v2: thanks Shawn
- add a newline between property and child node.

v1: https://lore.kernel.org/linux-arm-kernel/20250715055903.1806961-1-martink@posteo.de/

thanks,

                               martin


 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index a3de6604e29f..9b59f53952d5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -80,6 +80,12 @@ A53_0: cpu@0 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+
+			cpu0_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_1: cpu@1 {
@@ -98,6 +104,12 @@ A53_1: cpu@1 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+
+			cpu1_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_2: cpu@2 {
@@ -116,6 +128,12 @@ A53_2: cpu@2 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+
+			cpu2_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_3: cpu@3 {
@@ -134,6 +152,12 @@ A53_3: cpu@3 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+
+			cpu3_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_L2: l2-cache0 {
-- 
2.47.3


