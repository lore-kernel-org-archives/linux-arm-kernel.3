Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9DACD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPHOe9KZshpKS4ZJenBPPNGifRjD7kK0jvzOaUmTNKc=; b=OZC3/Blq0wcj30K5aANzYzWuMT
	hP4qgvPlCKswEnqGPF9DlYG3O/o0h/GTRH7k/3bTGX4MZo5qz6TcSoLOQ/oqvIX/+Nfidfm/HN8sR
	aYht/+/ny9T1ydRdWQhKHJZa93ufscmG6raK7nkx2lrzsdRpVQ8dWpijZayntAK2RAjQNU3T7+Wy/
	5lsEm3/FabCDu8gMUe7TuGCaA0QYW1ldyaNZOAL0v/nFKc2xB+6xRLjjhU1HZ/fZWaInOeXQXDwZe
	gFjKQJbvCx0zIdv/vNwp7pQ89jqfd5qPsnx2apsvsIqvYFIvlRGqAugQ5zQiee7HqO+viQN5EWRvQ
	fSfa8/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnL1-00000001OLl-2SDR;
	Tue, 26 May 2026 08:40:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnKz-00000001OK6-0olk;
	Tue, 26 May 2026 08:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A6E8600C3;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 303C8C2BD01;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779784832;
	bh=Ex6/9dNKnvHs3Oge7eQrUgtoT6twrlN8SWMJ0lY6PFU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s2UFptAJqnqM1bNoR4DDPPEJwXcRVNNyjSHu56gokxtyDTexkpAZcP7PJuBtDs+g7
	 1fnID0GQmNmhRABhCSkyA+xpJMbDiQliQ8eIbvWfgJQu08e3R2dm5qxSi+ke/pQsaq
	 Atwi1voUdBWwkLCezUwKO2HYalmm0BeaFEinqG7ocvXmlw7pVGQU/tWiX4yos/V8Q9
	 0yN5I4zTXw9NnK5o6qLlsx8jfSgHwI71rUgled7Og8cbMl+hcyzdOUkJGCALWIXqw7
	 z7D0/zoXV+i0P7fOtyWQyZv3r4Lb2Lc2lFKP00LUn2HHmCq6i0KalzKp6X+K/1H/aO
	 yAeJl/oa0JQzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A423CD5BD1;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Tue, 26 May 2026 16:40:21 +0800
Subject: [PATCH RFC RESEND v5 5/6] arm64: dts: amlogic: Add video decoder
 driver support for S4 SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-b4-s4-vdec-upstream-v5-5-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779784828; l=1760;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=1qF2f9ADFwCWWbSpwYb2bAeCjbaHvd/hJkHSg3Lnlh8=;
 b=ERzxHkusE0DRUGGalcEh+1YXN5WZTyPDZy2vKRneRZ1q7ucjdVO6J2OEbfZZe7cQ2I9srCrm5
 nWuS3mNzMsWDjYK7GZJDoTTxkYDGimh2q7qwjAUpdykwjXzKjXEVhCM
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vdec node to enable Amlogic V4L2 stateless video decoder
support.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..5ad826e4b554 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -96,6 +96,11 @@ saradc: adc@fe026000 {
 		status = "disabled";
 	};
 
+	optee {
+		compatible = "linaro,optee-tz";
+		method = "smc";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -907,5 +912,34 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vdec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			amlogic,canvas = <&canvas>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "dos",
+				      "vdec",
+				      "hevcf";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hevc";
+			resets = <&reset RESET_DOS>;
+			secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0



