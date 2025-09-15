Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14954CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ICKBmocCPYXxFHgUB627O3pR8j4JSjF02NuDIYI+nE=; b=Nyty8zrMQL1i8TA5kCn/whJQVJ
	MYEYLZLGljs8Qd2wQ6bFtpjywFIAY154CbZ8KnTmKhuWgq+DgkbUVnPKTizFF3arIxLwmyK2MBsTz
	PgIvCAMAzrvJOAZVzQmq0Q8FQruCdW+DwzS5Dk/Gg3T+hiy/zejVFGlEkP4/U1XUoDw7KuJq6zs6R
	D97S5kOeN7dMASt4/bhDoXyjpxC7htgkVlkTp81EwcKuN7enBGOSf8ofl1wf+18HxYwEJn4zhUqB2
	1K3Rakps+kE/X/ptD53HuiL5k0nMVBzz43AnmdwEhcG03CxNoiaSb0X0xZzBCBnaUzzZ4UPdyTuxx
	V6zZw5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5eC-00000003Ubd-3rCt;
	Mon, 15 Sep 2025 09:37:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5eA-00000003UbC-3pgj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:37:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 983EA1063;
	Mon, 15 Sep 2025 02:37:09 -0700 (PDT)
Received: from [10.1.35.47] (unknown [10.1.35.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 702B13F694;
	Mon, 15 Sep 2025 02:37:15 -0700 (PDT)
Message-ID: <5341c539-d03f-4a29-80bc-cd3deaab9a07@arm.com>
Date: Mon, 15 Sep 2025 10:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/25] coresight: trbe: Request specific affinities for
 percpu IRQ
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 James Clark <james.clark@linaro.org>
References: <20250915085702.519996-1-maz@kernel.org>
 <20250915085702.519996-21-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250915085702.519996-21-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_023719_002538_B2E06033 
X-CRM114-Status: GOOD (  14.11  )
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

On 15/09/2025 09:56, Marc Zyngier wrote:
> Let the TRBE driver request IRQs with an affinity mask matching
> the TRBE implementation affinity.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index c512f8faa6012..4a84a6bc2e8fc 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1492,7 +1492,8 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
>   	if (!drvdata->handle)
>   		return -ENOMEM;
>   
> -	ret = request_percpu_irq(drvdata->irq, arm_trbe_irq_handler, DRVNAME, drvdata->handle);
> +	ret = request_percpu_irq_affinity(drvdata->irq, arm_trbe_irq_handler, DRVNAME,
> +					  affinity, drvdata->handle);
>   	if (ret) {
>   		free_percpu(drvdata->handle);
>   		return ret;


Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


