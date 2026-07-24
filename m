Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746F0C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bp9rvWmCD3DpzkOE6WbKOB/ALQZQiEicFGw7rcyEDOk=; b=YUWP24Q3/o+jXz02NVcyGyfzy9
	Gm6rU/Z5c4ZqEJJ5/nUIINTXBpWBwSNKjaTprBZaRYLtCYDMTZwjHJ0A/JQyJbCB9/HRlJuyqZ0Ej
	J/1OM3krjqXw5WKDkcG7/YBRFJCznQNvtkwGQsOzvS+LFu/9REwCZ3Me+HyxXN16alml0VEpN8oNR
	LzS0jJYShf0hxAqRcph/bFXTCQL1JO49o+1wfbudeDquGwoQgM2bpinvcrtLIMxIm1OBaiCIFnAM0
	lJ5kwFIA8AK5wzsruow1VOGAZP6tBv/WT8Dh5CDOX29hs36GZaRp2KHdsg07JNbePfgrc+3Y7/XkP
	wb+uxcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAfa-0000000Fj7x-0Kqr;
	Fri, 24 Jul 2026 07:50:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAfZ-0000000Fj7b-2yi3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:50:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BDEC600AA;
	Fri, 24 Jul 2026 07:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AE41F000E9;
	Fri, 24 Jul 2026 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879408;
	bh=Bp9rvWmCD3DpzkOE6WbKOB/ALQZQiEicFGw7rcyEDOk=;
	h=From:Date:Subject:To:Cc;
	b=CIXpiX5qGkFIrYv4JGByVCLQKqqHgJGJQl68Fe9l9rdR6StuePglw4jML1HM47S6I
	 Ej/AC+Z8YBkQVeMMyXfd2kGLW2qcO2faWXrcjl2Ujv3qyYSLKLibgoF8MhIjVlF33s
	 QxT2pDEBTv2Re0n8+1L+hXvZB1ScfVY+GjQffW3lhELtNpDmLjlpsSQZBPICU3TTY+
	 keAA6GEJEhKiyEchNvp080XYL2BdNmv6CrlJjrML3qI8DxP6NI//L76Gb5yq0fXtHl
	 6QbmrZwGw6M7e3m7/8gnwhs7MxKKXKqeGOQjQUzKwEdFc+eYNYmCNlbkJQZVNlhryz
	 0CWTH2REaiiug==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:50:04 +0200
Subject: [PATCH] ARM: dts: ixp4xx: Drop the reg-offset hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-ixp4xx-dts-fix-v1-1-09bf7111e94e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMT3cyKApOKCt2UkmLdtMwKXYvUpCRDQ0uL5LS0FCWgpoKiVKAw2MD
 oWAi/uDQpKzW5BGSKUm0tAATLvKVyAAAA
X-Change-ID: 20260724-ixp4xx-dts-fix-8ebb1198cffd
To: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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

The reg-offset hack only works when the IXP4xx platform is
running in big endian mode, and it is there to byte-offset
the byte where the serial registers appear in the BE config.

This is clearly wrong, workarounds need to be in the
drivers. Drop the reg-offset.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
SoC folks: please apply this directly for DTS for v7.3.
The prerequisite patch to serial is already merged by Greg.
---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
index 0adeccabd4fe..b0f98da8def4 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
@@ -84,11 +84,6 @@ pci@c0000000 {
 		uart0: serial@c8000000 {
 			compatible = "intel,xscale-uart";
 			reg = <0xc8000000 0x1000>;
-			/*
-			 * The reg-offset and reg-shift is a side effect
-			 * of running the platform in big endian mode.
-			 */
-			reg-offset = <3>;
 			reg-shift = <2>;
 			interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <14745600>;
@@ -98,11 +93,6 @@ uart0: serial@c8000000 {
 		uart1: serial@c8001000 {
 			compatible = "intel,xscale-uart";
 			reg = <0xc8001000 0x1000>;
-			/*
-			 * The reg-offset and reg-shift is a side effect
-			 * of running the platform in big endian mode.
-			 */
-			reg-offset = <3>;
 			reg-shift = <2>;
 			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <14745600>;

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260724-ixp4xx-dts-fix-8ebb1198cffd

Best regards,
--  
Linus Walleij <linusw@kernel.org>


