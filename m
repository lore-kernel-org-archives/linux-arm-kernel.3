Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C49C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 03:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ra31PvflUj2/dfEest80/0xB0KpZjPPOVZSt5vtRaHE=; b=ADYFb62SIBmUJ1Se88iZBS9EfZ
	i2f/ctKB6Z/cnNNp8NUfjDTa+3/N3ZftN6fqDVxJzxBtsuLv30/Rs2Z2z9mzbLkoufgxd6iMifl5J
	FpKC6S2hGtMDuBbv9+84MZHJ9KtuBQke267AjpvI5JBrBfxvuyGVyaRUcWSOKUYE5UKwoFQlzR7xj
	ZEuyeTlsAl/sIlppedq2c8Lv71bfSfJixMOvGxY9W4LdGEdtQlLiYX00Ya+t4pDzLI2o9XjNUSl/+
	oq2XyzchahzFVn4se7yJjwmuBbauhH5ACYl3n6hL1aaN1dRnLa9RxIz01QltXzayng2N3XF0iW4ba
	xPkeKbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6MK-0000000BwVq-234H;
	Thu, 19 Jun 2025 03:54:40 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6K5-0000000BwPY-2aqI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 03:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ra31PvflUj2/dfEest80/0xB0KpZjPPOVZSt5vtRaHE=;
	b=K6uNNIZ0comjpOJ1tCTnKTR7Jt7JYL74HgnaSOjmMRoGI58BjJjl4oVpVCQzXa
	YlkGZ92Q018P2lUqr63fOiX0oTrYwDxCEXwrEOcTf6tbu1g0SogUJ+6Sak5GKitW
	VyMNnierDphjCFyXHmq46OjnHqKJQNL//Eo4B9zvp5IvE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD31+1LiVNoPnL8AA--.63076S3;
	Thu, 19 Jun 2025 11:51:41 +0800 (CST)
Date: Thu, 19 Jun 2025 11:51:39 +0800
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
Subject: Re: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
Message-ID: <aFOJSz10KoTzQ+01@dragon>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
X-CM-TRANSID: Ms8vCgD31+1LiVNoPnL8AA--.63076S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUo1v3UUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwJxZWhTQrn41gAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_205221_988765_AB675319 
X-CRM114-Status: UNSURE (   9.87  )
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

On Tue, May 20, 2025 at 11:46:13AM +0800, Haibo Chen wrote:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"),
> the vf610 GPIO driver no longer uses the static number 32 for
> gc->ngpio. This allows users to configure the number of GPIOs
> per port.
> 
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied, thanks!


