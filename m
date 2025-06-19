Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3BFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 03:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LU7QhYjxOqOH4zbvw6oM0dtf5fFvFxSixl3GW1jJGTw=; b=DrqwqyzUBkETSHULJ+Ts/ov3xQ
	mSTf5+cb9xvOADrR8m1P6K/G6ABjb1HJMZf4WH7efG9a5vqYz6TTWihsmV+nzg2R4lfFpDI7I9y0y
	aDS90RYnLwK7QQxwBbYrFvzsI0lQruMnRssqenMBtv7f4k/wHJryR5WtDM29Rx6NHlweBWT1S3j/O
	3w1Q2juSiweL9E1e1IKb+fpAIb6L4woPAioMGOhdLRlHpZynRD2Pn28Km6t3CB9RCLI6DblBs6Riu
	tdPzrCLNHv9gkHIUWaS8cxgv4vkHsoyDrrOZFO6G92rrcoDy7sdFLipfciD2mqRy7dtVuVkCUJLlO
	6gzNQ11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6Oi-0000000Bwtu-0rN6;
	Thu, 19 Jun 2025 03:57:08 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6MS-0000000BwYw-3f6b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 03:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LU7QhYjxOqOH4zbvw6oM0dtf5fFvFxSixl3GW1jJGTw=;
	b=c8r1P5P4xE0Kb3/i+H2dW91s0RkOZn33p8n76h5J7WpdAfONeFvuQYZ1B7936F
	EK/EPsIEAzrXOu1pQ6ERZKymZQV3Z8VQhybSR9Z/6MCo4yb3obETCifpFGzJoF0B
	TC/HLpaHvgH+aE3WKx1JA/OCruq+eSOsSYCQsB7CtBsUQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHZsPUiVNoFnv8AA--.41662S3;
	Thu, 19 Jun 2025 11:53:58 +0800 (CST)
Date: Thu, 19 Jun 2025 11:53:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	peng.fan@nxp.com, wahrenst@gmx.net, conor@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 3/3] ARM64: dts: add ngpios for vf610 compatible gpio
 controllers
Message-ID: <aFOJ1OXvpEP8gaxL@dragon>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
X-CM-TRANSID: Ms8vCgDHZsPUiVNoFnv8AA--.41662S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW5Kr4fXw4UWr1kKFWfZrb_yoWfArc_CF
	W0qw4UZws5uFWxKw47Kr4Ivr18Ca4fZw13Wry7Gr93Ja4YqrnrtFs3JrW3JayUWFs8KasI
	kry5tr48Aw4agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbUKsUUUUUU==
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIReG62hTideU6wAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_205449_273311_97DB6BDA 
X-CRM114-Status: GOOD (  11.59  )
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

On Tue, May 20, 2025 at 11:46:14AM +0800, Haibo Chen wrote:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"),
> the vf610 GPIO driver no longer uses the static number 32 for
> gc->ngpio. This allows users to configure the number of GPIOs
> per port.
> 
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
> 
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Historically we use "ARM: dts: ..." prefix for arch/arm/boot/dts changes,
but use "arm64: dts: ..." for arch/arm64/boot/dts ones.

Fixed the prefix up and applied, thanks!

Shawn


