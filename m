Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7B1C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXnu/bZIeJl4I+A8cp46CxHbl8A1bqSErTxPXxsXNpw=; b=soLdlUB5Fzn1IbgGTAMtdM9xXm
	7wwuUxZauflCAWVBP0bEejOaVfw9aFqYgr3k+jmRZ4C+iaqAjq4kQjQz/mNKNNXgQIB3MnmpM1yXL
	nGliyZDb6TyjP5r+3j9znc+IfPQ5keLPxVYmdegK2rsX6OiuHSjgW3qg6Hwthd7giVT9O0XsHPF+c
	JGBVdrbb3zfXOVzupOAZKIHGqXEDWeiFheYhhxJ60pzqUfQQqRGuJEEgDODJtSbigCTTalfWq7Yeu
	m7CTAba8BD7zRsJbhussgUI53xjiSWsDm4WscftwX6FMJj+zIi6u6+PXC1wdUYU355AzY2YjfpDUM
	uovMiaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lZK-00000003qOT-2rkq;
	Sat, 05 Sep 2026 08:16:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lZI-00000003qNu-3g4O
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 05 Sep 2026 08:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pXnu/bZIeJl4I+A8cp46CxHbl8A1bqSErTxPXxsXNpw=; b=DkqM8rAKm4oInyGb6BZw5WiKSb
	mMdFG3bZklLE3fpvnxt9/o3uqRZFg/X0Ky4BXeL26vOZ/bSNQbzb3m3EiJVyjrM7Uql3eJ8vkMnL5
	NcBni3R9pxWfok3qTCpFhXFkKFtYKbTHlPMCP3qgl5iJJqBsEubXOhbUVJamKoNIiA621P/rP8GO4
	qlVzPipZUQ7W/R2OY6JFKmoU/PmE0QT9ESB3uPvtzqy2f6fSHedYi5TN0MwYECaUMvxEY+G6bcQJG
	iFUHp3Q6PIf9lli8OdkAIsMF1GdceaCjYgwxTGWfAzmBHpvuQ3IvaZ1tT81gVFA1NMFlbfkwJ9zqO
	rJ4/PtXg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lZE-0000000EvwH-2NgQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:16:07 +0000
Received: from loongson.cn (unknown [223.64.69.112])
	by gateway (Coremail) with SMTP id _____8BxW_C8z5tqz_AIAA--.26074S3;
	Sat, 05 Sep 2026 16:15:56 +0800 (CST)
Received: from [10.161.0.102] (unknown [223.64.69.112])
	by front1 (Coremail) with SMTP id qMiowJAx3c67z5tqRlMbAA--.58334S2;
	Sat, 05 Sep 2026 16:15:55 +0800 (CST)
Message-ID: <7ca2d3fe-2a22-4c89-b85f-2e79d0d1f20f@loongson.cn>
Date: Sat, 5 Sep 2026 16:15:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dma: loongson: use named initializers for
 acpi_device_id
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Viresh Kumar <vireshk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
 <20260904-acpi-dma-v1-2-0fcc63d65d4b@thegoodpenguin.co.uk>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20260904-acpi-dma-v1-2-0fcc63d65d4b@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qMiowJAx3c67z5tqRlMbAA--.58334S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEBCGqbiHYBdAAAsw
X-Coremail-Antispam: 1Uk129KBj93XoW7trWxCF45uw43Gw1xGrWfZwc_yoW8GFykpF
	ZxA340krWDtFW3Zwn3Ary8XFy5A3sxCFZFgay7J34fur93Ww4q9r15KF1qgF17ArW8XFyI
	vFWkuFW7CF4UCrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_091605_026861_9495CD16 
X-CRM114-Status: GOOD (  13.07  )
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



On 2026/9/4 22:10, Pawel Zalewski wrote:
> Use a named initializer for the acpi_device_id fields which
> makes the code more readable and consistent with how lists
> are initialized in the rest of the kernel code base.
> 
> While we are at it - unify the list terminator to have
> a single space between the brackets and no trailing
> comma.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
LGTM.
Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>

> ---
>   drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc859..70880625c6e92 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -709,8 +709,8 @@ static const struct of_device_id loongson2_cmc_dma_of_match[] = {
>   MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
>   
>   static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] = {
> -	{ "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
> -	{ /* sentinel */ }
> +	{ .id = "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);
>   
> 

-- 
Thanks.
Binbin


