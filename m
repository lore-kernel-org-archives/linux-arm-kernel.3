Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00DBC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCiPdyb0QQ9e9nuHaf2KKbFHL7oS21ToY5ZyNFq06qs=; b=iGSDcNzTFNzee9LeLdx8lDy3pU
	NsI8WwOWLgFHvKC0oMDfFp3WwrGyjXVRbr9vXCqK4uXBAEqtfXLFKCmyPH/xkCL0fkiKeiqD9Ae+d
	DalgFNUzQ0wZpalGqSX6SMrJniPOKp/rpFNENAyPRWNp5h1kU9+6tVrJT0m3cxiQXdWVugyJhM4n1
	/CxzEEp5vJSwY1ftM/1x94WnrXt3J02U4neDuJbQcaJBfngGoV9LaQ8GXwOM9grLD7odQ3h+OjidU
	NVnJ/KRQQasyb4b7xSrzK4jELkjmUU4DqMRV+IXxkXLG0UNbud840AnOUvZ23H4sCcvVXbA8fcfca
	EHk3Ue6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqC3w-0000000BBJZ-1RgS;
	Thu, 06 Mar 2025 14:19:00 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAZS-0000000AxRp-208H;
	Thu, 06 Mar 2025 12:43:27 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d2b83ca7;
	Thu, 6 Mar 2025 20:38:21 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yao Zi <ziyao@disroot.org>
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3528 QoS register node
Date: Thu,  6 Mar 2025 20:38:09 +0800
Message-Id: <20250306123809.273655-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306123809.273655-1-amadeus@jmu.edu.cn>
References: <20250306123809.273655-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTxkZVk9ISx9LGEtCHUsZTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1
	kG
X-HM-Tid: 0a956b76c86d03a2kunmd2b83ca7
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAg6Hio4QzJMKjM#GiJLIwpN
	PiIwCTBVSlVKTE9KSU1PTEtJSU9OVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQU9CTUk3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_044326_723651_42FA7748 
X-CRM114-Status: UNSURE (   6.83  )
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

The Quality-of-Service (QsS) node stores/restores specific
register contents when the power domains is turned off/on.
Add QoS node so that they can connect to the power domain.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 160 +++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index b1713ed4d7e2..0c0e7f151462 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -129,6 +129,166 @@ gic: interrupt-controller@fed01000 {
 			#interrupt-cells = <3>;
 		};
 
+		qos_crypto_a: qos@ff200000 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff200000 0x0 0x20>;
+		};
+
+		qos_crypto_p: qos@ff200080 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff200080 0x0 0x20>;
+		};
+
+		qos_dcf: qos@ff200100 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff200100 0x0 0x20>;
+		};
+
+		qos_dft2apb: qos@ff200200 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff200200 0x0 0x20>;
+		};
+
+		qos_dma2ddr: qos@ff200280 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff200280 0x0 0x20>;
+		};
+
+		qos_dmac: qos@ff200300 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff200300 0x0 0x20>;
+		};
+
+		qos_keyreader: qos@ff200380 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff200380 0x0 0x20>;
+		};
+
+		qos_cpu: qos@ff210000 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff210000 0x0 0x20>;
+		};
+
+		qos_debug: qos@ff210080 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff210080 0x0 0x20>;
+		};
+
+		qos_gpu_m0: qos@ff220000 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff220000 0x0 0x20>;
+		};
+
+		qos_gpu_m1: qos@ff220080 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff220080 0x0 0x20>;
+		};
+
+		qos_pmu_mcu: qos@ff240000 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff240000 0x0 0x20>;
+		};
+
+		qos_rkvdec: qos@ff250000 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff250000 0x0 0x20>;
+		};
+
+		qos_rkvenc: qos@ff260000 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff260000 0x0 0x20>;
+		};
+
+		qos_gmac0: qos@ff270000 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff270000 0x0 0x20>;
+		};
+
+		qos_hdcp: qos@ff270080 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff270080 0x0 0x20>;
+		};
+
+		qos_jpegdec: qos@ff270100 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff270100 0x0 0x20>;
+		};
+
+		qos_rga2_m0ro: qos@ff270200 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff270200 0x0 0x20>;
+		};
+
+		qos_rga2_m0wo: qos@ff270280 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff270280 0x0 0x20>;
+		};
+
+		qos_sdmmc0: qos@ff270300 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff270300 0x0 0x20>;
+		};
+
+		qos_usb2host: qos@ff270380 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff270380 0x0 0x20>;
+		};
+
+		qos_vdpp: qos@ff270480 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff270480 0x0 0x20>;
+		};
+
+		qos_vop: qos@ff270500 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff270500 0x0 0x20>;
+		};
+
+		qos_emmc: qos@ff280000 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff280000 0x0 0x20>;
+		};
+
+		qos_fspi: qos@ff280080 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff280080 0x0 0x20>;
+		};
+
+		qos_gmac1: qos@ff280100 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff280100 0x0 0x20>;
+		};
+
+		qos_pcie: qos@ff280180 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff280180 0x0 0x20>;
+		};
+
+		qos_sdio0: qos@ff280200 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff280200 0x0 0x20>;
+		};
+
+		qos_sdio1: qos@ff280280 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff280280 0x0 0x20>;
+		};
+
+		qos_tsp: qos@ff280300 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff280300 0x0 0x20>;
+		};
+
+		qos_usb3otg: qos@ff280380 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff280380 0x0 0x20>;
+		};
+
+		qos_vpu: qos@ff280400 {
+			compatible = "rockchip,rk3528-qos", "syscon";
+			reg = <0x0 0xff280400 0x0 0x20>;
+		};
+
 		cru: clock-controller@ff4a0000 {
 			compatible = "rockchip,rk3528-cru";
 			reg = <0x0 0xff4a0000 0x0 0x30000>;
-- 
2.25.1


