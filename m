Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DA0C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 06:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cWcMd28LdZJtvaKT2lTtEEObHQnShKEwJB2WsINCaRk=; b=tckd8JzW8gGcNUM7creJJ+F2pN
	i7J8MPQlN5nQfWBXZBe/4KxtdH9nSPte30gRYzhekwM+fFTGuNXHv12thjNPmuotbjm2sc075mMfG
	jMik5FehvokmNtzmjtfn3tYRkWzWLEPxKXa9SVGLbmnb2GOEdiZZa1cneXmADvKr866EyiVdln0/B
	fC2VAng+wPmsmKVXbzNS2gRUv+zemqIYuTX6RAe6jMsDrcyhCP9qLaEjyyQ8QM1ivxuQschi4GPAX
	+5JAu9SYjUs+rHhPL6atCPQlLX2o/MaHLS2cVoKcri8jK949G+HU+uoKuWVwaS0dKy03eCK6HLYQv
	oUBzOnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYmR-00000004AJI-3GQG;
	Tue, 15 Jul 2025 06:04:43 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYhM-000000049c9-3yWe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 05:59:30 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 4F899240028
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1752559163; bh=cWcMd28LdZJtvaKT2lTtEEObHQnShKEwJB2WsINCaRk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=gldnOpwH6PEH0RgZG5SIBjRQauWPfke8wj178y0ekjfrdutj/WVXtdwqjMv7t10nX
	 /6RDUL8NgYkcapZIGJmDb6HEdlt8RJGeCvukQfQI5TfMnHa6Jb5yntWbL2oTNITTQo
	 jhQEgC7DpGIhz8K/ExrIuwhDBtlcpYrDB7ObJ2Z9hnq23L9riv0yrGqMTv7ZKTnW88
	 Kh80nFsgOwfroB7Af2kMWl6lrPOUuXACjHPC61JG3SOHVRrDMJplsoONw6sIekCkGm
	 UPiy0GjIbeQaOisFefm0uk1SHNSMT67EzXSzLJ7D4o9Dmc3KcrPkFRxbq5rXE7TMnF
	 el/ZjB6Vqqhrg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bh7mn3cD9z9rxD;
	Tue, 15 Jul 2025 07:59:21 +0200 (CEST)
From: Martin Kepplinger <martink@posteo.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Kepplinger <martink@posteo.de>
Subject: [PATCH 1/2] arm64: dts: imx8mp: add idle cooling devices to cpu core
Date: Tue, 15 Jul 2025 05:59:22 +0000
Message-Id: <20250715055903.1806961-1-martink@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_225929_124141_F6A85A73 
X-CRM114-Status: UNSURE (   8.85  )
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

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bb24dba7338ea..66e1a27d6eed9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -80,6 +80,11 @@ A53_0: cpu@0 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+			cpu0_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_1: cpu@1 {
@@ -98,6 +103,11 @@ A53_1: cpu@1 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+			cpu1_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_2: cpu@2 {
@@ -116,6 +126,11 @@ A53_2: cpu@2 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+			cpu2_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_3: cpu@3 {
@@ -134,6 +149,11 @@ A53_3: cpu@3 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+			cpu3_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_L2: l2-cache0 {
-- 
2.39.5


