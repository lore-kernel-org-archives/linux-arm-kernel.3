Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FF3106ACEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4MC6TZxbYtbW++aJnjTwi5qHIz2Y5mW4BPCtPUKHPk=; b=1A5HT4yE7ifZxAQsP8X+LD9ZUG
	WIUVl62WiCDcS8wFCkDDR24CSvlpBvoW5AaN6cEr90ZZlcvXO6SmVcA7eAd1M7uipaO3z5+a5FV4L
	XvbahouakefU3VU+9vqQDcjOUiQwqaa6+VtztcnXQ3KaBbrb6gHOmpleTsyenqZDGdivQ85eby7h5
	4e3bFF8C/ne2I6ODgs5WeN/QUjGTt3uOAtn8CWobRRWvos+ty9xjHVus9Ki8Or7PRVux2ipbnOfY2
	P9gIc993CkuZAEzq0klOCIzO8At6vPAzel5oZutWnGT60Qwlb8gcuFb2cWWSc8S7xv+VyNVVBBsqv
	egDcZREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ncE-0000000FTNi-0AG9;
	Thu, 12 Mar 2026 21:30:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nc5-0000000FTJC-1PJr;
	Thu, 12 Mar 2026 21:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=h4MC6TZxbYtbW++aJnjTwi5qHIz2Y5mW4BPCtPUKHPk=; b=rB78n+KmyKiiQVYIuyT+Zej62M
	C0aBAQPFEDGM2qLUyw/1gMLFAxhaQAzg9f5hvYMCku5pMrHd8HZyh95EKNROKJsJe1J4mBpL5aXAj
	bH2DCry+M3kN2vWhwxmD5pp3z812UnCoUx1xAvWp+m0Kde1un8r59VV7pmzFVJXt05AeMCaEkDfYI
	/mfnQ0NsEpvUGzQI6tmyoeyeEZw2gwTAJ8Uz0C8qyEk7BKsAoTN36rjAjrKFCzmZybDSG6aJZCLVb
	d+CVQT013rH7XTSIGaq7L7RQutGOIXjRVlZZ1+j732WLai0k7HOQuBnwTuKMDOBPWcDkM3vWIdcyM
	TP/oZj2Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v2 1/3] arm64: dts: rockchip: Enable OTP controller for RK3562
Date: Thu, 12 Mar 2026 22:30:17 +0100
Message-ID: <20260312213019.13965-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312213019.13965-1-heiko@sntech.de>
References: <20260312213019.13965-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_143037_462591_A8D58F5E 
X-CRM114-Status: UNSURE (   9.44  )
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

Enable the One Time Programmable Controller (OTPC) in RK3562 and add
an initial nvmem fixed layout.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3562.dtsi | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
index f84676b47b27..e4816aa3dae0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
@@ -1093,6 +1093,52 @@ sdmmc1: mmc@ff890000 {
 			status = "disabled";
 		};
 
+		otp: efuse@ff930000 {
+			compatible = "rockchip,rk3562-otp";
+			reg = <0x0 0xff930000 0x0 0x4000>;
+			clocks = <&cru CLK_USER_OTPC_NS>, <&cru PCLK_OTPC_NS>,
+				 <&cru PCLK_OTPPHY>, <&cru CLK_SBPI_OTPC_NS>;
+			clock-names = "otp", "apb_pclk", "phy", "sbpi";
+			resets = <&cru SRST_USER_OTPC_NS>, <&cru SRST_P_OTPC_NS>,
+				 <&cru SRST_P_OTPPHY>, <&cru SRST_SBPI_OTPC_NS>;
+			reset-names = "otp", "apb", "phy", "sbpi";
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				cpu_code: cpu-code@2 {
+					reg = <0x02 0x2>;
+				};
+
+				otp_cpu_version: cpu-version@8 {
+					reg = <0x08 0x1>;
+					bits = <3 3>;
+				};
+
+				otp_id: id@a {
+					reg = <0x0a 0x10>;
+				};
+
+				cpu_leakage: cpu-leakage@1a {
+					reg = <0x1a 0x1>;
+				};
+
+				log_leakage: log-leakage@1b {
+					reg = <0x1b 0x1>;
+				};
+
+				npu_leakage: npu-leakage@1c {
+					reg = <0x1c 0x1>;
+				};
+
+				gpu_leakage: gpu-leakage@1d {
+					reg = <0x1d 0x1>;
+				};
+			};
+		};
+
 		dmac: dma-controller@ff990000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x0 0xff990000 0x0 0x4000>;
-- 
2.47.3


