Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB6BD6ACED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 11:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLrHguxC7K6XrUIyhcFgmkB2UNIzwp8Gxjli0fqY3o4=; b=KKfJtJep8hHL5iRcEFtiDWhngf
	pwJSapsCyt9aPvkefnO8o2aVJKvjoVyFMgUVQ1HZZSdyXPCvjcfNUCR2pvSHFKnBnKsNgSXcEDDYp
	nrX0I9qaxvMPS6X4pn8WO9CmN28zCCl6pfQIEge5LDS5wBrslBvNJV6A/VBo/MemrFkgI4/Cps2/L
	LRyW3/TcAl2XNNHQckwjLxW1I4znlnOgqHmA1+943q4JdksYykbKwp62KfB7SO4cEsjdINfDHiQzU
	hZ2VJU8FqOojgq+aKMTkGbQklkVNL2GKPqU4OYRg1OVnhtDL7bJinelLbHhliz7QfCZMcjsMacOqh
	TwV1kR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCMc-00000008MhV-147a;
	Thu, 18 Dec 2025 11:40:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCMb-00000008MhA-09PP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Dec 2025 11:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=fLrHguxC7K6XrUIyhcFgmkB2UNIzwp8Gxjli0fqY3o4=; b=h8TlexDGB/pdKQvqiEGSp5AWGH
	yzOEtyst81wlov23rrSKe2JEgdaa8OLocrxfhrzb3MtyYKxo4pIpT2OHKZtF5KayeN11mm3mQgxGx
	2oEINIYIzj0KljAv6TNxh0FzrEAAYZteAGRr6RXtFZf+CrxCamBkjuA+P5CvbM19oP7BzsT3OuUB8
	vodBg5biLK2LRFS1aF1NKq23aSNxCrYF4ACFTqrfDMjbNEaBqEZc6aiYWmgnoqYfYacysu7GccUIw
	aBkz2/ydy/YF/SvYKKnz/zDLUuBnIgD2N62XSmH1u4ep4wiEHj3mzBxmO2EenWsrRxw3n8+ZXBVBH
	C9skDqeQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCMY-000000064BB-0wJq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 11:40:07 +0000
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1vWCMB-0001vK-3X; Thu, 18 Dec 2025 12:39:43 +0100
From: Fabian Pflug <f.pflug@pengutronix.de>
Date: Thu, 18 Dec 2025 12:39:21 +0100
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-fpg-nxp-imx93-frdm-v4-1-cd3a9f6ac89a@pengutronix.de>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
In-Reply-To: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Fabian Pflug <f.pflug@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_114006_290777_4F34AEF0 
X-CRM114-Status: UNSURE (   8.18  )
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

Add DT compatible string for NXP i.MX93 11x11 FRDM board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43b..eab81799b0793 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1419,6 +1419,7 @@ properties:
           - enum:
               - fsl,imx93-9x9-qsb         # i.MX93 9x9 QSB Board
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
+              - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 

-- 
2.47.3


