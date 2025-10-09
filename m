Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2659CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=faGgMX7yftl+bZV4d1jTQGN+lvZUg2QDcMXs0q6kWgA=; b=pFpvRwo9/SbB3j/7ON8VPQgyOm
	9PfM9fY2U+8HAHpbd81lAtQk3TUc0/c7DJXPhdJRKpSA2CZpUkyqVi8P0xLCTm71J3S47JFd7NX1+
	8B9v1BrhoipL1qb2pFm4kRsAk0QfikjBMNX8MiMdb1TWfopDu6xf68RsXTFcwl5ofXwcKMWeQGEai
	sdbC+UISARmF13gaPYu7p0MLI2xK8ahNOUqz5FsNPO/DZ+Me1HmXwbQfD0H2/HhQFPTaFJg6oza2S
	tywnGy17ue4hBhgxEEv3gwpKIxs5miCcGSDnpvZzRMpgv7odum6+a0vfTHaxJ47qNmhNQso42h+nX
	+yjj8G5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oHw-00000005qF1-0GfT;
	Thu, 09 Oct 2025 10:54:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oHt-00000005qCr-26Y7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:54:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD4B444AF2;
	Thu,  9 Oct 2025 10:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 814D8C4CEE7;
	Thu,  9 Oct 2025 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760007260;
	bh=AH1YWT1PmOpsxR4ljF1m4JmyHPJPRdfWYF5LAjqppjw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VAsm0dUSNHW40Z/IpV8gBFAUZiPhVDvQdry5/iL2Oqcij++VpcnbL8hMjX2Hoh54r
	 T/oNTHWzERv3bHNiUNtie7g2JHBHv+HjJ7BHjUB213QvJ4ZIW+4JMQj0LnDvYwQxyf
	 QDzeYvRUwE1QF5drm+g8MC0LZe0ezKQeLDNtUXRG6w5jEUPOpAs35RMMUZgZrQonip
	 NvXKng0CyvgbUH4OeresLk71/wPEXQ+pqETrpVuDbSgcP/Z9ZulPM9Tk5goMt3pEvM
	 iR7VqO8Vfi1BZ2COOzRWFdUZgKsYCVyPYYexz2p8h6VdMzPhcUAaIwNvBthl4k4NrI
	 Un7GJuUX+coEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F76FCCD183;
	Thu,  9 Oct 2025 10:54:20 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH 0/5] arm64: dts: freescale: add support for the GOcontroll
 Moduline IV/Mini
Date: Thu, 09 Oct 2025 12:54:16 +0200
Message-Id: <20251009-mini_iv-v1-0-f3889c492457@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFiU52gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNL3dzMvMz4zDLdRAPTVNNko2RDIyNjJaDqgqLUtMwKsEnRsbW1AA1
 gqCRZAAAA
X-Change-ID: 20251009-mini_iv-a05e5c2c1223
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760007259; l=1210;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=AH1YWT1PmOpsxR4ljF1m4JmyHPJPRdfWYF5LAjqppjw=;
 b=cBmGj7Wqbc/xkjDIXBHq1BeswMYmO+gRfkT82CTX4YzTxUswkiR/3SzGkj0EaLLjOEdiluSQS
 oIPsQDCYFNfAcq4xre8PD+0SBdcfQDubafa3oXaTWbr6FRGhUXT026R
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_035421_580171_5ACF8B20 
X-CRM114-Status: UNSURE (   6.98  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add initial support for the Moduline IV and Moduline Mini embedded
controllers.

These systems are powered by the Ka-Ro Electronics tx8m-1610 COM, which
features an imx8mm SoC.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Maud Spierings (5):
      dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
      arm64: dts: freescale: Add the GOcontroll Moduline IV
      arm64: dts: freescale: Add the GOcontroll Moduline Mini

 Documentation/devicetree/bindings/arm/fsl.yaml     |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |  33 +
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 801 +++++++++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 691 ++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 562 +++++++++++++++
 6 files changed, 2092 insertions(+)
---
base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
change-id: 20251009-mini_iv-a05e5c2c1223

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



