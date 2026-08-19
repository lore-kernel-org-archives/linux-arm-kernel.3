Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF78C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HC9hzqp25hJ9dnFkyg3+4PSSoZICNQ+8dExx/7chds=; b=ZwtsvTQ/yu5+toAvEfpz3U+W0y
	jBKzartI9lavsLBTPscFWsI6+kEa+KIRnvVETaG98XliNK5IBoUiG9vEBLqkI+PTp1gCihwnh3VLX
	80YMd73lggOmGP+FMj/LY65Dey2z+X7iUGZoV5XaECboqBwLlAqa6D52qgOYU5Ytrtma2LQkuN/Jl
	Iy09OldRT+c9Rnj/D0FqEl1l+5m1Zl7DnHqiAog2hLPZT+x2K19IFLBRl1by0+xC4u4xB7L/8erlL
	MQJsLkTFsULvcukR30wBdlisc2KrX2KFs3lHZWG65ZfGnIj/bn1C5U5HzidTIu40xufc5M4Hqh5V2
	NTQznMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwalu-00000009CMu-3fsj;
	Wed, 19 Aug 2026 07:31:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwalt-00000009CMk-0tpU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:31:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9501160A5B;
	Wed, 19 Aug 2026 07:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE76C1F000E9;
	Wed, 19 Aug 2026 07:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787124696;
	bh=3HC9hzqp25hJ9dnFkyg3+4PSSoZICNQ+8dExx/7chds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hr0oUucKoheS3zqBS3EqHM07soF7W/biU/1NSGlWU/Xxf+DOFemVcmIm5YosXdpMt
	 PudcHgdJL6I3FxB67iBX3QCDqxCPrP7W0qBY9bLAcjGdg9rkT2o+yv0GHBoKWidKud
	 g+42uBSMsj8mhX3xRGReSaqDSiCRKrVYtICbOzPbcjE8jfggnrp6RfOlkKZCr9mUR0
	 3rAoXZNK53Idf331vcMLgnDdVf79nUKnPG0Dm5jUWeJN0W5uoHUBa9meWaqTZ4YaUO
	 es6N/H67wYyf0LIJhnrEB/KA5OUrrx/oldcOnjadA7Cu9i1y1AZbOKPZ6frBmdjZsw
	 iSFuK7EG3VRcw==
Date: Wed, 19 Aug 2026 00:31:34 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v9 1/3] usb: add missing headers transitively included by
 <linux/phy/phy.h>
Message-ID: <aoVb1kxR11yP0Uvv@hu-petche-lv.qualcomm.com>
References: <20260810125614.441667-1-vladimir.oltean@nxp.com>
 <20260810125614.441667-2-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810125614.441667-2-vladimir.oltean@nxp.com>
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

On 26-08-10 15:56:12, Vladimir Oltean wrote:
> The chipidea ci_hdrc_imx driver uses regulator consumer API like
> regulator_enable() but does not include <linux/regulator/consumer.h>.
> 
> The core USB HCD driver calls invalidate_kernel_vmap_range() and
> flush_kernel_vmap_range(), but does not include <linux/highmem.h>.
> 
> The DWC3 gadget driver calls:
> - device_property_present()
> - device_property_count_u8()
> - device_property_read_u8_array()
> but does not include <linux/property.h>
> 
> Similarly, dwc3-imx uses device_property_read_bool() without including
> <linux/property.h>.
> 
> The dwc3-generic-plat driver uses of_device_get_match_data() but does
> not include <linux/of.h>.
> 
> In all these cases, the necessary includes were still provided somehow,
> directly or indirectly, through <linux/phy/phy.h>. I found the following
> command to be quite helpful in figuring out the include chain:
> 
> $ make KCFLAGS="-H" drivers/usb/dwc3/dwc3-imx.o
> 
> Since <linux/phy/phy.h> wants to drop the unnecessary includes, fill in
> the required headers to avoid any breakage.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com> # dwc3
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Cc: Peter Chen <peter.chen@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org> #chipidea part

Peter
> 
> v7->v9: none
> v6->v7:
> - add drivers/usb/dwc3/dwc3-imx.c to the list of patched files
> - collect tag from Greg, keeping it despite the new addition because the
>   change is minor and in the same spirit as the rest
> (https://lore.kernel.org/linux-phy/2026033028-squint-yield-4c23@gregkh/)
> v2->v6: none
> v1->v2: collect tag
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c   | 1 +
>  drivers/usb/core/hcd.c               | 1 +
>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  drivers/usb/dwc3/dwc3-imx.c          | 1 +
>  drivers/usb/dwc3/gadget.c            | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 282314eea7fc..1509b8ec630c 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -17,6 +17,7 @@
>  #include <linux/clk.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm_qos.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "ci.h"
>  #include "ci_hdrc_imx.h"
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 8e8a5f59b319..f7def9b116e0 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/bcd.h>
> +#include <linux/highmem.h>
>  #include <linux/module.h>
>  #include <linux/version.h>
>  #include <linux/kernel.h>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07c..2f2ae6f4704f 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> index 973a486b544d..6e122674edaf 100644
> --- a/drivers/usb/dwc3/dwc3-imx.c
> +++ b/drivers/usb/dwc3/dwc3-imx.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  
>  #include "core.h"
>  #include "glue.h"
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index fa0f16ffafef..e70c17d50db8 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/delay.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/platform_device.h>
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen

