Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26677D75E2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfpaYCJPU3dx2+EaDeUDD3UxGAopP0lXg1CxsKXRTew=; b=27r69esCdQEBWP8RHtg3UoXpN/
	+w5kvO+Df30ssyZzY043ooLpPm5OLm6Wbq7SdqCmucoN6mylsb+T7W206de/S+kICbSvhZfuUAbh9
	BP5vcbUoAQrmm+iS6RAdzvXMkjdIKM1/oUQqBx5vcD3r/xkPkVeklEDjtM3h2PIxwP9PAImRu5GPN
	ZIxi3Z4yC+ksdbpoS4eLjYP2BpbwVjBj37dwINbcYl7Q6qvJfHuXNWxOPbI7/CazWaJyq144YNRhd
	kAm8s2mtyRGINV2Zql4zQLRlg6HY/DuoWEX2bntJsXR/Xg2vcMboHdUn5WKtbFIq/UoQiMb+dsBbC
	E8DCrMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERjy-00000002M89-1Niq;
	Fri, 22 Nov 2024 11:22:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERg1-00000002LLu-0pFw;
	Fri, 22 Nov 2024 11:18:18 +0000
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDA70F86;
	Fri, 22 Nov 2024 12:17:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732274275;
	bh=+TycvT76QBlSTG2Wc1ml2WaPiIwhkCQW9F/t/pgRKLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S52zSAXEm86LGZseLzveT2rpxu9vOjQl/1U5c4hbXS69HIW5BLM8Nx9F0C4dJKBTr
	 mgvE2bSor40TjmrLQxmLJJjkN7uPLXxBbbl19swwJKOiPvp20jaSnCfcpc5gqI3toX
	 sN+0Q3W1CJmv9nAawn0ZpT2IKHS/wpYljzXgAjd8=
Date: Fri, 22 Nov 2024 12:18:11 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jacopo.mondi@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 3/5] drivers: media: bcm2835-unicam: Disable trigger
 mode operation
Message-ID: <qylnmgwawjmzuzkawku7ti6orj4a7ju6bckie25ion5ii5satz@slyawn2rm7gm>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-4-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122084152.1841419-4-naush@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_031817_397452_CDBB8564 
X-CRM114-Status: GOOD (  19.50  )
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

Hi Naush

On Fri, Nov 22, 2024 at 08:41:50AM +0000, Naushir Patuck wrote:
> The imx219/imx708 sensors frequently generate a single corrupt frame
> (image or embedded data) when the sensor first starts. This can either
> be a missing line, or invalid samples within the line. This only occurrs
> using the upstream Unicam kernel driver.

I think the last statement can b dropped.

>
> Disabling trigger mode elimiates this corruption. Since trigger mode is
> a legacy feature copied from the firmware driver and not expected to be
> needed, remove it. Tested on the Raspberry Pi cameras and shows no ill
> effects.
>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index d573d4d89881..550eb1b064f1 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -834,11 +834,6 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  		}
>  	}
>
> -	if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
> -		/* Switch out of trigger mode if selected */
> -		unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
> -		unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
> -	}
>  	return IRQ_HANDLED;
>  }
>
> @@ -1002,8 +997,7 @@ static void unicam_start_rx(struct unicam_device *unicam,
>
>  	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_DDL);
>
> -	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
> -	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
> +	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_IBOB;
>  	line_int_freq = max(fmt->height >> 2, 128);
>  	unicam_set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
>  	unicam_reg_write(unicam, UNICAM_ICTL, val);
> --
> 2.34.1
>
>

