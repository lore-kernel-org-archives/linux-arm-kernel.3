Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90317E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYhIP+6XdCauU90xrCm4a61igbxLWRkJYD2iC97akYA=; b=iIxSg5T3mriu70qlD/G+QYa8DO
	rBf/3haPXPWv9xUr8KSPKvcHmczqdanQvGJRvnBZJ2m7WnViydQvLG7B1c5HVkwEE4fL08oo7yByr
	5YQVqLlU4qmt25ay6YGz271D+QCZGyZt/tWBESd3XQK/m3G43z/CMEgm4J7HYU/0Lkp3gOStHvWo0
	R1T0+MWE7XMGK1AmFoasIOYgHOAK70EC0YkxXtIQbdyTGHloeKtJuev57K54khr9ay5zxheTsPVyE
	hi8GwT9w3n9ZiB1fYAjUjUjZqlLQY8emXilqzxvjDNyGLzO5w1PYkfb6LZOEunQslOPC3of+Bwt/3
	eTP0I3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr2K-0000000GDFI-0TG9;
	Wed, 18 Dec 2024 10:12:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr1E-0000000GD9i-421r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:11:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DB47FEC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 02:11:30 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4EBD43F720
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 02:11:02 -0800 (PST)
Date: Wed, 18 Dec 2024 10:10:48 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mfd: syscon: Remove the platform driver support
Message-ID: <Z2KfqFVz272M_iiP@e110455-lin.cambridge.arm.com>
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
 <20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_021105_091379_959CEB1F 
X-CRM114-Status: GOOD (  28.46  )
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

On Tue, Dec 17, 2024 at 12:11:41PM -0600, Rob Herring (Arm) wrote:
> The platform driver is dead code. It is not used by DT platforms since
> commit bdb0066df96e ("mfd: syscon: Decouple syscon interface from
> platform devices") which said:
> 
>     For non-DT based platforms, this patch keeps syscon platform driver
>     structure so that syscon can be probed and such non-DT based drivers
>     can use syscon_regmap_lookup_by_pdev API and access regmap handles.
>     Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT based,
>     we can completely remove platform driver of syscon, and keep only helper
>     functions to get regmap handles.
> 
> The last user of syscon_regmap_lookup_by_pdevname() was removed in 2018.
> syscon_regmap_lookup_by_pdevname() was then removed in 2019, but that
> commit failed to remove the rest of the platform driver.
> 
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

(Mostly for the vexpress-sysreg.c part, but hey, it's all code being removed):

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/mfd/syscon.c                 | 66 ------------------------------------
>  drivers/mfd/vexpress-sysreg.c        |  1 -
>  include/linux/platform_data/syscon.h |  9 -----
>  3 files changed, 76 deletions(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 72f20de9652da2d7bad12e4bc2c43ac0c9a97f76..bfb1f69fcff1d3cd35cf04ccd4c449e7d0395c79 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -12,22 +12,15 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/hwspinlock.h>
> -#include <linux/io.h>
> -#include <linux/init.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_platform.h>
> -#include <linux/platform_data/syscon.h>
> -#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/slab.h>
>  
> -static struct platform_driver syscon_driver;
> -
>  static DEFINE_MUTEX(syscon_list_lock);
>  static LIST_HEAD(syscon_list);
>  
> @@ -337,62 +330,3 @@ struct regmap *syscon_regmap_lookup_by_phandle_optional(struct device_node *np,
>  	return regmap;
>  }
>  EXPORT_SYMBOL_GPL(syscon_regmap_lookup_by_phandle_optional);
> -
> -static int syscon_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct syscon_platform_data *pdata = dev_get_platdata(dev);
> -	struct syscon *syscon;
> -	struct regmap_config syscon_config = syscon_regmap_config;
> -	struct resource *res;
> -	void __iomem *base;
> -
> -	syscon = devm_kzalloc(dev, sizeof(*syscon), GFP_KERNEL);
> -	if (!syscon)
> -		return -ENOMEM;
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENOENT;
> -
> -	base = devm_ioremap(dev, res->start, resource_size(res));
> -	if (!base)
> -		return -ENOMEM;
> -
> -	syscon_config.max_register = resource_size(res) - 4;
> -	if (!syscon_config.max_register)
> -		syscon_config.max_register_is_0 = true;
> -
> -	if (pdata)
> -		syscon_config.name = pdata->label;
> -	syscon->regmap = devm_regmap_init_mmio(dev, base, &syscon_config);
> -	if (IS_ERR(syscon->regmap)) {
> -		dev_err(dev, "regmap init failed\n");
> -		return PTR_ERR(syscon->regmap);
> -	}
> -
> -	platform_set_drvdata(pdev, syscon);
> -
> -	dev_dbg(dev, "regmap %pR registered\n", res);
> -
> -	return 0;
> -}
> -
> -static const struct platform_device_id syscon_ids[] = {
> -	{ "syscon", },
> -	{ }
> -};
> -
> -static struct platform_driver syscon_driver = {
> -	.driver = {
> -		.name = "syscon",
> -	},
> -	.probe		= syscon_probe,
> -	.id_table	= syscon_ids,
> -};
> -
> -static int __init syscon_init(void)
> -{
> -	return platform_driver_register(&syscon_driver);
> -}
> -postcore_initcall(syscon_init);
> diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
> index d34d58ce46db2ad0d53b3daeabc9d3763883b39a..ef03d6cec9ff6927668d051ca459eb1d8ff7269e 100644
> --- a/drivers/mfd/vexpress-sysreg.c
> +++ b/drivers/mfd/vexpress-sysreg.c
> @@ -10,7 +10,6 @@
>  #include <linux/mfd/core.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> -#include <linux/platform_data/syscon.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/stat.h>
> diff --git a/include/linux/platform_data/syscon.h b/include/linux/platform_data/syscon.h
> deleted file mode 100644
> index 2c089dd3e2bda3baf5cef201ef43bca709e12c0b..0000000000000000000000000000000000000000
> --- a/include/linux/platform_data/syscon.h
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef PLATFORM_DATA_SYSCON_H
> -#define PLATFORM_DATA_SYSCON_H
> -
> -struct syscon_platform_data {
> -	const char *label;
> -};
> -
> -#endif
> 
> -- 
> 2.45.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

