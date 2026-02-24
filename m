Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893CAF3C9A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LR1BoBtjjYjHb3IHoLspkE7ocfv14ii/4mdD4kVdWHo=; b=3uo7jG1qbVrXwQtNZ4Ar8FEhpt
	JEVqCciKgIEnRbgs4SrMUCNujEwKLyCKjblqXUMBfd9odlizlAOU+n43uTfXBeM+GdRGPLT2z4rEE
	K1gAj0t6EhnbQ0hcC0cEVcf9JV7FRqQdiVJjXdhLVws8sEWqXgNQvUe/IJ6XlpWeKW9bu8mDCo0Ul
	b4Zui5FhjqgQPo0hMGDvoMnWf8ec2Kg5P1H1714CvnHwKUTSvFgJ6Imr/JS7mggqUOQ8EC19ZLkrA
	Qsf+BZghV9uHaXd1jbKuloJUYgtBki6l0ISgz4EnJ0gjVvWQSzaD9U4axF5XlJLgXne1yvfvXXNJU
	kgjhiiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuul0-00000002MAp-2MRm;
	Tue, 24 Feb 2026 15:55:30 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuukw-00000002MAD-2hHb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:55:29 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fL2Nh6dWTzJ46ZV;
	Tue, 24 Feb 2026 23:55:00 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id B2B0C40539;
	Tue, 24 Feb 2026 23:55:22 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 15:55:21 +0000
Date: Tue, 24 Feb 2026 15:55:20 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<Dmitry.Lamerov@arm.com>, <catalin.marinas@arm.com>, <bp@alien8.de>,
	<robh@kernel.org>, <rafael@kernel.org>, <will@kernel.org>,
	<conor@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <krzk+dt@kernel.org>, <Michael.Zhao2@arm.com>,
	<tony.luck@intel.com>
Subject: Re: [PATCH v2 11/11] RAS: add DeviceTree firmware-first CPER
 provider
Message-ID: <20260224155520.00004e92@huawei.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-11-347fa2d7351b@arm.com>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
	<20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-11-347fa2d7351b@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_075526_998849_59344477 
X-CRM114-Status: GOOD (  44.40  )
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

On Fri, 20 Feb 2026 13:42:29 +0000
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Add a DeviceTree firmware-first CPER provider that reuses the shared
> GHES helpers, wire it into the RAS Kconfig/Makefile and document it in
> the admin guide. Update MAINTAINERS now that the driver exists.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
Hi Ahmed,

Various comments inline.

Jonathan

> ---
>  Documentation/admin-guide/RAS/main.rst |  18 +++
>  MAINTAINERS                            |   1 +
>  drivers/acpi/apei/apei-internal.h      |  10 +-
>  drivers/acpi/apei/ghes_cper.c          |   2 +
>  drivers/ras/Kconfig                    |  12 ++
>  drivers/ras/Makefile                   |   1 +
>  drivers/ras/esource-dt.c               | 264 +++++++++++++++++++++++++++++++++
>  include/acpi/ghes_cper.h               |   9 ++
>  8 files changed, 308 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/admin-guide/RAS/main.rst b/Documentation/admin-guide/RAS/main.rst
> index 5a45db32c49b..4ffabaaeabb1 100644
> --- a/Documentation/admin-guide/RAS/main.rst
> +++ b/Documentation/admin-guide/RAS/main.rst
> @@ -205,6 +205,24 @@ Architecture (MCA)\ [#f3]_.
>  .. [#f3] For more details about the Machine Check Architecture (MCA),
>    please read Documentation/arch/x86/x86_64/machinecheck.rst at the Kernel tree.
>  
> +Firmware-first CPER via DeviceTree
> +----------------------------------
> +
> +Some systems expose Common Platform Error Record (CPER) data
> +via DeviceTree instead of ACPI HEST tables.

I'd argue this isn't really DT specific, it's just not ACPI table.
You could for instance use PRP0001 and wire this up on ACPI with only
one trivial change to generic property.h accessor for the boolean.

Or use another firmware information source entirely.

> +Enable ``CONFIG_RAS_ESOURCE_DT`` to build the ``drivers/ras/esource-dt.c``
> +driver and describe the CPER error source buffer with the
> +``Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml`` binding.
> +The driver reuses the GHES CPER helper object in
> +``drivers/acpi/apei/ghes_cper.c`` so the logging, notifier chains, and
> +memory failure handling match the ACPI GHES behaviour even when
> +ACPI is disabled.
> +
> +Once a platform describes a firmware-first provider, both ACPI GHES and the
> +DeviceTree driver reuse the same code paths. This keeps the behaviour
> +consistent regardless of whether the error source is described via ACPI
> +tables or DeviceTree.

> diff --git a/drivers/ras/Kconfig b/drivers/ras/Kconfig
> index fc4f4bb94a4c..ea6d96713020 100644
> --- a/drivers/ras/Kconfig
> +++ b/drivers/ras/Kconfig
> @@ -34,6 +34,18 @@ if RAS
>  source "arch/x86/ras/Kconfig"
>  source "drivers/ras/amd/atl/Kconfig"
>  
> +config RAS_ESOURCE_DT
> +	bool "DeviceTree firmware-first CPER error source block provider"
It isn't really DT specific other than one call that I've suggested you
replace with a generic firmware accessor.

> +	depends on OF

Generally we don't gate on OF unless there are OF specific calls. Here there
aren't so you are just reducing build coverage. || COMPILE_TEST 
maybe.

> +	depends on ARM64

Likewise, nothing in here is arm64 specific that I can spot.

> +	select GHES_CPER_HELPERS
> +	help
> +	  Enable support for firmware-first Common Platform Error Record (CPER)
> +	  error source block providers that are described via DeviceTree
> +	  instead of ACPI HEST tables. The driver reuses the existing GHES
> +	  CPER helpers so the error processing matches the ACPI code paths,
> +	  but it can be built even when ACPI is disabled.
> +

> diff --git a/drivers/ras/esource-dt.c b/drivers/ras/esource-dt.c
> new file mode 100644
> index 000000000000..b575a2258536
> --- /dev/null
> +++ b/drivers/ras/esource-dt.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DeviceTree provider for firmware-first CPER error source block.
> + *
> + * This driver shares the GHES CPER helpers so we keep the reporting and
> + * notifier behaviour identical to ACPI GHES
> + *
> + * Copyright (C) 2025 ARM Ltd.
> + * Author: Ahmed Tiba <ahmed.tiba@arm.com>
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
Used?
> +#include <linux/module.h>
mod_devicetable.h for of_device_id definition.

> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
Generally very little reason to include these.  Not sure why you need
them here.

> +#include <linux/panic.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <acpi/ghes.h>
> +#include <acpi/ghes_cper.h>
> +
> +static atomic_t ghes_ffh_source_ids = ATOMIC_INIT(0);
I'd normally expect an IDA or similar. If nothing else it clearly
indicates we only want a unique ID.
> +
> +struct ghes_ffh_ack {
> +	void __iomem *addr;
> +	u64 preserve;
> +	u64 set;
> +	u8 width;
> +	bool present;
> +};
> +
> +struct ghes_ffh {
> +	struct device *dev;
> +	void __iomem *status;
> +	size_t status_len;
> +
> +	struct ghes_ffh_ack ack;
> +
> +	struct acpi_hest_generic *generic;
> +	struct acpi_hest_generic_status *estatus;
> +
> +	bool sync;
> +	int irq;
> +
> +	/* Serializes access to the firmware-owned buffer. */
If we are serializing it, in what sense is it owned by the firmware?

> +	spinlock_t lock;
> +};


> +
> +static void ghes_ffh_process(struct ghes_ffh *ctx)
> +{
> +	unsigned long flags;
> +	int sev;
> +
> +	spin_lock_irqsave(&ctx->lock, flags);

guard() + include cleanup.h. Then can do returns in error paths.

> +
> +	if (ghes_ffh_copy_status(ctx))
> +		goto out;
Like here to give simpler lfow.


> +
> +	sev = ghes_severity(ctx->estatus->error_severity);
> +	if (sev >= GHES_SEV_PANIC)
> +		ghes_ffh_fatal(ctx);
> +
> +	if (!ghes_estatus_cached(ctx->estatus)) {
> +		if (ghes_print_estatus(NULL, ctx->generic, ctx->estatus))

Combine the two if statements with &&

> +			ghes_estatus_cache_add(ctx->generic, ctx->estatus);
> +	}
> +
> +	ghes_cper_handle_status(ctx->dev, ctx->generic, ctx->estatus, ctx->sync);
> +
> +	ghes_ffh_ack(ctx);
> +
> +out:
> +	spin_unlock_irqrestore(&ctx->lock, flags);
> +}
> +
> +static irqreturn_t ghes_ffh_irq(int irq, void *data)
> +{
> +	struct ghes_ffh *ctx = data;
> +
> +	ghes_ffh_process(ctx);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ghes_ffh_init_ack(struct platform_device *pdev,
> +			     struct ghes_ffh *ctx)
> +{
> +	struct resource *res;
> +	size_t size;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return 0;
> +
> +	ctx->ack.addr = devm_ioremap_resource(&pdev->dev, res);
Why not devm_platform_get_and_ioremap_resource()?

> +	if (IS_ERR(ctx->ack.addr))
> +		return PTR_ERR(ctx->ack.addr);
> +
> +	size = resource_size(res);
> +	switch (size) {
> +	case 4:
> +		ctx->ack.width = 32;
> +		ctx->ack.preserve = ~0U;
> +		break;
> +	case 8:
> +		ctx->ack.width = 64;
> +		ctx->ack.preserve = ~0ULL;
> +		break;
> +	default:
> +		dev_err(&pdev->dev, "Unsupported ack resource size %zu\n", size);
> +		return -EINVAL;
> +	}
> +
> +	ctx->ack.set = BIT_ULL(0);
> +	ctx->ack.present = true;
> +	return 0;
> +}
> +
> +static int ghes_ffh_probe(struct platform_device *pdev)

Consider using a 
	struct device *dev = &pdev->dev;
given there is only one device around and it will shorten a bunch of
lines a little.

> +{
> +	struct ghes_ffh *ctx;
> +	struct resource *res;
> +	int rc;
> +
> +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&ctx->lock);
> +	ctx->dev = &pdev->dev;
> +	ctx->sync = of_property_read_bool(pdev->dev.of_node, "arm,sea-notify");
Hmm. I'd allow for other firmware types with
	device_property_read_bool() instead.

> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "status region missing\n");
In probe you can always use dev_err_probe. It pretty prints the return value etc and
saves lines of code.
		return dev_err_probe(&pdev->dev, -EINVAL, "status region missing\n");

Don't worry about slightly long line.

> +		return -EINVAL;
> +	}
> +
> +	ctx->status_len = resource_size(res);
> +	if (!ctx->status_len) {
> +		dev_err(&pdev->dev, "Status region has zero length\n");
As above, use dev_err_probe()

> +		return -EINVAL;
> +	}
> +
> +	ctx->status = devm_ioremap_resource(&pdev->dev, res);
I'd be tempted to use devm_platform_get_and_ioremap_resource() and just
not worry about mapping and unmapping that will unnecessarily occur in the
case of error.

> +	if (IS_ERR(ctx->status))
> +		return PTR_ERR(ctx->status);
> +
> +	rc = ghes_ffh_init_ack(pdev, ctx);
> +	if (rc)
> +		return rc;
> +
> +	rc = ghes_ffh_init_pool();
> +	if (rc)
> +		return rc;
> +
> +	ctx->estatus = devm_kzalloc(&pdev->dev, ctx->status_len, GFP_KERNEL);
> +	if (!ctx->estatus)
> +		return -ENOMEM;
> +
> +	ctx->generic = devm_kzalloc(&pdev->dev, sizeof(*ctx->generic), GFP_KERNEL);
> +	if (!ctx->generic)
> +		return -ENOMEM;
> +
> +	ctx->generic->header.type = ACPI_HEST_TYPE_GENERIC_ERROR;
> +	ctx->generic->header.source_id =
> +		atomic_inc_return(&ghes_ffh_source_ids);
> +	ctx->generic->notify.type = ctx->sync ?
> +		ACPI_HEST_NOTIFY_SEA : ACPI_HEST_NOTIFY_EXTERNAL;
> +	ctx->generic->error_block_length = ctx->status_len;
> +
> +	ctx->irq = platform_get_irq_optional(pdev, 0);
> +	if (ctx->irq <= 0) {
> +		if (ctx->irq == -EPROBE_DEFER)
> +			return ctx->irq;
> +		dev_err(&pdev->dev, "interrupt is required (%d)\n", ctx->irq);
If it's required, why call get_irq_optional?
That only serves to suppress the error message inside the call.  Use
the non optional version and drop this.

> +		return -EINVAL;
> +	}
> +
> +	rc = devm_request_threaded_irq(&pdev->dev, ctx->irq,
> +				       NULL, ghes_ffh_irq,
> +				       IRQF_ONESHOT,
> +				       dev_name(&pdev->dev), ctx);
> +	if (rc)
> +		return rc;
> +
> +	platform_set_drvdata(pdev, ctx);

I can't immediately spot where this is used.  If it isn't don't set it as that
will mislead people into thinking it's needed.

> +	dev_info(&pdev->dev, "Firmware-first CPER status provider (interrupt)\n");

Krysztof already commented on this one.

> +	return 0;
> +}
> +
> +static void ghes_ffh_remove(struct platform_device *pdev)
> +{

If nothing to do, platform drivers don't need a remove so get rid of it.

> +}
> +
> +static const struct of_device_id ghes_ffh_of_match[] = {
> +	{ .compatible = "arm,ras-ffh" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ghes_ffh_of_match);
> +
> +static struct platform_driver ghes_ffh_driver = {
> +	.driver = {
> +		.name = "esource-dt",
> +		.of_match_table = ghes_ffh_of_match,
> +	},
> +	.probe = ghes_ffh_probe,
> +	.remove = ghes_ffh_remove,
> +};
> +
Common convention is keep this tightly coupled with the
struct platform_driver but not having a blank line here.

> +module_platform_driver(ghes_ffh_driver);
> +
> +MODULE_AUTHOR("Ahmed Tiba <ahmed.tiba@arm.com>");
> +MODULE_DESCRIPTION("Firmware-first CPER provider for DeviceTree platforms");
> +MODULE_LICENSE("GPL");



