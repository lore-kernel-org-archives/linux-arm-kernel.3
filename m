Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67330606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v+lyJvDv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rJeLsl+T;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EPB+nD3E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CttS6bLkCRkmCK7/rWH8vIsMnUvlXcALwNj2LzjHU/g=; b=v+lyJvDvUR/SevZBTwQX4bk1Sj
	U6HCSdtnFt4isClrs7KrKFe9dz3uNg1xY9rOLzy0FQe1N0+0qNOkx2U3TXY8Huf9+l7d6eron0Qaw
	hThem3qJt0guQOefQHGIdlf2CUR37PYORanQUbtzt+aHSw7T4sd8tSD3lEgDIeV3uu1z9HH1JoBrv
	XLq79msWrtnzbivh8Z5FL6fnsMD//yCB5Xl0QTeDJttVvRHaJX7N5g27K3KSxNq2ybTrH+CzdKUof
	f7/SwOjytFlj01OnhB72ze6OKiyShvEC/YTKtt/3sYOcnfxM9mzmortn3T/es+G5sI0siAw2aSRrM
	ZbUIeQ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3d7-00000008xYG-2k1t;
	Tue, 20 Oct 2026 06:47:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3d5-00000008xXu-3ELe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Oct 2026 06:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CttS6bLkCRkmCK7/rWH8vIsMnUvlXcALwNj2LzjHU/g=; b=rJeLsl+TGcUgfCTxJMYE4fPJZX
	SxeCTAAmIXjX9mBtCIKJyGVvtfkWrFICMehKtGB74+DACesOMjSNRNR3ejAo+T7ne9WeusGJEnQLy
	xKwKySolaW4HUefu45EFgUGwsH7iN/36gxF+zGXjBkUh23IscxDJTnUZu6h3I+tdvtXcmLGJSyWmf
	IS6b7xF4JwZgdYqUCEaSce6ZE1P8StR4Y44d2KoBlkpPz3WzvYj0F8lJC8pBIWkCvWBMyq8rhnP1U
	Yt6SFYLdHYa53tOrKzD4FuC+N5Z4yaQHoJsAh75gvak0w1ytPbAj/Vx0DTDZ/qdGg+sXBv6H+MPne
	qhNIk+Pw==;
Received: from mailout1.samsung.com ([203.254.224.24])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJ3cz-00000004NlF-08w9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 06:47:22 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261020064707epoutp01ed5aea850ca616654998cfee5a63f4b4~gKf8OAgjj2286622866epoutp01k
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:47:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261020064707epoutp01ed5aea850ca616654998cfee5a63f4b4~gKf8OAgjj2286622866epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478827;
	bh=CttS6bLkCRkmCK7/rWH8vIsMnUvlXcALwNj2LzjHU/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPB+nD3EGu/FcyoOwFTrty/SmNyp3qccgrtTJ22lfAwBBvXmIf+wv/2aKK6MyyayB
	 Gil/wsKViA4/Gky/nWDpYo4n/LAGxcu+UaWWThZQX1yKjdTsTJhNpGumpyv+g+qtuU
	 rHb7faSCvM2qJCW0pIouNspIY1sl9UVIZENlNFps=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261020064706epcas5p4bd760fb2eb20a9c208831c2345c44756~gKf7WC4GN1149911499epcas5p4J;
	Tue, 20 Oct 2026 06:47:06 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j82yd1W7Hz2SSKd; Tue, 20 Oct
	2026 06:47:05 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261020063830epcas5p399de5889b53cc8d033aad76f13691bb1~gKYatkDcg1675316753epcas5p35;
	Tue, 20 Oct 2026 06:38:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063827epsmtip1d254156560785875aa46e9282f78f8da~gKYYP-GOp3272632726epsmtip1P;
	Tue, 20 Oct 2026 06:38:27 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 11/14] arm64: dts: exynos8855: add cmu_top & cmu_peric
 clock DT nodes
Date: Tue, 20 Oct 2026 12:25:55 +0530
Message-Id: <20261020065558.1829402-12-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020063830epcas5p399de5889b53cc8d033aad76f13691bb1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063830epcas5p399de5889b53cc8d033aad76f13691bb1
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063830epcas5p399de5889b53cc8d033aad76f13691bb1@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_074717_776872_592F590C 
X-CRM114-Status: GOOD (  15.97  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add required dt node for cmu_top & cmu_peric block.
This also add sysreg_peric node. sysreg_peric contains
DRCG and MEMCLK SFRs bits which are used in clock driver.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 0333b80eba84..2e5dc79d66bc 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/samsung,exynos8855.h>
 
 / {
 	compatible = "samsung,exynos8855";
@@ -170,12 +171,43 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_top: clock-controller@13900000 {
+			compatible = "samsung,exynos8855-cmu-top";
+			reg = <0x13900000 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
+
 		pinctrl_usi: pinctrl@15030000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x15030000 0x1000>;
 			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric: clock-controller@15400000 {
+			compatible = "samsung,exynos8855-cmu-peric";
+			reg = <0x15400000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_IP>;
+			clock-names = "oscclk",
+				      "bus",
+				      "mmc_card",
+				      "ip";
+			samsung,sysreg = <&sysreg_peric>;
+		};
+
+		sysreg_peric: syscon@15420000 {
+			compatible = "samsung,exynos8855-peric-sysreg",
+				      "syscon";
+			reg = <0x15420000 0x10000>;
+			clocks = <&cmu_peric CLK_GOUT_SYSREG_PERIC>;
+		};
+
 		pinctrl_peric: pinctrl@15440000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x15440000 0x1000>;
-- 
2.34.1


