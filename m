Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D25ECA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLQLlNtnOCPhjt4e0xOfXJp9xP7cfZoVEkC3zGk+ocg=; b=zZ91firqA0yN7DDy2WrMV5Zt0T
	/A0/q4HJyMG/njswjkM6tqr0LIVryUMI9I0BUVBXLzobAG3ypF7Mw0X1fxR0z/Yu49KHb9K3BbFQ7
	G89nIWO+bX2PsQQFhm/YAc3cnuErlgfZkZs/FeDsKDKv+AoKVmdoFPnWsj8q9DqA9GaPOk8H4TE+N
	zP2Sstpz6g4Wodoa7+Xvn53ef8jNDsUoET1ttiUVALT9/ltFvnXk94iZeHTLFn0FXyqVDV5CtD2zJ
	gkPKgp2oU0kQ4ymxD4D/zD5iwz1MJ6xu6gRF8Gd9GTCUDi8qglE5V7mlc9/sHBrwwiUIS2zJWu/j6
	xHQ85oAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9kV-000000079KC-00YQ;
	Sat, 30 Aug 2025 00:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1s6-00000006NbH-3z5M
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 16:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MLQLlNtnOCPhjt4e0xOfXJp9xP7cfZoVEkC3zGk+ocg=; b=i0TdC7yKyVlWsqfBih/hpFGf2Z
	nvxoGPPvilnovmHmCyCL1IB4dX9tleV94z+8Rhu5xAvzJkNuHXIDHhnMYlw/7sp0gY6Kmc7Xr5p3R
	WLVD6EtWPSKMNBAfam1zuOKoiKGFy9lBqdI9eTBeJqv+bihRxUUrrzYvko0zbgQD6HPBfVlSDfYzz
	yVmiQP9/PDPZw0hMk2OFq9G7xa0mUZ9YNV676mbqGf+lGIO6IK1404n+7OqcgSH44ZhU3aaWirQqX
	faIJiQQm1gUBNmHYSMYmnLn3zkA2uGZOcYSJKJOKTwhw1SCQgGfqypWaTQnFa5D9ytI+P6EhmahKI
	qbgonlTA==;
Received: from mx.olsak.net ([37.205.8.231])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1s0-00000003DtC-3VqW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:22:37 +0000
DKIM-Signature: a=rsa-sha256; bh=MLQLlNtnOCPhjt4e0xOfXJp9xP7cfZoVEkC3zGk+ocg=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1756484471; v=1; x=1756916471;
 b=MOSA6oI9LJFmMEejE0ziCE7DsKyPiauy9MpmVkwn2PfO0U2Zp1ttR9wV7MR+dJ13kzURd2pi
 0nq3GVkfRKllmzxnQF3MshjajU56vBuiRc28Ia9BEojtgAcRmMHFFwX5myr2anTjwsL41mkB1xU
 VjrJrra4O7YzmyzYhpmRjFzdmii1VjYF0ngG5FcinpsYubfIcj+UJyuQNcPSv0Tos1lVyzPtPQW
 q01RFFeRs/CbdPGmIMreVMmf+uiViSFLyBDiXJWFMfnU3W2yNSY6cVO4K+GV1S2bNqkvSaz7rkw
 ekHOBLf9FEg/eUBuhg2HrVt2jgSO3Cfi3Xw+MzwvgtjQw==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 9fa50dd1; Fri, 29 Aug 2025 18:21:11 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Fri, 29 Aug 2025 18:21:06 +0200
Subject: [PATCH v3 3/4] clk: mmp: pxa1908: Instantiate power driver through
 auxiliary bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250829-pxa1908-genpd-v3-3-2aacaaaca271@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4741;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=fPWhnGfubtatcWiWaKaUiAvygdrfiV2pPKAKsw2j7KQ=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBkbLxdvXb7nS5z1mZKHJ1aditrhwrsyem+jm9rzC6bf2
 I+sKlh7sKOUhUGMi0FWTJEl97/jNd7PIlu3Zy8zgJnDygQyhIGLUwAmUj2L4X+F6hMd9trLAfNr
 p1w4umFW1YtdqwqOfvoRay2koVHjmfqO4X9K9YwKv4c3Fs6e3ZdYfkPtebZGK//+gn89V39xvpt
 1cDEHAA==
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_172236_257013_24F54C50 
X-CRM114-Status: GOOD (  21.46  )
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

The power domain driver shares the APMU clock controller's registers.
Instantiate the power domain driver through the APMU clock driver using
the auxiliary bus.

Also create a separate Kconfig entry for the PXA1908 clock driver to
allow (de)selecting the driver at will and selecting
CONFIG_AUXILIARY_BUS.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v3:
- Move driver back to pmdomain subsystem, use auxiliary bus to
  instantiate the driver

v2:
- Move to clk subsystem, instantiate the driver from the APMU clock
  driver
- Drop clock handling
- Squash MAINTAINERS patch
---
 MAINTAINERS                        |  2 ++
 drivers/clk/Kconfig                |  1 +
 drivers/clk/mmp/Kconfig            | 10 ++++++++++
 drivers/clk/mmp/Makefile           |  5 ++++-
 drivers/clk/mmp/clk-pxa1908-apmu.c | 20 ++++++++++++++++++++
 5 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34e5e218e83e0ed9882b111f5251601dd6549d4e..88c0df09d7b354f95864f5a48daea3be14a90dc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2869,7 +2869,9 @@ ARM/Marvell PXA1908 SOC support
 M:	Duje Mihanović <duje@dujemihanovic.xyz>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
 F:	arch/arm64/boot/dts/marvell/mmp/
+F:	drivers/clk/mmp/Kconfig
 F:	drivers/clk/mmp/clk-pxa1908*.c
 F:	drivers/pmdomain/marvell/
 F:	include/dt-bindings/clock/marvell,pxa1908.h
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 4d56475f94fc1e28823fe6aee626a96847d4e6d5..68a9641fc649a23013b2d8a9e9f5ecb31d623abb 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -511,6 +511,7 @@ source "drivers/clk/imx/Kconfig"
 source "drivers/clk/ingenic/Kconfig"
 source "drivers/clk/keystone/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
+source "drivers/clk/mmp/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mstar/Kconfig"
 source "drivers/clk/microchip/Kconfig"
diff --git a/drivers/clk/mmp/Kconfig b/drivers/clk/mmp/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..b0d2fea3cda5de1284916ab75d3af0412edcf57f
--- /dev/null
+++ b/drivers/clk/mmp/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config COMMON_CLK_PXA1908
+	bool "Clock driver for Marvell PXA1908"
+	depends on ARCH_MMP || COMPILE_TEST
+	depends on OF
+	default y if ARCH_MMP && ARM64
+	select AUXILIARY_BUS
+	help
+	  This driver supports the Marvell PXA1908 SoC clocks.
diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
index 062cd87fa8ddcc6808b6236f8c4dd524aaf02030..0a94f2f0856389c8e959981ccafbb02140a7733d 100644
--- a/drivers/clk/mmp/Makefile
+++ b/drivers/clk/mmp/Makefile
@@ -11,4 +11,7 @@ obj-$(CONFIG_MACH_MMP_DT) += clk-of-pxa168.o clk-of-pxa910.o
 obj-$(CONFIG_COMMON_CLK_MMP2) += clk-of-mmp2.o clk-pll.o pwr-island.o
 obj-$(CONFIG_COMMON_CLK_MMP2_AUDIO) += clk-audio.o
 
-obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o clk-pxa1908-apbcp.o clk-pxa1908-apmu.o clk-pxa1908-mpmu.o
+obj-$(CONFIG_COMMON_CLK_PXA1908) += clk-pxa1908-apbc.o clk-pxa1908-apbcp.o \
+	clk-pxa1908-mpmu.o clk-pxa1908-apmu.o
+
+obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o
diff --git a/drivers/clk/mmp/clk-pxa1908-apmu.c b/drivers/clk/mmp/clk-pxa1908-apmu.c
index d3a070687fc5b9fb5338f377f82e7664ca0aac29..eab02c89c9153619ac53f7486ed811f2cae12a43 100644
--- a/drivers/clk/mmp/clk-pxa1908-apmu.c
+++ b/drivers/clk/mmp/clk-pxa1908-apmu.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -85,6 +86,8 @@ static void pxa1908_axi_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
 static int pxa1908_apmu_probe(struct platform_device *pdev)
 {
 	struct pxa1908_clk_unit *pxa_unit;
+	struct auxiliary_device *adev;
+	int ret;
 
 	pxa_unit = devm_kzalloc(&pdev->dev, sizeof(*pxa_unit), GFP_KERNEL);
 	if (!pxa_unit)
@@ -94,6 +97,23 @@ static int pxa1908_apmu_probe(struct platform_device *pdev)
 	if (IS_ERR(pxa_unit->base))
 		return PTR_ERR(pxa_unit->base);
 
+	adev = devm_kzalloc(&pdev->dev, sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = "power";
+	adev->dev.parent = &pdev->dev;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
 	mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, APMU_NR_CLKS);
 
 	pxa1908_axi_periph_clk_init(pxa_unit);

-- 
2.51.0


