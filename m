Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FFCCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 20:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkbWTBR/D24vJJziiKYaJKASASa0VID8Rv/STk+D6dc=; b=nUetovxFumcI5noDcmbG0NMRKK
	ThekD126zSp2ur6ArX+4LY66pU97X1w9rktZF+IDJMMtgy1kGCbydmxrldRKlb1bgDSQw7WxAm5VT
	nUktDk5OGlvv0LZhlni4vm7ps2CNClfO/Z/Wf0LP5NsV6FxcP0LJxE068UAVI3l8C/XbQRwkjzPEv
	8hkoc1t2gR3HrLEkHGzgxNLgAOdj6uQa9f6w0sgkMZh3nh9NrOTCHrUlbXLxfARE+UXOXbJGiRs8t
	cRSeKiCary1E44qLwASkLeDQJIQq8omTKLe7+8q8Y1n+viNf3UgcTj3JRvaaV+TKQV65Aov5KBM3o
	YyNgt8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHTL-00000007CRs-3Cb7;
	Fri, 09 Oct 2026 20:45:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHTJ-00000007CRE-3gsJ;
	Fri, 09 Oct 2026 20:45:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5446C60204;
	Fri,  9 Oct 2026 20:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADC62C2BCFB;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791578740;
	bh=vpQiuBK6+oVU+3H9fHMnAa4/lvYSw1L26uvgbFaz1gA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GLpY+EZf/jbS0oXCHZw6BuVOxSt4cv5EDMGUu6tFw7e3o1agLJpuPdSgSU7RTM+kJ
	 W/j8o4joj58zWaUC7AM/vUO+nDBnXeWxPlGDuf9/+CwVNcFGKknPls+WgHRmP9vSBt
	 3g96IsaqTK5qvVFNJg0FSYwUZgWb13q66ehfuWGhFRgPUhgiNtpBcYYqWgjZecUquW
	 Zkr8KwP+hEybG1xJiQNfVt8P/0FQvW+YqaGxgRgxqUmuAEFFXvZoZrIwG2XCGdt6/m
	 BEhrvizZXo2W2u4/2EnpgjFxYsEwr72hIa61/BwCxfNsoXblhiJSzcCYbvzFphPWuv
	 qZ35URoZIf6XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A63BCA601E;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 09 Oct 2026 20:45:36 +0000
Subject: [PATCH 1/2] dt-bindings: gpio: pca95xx: add onnn,pca9655 with
 nxp,pca9555 fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-helios64-pca9655-v1-1-673ee4432650@iav.lv>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
In-Reply-To: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Rosen Penev <rosenp@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=hwPZSPeRdIPJzNMdM23subxRzNUtRq7wz0V1xH0yzjg=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkng4q0mR+f+lNWWPY86ViKmaPPXsN/ryL4bzfHMdXL8
 bzzDr3dUcrCIMbFICumyDLhkMatjCVX//p7mD+AmcPKBDKEgYtTACby4CEjw3v3veEsqge9IxZu
 n6A/fd2/fzerWBRt2Z70hl/btj64cT8jQ6vZ+10TDlxxX3IrKax844VsZacev0C//51+7zjXJP1
 W4wQA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The ON Semiconductor PCA9655E is a 16-bit I2C GPIO expander that the
pca953x driver handles as a PCA9555: both entries of its OF match
table carry OF_953X(16, PCA_INT), and onnn,pca9655 has been there since
commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
pca9655"). Document it with nxp,pca9555 as the fallback, the form the
comments in armada-388-clearfog.dtsi and armada-388-helios4.dts ask
for. The I2C core tries OF matching first, so the fallback form
probes; tested on Helios64, the first user.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4631388a7d91..d671aaf83bb7 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -25,6 +25,9 @@ properties:
       - items:
           - const: kinetic,kts1622
           - const: ti,tcal6416
+      - items:
+          - const: onnn,pca9655
+          - const: nxp,pca9555
       - items:
           - enum:
               - exar,xra1202

-- 
2.43.0



