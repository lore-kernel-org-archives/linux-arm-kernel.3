Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCF8E68974
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvKawciAkdPp3q3ubehqdShlOvcYEaxk6sp8bheVwoU=; b=LPEhBIV14o7+q3XXTh2UjqSRy8
	l1yh72ykKSnAw/lOFRbsvGQUXuqZuDlmukPX1KvLXEY7iP+xsYbu8PCh6v9lOiUV7w+6FKLupJaM/
	FGTrAWE7nrIPz2i+imJVqSKmGcuhTfpHKbNzecoW6p2zxlljk+V7dhRpVU6//P6YBHKH9PT/fmr8G
	UL2b+BnDndk3RkQ1zwxGpXf5yz3oqCUSkIQQc6+rnxDRyYZsRTIz4z6wivjOsayoG/HwGT+Yj/04K
	biVj+vTK03Y8ie77Bi+WEyGyRjfqi2Xwaj+hhbGbAC/KCcDgJ2B8NRK0HC+bOSIQC5FbN3J6LoTeu
	cRvyJ6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TPr-00000003P1B-0JeX;
	Thu, 31 Oct 2024 11:32:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TM1-00000003OZ9-2OMa;
	Thu, 31 Oct 2024 11:28:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BF8A1063;
	Thu, 31 Oct 2024 04:29:08 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12A993F73B;
	Thu, 31 Oct 2024 04:28:36 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:28:28 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>
Subject: Re: [PATCH v1 1/1] phy: sun4i-usb: Remove unused of_gpio.h
Message-ID: <20241031112810.21d00b29@donnerap.manchester.arm.com>
In-Reply-To: <20241031104631.2454581-1-andriy.shevchenko@linux.intel.com>
References: <20241031104631.2454581-1-andriy.shevchenko@linux.intel.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_042841_686915_1C190E96 
X-CRM114-Status: GOOD (  12.72  )
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

On Thu, 31 Oct 2024 12:46:31 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> of_gpio.h is deprecated and subject to remove. The drivers in question
> don't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index cd159a71b23c..29b8fd4b9351 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -23,7 +23,6 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/phy/phy.h>
>  #include <linux/phy/phy-sun4i-usb.h>
>  #include <linux/platform_device.h>


