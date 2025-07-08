Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D235BC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuFzs3wV9/aUJXvIhAeRiLMm1B0NlfPM41WQQ1CC340=; b=j0nfNNiQVxdev/qsjy9cCG07xq
	SxcYf7UdP/+Vot/QLgTomT0BkXP9kQM/YPw/9EJ7DCOKQno7IE2m+RS/hB5UEsV6XIIDnfhftPR3l
	U2ALmhc3CygHjqIo0eI8vcIrQm8HYzc4GDEtgoetF8C/Zqxx3a4Cu8lgSE4TLj6DNiJoaxearOGj+
	aB9ibP/nUIERuk9p1aNH8JkF0IPY4fEFfvluubxLThdlEddpcC6eF1gBcclhFn2Aq4/QjUlFlyAoP
	T3ZwCxb/a11HvCRAIQjPW3//PwdKZJl7qoLFc2e6D72XGEvEm3yZCDP4wunOPPA+Jn5nWUqfEbU7y
	8SzBMeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4ew-00000004tlQ-2cLl;
	Tue, 08 Jul 2025 09:30:42 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ427-00000004nZJ-1Duh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:50:37 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bbvWt1LYQz9sfF;
	Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoqHkokhU4QF; Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bbvWt0c9qz9sXD;
	Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EC098B76C;
	Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id s3ivdJfLK1Dw; Tue,  8 Jul 2025 10:33:29 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D09838B763;
	Tue,  8 Jul 2025 10:33:29 +0200 (CEST)
Message-ID: <907f875e-5ed0-4eca-b285-ebb7e47137ce@csgroup.eu>
Date: Tue, 8 Jul 2025 10:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Qiang Zhao <qiang.zhao@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250611104348.192092-19-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_015035_497000_12BC6B33 
X-CRM114-Status: GOOD (  19.56  )
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

Hi,

Le 11/06/2025 à 12:43, Jiri Slaby (SUSE) a écrit :
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org

There must be something wrong with this patch. b4 shazam applies a 
different patch.

$ b4 shazam -l -s --single-message --no-parent 
20250611104348.192092-19-jirislaby@kernel.org
Single-message mode, ignoring any follow-ups
Grabbing thread from 
lore.kernel.org/all/20250611104348.192092-19-jirislaby@kernel.org/t.mbox.gz
Breaking thread to remove parents of 
20250611104348.192092-19-jirislaby@kernel.org
Checking for newer revisions
Grabbing search results from lore.kernel.org
   Added from v2: 1 patches
Analyzing 25 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 22 code-review messages
Will use the latest revision: v2
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
     + Reviewed-by: David Lechner <dlechner@baylibre.com> (✗ 
DKIM/baylibre-com.20230601.gappssmtp.com)
     + Link: 
https://lore.kernel.org/r/20250612084627.217341-1-jirislaby@kernel.org
     + Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
   ---
   ✓ Signed: DKIM/kernel.org
---
Total patches: 1
---
Application de  iio: adc: stm32-adc: Use dev_fwnode()

You must have posted another patch with the same message ID. I had to 
apply it manually.

Christophe

> 
> ---
> Cc: linux-tegra@vger.kernel.org
> ---
>   drivers/soc/fsl/qe/qe_ic.c | 3 +--
>   drivers/soc/tegra/pmc.c    | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 4068b501a3a3..943911053af6 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -407,7 +407,6 @@ static int qe_ic_init(struct platform_device *pdev)
>   	void (*high_handler)(struct irq_desc *desc);
>   	struct qe_ic *qe_ic;
>   	struct resource *res;
> -	struct device_node *node = pdev->dev.of_node;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (res == NULL) {
> @@ -441,7 +440,7 @@ static int qe_ic_init(struct platform_device *pdev)
>   		high_handler = NULL;
>   	}
>   
> -	qe_ic->irqhost = irq_domain_create_linear(of_fwnode_handle(node), NR_QE_IC_INTS,
> +	qe_ic->irqhost = irq_domain_create_linear(dev_fwnode(&pdev->dev), NR_QE_IC_INTS,
>   						  &qe_ic_host_ops, qe_ic);
>   	if (qe_ic->irqhost == NULL) {
>   		dev_err(dev, "failed to add irq domain\n");
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index e0d67bfe955c..9543bee0c321 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2500,8 +2500,7 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
>   	pmc->irq.irq_set_type = pmc->soc->irq_set_type;
>   	pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
>   
> -	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96,
> -						  of_fwnode_handle(pmc->dev->of_node),
> +	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96, dev_fwnode(pmc->dev),
>   						  &tegra_pmc_irq_domain_ops, pmc);
>   	if (!pmc->domain) {
>   		dev_err(pmc->dev, "failed to allocate domain\n");


