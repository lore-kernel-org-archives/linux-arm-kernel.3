Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E74ECFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 03:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toOpJi12FR6Tm4uRNkngqm1i3ZI345NMYtz5/4KyLyk=; b=lZB4xj1+IfhSP9vj+dRjDuyR+Q
	P0wtXrEvi0uB6HLach6SQvNmbeGsU/RnA4zbyK5s0Lzloxt3Tvb3rNeFvQl7t3MFsb0GvHECE/yaY
	6jMFt/jPDbV5WKF8xtSSWMwnOBtVQG+xLatxXriwPVlXLwCT/E7Mgf0xP4uPwicOYbzvEHDdlEfVv
	b+nJdmDbSKidmI+CtkGebgnSPAhl1Hbh99ZrgCUhbqxcw8TiqFCaiTMvnbyT7UC6yiFZgGVue6/ZO
	ZwIJWOmKXpT2vB4hSYZXrCdRzoj7/Zo/QAudrwgG/Iatmzs+1a82XLx03sL1VBbfuFTy1TP0vqbYw
	YT1mDnCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNJe-0000000B1tq-36GE;
	Mon, 24 Nov 2025 03:32:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNJb-0000000B1sN-3joI;
	Mon, 24 Nov 2025 03:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3AF244398;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94261C2BC9E;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763955154;
	bh=nQMpas0P68zqe+jsuAUQuc78OljFGZeSHfJ158LMKlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LIvqdsee1woYL1Q8LlyGqPI8UWC+R3TubGMryLxV0Lbrjw1PUqH1+0rJGHSYq1tzW
	 eDifwaEwSBYALohqMjo5p22/686Mjw832VBupIP5TTaoZtBobhGXBLaAftNEjtFIco
	 dX5gzqMTJxLrX2RrCe1r+154pMsLSTq0Is4iJPJ9K7vm1I1fDlSw3Iu567FfLMI9N2
	 OoNfNVbVdk2YMATkWV2uyfnW7+vyqnaGpvhI0K2dTG39slf9Mw9tFBCKXOEZ1yRDwk
	 05P/M7Mfirm+JfS8T2VyNAcKtQVFyZEVfqAS+qgUJnEMyhdg352PJA+QpsmmO8+lqT
	 BT3og9flY3swA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8685BCFD31F;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 24 Nov 2025 11:32:19 +0800
Subject: [PATCH RFC v2 3/3] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-b4-s4-vdec-upstream-v2-3-bdbbce3f11a6@amlogic.com>
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
In-Reply-To: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763955152; l=1441;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ipvSyoCuAjlj5iGd/O8ZvsuGOB2B3dXxp1S6BN3SOc4=;
 b=+1wPmnRCbaMUs0SfXj44FPENcjNu8W4k/F7Tgy5s0bjQiMcfnJkYcBKCv5+xdb+cSPZT7jend
 eHRRpV6VIQSA8ZOxSqEmAJO5YdnW3ZVx3xXwZdX4csth3oNHl+54ezg
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_193235_974796_BBB7220D 
X-CRM114-Status: UNSURE (   8.97  )
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vcodec node to enable Amlogic V4L2 stateless video decoder
support.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994df..80f1b92492a5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -853,5 +853,32 @@ emmc: mmc@fe08c000 {
 			no-sd;
 			status = "disabled";
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vcodec-dec";
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
+			clock-names = "vdec",
+				      "clk_vdec_mux",
+				      "clk_hevcf_mux";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hevc";
+		};
 	};
 };

-- 
2.42.0



