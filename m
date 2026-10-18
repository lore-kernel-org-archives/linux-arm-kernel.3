Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6B9CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 23:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e4WE20O8Rc1VgzdqF32AmLC1BPibXZYUFbzR4tIIrE=; b=IbkX5Mcy16rhAwQouBuv5LmhS1
	lMUjxXIR+C/TPQUnIJbtDrr9LgOJ/iIWOfNOAOlfCHd5u/xw9WbhnkjNPBUC6f4zh70QY4o1p4+Hf
	e67+pvNjc4QJdZHfMxzU9UIb33ccsKS5eiFAv6Z7HPA39ys0kpP1J/e5r35N7qXvwsK80sxVHXBl6
	iVul3fnLPoaiO1c3oujw1zTCW7l2w+imIffomxvSla7TING3XTfqK/fohvWod5fpw0/QA80FrJSAN
	BSduseEzb5zlbebihfitC2oUaErbXC4dQ8N9ePTZzvcSzmDQKe85sPEL0YG5MJ9PR6IWH3BI9XnG+
	mveXmreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIa6c-00000006I4Y-0Tn6;
	Sun, 18 Oct 2026 23:15:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIa6Z-00000006I4Q-3vZk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 23:15:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E864F60D9E;
	Sun, 18 Oct 2026 23:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F441F000C4;
	Sun, 18 Oct 2026 23:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792365350;
	bh=4e4WE20O8Rc1VgzdqF32AmLC1BPibXZYUFbzR4tIIrE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EzdGfbewnEhIziv1YL/5Gs3Q8qpBioGwiZ3DXYkEaS3CR8wJKqldZ/xq2Do6mY44T
	 0Si/HW8abmJ1QEBnb3nVgK/ck/gplmbh0zDW0T2Dox8iA78R89YwyTpTK/grZtbWJg
	 AyyG8Yb7Wzf22M1f2D8faolUwip/qa+mZU3IqN20xjue+r3v9R7/VLH/RSO+gsydcw
	 7hUY2bb7I0venUazDjkTvv+inyecj92M6hohjk10GLWHWgcCICxgDSJPGjipIIx5SE
	 wa6l0P/VGznMycXw479YqJcrmoEhAE/TNsTst3tR+S+6/I9I4UtVsu9DCOwIEyghc0
	 +cMsv2H9NZpDw==
Date: Mon, 19 Oct 2026 00:15:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 09/15] iio: adc: xilinx-xadc: Drop unused header
 files
Message-ID: <20261019001542.157390c4@jic23-hlaptop>
In-Reply-To: <20261005094205.1045874-10-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-10-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 5 Oct 2026 15:11:59 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Remove header files that are no longer required after the
> recent code cleanups.
I'd retitle this patch as you are adding includes as well.
Perhaps "Update to include appropriate header files."


> 
> No functional change intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> ---
>  drivers/iio/adc/xilinx-xadc-core.c   | 7 +++----
>  drivers/iio/adc/xilinx-xadc-events.c | 1 -
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
> index 65fcefa07516..46b95883a250 100644
> --- a/drivers/iio/adc/xilinx-xadc-core.c
> +++ b/drivers/iio/adc/xilinx-xadc-core.c
> @@ -11,27 +11,26 @@
>   *  - AXI XADC interface: Xilinx PG019
>   */
>  
> +#include <linux/array_size.h>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/bitops.h>
>  #include <linux/cleanup.h>
>  #include <linux/clk.h>
> +#include <linux/container_of.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> -#include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/overflow.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> -#include <linux/sysfs.h>
>  #include <linux/types.h>
>  
>  #include <linux/iio/buffer.h>
>  #include <linux/iio/events.h>
>  #include <linux/iio/iio.h>
> -#include <linux/iio/sysfs.h>
>  #include <linux/iio/trigger.h>
>  #include <linux/iio/trigger_consumer.h>
>  #include <linux/iio/triggered_buffer.h>
> diff --git a/drivers/iio/adc/xilinx-xadc-events.c b/drivers/iio/adc/xilinx-xadc-events.c
> index f5b5aad6e313..ea0f06ca2a82 100644
> --- a/drivers/iio/adc/xilinx-xadc-events.c
> +++ b/drivers/iio/adc/xilinx-xadc-events.c
> @@ -8,7 +8,6 @@
>  
>  #include <linux/iio/events.h>
>  #include <linux/iio/iio.h>
> -#include <linux/kernel.h>
>  #include <linux/types.h>
>  
>  #include "xilinx-xadc.h"


