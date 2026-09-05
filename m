Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28D3C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 23:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBwprd27R86EaPLJBM8dvaABJd4TLWMuEGw2bd6/P8U=; b=qc5FFumHHJaCl6PsHPWfm/wrEV
	Ki4gEOikIVncThpeCEutfUaqI4S3H8EzVJLnZqDhsJ+pA1hSHmXRud5gQkuA5EXofaEnpKNR+OeYx
	s36FMuzA0kkzlwXQorZYSni0oGYow/0+66hZ67ZGQu7fvxas2JAVaR5ZIwAWEIJdRAH0zCl0F4X4L
	gORjX3PVmjxsS5ll8Y+xeeR2okvk0tFt/ayULOLCPiJLeL6OXap7WqEoeKnxgejzWwPBGMmZ3ZBeL
	GztdG8NOk6J/TkMU83wfoSSOzQLeAF/FBv217L8ilVJjsAKdSj7K8o6ZSz+MPY0Ybfectj46I/qtH
	L1NEkM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ztY-00000004TtN-0mWN;
	Sat, 05 Sep 2026 23:34:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ztW-00000004Tt4-22oq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 23:33:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 629B241843;
	Sat,  5 Sep 2026 23:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4652D1F00A3A;
	Sat,  5 Sep 2026 23:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788651237;
	bh=VBwprd27R86EaPLJBM8dvaABJd4TLWMuEGw2bd6/P8U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jl0hhuAewGv514kVZdPDvCIdRevxtwBAY4wOvEV9RCwyz/QnDn4nBIaiL29KoA/z8
	 8V04kq6idsfBgO9+uU659QdKFUfYnHWdfCNLNtHMMonpCH85hem/PNV/au+2OeahLb
	 tuc8FpPc4khRQTokL4hNzsNwpjtN2rPq2RbDzkZZI6ox464rMFvfI1eKDWOZXoYIcc
	 yH6O/IoRqxK2aBanWfcLUVfBMUMyqzSJwSb4eay3BxLEOJn/NfbYTXncc8HQTxY/JH
	 vfdY9ghnXS4C6nNrpMxv8r22Sk/JuYiHJYjzMYOm2Y4kYjBmXMJWSx8f76eQAjRzmV
	 SBRk+T2SCPVTQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/6] iio: adc: bcm_iproc_adc: fix include
 dependencies
From: Jonathan Cameron <jic23@kernel.org>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260905093631.48667-3-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
 <20260905093631.48667-3-mdshahid03@gmail.com>
Date: Sun, 06 Sep 2026 00:33:40 +0100
Message-Id: <178865122087.3402141.18120568550837598707.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577;
 i=jonathan.cameron@oss.qualcomm.com; h=from:subject:message-id;
 bh=o1LKxioRKjTP0DmjmeuLC8KW3uzhMGftEX7ghnHlnDA=;
 b=owEBfwKA/ZANAwAKAVSFNJnE9BaIAcsmYgBqnKbW5WXq5c5/lCO7CmIb2qL1eefg8jdpWOUgy
 +1BiR3qG3iJAkUEAAEKAC8WIQRuKWazh4QGUpEmgbFUhTSZxPQWiAUCapym1hEcamljMjNAa2Vy
 bmVsLm9yZwAKCRBUhTSZxPQWiDouEACWrrfRCRayDMQEGwqtQ63k3K6nFsW5uuN4v3kO30s/hv7
 Jzy75/XwyNg7pem4DV0BX3diHx/bdJF8xtpPvdLnvUlS8RW9x164VFHlBoQVW23L9AciR4ZRNjC
 BP7qeAnwyuCHALpfKB+cNfUuQLpYeu7igZx8Cjw7L8Dl8SEVvxnhFOy4uwIYuMcPEkfeWRWItwG
 SbFJL2NVYF+LU7rO62jEMZk/78p0cuNpjCwHOCzy20t8OuVL6d3op3EhagT8tRVnSLfeP4cFAtU
 e9tpJPR0dKtB7nbk2nDTgJiXW9dYA6ji/rtzrgYHcmXwJXzuCJKhr7Z2AO8hVbVxpb+WH57qaYn
 oicth/mrVTCOTLx6pwa0jo2hwjP+6okz8zFs/VWz4Vwp8z1YqB1hjJQhCIg4fGuwS5w2Laj+/5w
 8B68QGx40FgMIGckLtT3L3jD/IL6IUajtFPL8i+Y81RIGh7f/F4G7InsmflWFFmuq8PRofSVTGS
 YMYi882rK10Ez7CZFG2rNzbasNI3p1nJKuLSiw4u1D6zzIKcWuxwTVyW4k0pbpmsV0UIZp9WcX7
 2yPRUd9vSKxYI2ArjX2fMs20xezpKrMf7+kSdgqTPifBwcIIn2BgEolntyuCJvNeshfIHmzbb0o
 MffxXAVXCM4zopZBPplL+Yet6FyuNNB0k8PVPtQ==
X-Developer-Key: i=jonathan.cameron@oss.qualcomm.com; a=openpgp;
 fpr=6E2966B387840652912681B154853499C4F41688
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

> Add the headers required directly by the driver for the APIs and
> types it uses.
> 
> Remove the unused linux/io.h header now that register access is
> handled through regmap APIs.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
>
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index e46e3761993a..e54f613d266a 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -2,15 +2,18 @@
>  /*
>   * Copyright 2016 Broadcom
>   */
> -

Really trivial but this change doesn't belong in here.
I don't really mind whether or not there is a blank line here but it
is definitely not related to the header changes that this patch
is focussed on.  I might fix up whilst applying or decide I can't
be bothered.  If you should spin a new version for other reasons
please put the line back again!

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
>  #include <linux/clk.h>
> +#include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> -#include <linux/io.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/types.h>
>  
>  #include <linux/iio/iio.h>

Otherwise, this looks fine to me.  The sashiko comment is a
preexisting issue so out of scope for this patch at least
(I also didn't check if it is correct or not)

Thanks,

J

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

