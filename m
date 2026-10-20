Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDBA606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CAb1wuof;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=bEAZzL0Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWkaG3M1ybkYTdaWSTR7V1saFfsOuJsMAGwFO7f5RRE=; b=CAb1wuofllNgvJBynyycgFYYff
	bk7HmXpZNUVKd8+XMeM9mDPcnKv/tkYmZkiWg8H+bVFBK7yTbcnPujJ1WnBVkVwtLQmJQRIpDhLK1
	AMKnrQqpHS6xAQBJWz6LkiLvdEUtOaVOP+OcFiIUgAohqW/rO5bh5ygcNZCv4Kv/DD1Cb/1e0lzya
	1WJX67BI0K20PPslbU4PNKo7aA0dPxnLb9oFIx1e6KSsuR6OWMsueqYHamntvkG6HURyndJrEc5UV
	QhfTWKfPiwTNeVuhA/nzCuNIjLwJALsE3NBZxmMk82MwiQr8kFH97ktlRMqHPcAezMEDxDuZBtrBT
	Qr/qyW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3fh-00000008xpY-0eYc;
	Tue, 20 Oct 2026 06:50:05 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3fd-00000008xns-20QN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 06:50:03 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261020064959epoutp01aa7648b313d2ee0fa0be1b366dfb1ead~gKicU1b562465124651epoutp017
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:49:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261020064959epoutp01aa7648b313d2ee0fa0be1b366dfb1ead~gKicU1b562465124651epoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478999;
	bh=tWkaG3M1ybkYTdaWSTR7V1saFfsOuJsMAGwFO7f5RRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bEAZzL0QQPjcbejbEnUpg21qoiA2fCLVRFjRF9RpDjGAeQHIW+7apxeA9ZH2LWpdv
	 JosjPLyi1ebytT5IMHtmbkzqrNhlltHkgkDzN2ULqjJNhjzdQsi+hxT6HxAr6E0jPQ
	 DfFLgIL9QxOK9wnGPEAUKDykREHLmTGr4CaMRbjA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261020064958epcas5p27b1e8ab2e53212c7476b6d5529ff1d59~gKibX1GIp0635106351epcas5p2H;
	Tue, 20 Oct 2026 06:49:58 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j831x01gPz3hhTD; Tue, 20 Oct
	2026 06:49:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020063835epcas5p2d869b6a168944982aebd5defa736bba0~gKYgGN7AV2333523335epcas5p23;
	Tue, 20 Oct 2026 06:38:35 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063833epsmtip108705944dd0b2e4142e079a6a0b4d202~gKYdvlOyP0323303233epsmtip1G;
	Tue, 20 Oct 2026 06:38:33 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 13/14] arm64: dts: exynos8855: add cmu_hsi clock DT nodes
Date: Tue, 20 Oct 2026 12:25:57 +0530
Message-Id: <20261020065558.1829402-14-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020063835epcas5p2d869b6a168944982aebd5defa736bba0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063835epcas5p2d869b6a168944982aebd5defa736bba0
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063835epcas5p2d869b6a168944982aebd5defa736bba0@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_235001_854870_90D6FE6D 
X-CRM114-Status: GOOD (  15.44  )
X-Spam-Score: -4.7 (----)
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

Add required dt node for cmu_hsi block, while at it add
sysreg_hsi node which contians bits for DRCG and MEMCLK
which are used by clock driver

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index b461de6a7548..3dd7a4c4c609 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
 			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi: clock-controller@17000000 {
+			compatible = "samsung,exynos8855-cmu-hsi";
+			reg = <0x17000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_HSI_NOC>,
+				 <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "ufs_embd";
+			samsung,sysreg = <&sysreg_hsi>;
+		};
+
+		sysreg_hsi: syscon@17020000 {
+			compatible = "samsung,exynos8855-hsi-sysreg",
+				      "syscon";
+			reg = <0x17020000 0x10000>;
+			clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
+		};
+
 		pinctrl_hsi_ufs: pinctrl@17040000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x17040000 0x1000>;
-- 
2.34.1


