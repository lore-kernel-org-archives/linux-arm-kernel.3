Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A61C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UIiQvVFfo75L239foWkL3IuUSVJzHOqP8t32ghz+BLg=; b=iQoHUPz6/yR8PzIJSTeO/8jVdm
	uh8raz5xpuzgSrcAyrUasZkDRKKCLL4hNpPzMZFgyGuLCqd6LHSzT/8+ecAFZmK70bxJ9XCfKLqDj
	oZp8QHBXOcBX0bjznmY3vosB+vw92HeFruA6V0wiOm/hMPjDqpTzB63WJK41kCUtc4CUlpgsfrS0P
	/HKHg1kppwSClp5eWUptcVkXThijbNU57zmcZkq9JfMhb/V6VnPd0Ov1t+ylgOH3pBTQIG582FwzM
	iNar9v5lOkJPU844C11Y6vOh4g3zZGvPzJ1PbQC1kytmirJ5wICSzjAVtW3wURi9VNsCsppBIK5yX
	5in+SDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2m2e-00000009TvM-0T9p;
	Thu, 10 Apr 2025 07:09:40 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2la4-00000009Ora-3QkE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:40:10 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 964FC1F95D;
	Thu, 10 Apr 2025 08:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744267207;
	bh=UIiQvVFfo75L239foWkL3IuUSVJzHOqP8t32ghz+BLg=; h=From:To:Subject;
	b=TAvYlURAM8YXb3T2T5UYXvy38bcKn9vgNq3K47P2uPorF8Ch6B78TsJK/4LLm+S2i
	 R+4OvzsuNQWQ4aVSANaT3Z1F7ofPyKXFbiUN5v9LOvnbzwLodbt2hgEcVbui7qH9SE
	 m83horlV/TUevAfQV9i65s/wN22DLXlP7bx223lE109KRBd78WXWNq1GAnjo6u0D9X
	 EQC5HpENNgnTYKMVpmEoh3ljkBmnNa1UkgIqXYgblYeu3tuj21nkO6nwQz4JQYSnR4
	 RN2TjFLuVcrMeV7VyL9Sf1BHhv8QAM+Ai22yi+qIeWC7JR9CVa0rOSwStJdASbDA0R
	 THJgNtV5TkgQg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: dts: imx6q-apalis: remove pcie-switch node
Date: Thu, 10 Apr 2025 08:40:00 +0200
Message-Id: <20250410064000.11369-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_234009_016126_E6A54929 
X-CRM114-Status: UNSURE (   7.89  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The compatible "plx,pex8605" does not exist, there is no DT binding for
it and there was never a driver matching this compatible, remove it.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts
index e1077e2da5f4..1f2200f50059 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts
@@ -36,15 +36,6 @@ &can2 {
 	status = "okay";
 };
 
-/* I2C1_SDA/SCL on MXM3 209/211 (e.g. RTC on carrier board) */
-&i2c1 {
-	/* PCIe Switch */
-	pcie-switch@58 {
-		compatible = "plx,pex8605";
-		reg = <0x58>;
-	};
-};
-
 &pcie {
 	vpcie-supply = <&reg_pcie_switch>;
 	status = "okay";
-- 
2.39.5


