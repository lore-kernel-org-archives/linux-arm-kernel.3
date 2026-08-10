Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD13C5B56B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cR5q9c8zxs0kvDwMYx9QuXfsTPCggxiJ1S/eoJFxgg=; b=jk8UPnPX27vfGCc9HC0bHaf7a/
	Plim1etCNwKZZZBoYGjoJT37FsNhjUQPLMG3kdyqv8itF6G9vOHesivGu5hhwIuzussdSzOh3JkYP
	fHNVm+DmrImP/mEpwAWA6ETB1+YMtvxIvlAOR1YGmAMXZ9un/Z9qIlL6BLucqFP5nw6dM7DJNS/4e
	LiC6C0T/6MCYheaFzfK+tEuCfHFz8oz4LGCIG9/ZSXDmU5zXULad7dd774UsSD3XOmnzNoNNyKY0Z
	KGbSShF2EFdwyiKp0UpOLv/Q5EMDS7LOrOzj0DKrrHfbvYw0ijGFH3ZBKCMnmChi9rmtQgeA5XuqB
	rxu7nQFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvv-0000000Bk0j-2O11;
	Mon, 10 Aug 2026 12:16:47 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvh-0000000BjWL-1lQ8;
	Mon, 10 Aug 2026 12:16:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11777C0514;
	Mon, 10 Aug 2026 15:16:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364191; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9cR5q9c8zxs0kvDwMYx9QuXfsTPCggxiJ1S/eoJFxgg=;
	b=X6r2N0uvMlSwPEGhnKwGUJ9gpJSyCW7rZGh9JrII3qrGjaYx12Es1+zGl7DT0Irs15qKxq
	Q8HSAn9Le8rI3AnqF6eL0VMGneMiiVVlRvKMyTQfMHJk0N5Blct8kMOSb8G0HQyOh7BisR
	dDkMEkYDsvyk4BrHF0jxaQp9jxitD9uK9E/ZzKi0nlFn67vZfbfkuSW3eqOWKuqqtxsQFC
	tZrSVzfMeo5vBTLq3hTKGLhrtZmVqBRngbb4v/Z3zbj8RDYHD4tqTQcrcj7ViGfT1Vn/hR
	VQBq6aGJHxSAinGUW1X9gd4rSXaCxsnE7wvsup3tNTJlft/q+lBz3smJMg9D6g==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 22/25] ARM: dts: rockchip: Add SDMMC1 node for RV1106
Date: Mon, 10 Aug 2026 15:11:13 +0300
Message-ID: <20260810121121.210040-23-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051633_712537_ECDB068B 
X-CRM114-Status: GOOD (  10.61  )
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

Add the SDMMC1 controller node, compatible with rockchip,rk3288-dw-mshc,
matching the existing eMMC and SD card controller nodes on this SoC.
The node is left disabled by default and can be enabled in board dts files.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 5db640a6ba90..b31cdb1c19d4 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -450,6 +450,18 @@ system_sram: sram@ff6c0000 {
 			ranges = <0 0xff6c0000 0x40000>;
 		};
 
+		sdmmc1: mmc@ff9a0000 {
+			compatible = "rockchip,rv1106-dw-mshc", "rockchip,rk3288-dw-mshc";
+			reg = <0xff9a0000 0x4000>;
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>,
+				<&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
+			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+			fifo-depth = <0x100>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
 		gmac: ethernet@ffa80000 {
 			compatible = "rockchip,rv1106-gmac", "snps,dwmac-4.20a";
 			reg = <0xffa80000 0x10000>;
-- 
2.47.3


