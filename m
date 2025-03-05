Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39D1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfhzBbez+6C+XPVfLefMYF3JdICUiUQBoKZk0UC0llA=; b=f5CPP/T+fl0qmvCDcyybiDFDgz
	zEYVfDEUeppBfnak1Nb6dI2IhwZFi6MJTlnBjY88JMASm2BFuGbaRnK8vQ2miA4GkWITd/wGZIQ96
	XSLQSoxFVPT75iYUsJ/ebnG/0HExNG6pTqijSjwhvcH1AUc1PsA9zQx6kUPk5Gd1isPdnNzuUTX5c
	u2Nch2AKhP3gnfK67Ymqm+PnyH8Z42KGoZ0vF+LFNiL42cJ4INtz7mXk6G/CFZXjvg0sGuyjTRvJj
	JTBmR/PZnTGwqdc1Hv82NftP/QMsEgcvc/CBsWN0Kkdw+bxzGKS749eMYVMbJeJekF1k/tDAqbXRz
	E+THar3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprgl-00000008gBj-0c5N;
	Wed, 05 Mar 2025 16:33:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqXn-00000008VS6-1rgU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 15:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XfhzBbez+6C+XPVfLefMYF3JdICUiUQBoKZk0UC0llA=; b=Sq8dH3Ieo3L9ulXus4wYKDSTd8
	qo9aZYHlsNo/rKYvwj0jm/koCPwbB2ZZfbLk8Uiia3cQeoMwW4fiWqaOemiUDFZADpc+6WATT+Fca
	Ne8vFLK02LJN88bb8ipeCIprJ9csjO7f8u/kffgnZx60YHSPvKUxCFY7PRvzktjmu879oBV3IUd5E
	mKmNfqYl5oXqfScyjCZ/SuHlZoqU6jzhuhiTa28VGhxnA0ytMVu+WXCHv7jhqxtMDSAC5lbJs/gCK
	9AkIuqxPAJqMGD9caQFaxTkMxGAr2D8xXlEhL9meTo8byj8WvyOwoTfHq/u0WXfrvgtR8Jr2lITXb
	mzfur6jA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqXi-00000000baQ-3bpp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 15:20:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39BFFFEC;
	Wed,  5 Mar 2025 07:20:28 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 852853F673;
	Wed,  5 Mar 2025 07:20:14 -0800 (PST)
Date: Wed, 5 Mar 2025 15:20:09 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] coresight: Add a KUnit test for
 coresight_find_default_sink()
Message-ID: <20250305152009.GH13418@e132581.arm.com>
References: <20250305-james-cs-kunit-test-v2-1-83ba682b976c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-james-cs-kunit-test-v2-1-83ba682b976c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_152019_758998_E2291A9A 
X-CRM114-Status: GOOD (  29.84  )
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

On Wed, Mar 05, 2025 at 03:07:19PM +0000, James Clark wrote:
> Add a test to confirm that default sink selection skips over an ETF
> and returns an ETR even if it's further away.
> 
> This also makes it easier to add new unit tests in the future.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
> Changes in v2:
> - Let devm free everything rather than doing individual kfrees:
>   "Like with managed drivers, KUnit-managed fake devices are
>   automatically cleaned up when the test finishes, but can be manually
>   cleaned up early with kunit_device_unregister()."
> - Link to v1: https://lore.kernel.org/r/20250225164639.522741-1-james.clark@linaro.org
> ---
>  drivers/hwtracing/coresight/Kconfig                |  9 +++
>  drivers/hwtracing/coresight/Makefile               |  3 +-
>  drivers/hwtracing/coresight/coresight-core.c       |  1 +
>  .../hwtracing/coresight/coresight-kunit-tests.c    | 77 ++++++++++++++++++++++
>  4 files changed, 88 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index ecd7086a5b83..f064e3d172b3 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -259,4 +259,13 @@ config CORESIGHT_DUMMY
>  
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called coresight-dummy.
> +
> +config CORESIGHT_KUNIT_TESTS
> +	  tristate "Enable Coresight unit tests"
> +	  depends on KUNIT
> +	  default KUNIT_ALL_TESTS
> +	  help
> +	    Enable Coresight unit tests. Only useful for development and not
> +	    intended for production.
> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 8e62c3150aeb..96f0dfedb1bf 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -51,5 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>  		   coresight-cti-sysfs.o
>  obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>  obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
> -obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
> -coresight-ctcu-y := coresight-ctcu-core.o
> +obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index bd0a7edd38c9..b101aa133ceb 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -959,6 +959,7 @@ coresight_find_default_sink(struct coresight_device *csdev)
>  	}
>  	return csdev->def_sink;
>  }
> +EXPORT_SYMBOL_GPL(coresight_find_default_sink);
>  
>  static int coresight_remove_sink_ref(struct device *dev, void *data)
>  {
> diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/drivers/hwtracing/coresight/coresight-kunit-tests.c
> new file mode 100644
> index 000000000000..a136af05eaf4
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <kunit/test.h>
> +#include <kunit/device.h>
> +#include <linux/coresight.h>
> +
> +#include "coresight-priv.h"
> +
> +static struct coresight_device *coresight_test_device(struct device *dev)
> +{
> +	struct coresight_device *csdev = devm_kcalloc(dev, 1,
> +						     sizeof(struct coresight_device),
> +						     GFP_KERNEL);
> +	csdev->pdata = devm_kcalloc(dev, 1,
> +				   sizeof(struct coresight_platform_data),
> +				   GFP_KERNEL);
> +	return csdev;
> +}
> +
> +static int coresight_test_cpuid(struct coresight_device *csdev)
> +{
> +	return 0;
> +}
> +
> +static void test_default_sink(struct kunit *test)
> +{
> +	/*
> +	 * ETM -> ETF -> ETR -> CATU
> +	 *                ^
> +	 *                | default
> +	 */
> +	struct device *dev = kunit_device_register(test, "coresight_kunit");
> +	struct coresight_device *etm = coresight_test_device(dev),
> +				*etf = coresight_test_device(dev),
> +				*etr = coresight_test_device(dev),
> +				*catu = coresight_test_device(dev);
> +	struct coresight_connection conn = {};
> +	struct coresight_ops_source src_ops = {.cpu_id = coresight_test_cpuid };
> +	struct coresight_ops etm_cs_ops = { .source_ops	= &src_ops };
> +
> +	etm->type = CORESIGHT_DEV_TYPE_SOURCE;
> +	etm->ops = &etm_cs_ops;
> +	etf->type = CORESIGHT_DEV_TYPE_LINKSINK;
> +	etf->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
> +	etr->type = CORESIGHT_DEV_TYPE_SINK;
> +	etr->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
> +	catu->type = CORESIGHT_DEV_TYPE_HELPER;
> +
> +	conn.src_dev = etm;
> +	conn.dest_dev = etf;
> +	coresight_add_out_conn(dev, etm->pdata, &conn);
> +
> +	conn.src_dev = etf;
> +	conn.dest_dev = etr;
> +	coresight_add_out_conn(dev, etf->pdata, &conn);
> +
> +	conn.src_dev = etr;
> +	conn.dest_dev = catu;
> +	coresight_add_out_conn(dev, etr->pdata, &conn);
> +
> +	KUNIT_ASSERT_PTR_EQ(test, coresight_find_default_sink(etm), etr);
> +}
> +
> +static struct kunit_case coresight_testcases[] = {
> +	KUNIT_CASE(test_default_sink),
> +	{}
> +};
> +
> +static struct kunit_suite coresight_test_suite = {
> +	.name = "coresight_test_suite",
> +	.test_cases = coresight_testcases,
> +};
> +
> +kunit_test_suites(&coresight_test_suite);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("James Clark <james.clark@linaro.org>");
> +MODULE_DESCRIPTION("Arm CoreSight KUnit tests");
> 
> ---
> base-commit: eeafe6a8790ea125252ca2e23c1a2469eaff1d9a
> change-id: 20250305-james-cs-kunit-test-3af1df2401e6
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>
> 

