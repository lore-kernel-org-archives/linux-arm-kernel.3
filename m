Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5E6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j4tReDj5;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OWv9Kqyv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=focRYHe+lLJ7WgjazgIVN+EOiAAyKkLKpH1zWpglXSg=; b=j4tReDj5hlGpjSq26dTDBqS/4x
	NSDLkaWNXOAnS+7keRJEb1EMcTFXpDFrPUtFj8fdb48J4UZPmNN3RLv3Bsj1EGYTjaC0f/CTRvcWW
	0mAtL/jzh5h1V8YBJpy7PZMG9mpdDfaPehVJqHs0QBHcG8wLkv5mxXvWiwjxbna8DipLzQELpc1ae
	mcmQ3UYPqoQRk2ssGkedcgxH3gycDE8lRbkAkMFRaeatAVSPhb0/+cf7Zb41ssavv9eV1iCYeMgp/
	uR5NpoHcUDv/M6VIZ9GuAsTXPYx/ASjqJonvYdRCoxQqJ0O9DfEqlJhBV7A6i43GGxqUDG2PQ2REV
	nYtDbUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiHH-0000000B9g6-46bM;
	Fri, 30 Oct 2026 08:47:59 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiHD-0000000B9et-3wvZ;
	Fri, 30 Oct 2026 08:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350076; x=1824886076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JfiM+BJFzo6/ofk3Y9BcFh3FD/ABNUljlg2cidkKFDI=;
  b=OWv9KqyvkIXfgmnFLiXTkMXwggfAferubjJwMq8H2uQstNd5REFVhHV1
   DuPpmIpoTYaS488XnUL5E7ZYmxPkWIu3vE+XbTWDa2ohlC8BFzwbnOHuH
   dQu28H3/RcIhb6RIpw7wh3HUxwhhwvxCXJ06DFqFgPTNOJBQG+d2dMv3s
   xdSAF2odvgLYBGJxNYmgWsZmRRONTD4iHaumJxlM+aUgh5A8VDto0A+u2
   z9/eMv5U4PnVm+XiMNCooH7JtBF2vBE2lSRUiHimhx6yhsSiv9Oc/JFTI
   kwgy3aotBbtBXrU9fI3rUEfB0T7RHORBl5fH3h2gP41R/JjpbemdHKZgh
   Q==;
X-CSE-ConnectionGUID: TPIPHD1QSuOH47M8J2O1RA==
X-CSE-MsgGUID: ES7iNt+XQ3K0s0FmiIa3MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2102489"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2102489"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:47:54 -0700
X-CSE-ConnectionGUID: xp/+FRjtRBK1m+vPmx/iGg==
X-CSE-MsgGUID: TfjHYg9uSj2UnXdMgjiUGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5277303"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2026 01:47:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 170A899; Fri, 30 Oct 2026 09:47:50 +0100 (CET)
Date: Fri, 30 Oct 2026 09:47:50 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Message-ID: <20261030084750.GP158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_014756_027522_01F11F91 
X-CRM114-Status: GOOD (  34.51  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Adding Konrad and Sven because they are also working towards the same goal
to get non-PCIe "platform" hosts supported.

On Fri, Oct 30, 2026 at 04:25:36PM +0800, Chunfeng Yun wrote:
> Add a new file plat.c to register platform NHI driver for MediaTek
> mt8901/mt8992 SoCs.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/thunderbolt/Makefile |   2 +-
>  drivers/thunderbolt/domain.c |  10 ++-
>  drivers/thunderbolt/nhi.c    |   2 +
>  drivers/thunderbolt/nhi.h    |   1 -
>  drivers/thunderbolt/pci.c    |  26 +-----
>  drivers/thunderbolt/plat.c   | 155 +++++++++++++++++++++++++++++++++++

Call it platform.c

>  drivers/thunderbolt/tb.h     |   2 -
>  include/linux/thunderbolt.h  |   1 +
>  8 files changed, 169 insertions(+), 30 deletions(-)
>  create mode 100644 drivers/thunderbolt/plat.c
> 
> diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
> index beb054c3126b..9c941682f3d6 100644
> --- a/drivers/thunderbolt/Makefile
> +++ b/drivers/thunderbolt/Makefile
> @@ -3,7 +3,7 @@ ccflags-y := -I$(src)
>  obj-${CONFIG_USB4} := thunderbolt.o
>  thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
>  thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
> -thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
> +thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o plat.o
>  
>  thunderbolt-${CONFIG_ACPI} += acpi.o
>  thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 24611f05b3cd..bec7e6ebc4a8 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -881,7 +881,7 @@ int tb_domain_unregister_unplugged_xdomains(struct tb *tb)
>  	return ctx.n;
>  }
>  
> -int tb_domain_init(void)
> +static int __init tb_domain_init(void)
>  {
>  	int ret;
>  
> @@ -907,7 +907,7 @@ int tb_domain_init(void)
>  	return ret;
>  }
>  
> -void tb_domain_exit(void)
> +static void __exit tb_domain_exit(void)
>  {
>  	bus_unregister(&tb_bus_type);
>  	ida_destroy(&tb_domain_ida);
> @@ -917,3 +917,9 @@ void tb_domain_exit(void)
>  	tb_debugfs_exit();
>  	tb_configfs_exit();
>  }
> +
> +subsys_initcall(tb_domain_init);
> +module_exit(tb_domain_exit);
> +
> +MODULE_DESCRIPTION("Thunderbolt/USB4 domain driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index e99a3fcc4a29..c0f9f1855e8f 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1379,8 +1379,10 @@ int nhi_probe(struct tb_nhi *nhi)
>  	device_wakeup_enable(dev);
>  
>  	pm_runtime_allow(dev);
> +	device_enable_async_suspend(dev);

Why you add this?

>  	pm_runtime_set_autosuspend_delay(dev, TB_AUTOSUSPEND_DELAY);
>  	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);

and this

>  	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index 88af9ab9fde7..37c11de167ad 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -29,7 +29,6 @@ enum nhi_mailbox_cmd {
>  
>  int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
>  enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
> -void nhi_enable_int_throttling(struct tb_nhi *nhi);
>  void nhi_disable_interrupts(struct tb_nhi *nhi);
>  void nhi_interrupt_work(struct work_struct *work);
>  irqreturn_t nhi_msi(int irq, void *data);
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index 4408229d8ac7..91d236300703 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -715,7 +715,7 @@ static struct pci_device_id nhi_ids[] = {
>  };
>  
>  MODULE_DEVICE_TABLE(pci, nhi_ids);
> -MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
> +MODULE_DESCRIPTION("Thunderbolt/USB4 PCI host interface driver");
>  MODULE_LICENSE("GPL");
>  
>  static struct pci_driver nhi_driver = {
> @@ -727,26 +727,4 @@ static struct pci_driver nhi_driver = {
>  	.driver.pm = &nhi_pm_ops,
>  };
>  
> -static int __init nhi_init(void)
> -{
> -	int ret;
> -
> -	ret = tb_domain_init();
> -	if (ret)
> -		return ret;
> -
> -	ret = pci_register_driver(&nhi_driver);
> -	if (ret)
> -		tb_domain_exit();
> -
> -	return ret;
> -}
> -
> -static void __exit nhi_unload(void)
> -{
> -	pci_unregister_driver(&nhi_driver);
> -	tb_domain_exit();
> -}
> -
> -rootfs_initcall(nhi_init);
> -module_exit(nhi_unload);
> +module_pci_driver(nhi_driver);
> diff --git a/drivers/thunderbolt/plat.c b/drivers/thunderbolt/plat.c
> new file mode 100644
> index 000000000000..85a00cd391d4
> --- /dev/null
> +++ b/drivers/thunderbolt/plat.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Thunderbolt driver - NHI driver (Platform bus specific implementation)
> + *
> + * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/errno.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include "nhi.h"
> +#include "tb.h"
> +
> +static int nhi_plat_init(struct tb_nhi *nhi)

nhi_platform_

> +{
> +	/*
> +	 * avoid device link fail for pcie tunnel
> +	 */

What's this? And the comment style is not the expected.

> +	pm_runtime_set_active(nhi->dev);
> +	pm_runtime_get_noresume(nhi->dev);
> +	devm_pm_runtime_enable(nhi->dev);

This means we never runtime suspend? Then this is not good.

> +
> +	return 0;
> +}
> +
> +static irqreturn_t nhi_plat_isr(int irq, void *data)
> +{
> +	struct tb_nhi *nhi = data;

Did you run checkpatch.pl against this? If not please do.

> +	schedule_work(&nhi->interrupt_work);
> +	return IRQ_HANDLED;
> +}
> +
> +static int nhi_plat_init_irq(struct tb_nhi *nhi)
> +{
> +	int ret;
> +
> +	INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
> +
> +	ret = devm_request_irq(nhi->dev, nhi->irq, nhi_plat_isr, IRQF_NO_SUSPEND,
> +			       dev_name(nhi->dev), nhi);
> +	if (ret)
> +		return dev_err_probe(nhi->dev, ret, "request irq failed\n");
> +
> +	return 0;
> +}
> +
> +static void nhi_plat_exit(struct tb_nhi *nhi)
> +{
> +	devm_free_irq(nhi->dev, nhi->irq, nhi);
> +	flush_work(&nhi->interrupt_work);
> +
> +	pm_runtime_put_noidle(nhi->dev);
> +	pm_runtime_disable(nhi->dev);
> +	pm_runtime_set_suspended(nhi->dev);
> +}
> +
> +static const struct tb_nhi_ops nhi_plat_default_ops = {
> +	.init = nhi_plat_init,
> +	.shutdown = nhi_plat_exit,
> +	.init_interrupts = nhi_plat_init_irq,
> +};
> +
> +static int nhi_plat_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tb_nhi *nhi;
> +
> +	nhi = devm_kzalloc(dev, sizeof(*nhi), GFP_KERNEL);
> +	if (!nhi)
> +		return -ENOMEM;
> +
> +	nhi->dev = dev;
> +	nhi->ops = &nhi_plat_default_ops;
> +
> +	nhi->iobase = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nhi->iobase))
> +		return PTR_ERR(nhi->iobase);
> +
> +	nhi->irq = platform_get_irq(pdev, 0);
> +	if (nhi->irq < 0)
> +		return dev_err_probe(dev, nhi->irq, "get irq failed\n");
> +
> +	return nhi_probe(nhi);
> +}
> +
> +static void nhi_plat_do_remove(struct platform_device *pdev, bool reset)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tb *tb = platform_get_drvdata(pdev);
> +	struct tb_nhi *nhi = tb->nhi;
> +
> +	/*
> +	 * On system shutdown/reboot force a host router reset so the
> +	 * CM asserts DPR on connected tbt3 devices before the router tree
> +	 * is removed (see tb_stop()).
> +	 */
> +	if (reset)
> +		nhi->host_reset = true;
> +
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +
> +	tb_domain_remove(tb);
> +	wait_for_completion(&nhi->domain_released);
> +	nhi_shutdown(nhi);
> +}
> +
> +static void nhi_plat_remove(struct platform_device *pdev)
> +{
> +	nhi_plat_do_remove(pdev, false);
> +}
> +
> +static void nhi_plat_shutdown(struct platform_device *pdev)
> +{
> +	nhi_plat_do_remove(pdev, true);
> +}
> +
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id nhi_plat_of_match[] = {
> +	{ .compatible = "thunderbolt-platform" },

Not sure if this is correct? Should this have mediatek,... ?

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nhi_plat_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id nhi_plat_acpi_match[] = {
> +	{ "ACPI0015", 0 },

Same here, where is this ID defined in the ACPI spec?

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, nhi_plat_acpi_match);
> +#endif
> +
> +static struct platform_driver nhi_plat_driver = {
> +	.probe = nhi_plat_probe,
> +	.remove = nhi_plat_remove,
> +	.shutdown = nhi_plat_shutdown,
> +	.driver = {
> +		.name = "thunderbolt",
> +		.of_match_table = of_match_ptr(nhi_plat_of_match),
> +		.acpi_match_table = ACPI_PTR(nhi_plat_acpi_match),
> +		.pm = &nhi_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(nhi_plat_driver);
> +MODULE_ALIAS("platform:thunderbolt");
> +MODULE_DESCRIPTION("Thunderbolt/USB4 platform host interface driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index e86845762e22..6dfdc47e05d2 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -768,8 +768,6 @@ extern const struct device_type tb_retimer_type;
>  extern const struct device_type tb_switch_type;
>  extern const struct device_type usb4_port_device_type;
>  
> -int tb_domain_init(void);
> -void tb_domain_exit(void);
>  int tb_xdomain_init(void);
>  void tb_xdomain_exit(void);
>  
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 57502da29080..212c8fea6571 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -532,6 +532,7 @@ struct tb_nhi {
>  	u32 *interrupt_mask;
>  	bool going_away;
>  	bool iommu_dma_protection;
> +	int irq;

You are missing kernel-doc.

>  	struct work_struct interrupt_work;
>  	u32 hop_count;
>  	unsigned long quirks;
> -- 
> 2.43.0

