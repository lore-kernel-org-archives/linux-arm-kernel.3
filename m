Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED30CA601F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=; b=uUCNKiL+lYq2B76Eqv2EPmHO2s
	YwkpSwAQI4Dc3jMgnrvr1IRC8KZUAb1AYXTtPsnL0gLzThL/+TE9OSIBmPsDUnMfVrEU7ASawHN+Y
	/emC7LyEPMjghB+L8UqKkMBAh4Sp+HnnE/7CFAMIsYL88oGVmXDYdliyP7RbXUcsMWNRvqHONl4pS
	RfGaypAy7OBJSwKnONUEKTcDs0BuPSV94Neh8P0h5Tj6B6i6MqOIiibVM4jES8HYjKpgNd8Tj+6iB
	hRaCBlRou3Wu8tDAp4djixjn86wcG5tdvCsTR6L9aG3wft3+/WyPuPSvQPMY7yo/a5q7sKCaC1MW8
	8YjsfgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8Ky-000000067WK-3ZfF;
	Fri, 09 Oct 2026 11:00:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8Kw-000000067Vf-1dWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E12E344835;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAC10C2BCFB;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543625;
	bh=zgU3iQM72YbxnsGmykO32NltLNkwhLgTNSOphGXHrLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pzBeS3p8UWaI488hUwmaXurh/4QnCf/E6RZvUAVBj0e3M8TI3+asuqEHMsKmxUlma
	 YUQjM6kaMiZ5jekIAXITNp9gSLHVy+BSaNzhDlM28UEfsGyrgTtoFlwL00harunvpV
	 fcHyIQgZKnR+Nh+Hssuv1NCYrCoKvu3PzKVxsB/vuqeDAxM2cuBBTx4l3NabsAw2tQ
	 Ta3fPsQXNlMRPgBWCUIf/ar38qwt6N4SKi4HVzHgsVOfir+nNWmPUTVrIX3R2m+pbw
	 fnwBnPhAI9CGss8xaTojByv0ZN3mO1hBANfbJPqQridI3dxN5c4nkdzwrC+7p2ASge
	 2qOR+nsyAr/oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9261CA9EBB;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 09 Oct 2026 19:00:25 +0800
Subject: [PATCH 4/4] MAINTAINERS: add ARM/AMBARELLA SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-cv75-soc-v1-4-808330e93ff1@ambarella.com>
References: <20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com>
In-Reply-To: <20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543624; l=1241;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=66/FpPmSuU75AtQewU8cj7mu+Qa/5qamx4Km8ySoeYo=;
 b=OLJtJKplFZzjxHKaJp+JiwaB+sO3Bcc1ojiAYPvpxq/D+ktK5TIyRcDaD7C/FTVikkW1s+xzM
 WCxJTCZxHFaBkC3fI4duNnP+PfCixNalMTaayP+EkHZmd9XuSECjOb1
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Add a maintainer entry covering Ambarella CV75 bindings, DTS and
related drivers.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..59e5b32d7a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,20 @@ F:	drivers/clocksource/asm9260_timer.c
 F:	drivers/rtc/rtc-asm9260.c
 F:	drivers/watchdog/asm9260_wdt.c
 
+ARM/AMBARELLA SOC SUPPORT
+M:	Long Zhao <longzhao@ambarella.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/ambarella.yaml
+F:	Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
+F:	arch/arm64/boot/dts/ambarella/
+F:	drivers/clk/ambarella/
+F:	drivers/pinctrl/pinctrl-ambarella*
+F:	include/dt-bindings/clock/ambarella,cv75-rct.h
+N:	ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1



