Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD4DC282E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5j1fWnJ2XM0wQewm+FudRcS3T2IzA8xXUy8Rt+N1S4=; b=pmOeIaUQUPlqm/gXBvqPleKEI7
	nGDiXb5DtPtD31kxgsCxd202IOg1/GlNgl0Tc9EMoHdcsyQb9ahZGf3LzW9fPmiZZ0ydSWqYUay2v
	l1vZD27GxZsH1AA8EcTkEvVFLnvh+j7JCLf36xn89HFLPi5qco3Ob0quK5/iNrPph1N/Sfd1r817A
	yRTOVmKMiY5m8xYjsSkLv+7PzkgigWOIdckNDetZateWPBhw9S5jKBr6iDmu3W7lVffiqN2IBn7hr
	iAht/Z95mlryPRzxzXb9UkBQLxPDnJFnmbHLPVrHNU0MllJxBSIKLUhCpJqBQ7wVeL+Bnd8avxa41
	ZQATox0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnoU-000000080xu-0beL;
	Wed, 05 Mar 2025 12:25:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn8r-00000007tjA-3Bck
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 11:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p5j1fWnJ2XM0wQewm+FudRcS3T2IzA8xXUy8Rt+N1S4=; b=rcgJd/L0DM4oIB6I0XRD/7MqQB
	HCguknv9qQBZEzn/pca5IKDJvkvRgm4oeF+sFSy2j9QJrn4cx+URxrt/sWmWlVJYW0n6aZgHbtLg/
	JyZPi1X4qQqJz36ikwNF5z7xyYSY9oG4v+YfSX/w7fexTZrRsCn6axBLrHyYp4MTZjlV92m5ZsBWB
	4f1n1hkRbX91Wgd3iW+GsxMxWDzC4RxLRiQpAgNysfEFLFOM4EBqRUl68olPNWLuUpR18B+YpRQug
	CzlLqEFvJ4hf9o+lclR55kia3m/hoSLEn+50WAN/xZvPbOdII4WXmfBLInkQotP4woZmEgxq2mi+m
	winxLFjw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn8o-00000000VHK-0MCH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:42:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70FE0FEC;
	Wed,  5 Mar 2025 03:42:29 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D36D3F673;
	Wed,  5 Mar 2025 03:42:15 -0800 (PST)
Date: Wed, 5 Mar 2025 11:42:11 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, scclevenger@os.amperecomputing.com,
	yeoreum.yun@arm.com, Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: Add a KUnit test for
 coresight_find_default_sink()
Message-ID: <20250305114211.GG13418@e132581.arm.com>
References: <20241217171132.834943-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217171132.834943-1-james.clark@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_114222_509661_FE7C69C0 
X-CRM114-Status: GOOD (  30.96  )
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

On Tue, Dec 17, 2024 at 05:11:31PM +0000, James Clark wrote:
> 
> Add a test to confirm that default sink selection skips over an ETF
> and returns an ETR even if it's further away.
> 
> This also makes it easier to add new unit tests in the future.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/Kconfig           |  9 ++
>  drivers/hwtracing/coresight/Makefile          |  1 +
>  drivers/hwtracing/coresight/coresight-core.c  |  1 +
>  .../coresight/coresight-kunit-tests.c         | 90 +++++++++++++++++++
>  4 files changed, 101 insertions(+)
>  create mode 100644 drivers/hwtracing/coresight/coresight-kunit-tests.c
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 06f0a7594169..056d04bc540a 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -247,4 +247,13 @@ config CORESIGHT_DUMMY
> 
>           To compile this driver as a module, choose M here: the module will be
>           called coresight-dummy.
> +
> +config CORESIGHT_KUNIT_TESTS
> +         tristate "Enable Coresight unit tests"
> +         depends on KUNIT
> +         default KUNIT_ALL_TESTS
> +         help
> +           Enable Coresight unit tests. Only useful for development and not
> +           intended for production.
> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..c170a41b3056 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o       coresight-cti-platform.o \
>                    coresight-cti-sysfs.o
>  obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>  obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
> +obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index ea38ecf26fcb..ce63b68d5503 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -869,6 +869,7 @@ coresight_find_default_sink(struct coresight_device *csdev)
>         }
>         return csdev->def_sink;
>  }
> +EXPORT_SYMBOL_GPL(coresight_find_default_sink);
> 
>  static int coresight_remove_sink_ref(struct device *dev, void *data)
>  {
> diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/drivers/hwtracing/coresight/coresight-kunit-tests.c
> new file mode 100644
> index 000000000000..d022bacc8357
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
> @@ -0,0 +1,90 @@
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
> +       struct coresight_device *csdev = devm_kcalloc(dev, 1,
> +                                                    sizeof(struct coresight_device),
> +                                                    GFP_KERNEL);
> +       csdev->pdata = devm_kcalloc(dev, 1,
> +                                  sizeof(struct coresight_platform_data),
> +                                  GFP_KERNEL);
> +       return csdev;
> +}
> +
> +static void coresight_free_test_device(struct device *dev,
> +                                      struct coresight_device *csdev)
> +{
> +       devm_kfree(dev, csdev->pdata->out_conns);

It will lead memory leaking if we don't release connections pointed by
'out_conns' pointer array.  Something like:

          for (i = 0; i < csdev->pdata->nr_outconns; i++)
               devm_kfree(dev, csdev->pdata->out_conns[i]);
          devm_kfree(dev, csdev->pdata->out_conns);

Otherwise, it looks good to me.

Thanks,
Leo

> +       devm_kfree(dev, csdev->pdata);
> +       devm_kfree(dev, csdev);
> +}
> +
> +static int coresight_test_cpuid(struct coresight_device *csdev)
> +{
> +       return 0;
> +}
> +
> +static void test_default_sink(struct kunit *test)
> +{
> +       /*
> +        * ETM -> ETF -> ETR -> CATU
> +        *                ^
> +        *                | default
> +        */
> +       struct device *dev = kunit_device_register(test, "coresight_kunit");
> +       struct coresight_device *etm = coresight_test_device(dev),
> +                               *etf = coresight_test_device(dev),
> +                               *etr = coresight_test_device(dev),
> +                               *catu = coresight_test_device(dev);
> +       struct coresight_connection conn = {};
> +       struct coresight_ops_source src_ops = {.cpu_id = coresight_test_cpuid };
> +       struct coresight_ops etm_cs_ops = { .source_ops = &src_ops };
> +
> +       etm->type = CORESIGHT_DEV_TYPE_SOURCE;
> +       etm->ops = &etm_cs_ops;
> +       etf->type = CORESIGHT_DEV_TYPE_LINKSINK;
> +       etf->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
> +       etr->type = CORESIGHT_DEV_TYPE_SINK;
> +       etr->subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
> +       catu->type = CORESIGHT_DEV_TYPE_HELPER;
> +
> +       conn.src_dev = etm;
> +       conn.dest_dev = etf;
> +       coresight_add_out_conn(dev, etm->pdata, &conn);
> +
> +       conn.src_dev = etf;
> +       conn.dest_dev = etr;
> +       coresight_add_out_conn(dev, etf->pdata, &conn);
> +
> +       conn.src_dev = etr;
> +       conn.dest_dev = catu;
> +       coresight_add_out_conn(dev, etr->pdata, &conn);
> +
> +       KUNIT_ASSERT_PTR_EQ(test, coresight_find_default_sink(etm), etr);
> +
> +       coresight_free_test_device(dev, etm);
> +       coresight_free_test_device(dev, etf);
> +       coresight_free_test_device(dev, etr);
> +       coresight_free_test_device(dev, catu);
> +}
> +
> +static struct kunit_case coresight_testcases[] = {
> +       KUNIT_CASE(test_default_sink),
> +       {}
> +};
> +
> +static struct kunit_suite coresight_test_suite = {
> +       .name = "coresight_test_suite",
> +       .test_cases = coresight_testcases,
> +};
> +
> +kunit_test_suites(&coresight_test_suite);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("James Clark <james.clark@linaro.org>");
> +MODULE_DESCRIPTION("Arm CoreSight KUnit tests");
> --
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

