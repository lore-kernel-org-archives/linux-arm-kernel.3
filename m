Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB535D609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 19:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NUwvPX0MOAvcZ/YKwNUB7Ir//X4GIxswkTSCTubvFoA=; b=HZaurc7NOCFDfhgiz4Oi4fXygF
	ETufUQqWKuB1Ttw+2vhwAF6pq14oa1QJZCzx9Y7BDdyxHvgbtzSJ9gdBh+egwDDM8Py+hzoP2smsx
	RLWZ5AZ9CWilpF+ieT6BfDKnVSIsMvvX7PSaQ5MeNxPRwBavO3qPn/VWpcjs3h20JO8ZCIsoLp1Z9
	sFljnBijGiiB8AaDasBxfXbI9+5UQu816dUxMw8gea/YxP50mxC34KgeBtoKLJVNKG18WyilvoP+N
	5S5gOZcyU1yc2T+tCyPUoycNR+xxFJ662Ciw5eOaLXBvpArTNjxTEHgFWc3t4NkLIhvPgPhQWhCpK
	48FngUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVaTb-00000005jww-0qaA;
	Tue, 16 Dec 2025 19:12:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVaTa-00000005jwm-0npa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 19:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F88060137;
	Tue, 16 Dec 2025 19:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353A2C4CEF1;
	Tue, 16 Dec 2025 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765912369;
	bh=lZ1L36MMIvqC3ItTAU11Z5ZidG2aFDbgBmoFw5G5xis=;
	h=From:To:Cc:Subject:Date:From;
	b=M5obNDteU4o4mV8OFBa77Oiq9OosbnLYuPXvNuf/t2eZ5LnDMYbp0k/NA+X1Nd1uZ
	 4jQ6S60XdmhsZAfHWvJrcol4iA51yqLNhcgEV6CjfWmnt148IxJhYMf88n+JB02GUG
	 w7Z0kgXNKmBkT5/pFpd+MUL2H6VDFex0veX4kmPAi+GTM7h2xNvDU6GDBAD8fAV46G
	 +z64gtwrmsaGqf+rSBHLeaAvV2VP153wzq0deDtxs50FtccrqXnq1z3ngsYZcQubyC
	 G0mtPXAC7Sihk4D2nBjXBHLwCsrrNc2jkrLC23r1cyimf0cAgjVfQEwoFwmaYPFNhU
	 Ct9a3Pp2ib5sQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: vexpress/v2m-rs1: Use documented arm,vexpress,config-bus child node names
Date: Tue, 16 Dec 2025 13:12:12 -0600
Message-ID: <20251216191212.2879226-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Update the arm,vexpress,config-bus child node names to use the
documented ones. Most of these were updated a while back, but I missed
these.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers may want to take this directly?

 arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
index 158b3923eae3..248b8e492d43 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
@@ -420,7 +420,7 @@ mcc {
 					compatible = "arm,vexpress,config-bus";
 					arm,vexpress,config-bridge = <&v2m_sysreg>;
 
-					oscclk0 {
+					clock-controller-0 {
 						/* MCC static memory clock */
 						compatible = "arm,vexpress-osc";
 						arm,vexpress-sysreg,func = <1 0>;
@@ -429,7 +429,7 @@ oscclk0 {
 						clock-output-names = "v2m:oscclk0";
 					};
 
-					v2m_oscclk1: oscclk1 {
+					v2m_oscclk1: clock-controller-1 {
 						/* CLCD clock */
 						compatible = "arm,vexpress-osc";
 						arm,vexpress-sysreg,func = <1 1>;
@@ -438,7 +438,7 @@ v2m_oscclk1: oscclk1 {
 						clock-output-names = "v2m:oscclk1";
 					};
 
-					v2m_oscclk2: oscclk2 {
+					v2m_oscclk2: clock-controller-2 {
 						/* IO FPGA peripheral clock */
 						compatible = "arm,vexpress-osc";
 						arm,vexpress-sysreg,func = <1 2>;
@@ -447,7 +447,7 @@ v2m_oscclk2: oscclk2 {
 						clock-output-names = "v2m:oscclk2";
 					};
 
-					volt-vio {
+					regulator-vio {
 						/* Logic level voltage */
 						compatible = "arm,vexpress-volt";
 						arm,vexpress-sysreg,func = <2 0>;
-- 
2.51.0


