Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341DBCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnB+ESRllSz8BZr/E0MZpYZ1CmW/iUgdsQJ9Zb4PjfE=; b=GvtN+v5QeIm/O9gQc1/h6un506
	5qNCqPqBxM6afTip6LmfUFsU0Jdtf+5++/uy+Dcufcst7YNFDd7aLKy9givone8E0E2oVib3hJxY9
	T8ShmTn8u9Ubec4PD5iuXNqdtUQfa4mSm7wLSK6rcYHn2wSvXfiP2DZ6YPbu0zOMUO1JOvS+HR214
	OC3aGDQbT5xUOnexEZFiv6/Sj74Hrb2ElDKZGzLAwdXVDskoPD2prJWB1OOm2o1TxRsFCeVZfV84/
	o5PIye6SK/NhFOtwGoBn3x8kSYKeX/fnvH++TculoO/ME9wUQdzKi0d2SxVafangBp1QzvFv/3vlC
	ydxdLDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9kf-000000079V9-1can;
	Sat, 30 Aug 2025 00:47:29 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1ss-00000006NRs-131z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:23:27 +0000
DKIM-Signature: a=rsa-sha256; bh=XnB+ESRllSz8BZr/E0MZpYZ1CmW/iUgdsQJ9Zb4PjfE=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1756484472; v=1; x=1756916472;
 b=KXifpgkO+dTYMTxEmNexcTCbCBq4VqKRTbEyle7d25fhjy5t1qskATsqWEbx11Ujq2rhm34m
 iYznJLphaZADDLS9lq3JtWeQfHmfTynDe44fhs6JY8486QlS6RqjT1aPb1tlrcvlOR0KUX0F+bc
 B3fCMtv6ebWN+QUEHhGGU/mMZ/cIumNGQQvyVPLqDjRaHbzh7lcIDz4K2Ywyg3CiCt4L/Fx6Buv
 kUVpgrv0tIDv269Ejr73J7K7C//AHpWFiQ8SqI8LVGOIZojY5ioI3eYQS37F8/gh/QGcHkXXmdt
 4BzcRK1fqf94NQrE4BLLH5xOP661qTrN8wqKL5x0v0ZTw==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 529e469f; Fri, 29 Aug 2025 18:21:12 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Fri, 29 Aug 2025 18:21:07 +0200
Subject: [PATCH v3 4/4] arm64: dts: marvell: pxa1908: Add power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250829-pxa1908-genpd-v3-4-2aacaaaca271@dujemihanovic.xyz>
References: <20250829-pxa1908-genpd-v3-0-2aacaaaca271@dujemihanovic.xyz>
In-Reply-To: <20250829-pxa1908-genpd-v3-0-2aacaaaca271@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=+LiKf5xAdZ3VQjErBPnxDlU3GQ3YyQ0Gx7TmBGM/obc=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBkbLxd7zLsy47VSwKc/9pcnyMjnK9vNVg7pFliw+P7z/
 JkRngf3d5SyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBEopoY/unWCxhsWfs6mzGo
 K/fx45e868okuZm45vpsFxP8/ll5kxXDX5makoAdSZrKUl4Ct4s+9BnKsadOOc5f3+N50zDhSzI
 bCwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_092326_443592_E901BA13 
X-CRM114-Status: GOOD (  11.54  )
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

Update the APMU clock controller's compatible to allow the new power
domain driver to probe. Also add the first two power domain consumers:
IOMMU (fixes probing) and framebuffer.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v2:
- Drop power controller node
- &pd -> &apmu
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 1 +
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi                       | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 47a4f01a7077bfafe2cc50d0e59c37685ec9c2e9..d61922f326a4654a45ab4312ea512ac1b8b01c50 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -23,6 +23,7 @@ chosen {
 		fb0: framebuffer@17177000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0x17177000 0 (480 * 800 * 4)>;
+			power-domains = <&apmu PXA1908_POWER_DOMAIN_DSI>;
 			width = <480>;
 			height = <800>;
 			stride = <(480 * 4)>;
diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index cf2b9109688ce560eec8a1397251ead68d78a239..ae85b90eeb408a8f4014ec7b60048ae1fd3d4044 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/marvell,pxa1908.h>
+#include <dt-bindings/power/marvell,pxa1908-power.h>
 
 / {
 	model = "Marvell Armada PXA1908";
@@ -79,6 +80,7 @@ smmu: iommu@c0010000 {
 			#iommu-cells = <1>;
 			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&apmu PXA1908_POWER_DOMAIN_VPU>;
 			status = "disabled";
 		};
 
@@ -291,9 +293,10 @@ sdh2: mmc@81000 {
 			};
 
 			apmu: clock-controller@82800 {
-				compatible = "marvell,pxa1908-apmu";
+				compatible = "marvell,pxa1908-apmu", "syscon";
 				reg = <0x82800 0x400>;
 				#clock-cells = <1>;
+				#power-domain-cells = <1>;
 			};
 		};
 	};

-- 
2.51.0


