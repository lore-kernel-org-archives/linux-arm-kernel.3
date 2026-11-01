Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE77606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J37mUgWw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qkfPS8hofwtnNm0CXa6ZP95vc5TkVzOTDVJ6YjTfRpo=; b=J37mUgWwbx2GvuOCtZtltJUXO8
	a7h2fzGQBP84jriEB6k0JP8GE2ChnvuhPZKK5oUet6ylthsWfKpL7aR1y40P+xJ4oHS/S30kT/4vK
	q2l/J/0GbwuHghDTEP24IjgtCqN97UbbI2ShenEvZ1i/YLvMDsrhoJs0GIqUUBkVw7fRkaO2FjL02
	NbIwCnTe91Xy3pjcYj+m+WtU/rTUaPtQxdAe1lwH4N//LfK2qChvlSZUx5PaxAj4wbPFwsNS4Ap0k
	YFH7QsUOnCZdGSn+p+5fAJ23hdMJg+JS+T5vMMdpssExIoAzgYm+KvkW1h3ageso/eH4+c3TmSpm0
	rNJSW96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNSMP-0000000E4Xh-0174;
	Sun, 01 Nov 2026 10:00:21 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNSMJ-0000000E4X7-2OyH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 10:00:18 +0000
Received: from Vostro-3710.lan (unknown [IPV6:240e:3bc:2e87:4e80:2a7b:821a:ffcf:549e])
	by smtp.qiye.163.com (Hmail) with ESMTP id 531059d45;
	Sun, 1 Nov 2026 18:00:04 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/1] arm64: dts: allwinner: a523: drop redundant status=okay
Date: Sun,  1 Nov 2026 18:00:00 +0800
Message-Id: <20261101100000.725282-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1968d4b0703a2kunm959b05f2a51c2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkwYVkwaHk8aH00eHUpNQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0seQUgZGEFJHkNMQU8eQ0tBSRpMGUFDSUoaQR0dGB1BTk
	9CHllXWRYaDxIVHRRZQVlPS0hVSktJQkNDTFVKS0tVS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_020015_815212_07448491 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Device nodes are enabled by default, so no need for
status="okay" property.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
Changes in v2:
  Remove `status = "okay"` from the pmic node.
  Link to v1: https://lore.kernel.org/lkml/20250901120020.181414-1-amadeus@jmu.edu.cn/
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 1 -
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 1 -
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 1 -
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 1 -
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..aa23d9062a3d 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -386,7 +386,6 @@ wdt: watchdog@2050000 {
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "hosc", "losc";
-			status = "okay";
 		};
 
 		uart0: serial@2500000 {
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index bfdf1728cd14..384a6174de3a 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -297,7 +297,6 @@ axp323: pmic@36 {
 		interrupt-controller;
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		status = "okay";
 
 		vin1-supply = <&reg_vcc5v>;
 		vin2-supply = <&reg_vcc5v>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index eb9fd0a65b41..ff772dfd5c92 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -249,7 +249,6 @@ axp323: pmic@36 {
 		interrupt-controller;
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		status = "okay";
 
 		vin1-supply = <&reg_vcc5v>;
 		vin2-supply = <&reg_vcc5v>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 85247186461d..e6c24e925a54 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -356,7 +356,6 @@ axp323: pmic@36 {
 		interrupt-controller;
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		status = "okay";
 
 		vin1-supply = <&reg_vcc5v>;
 		vin2-supply = <&reg_vcc5v>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 26ce579b42bf..7d056d555e36 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -341,7 +341,6 @@ axp323: pmic@36 {
 		reg = <0x36>;
 		#interrupt-cells = <1>;
 		interrupt-controller;
-		status = "okay";
 
 		vin1-supply = <&reg_vcc5v>;
 		vin2-supply = <&reg_vcc5v>;
-- 
2.34.1


