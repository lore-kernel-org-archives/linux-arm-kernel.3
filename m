Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50849C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X53Dg3JX6RQ58hCIVbtusiVpOOR9DjZYF8ecPGUXFko=; b=Le1BcxQp25+KLtfCXjpIzTqgtg
	fztw8mIwuSS1NsAnn5C7Z+K+w8lwFC7xvGw8tUf90fv3n0DmysHW1kUR9Fe6F3RZJG+ZJCv6BpU+g
	wGg7cgx2xBXt6+SAKkwC4JUEKUimbTptYP/+54iEStgpZwUMa0sCxVHCQXZiSEvfMFJtn4E5KqhLm
	i4/Xp1Au/u5P6pSRqyMlqNAWstTrFYysPg7t1TSsZOsXcprK9NbmXu6MOBARsBo8rTtur18lRl1/R
	TKGfJhkQN1xXa5eZWCUKtvoz5aBOZP7VRvInfUMfawDmq+rJa2LCKPG3ljzFdj6ZXm2txp4X+0NtY
	iTzNrXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyuX-0000000FHsG-0fXN;
	Wed, 12 Aug 2026 02:41:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyuP-0000000FHn4-0Eqz;
	Wed, 12 Aug 2026 02:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E28060A92;
	Wed, 12 Aug 2026 02:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A761EC4AF0B;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786502495;
	bh=YzQQXB1KJ/dfcO3KKTf+6rvMmNX607uQoOey7A+GN30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tSvcS2icAZfD7TpZkgPMV5YGOz1/Gd9NnO4QhypC/Mo9sl4WoYtdhr/m0fDDdx28S
	 YVfDL8vEUQsIEi0sY+29lPphD5WzwCSGCL8CoEdEkvzmI+nKdyM/iMjnADlio+NJxP
	 jGaWfziupMsAtlE3JV+vrJtaGRNW/55gQgbJrn6KMNBPTWOfosbjCjUuOi8G2JbKQh
	 NewEcrY3DEfk8HwDU2HnUYbuR0MpHrK6I0X0BOw3yFm2VEPgMHpFzcWAv8vK/LnpAS
	 daFkW6iYtYsGSvX4JPVwflXRLYvnLPUbtaOavFz0XojSg/AmIBKfMNLKwxMH/Vljiu
	 sLlHmrnmIOdCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91527C5CFE7;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:41:27 +0800
Subject: [PATCH v7 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-b4-s4-vdec-upstream-v7-5-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786502492; l=1846;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=qRShNFkJQlNUkFvKG/kCJh03drVQsoAHqU8mC/mCf5Q=;
 b=TWQEzLI63GmC4EnCwy5hwJdzrcYDzXkvPw6p6AjHpNmU9qdSA5Zxmbz4yVxWsskeRov9qv6h+
 C7IaIeu6bNvCS9F5BoOK+b+l718w7uHM2TnDpNdRYYXSF/LBnm/sXzh
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
support. Since the video fw needs to be loaded via TEE helpers,
enable the optee node in this patch.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..2262bc198de3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -80,6 +80,11 @@ pwrc: power-controller {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
 	};
 
 	saradc: adc@fe026000 {
@@ -907,5 +912,35 @@ emmc: mmc@fe08c000 {
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
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "hvdec",
+					  "vdec";
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "dos",
+				      "vdec",
+				      "hevcf";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hvdec";
+			resets = <&reset RESET_DOS>;
+			amlogic,canvas = <&canvas>;
+			secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0



