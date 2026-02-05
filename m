Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00249ECD9A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vvatJcVDYv2jsixz0CF+35CybVqCxF1N7tYF0/veLg=; b=MqMT2xXOJpu8mnBNTBV6m3A757
	DIP+KHQlHI0rQ2YJZqUE08qccKLqpUJWInFdbKrx0yV3oY1PYETm3ScebY/ojmw5G31Hpn6utE3xQ
	wzsKvC9Vi8+DivEp528EoLz4ojz9oItEdTHrSA5kqoVyoZDj09BFoWJaDEtOP1XHG3mvEsJiSLJo6
	WAZIY4IfCnMfsa4ccHIBB5ykEzYecObatTyyxPkcqIC8zt7GOAGezySXngB3SHmQJxj7qPAyP2j/W
	uj8HbiKFW3kXxy+ZCZfGuZfkM+KKpcQuKa2fkI5VH7Ub7OGzup3at/jFhiLKxGlyo51EWTvQfahB+
	FqssCh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6pl-0000000AVri-0KE2;
	Thu, 05 Feb 2026 21:24:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6pf-0000000AVnp-2fgX;
	Thu, 05 Feb 2026 21:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=5vvatJcVDYv2jsixz0CF+35CybVqCxF1N7tYF0/veLg=; b=sL4JlmT2/cM/n+LPn05/JVHtXq
	h+UlWA6Q8AWMbBNCIvHKpjlSfXW+TKhUJP5vTvbXbABjbNQHTg3Al2W7NpouIeVbwzSj5KXwx+zrg
	bs8nktdyZNDjCimlwku+IK1hYd9QjPDCmWeLomQCqVC4ammvLPVDBtFTGwgauqDhjFU9/1758FrZl
	n9KQEfUx0Tg+1nnc2NgdAVRlbwtH5Q1ZxPvuSabmCf9MbInpFyoRQmA+5nL8l15TjZ3eSwX1UvVLG
	4UfGvJyBcGKYg6xLvbE2rOyoufQqr8S/FY5EcH30GSxXiGLQXJGzyTcnS2LgnsEBk2S+Ae3/FaAaq
	Khwblq9g==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6pd-007GK0-1z; Thu, 05 Feb 2026 22:24:09 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable OTP controller for RK3528
Date: Thu,  5 Feb 2026 22:23:47 +0100
Message-ID: <20260205212347.490636-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205212347.490636-1-heiko@sntech.de>
References: <20260205212347.490636-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_132412_288758_3CEC410B 
X-CRM114-Status: GOOD (  10.85  )
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

From: Jonas Karlman <jonas@kwiboo.se>

Enable the One Time Programmable Controller (OTPC) in RK3528 and add
an initial nvmem fixed layout.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index d402f2828814..171b48c9cdb7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -1190,6 +1190,53 @@ sdmmc: mmc@ffc30000 {
 			status = "disabled";
 		};
 
+		otp: nvmem@ffce0000 {
+			compatible = "rockchip,rk3528-otp";
+			reg = <0x0 0xffce0000 0x0 0x4000>;
+			clocks = <&cru CLK_USER_OTPC_NS>, <&cru PCLK_OTPC_NS>,
+				 <&cru CLK_SBPI_OTPC_NS>;
+			clock-names = "otp", "apb_pclk", "sbpi";
+			resets = <&cru SRST_USER_OTPC_NS>, <&cru SRST_P_OTPC_NS>,
+				 <&cru SRST_SBPI_OTPC_NS>;
+			reset-names = "otp", "apb", "sbpi";
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
+				logic_leakage: logic-leakage@1b {
+					reg = <0x1b 0x1>;
+				};
+
+				gpu_leakage: gpu-leakage@1c {
+					reg = <0x1c 0x1>;
+				};
+
+				tsadc_trim: tsadc-trim@44 {
+					reg = <0x44 0x2>;
+					bits = <0 10>;
+				};
+			};
+		};
+
 		dmac: dma-controller@ffd60000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x0 0xffd60000 0x0 0x4000>;
-- 
2.47.2


