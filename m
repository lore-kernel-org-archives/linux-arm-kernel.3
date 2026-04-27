Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C53FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwfVkr0UOUwn+x+uMm0tm2aNi88wncm2E+3QATUM66I=; b=Cd530SPJUGt4oElMNYM9ltWnDs
	/nbcUEfFwacDaxEdEu8SKANBJbvCs4HZzcj4hpFd1XsMdkgrd3QNaty1Dwo/0CnCEB7a5JbIFbuOq
	TXWT+VbpOAAJDjze/sBfeO1g8mHOcgj+BYv9XlaGcNIuTZ0Ssc18DQdHTBeaQQtFJdcCvnpv+BlCT
	QIuOgH9BvICgpzwnu318R6AaoDcy/jqkKGT1Ss7qC/O7f4IbGWSs4pwhqEMzxwBfyzaK97nnciTGN
	/PTWNFDRWGVIm4aioX67/HoLakq+UpL7bsJr9NL8qxBNMA++lkPSRO9145MttQKlIO5fA/GlfFrE7
	ekG0kgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIvf-0000000Gf8P-3fAM;
	Mon, 27 Apr 2026 10:11:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIvd-0000000Gf7u-1MaE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E438401A9;
	Mon, 27 Apr 2026 10:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083B9C2BCB6;
	Mon, 27 Apr 2026 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777284660;
	bh=hTQ+Nm3408VfTS6qIZ7SJIR7a4UET8p2wzXRUI2N2Uc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=myRy1y0SwFinU1uPzxc1hL5qGx1+kLTlJ9Dlp5AB5O4+KIxoDbo1saHPgDTJNHcra
	 Kt1aGX7djF+l3UnKvV+YBGpJ3Hxk3zcMM5rk+wC+m+gfyOUD9FndV8kj1Vzg5Y6wh3
	 SrQnIBPxJnX6tAUyrZ23tl1yiCsvmKbUquVj71chriRHUamvvcXPn7Nq/blq4Ouez1
	 yG8DTcO0bOQ21Z5/lzqhgLe1FtAQLDpRFpkfwhCnbWI1ITOo7xLRXMWFBkvQP4IqNH
	 UH4Z46PdddCXiZQwpSky/4rg9Xi2JOTk3/iXrXyY8KJu2cXlLaFA1MUAzi68g0cFdS
	 JgENA8/LjAC9Q==
Date: Mon, 27 Apr 2026 11:10:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Caio Morais <caiomorais@usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, michal.simek@amd.com,
 nuno.sa@analog.com, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH 3/3] iio: common: st_sensors: fix includes with IWYU
Message-ID: <20260427111050.7fbf88a1@jic23-huawei>
In-Reply-To: <20260426211834.3318306-4-caiomorais@usp.br>
References: <20260426211834.3318306-1-caiomorais@usp.br>
	<20260426211834.3318306-4-caiomorais@usp.br>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_031101_386443_736034D2 
X-CRM114-Status: GOOD (  14.67  )
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

On Sun, 26 Apr 2026 18:18:02 -0300
Caio Morais <caiomorais@usp.br> wrote:

> From: Caio Morais <caiomorais@usp.br>
> 
> Signed-off-by: Caio Morais <caiomorais@usp.br>
> ---
>  drivers/iio/common/st_sensors/st_sensors_i2c.c | 7 +++++--
>  drivers/iio/common/st_sensors/st_sensors_spi.c | 9 +++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/common/st_sensors/st_sensors_i2c.c b/drivers/iio/common/st_sensors/st_sensors_i2c.c
> index 7156302fe..04d106def 100644
> --- a/drivers/iio/common/st_sensors/st_sensors_i2c.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_i2c.c
> @@ -7,12 +7,15 @@
>   * Denis Ciocca <denis.ciocca@st.com>
>   */
>  
> +#include <linux/device.h>
> +#include <linux/err.h>
>  #include <linux/i2c.h>
> -#include <linux/kernel.h>
> +#include <linux/linkage.h>
>  #include <linux/module.h>
> -#include <linux/iio/iio.h>
>  #include <linux/regmap.h>
>  
> +#include <linux/iio/iio.h>
> +
>  #include <linux/iio/common/st_sensors_i2c.h>
>  
>  #define ST_SENSORS_I2C_MULTIREAD	0x80
> diff --git a/drivers/iio/common/st_sensors/st_sensors_spi.c b/drivers/iio/common/st_sensors/st_sensors_spi.c
> index 0da270139..884077d51 100644
> --- a/drivers/iio/common/st_sensors/st_sensors_spi.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_spi.c
> @@ -7,12 +7,17 @@
>   * Denis Ciocca <denis.ciocca@st.com>
>   */
>  
> -#include <linux/kernel.h>
> +#include <linux/device.h>
This one is similar to kernel.h in that it's mostly a catch all header
that we prefer to replace if possible with more specific ones.

Now the driver might directly dereference a struct device, but if
so that normally indicates something we should clean up.
Maybe it's something else.  As mentioned in previous review
providing that info under the --- in the patch can save time on
questions like this.

> +#include <linux/err.h>
> +#include <linux/linkage.h>
>  #include <linux/module.h>
> -#include <linux/iio/iio.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/spi/spi.h>
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +#include <linux/iio/iio.h>
>  
>  #include <linux/iio/common/st_sensors_spi.h>
>  


