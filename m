Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9038ACAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 02:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujLHZ6eXkFngEex8D0oHiwsVLu9bhDh8My+/eUW9B3c=; b=YMmDtZfpb5xP7axCxUpclSAAON
	9Cjwu7FfZWrV3cvoru9O3IqytnxPNB/U6aU7QkrmPOUjp0C60A0o6joxkoDlqMTA4e0NnhwH0HeZi
	Eeb3QlSVOTDpmlK+C1mTDDGcYWnCGS94psTce/9C2dmp0NpCF0N3yOW+twcR408NAZQ/z+/g4oltH
	CF9Jb8GW0YUa3uyRGjEjTFfnbHbvPi8wHWK5ukrkBdgXctOgxWLPJcU7No4k/Y4itS4+Iv2IBG9xn
	rb7aDjiFdXrGjp5+1zM3vvDtCjj9sgMbBB4AJPF25KzgFaF/p8RPU59ScVN+ZAKDUtPYdtmeHgi36
	I5vmX4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Kwk-00000006SVu-1m4A;
	Sat, 27 Sep 2025 02:46:02 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Kwg-00000006SRw-1flV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 02:46:00 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cYWvB0Z76z24j75;
	Sat, 27 Sep 2025 10:42:14 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 118571A016C;
	Sat, 27 Sep 2025 10:45:51 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 27 Sep 2025 10:45:50 +0800
Subject: Re: [PATCH v3] ACPI: AGDI: Add interrupt signaling mode support
To: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Ilkka Koskinen <ilkka@os.amperecomputing.com>
References: <20250905042751.945616-1-fj1078ii@aa.jp.fujitsu.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <b7c5709f-ee69-3f55-4c37-60ca466e94c8@huawei.com>
Date: Sat, 27 Sep 2025 10:45:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20250905042751.945616-1-fj1078ii@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_194558_829188_2DC1880F 
X-CRM114-Status: GOOD (  33.32  )
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

Hi Kazuhiro,

Sorry for the late reply, some comments below.

On 2025/9/5 12:27, Kazuhiro Abe wrote:
> AGDI has two types of signaling modes: SDEI and interrupt.
> Currently, the AGDI driver only supports SDEI.
> Therefore, add support for interrupt signaling mode
> The interrupt vector is retrieved from the AGDI table, and call panic
> function when an interrupt occurs.
> 
> Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
> ---
> I keep normal IRQ code when NMI cannot be used.
> If there is any concern, please let me know.
> 
> v2->v3
>   - Fix bug in the return value of agdi_probe function.
>   - Remove unnecessary curly braces in the agdi_remove function.
> 
> v2: https://lore.kernel.org/all/20250829101154.2377800-1-fj1078ii@aa.jp.fujitsu.com/
> v1->v2
>   - Remove acpica update since there is no need to update define value
>     for this patch.
> ---
>   drivers/acpi/arm64/agdi.c | 95 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 88 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/agdi.c b/drivers/acpi/arm64/agdi.c
> index e0df3daa4abf..2313a46f01cd 100644
> --- a/drivers/acpi/arm64/agdi.c
> +++ b/drivers/acpi/arm64/agdi.c
> @@ -16,7 +16,11 @@
>   #include "init.h"
>   
>   struct agdi_data {
> +	unsigned char flags;

Adding a comment here for what's the falgs used for,
multi flags in this file such as irq_flags, just
make the code easy to understand.

>   	int sdei_event;
> +	unsigned int gsiv;
> +	bool use_nmi;
> +	int irq;
>   };
>   
>   static int agdi_sdei_handler(u32 sdei_event, struct pt_regs *regs, void *arg)
> @@ -48,6 +52,55 @@ static int agdi_sdei_probe(struct platform_device *pdev,
>   	return 0;
>   }
>   
> +static irqreturn_t agdi_interrupt_handler_nmi(int irq, void *dev_id)
> +{
> +	nmi_panic(NULL, "Arm Generic Diagnostic Dump and Reset NMI Interrupt event issued\n");
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t agdi_interrupt_handler_irq(int irq, void *dev_id)
> +{
> +	panic("Arm Generic Diagnostic Dump and Reset Interrupt event issued\n");
> +	return IRQ_HANDLED;
> +}
> +
> +static int agdi_interrupt_probe(struct platform_device *pdev,
> +				struct agdi_data *adata)
> +{
> +	unsigned long irq_flags;
> +	int ret;
> +	int irq;
> +
> +	irq = acpi_register_gsi(NULL, adata->gsiv, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_HIGH);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "cannot register GSI#%d (%d)\n", adata->gsiv, irq);
> +		return irq;
> +	}
> +
> +	irq_flags = IRQF_PERCPU | IRQF_NOBALANCING | IRQF_NO_AUTOEN |
> +		    IRQF_NO_THREAD;
> +	/* try NMI first */
> +	ret = request_nmi(irq, &agdi_interrupt_handler_nmi, irq_flags,
> +			  "agdi_interrupt_nmi", NULL);
> +	if (ret) {
> +		ret = request_irq(irq, &agdi_interrupt_handler_irq,
> +				  irq_flags, "agdi_interrupt_irq", NULL);
> +		if (ret) {
> +			dev_err(&pdev->dev, "cannot register IRQ %d\n", ret);
> +			acpi_unregister_gsi(adata->gsiv);
> +			return ret;
> +		}
> +		enable_irq(irq);
> +		adata->irq = irq;
> +	} else {
> +		enable_nmi(irq);
> +		adata->irq = irq;
> +		adata->use_nmi = true;
> +	}

if (!ret) {
	/* NMI handling code */
}

/* Then try normal interrupt */
ret = request_irq();
...

This makes code better organized.

> +
> +	return 0;
> +}
> +
>   static int agdi_probe(struct platform_device *pdev)
>   {
>   	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
> @@ -55,12 +108,15 @@ static int agdi_probe(struct platform_device *pdev)
>   	if (!adata)
>   		return -EINVAL;
>   
> -	return agdi_sdei_probe(pdev, adata);
> +	if (adata->flags & ACPI_AGDI_SIGNALING_MODE)
> +		return agdi_interrupt_probe(pdev, adata);
> +	else
> +		return agdi_sdei_probe(pdev, adata);
>   }
>   
> -static void agdi_remove(struct platform_device *pdev)
> +static void agdi_sdei_remove(struct platform_device *pdev,
> +			     struct agdi_data *adata)
>   {
> -	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
>   	int err, i;
>   
>   	err = sdei_event_disable(adata->sdei_event);
> @@ -83,6 +139,29 @@ static void agdi_remove(struct platform_device *pdev)
>   			adata->sdei_event, ERR_PTR(err));
>   }
>   
> +static void agdi_interrupt_remove(struct platform_device *pdev,
> +				  struct agdi_data *adata)
> +{
> +	if (adata->irq != -1) {
> +		if (adata->use_nmi)
> +			free_nmi(adata->irq, NULL);
> +		else
> +			free_irq(adata->irq, NULL);
> +
> +		acpi_unregister_gsi(adata->gsiv);
> +	}

if (adata->irq == -1)
	return;

...

To save extra { }.

> +}
> +
> +static void agdi_remove(struct platform_device *pdev)
> +{
> +	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
> +
> +	if (adata->flags & ACPI_AGDI_SIGNALING_MODE)
> +		agdi_interrupt_remove(pdev, adata);
> +	else
> +		agdi_sdei_remove(pdev, adata);
> +}
> +
>   static struct platform_driver agdi_driver = {
>   	.driver = {
>   		.name = "agdi",
> @@ -94,7 +173,7 @@ static struct platform_driver agdi_driver = {
>   void __init acpi_agdi_init(void)
>   {
>   	struct acpi_table_agdi *agdi_table;
> -	struct agdi_data pdata;
> +	struct agdi_data pdata = {0};

struct agdi_data pdata = { 0 };

Thanks
Hanjun

