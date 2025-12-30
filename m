Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8757EE4983
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjLaYjrR1MKuGXNVMXC/3x7JElHhhnNjgoytiQMaSJ4=; b=oLofd3gnDF/+HfRqCX10pG3lyV
	6im1EfSGpXffv+cMSc4BEKsQjlvIBieA+w8gjL6ujpqR0N2s+6a5JcltpJRtRv0peIGd8fIpUN2cX
	IPvkV0Wv+5AkFLDCUFZfvHeBQXt5ZOK58deQlpxJwL4qBoioJyzhT+GsorLiVsE2pqQFH4+WR4VXu
	7U0a38xd7ntHIl6HIXPsjxGBjl+/5fP5dqCIXegOPmjgkqYz7jo4LsWqCWyLSDtvxr1pfdP09ihhu
	kTfMByDp12IvIFEHTU/SuSVK1XKYN0cGVB6KYxWoEXe4As6wW03Ox2ueG66+3cVgyX2f73tarmDWF
	L6ZOcnkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vacWV-000000053ID-03eU;
	Tue, 30 Dec 2025 16:24:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vacWR-000000053Hp-3uqc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 16:24:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8A8BCC1D73A;
	Tue, 30 Dec 2025 16:24:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDEA56072C;
	Tue, 30 Dec 2025 16:24:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C8CA113B029B;
	Tue, 30 Dec 2025 17:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767111871; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PjLaYjrR1MKuGXNVMXC/3x7JElHhhnNjgoytiQMaSJ4=;
	b=X3KfMSP85DHhW63H9aYJGfgf7piH+p8p/oKHaqM0A3q1yoh9B4WigDduzbQlJBtk0/Rxgd
	7rINi6glPvbrkkisffEiOZG/p1DfWz9D/yjmf6mqsWZ6jN2fy5E0m5xu6hBgrE+ZpGZecn
	y8Oz0YFHt60/2ev1XLSNVOIAQLlGaB2dSvGpfHk8naCwZrtV2KA3Ta4h5jQ8QPqtkXLfGH
	pxEdp2m8rfoH6lmvzsRvooC8VGnEDLl7WlvSXx39MM/On/ujHwxaNWsrWrzSlcNJ/Jvvxk
	hgfaThTIhPdc+hTgy2UIqnLxwlrnefR1RtuWH6Y2l8OWGNtzoxF2KnF9UGPnZw==
Date: Tue, 30 Dec 2025 17:24:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Haidong Zheng
 <haidong.zheng@nxp.com>, Danwei Luo <danwei.luo@nxp.com>, Lei Xu
 <lei.xu@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add support for NXP
 i.MX93 FRDM
Message-ID: <20251230172427.4f22ac7c@windsurf>
In-Reply-To: <20251230171548.67289601@windsurf>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
	<20251218-fpg-nxp-imx93-frdm-v4-2-cd3a9f6ac89a@pengutronix.de>
	<20251230171548.67289601@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_082436_159457_63145391 
X-CRM114-Status: GOOD (  12.48  )
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

Hello (again),

On Tue, 30 Dec 2025 17:15:48 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I see the PMIC interrupt and the RTC interrupts are routed to the I2C
> GPIO expander at 1-0022, so I imagine either the PMIC or the RTC are
> triggering an interrupt (left enabled by U-Boot), and the kernel isn't
> compiled with the driver for either the PMIC or the RTC, and therefore
> there's no IRQ handler?
> 
> (I confess I didn't investigate more than that at this point.)

Upon closer inspection, I in fact get thousands over IRQ #100 per
seconds right after boot, until the point where it reaches 100000 IRQ
events, and the splat appears, with the IRQ being subsequently
disabled. So it's not just one interrupt, but a storm of it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

